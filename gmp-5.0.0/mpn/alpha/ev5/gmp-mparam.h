/* Alpha EV5 gmp-mparam.h -- Compiler/machine parameter header file.

Copyright 1991, 1993, 1994, 1999, 2000, 2001, 2002, 2004, 2005, 2008, 2009,
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


/* 600 MHz 21164A */

#define DIVREM_1_NORM_THRESHOLD              0  /* preinv always */
#define DIVREM_1_UNNORM_THRESHOLD            0  /* always */
#define MOD_1_NORM_THRESHOLD                 0  /* always */
#define MOD_1_UNNORM_THRESHOLD               0  /* always */
#define MOD_1N_TO_MOD_1_1_THRESHOLD         36
#define MOD_1U_TO_MOD_1_1_THRESHOLD          3
#define MOD_1_1_TO_MOD_1_2_THRESHOLD         0
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        14
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     76
#define USE_PREINV_DIVREM_1                  1  /* preinv always */
#define DIVEXACT_1_THRESHOLD                 0  /* always */
#define BMOD_1_TO_MOD_1_THRESHOLD           72

#define MUL_TOOM22_THRESHOLD                14
#define MUL_TOOM33_THRESHOLD                74
#define MUL_TOOM44_THRESHOLD               130
#define MUL_TOOM6H_THRESHOLD               155
#define MUL_TOOM8H_THRESHOLD               236

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      73
#define MUL_TOOM32_TO_TOOM53_THRESHOLD      84
#define MUL_TOOM42_TO_TOOM53_THRESHOLD      73
#define MUL_TOOM42_TO_TOOM63_THRESHOLD      56

#define SQR_BASECASE_THRESHOLD               4
#define SQR_TOOM2_THRESHOLD                 26
#define SQR_TOOM3_THRESHOLD                 53
#define SQR_TOOM4_THRESHOLD                136
#define SQR_TOOM6_THRESHOLD                173
#define SQR_TOOM8_THRESHOLD                254

#define MULMOD_BNM1_THRESHOLD                9
#define SQRMOD_BNM1_THRESHOLD               14

#define MUL_FFT_TABLE  { 240, 480, 1344, 1792, 5120, 20480, 81920, 196608, 0 }
#define MUL_FFT_MODF_THRESHOLD             240
#define MUL_FFT_THRESHOLD                 1920

#define SQR_FFT_TABLE  { 240, 480, 1216, 1792, 5120, 12288, 81920, 196608, 0 }
#define SQR_FFT_MODF_THRESHOLD             208
#define SQR_FFT_THRESHOLD                 1920

#define MULLO_BASECASE_THRESHOLD             0  /* always */
#define MULLO_DC_THRESHOLD                  44
#define MULLO_MUL_N_THRESHOLD              246

#define DC_DIV_QR_THRESHOLD                 47
#define DC_DIVAPPR_Q_THRESHOLD             182
#define DC_BDIV_QR_THRESHOLD                47
#define DC_BDIV_Q_THRESHOLD                168

#define INV_MULMOD_BNM1_THRESHOLD           55
#define INV_NEWTON_THRESHOLD               187
#define INV_APPR_THRESHOLD                 179

#define BINV_NEWTON_THRESHOLD              220
#define REDC_1_TO_REDC_N_THRESHOLD          77

#define MATRIX22_STRASSEN_THRESHOLD         11
#define HGCD_THRESHOLD                      96
#define GCD_DC_THRESHOLD                   309
#define GCDEXT_DC_THRESHOLD                233
#define JACOBI_BASE_METHOD                   2

#define DIVREM_1_NORM_THRESHOLD              0  /* preinv always */
#define DIVREM_1_UNNORM_THRESHOLD            0  /* always */
#define MOD_1_NORM_THRESHOLD                 0  /* always */
#define MOD_1_UNNORM_THRESHOLD               0  /* always */
#define MOD_1N_TO_MOD_1_1_THRESHOLD         33
#define MOD_1U_TO_MOD_1_1_THRESHOLD          5
#define MOD_1_1_TO_MOD_1_2_THRESHOLD         0
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        16
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     76
#define USE_PREINV_DIVREM_1                  1  /* preinv always */
#define DIVEXACT_1_THRESHOLD                 0  /* always */
#define BMOD_1_TO_MOD_1_THRESHOLD           75

#define GET_STR_DC_THRESHOLD                15
#define GET_STR_PRECOMPUTE_THRESHOLD        25
#define SET_STR_DC_THRESHOLD               470
#define SET_STR_PRECOMPUTE_THRESHOLD      1452

#define MUL_FFT_TABLE2 {{1,4}, {177,5}, {481,6}, {1089,7}, {3905,6}, {3969,7}, {4353,8}, {4929,9}, {5633,7}, {5761,5}, {5793,7}, {5889,6}, {5953,5}, {6145,7}, {7041,5}, {7169,8}, {7425,9}, {7681,8}, {9281,7}, {9345,6}, {9409,5}, {9841,8}, {10305,9}, {10753,8}, {11265,9}, {11777,7}, {11905,9}, {12289,10}, {13313,9}, {14593,7}, {14849,9}, {15361,8}, {15745,7}, {15937,5}, {15969,8}, {16513,6}, {16609,4}, {16641,7}, {16865,5}, {17105,8}, {17409,7}, {18177,8}, {18433,9}, {19585,10}, {22529,9}, {23553,10}, {24577,11}, {26625,10}, {28161,8}, {28545,6}, {28737,4}, {28753,5}, {28817,6}, {28865,4}, {28881,5}, {28897,6}, {28929,8}, {29441,9}, {30465,11}, {30721,10}, {32769,9}, {33793,10}, {34817,9}, {35841,10}, {38913,8}, {40129,7}, {40193,6}, {40257,5}, {40289,8}, {40449,9}, {44289,8}, {44545,9}, {45057,10}, {48129,9}, {49409,10}, {50433,11}, {51201,10}, {53249,11}, {63489,9}, {64001,10}, {67585,9}, {68097,10}, {75777,11}, {81921,10}, {84993,11}, {89089,9}, {89601,11}, {96257,10}, {102401,12}, {126977,11}, {129025,9}, {129537,8}, {129793,10}, {131073,11}, {136193,10}, {138753,9}, {141313,11}, {145409,10}, {146945,11}, {159745,10}, {160769,9}, {161281,11}, {161793,10}, {169473,11}, {170497,9}, {171009,10}, {174081,9}, {179969,11}, {194561,10}, {206849,9}, {207361,10}, {209409,9}, {210945,10}, {211969,9}, {212993,11}, {215041,12}, {218113,10}, {219137,11}, {222209,12}, {253953,11}, {264705,9}, {266241,10}, {272897,11}, {274433,10}, {280577,11}, {364545,12}, {389121,10}, {390145,11}, {424961,13}, {434177,11}, {450561,13}, {516097,12}, {MP_SIZE_T_MAX, 0}}

#define SQR_FFT_TABLE2 {{1,4}, {209,5}, {417,6}, {1089,7}, {3585,6}, {3777,8}, {6657,7}, {9249,8}, {11329,6}, {11521,5}, {11553,8}, {15105,6}, {15201,5}, {15233,7}, {15361,8}, {15617,7}, {15745,5}, {15857,4}, {15873,7}, {16257,6}, {16897,5}, {17377,7}, {17633,9}, {18049,7}, {18177,8}, {20033,6}, {20241,8}, {20993,9}, {22529,10}, {25345,11}, {28673,9}, {29697,10}, {31745,9}, {32257,8}, {32513,10}, {35073,9}, {35329,8}, {36865,7}, {36993,9}, {38401,8}, {39169,10}, {41473,9}, {41985,7}, {42497,6}, {42689,7}, {42753,8}, {43009,7}, {43137,9}, {43649,7}, {43809,6}, {43841,8}, {44545,9}, {45313,10}, {53249,11}, {60417,9}, {60929,7}, {61569,9}, {64769,10}, {71169,9}, {72193,10}, {72705,9}, {74241,7}, {74369,9}, {74753,11}, {75777,9}, {76289,10}, {79361,9}, {79873,11}, {96769,9}, {97537,10}, {102401,11}, {104961,12}, {122881,10}, {126977,8}, {128001,10}, {129537,9}, {130049,10}, {135169,9}, {135681,8}, {135937,7}, {136193,9}, {137217,11}, {139265,10}, {141057,8}, {141569,7}, {142337,8}, {143489,7}, {143617,8}, {144385,7}, {145537,9}, {145921,11}, {147457,9}, {149249,8}, {150273,7}, {151041,8}, {151297,10}, {154113,11}, {155649,9}, {157697,11}, {165889,9}, {172033,10}, {176129,9}, {177665,10}, {179201,11}, {181249,10}, {182273,11}, {186369,9}, {187649,8}, {188417,10}, {189441,11}, {192513,10}, {202753,8}, {203009,9}, {203265,8}, {203521,9}, {206849,10}, {210945,11}, {214017,12}, {219137,11}, {221185,12}, {225281,11}, {227329,12}, {239617,11}, {241665,12}, {245761,11}, {260097,10}, {261121,9}, {261633,10}, {263169,11}, {264193,10}, {265217,11}, {288769,10}, {293121,11}, {294913,9}, {296449,8}, {296705,9}, {298497,11}, {299009,10}, {300033,9}, {301569,11}, {304129,10}, {307201,11}, {359937,12}, {385025,11}, {395265,10}, {399361,11}, {409601,10}, {411137,9}, {411649,10}, {413697,11}, {455681,10}, {457217,11}, {462849,10}, {463873,12}, {480257,13}, {495617,12}, {499713,13}, {507905,11}, {509953,13}, {516097,12}, {526337,10}, {528385,11}, {587777,12}, {651265,11}, {719873,12}, {782337,11}, {849921,12}, {915457,13}, {MP_SIZE_T_MAX, 0}}
