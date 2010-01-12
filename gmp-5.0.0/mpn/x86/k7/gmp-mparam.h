/* AMD K7 gmp-mparam.h -- Compiler/machine parameter header file.

Copyright 1991, 1993, 1994, 2000, 2001, 2002, 2003, 2004, 2005, 2008, 2009,
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

#define GMP_LIMB_BITS 32
#define BYTES_PER_MP_LIMB 4


#define MOD_1_NORM_THRESHOLD                 0  /* always */
#define MOD_1_UNNORM_THRESHOLD               4
#define MOD_1N_TO_MOD_1_1_THRESHOLD         14
#define MOD_1U_TO_MOD_1_1_THRESHOLD          6
#define MOD_1_1_TO_MOD_1_2_THRESHOLD         0
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        20
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     26
#define USE_PREINV_DIVREM_1                  1  /* native */
#define DIVEXACT_1_THRESHOLD                 0  /* always (native) */
#define BMOD_1_TO_MOD_1_THRESHOLD           28

#define MUL_TOOM22_THRESHOLD                28
#define MUL_TOOM33_THRESHOLD                85
#define MUL_TOOM44_THRESHOLD               148
#define MUL_TOOM6H_THRESHOLD               204
#define MUL_TOOM8H_THRESHOLD               309

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      85
#define MUL_TOOM32_TO_TOOM53_THRESHOLD      99
#define MUL_TOOM42_TO_TOOM53_THRESHOLD      93
#define MUL_TOOM42_TO_TOOM63_THRESHOLD     101

#define SQR_BASECASE_THRESHOLD               0  /* always (native) */
#define SQR_TOOM2_THRESHOLD                 50
#define SQR_TOOM3_THRESHOLD                 87
#define SQR_TOOM4_THRESHOLD                208
#define SQR_TOOM6_THRESHOLD                306
#define SQR_TOOM8_THRESHOLD                430

#define MULMOD_BNM1_THRESHOLD               18
#define SQRMOD_BNM1_THRESHOLD               19

#define MUL_FFT_TABLE  { 400, 800, 1408, 3584, 10240, 40960, 163840, 0 }
#define MUL_FFT_MODF_THRESHOLD             928
#define MUL_FFT_THRESHOLD                 7808

#define SQR_FFT_TABLE  { 400, 800, 1408, 3584, 10240, 24576, 163840, 0 }
#define SQR_FFT_MODF_THRESHOLD             720
#define SQR_FFT_THRESHOLD                 7552

#define MULLO_BASECASE_THRESHOLD            10
#define MULLO_DC_THRESHOLD                  50
#define MULLO_MUL_N_THRESHOLD            13463

#define DC_DIV_QR_THRESHOLD                 60
#define DC_DIVAPPR_Q_THRESHOLD             333
#define DC_BDIV_QR_THRESHOLD                82
#define DC_BDIV_Q_THRESHOLD                268

#define INV_MULMOD_BNM1_THRESHOLD           54
#define INV_NEWTON_THRESHOLD               300
#define INV_APPR_THRESHOLD                 303

#define BINV_NEWTON_THRESHOLD              264
#define REDC_1_TO_REDC_N_THRESHOLD          86

#define MU_DIV_QR_THRESHOLD               1858
#define MU_DIVAPPR_Q_THRESHOLD            1718
#define MUPI_DIV_QR_THRESHOLD              114
#define MU_BDIV_QR_THRESHOLD              1387
#define MU_BDIV_Q_THRESHOLD               1470

#define MATRIX22_STRASSEN_THRESHOLD         15
#define HGCD_THRESHOLD                     154
#define GCD_DC_THRESHOLD                   599
#define GCDEXT_DC_THRESHOLD                443
#define JACOBI_BASE_METHOD                   1

#define GET_STR_DC_THRESHOLD                17
#define GET_STR_PRECOMPUTE_THRESHOLD        34
#define SET_STR_DC_THRESHOLD               542
#define SET_STR_PRECOMPUTE_THRESHOLD      1615

#define MUL_FFT_TABLE2 {{1,4}, {337,5}, {801,6}, {1601,7}, {3457,8}, {3841,7}, {4481,8}, {10113,9}, {11777,8}, {13057,9}, {15873,8}, {18177,9}, {28161,10}, {31745,9}, {40449,10}, {48129,9}, {52737,11}, {63489,10}, {64513,9}, {71681,10}, {73729,9}, {74241,10}, {80897,9}, {84481,10}, {84993,9}, {85505,10}, {97281,9}, {97793,10}, {98817,9}, {102401,10}, {113665,11}, {129025,10}, {130049,9}, {130561,10}, {163329,11}, {168961,10}, {169985,11}, {194561,10}, {195585,9}, {196097,10}, {199681,12}, {201729,10}, {208897,12}, {258049,11}, {260097,10}, {290817,11}, {326657,9}, {328193,8}, {328705,9}, {329729,10}, {331265,8}, {331521,9}, {336897,10}, {337921,11}, {391169,10}, {392193,9}, {392705,8}, {392961,9}, {393217,10}, {394241,9}, {396801,10}, {397313,11}, {399361,9}, {403457,10}, {405505,11}, {456705,12}, {520193,11}, {523265,9}, {524289,11}, {526337,9}, {539649,10}, {555009,9}, {556545,11}, {587777,10}, {622337,11}, {653313,10}, {686081,9}, {693761,11}, {694273,12}, {782337,11}, {784385,10}, {818177,9}, {818689,11}, {849921,9}, {851457,10}, {916481,11}, {917505,13}, {1040385,12}, {1044481,11}, {1112065,10}, {1145857,11}, {1243137,10}, {1244673,12}, {1306625,11}, {1339393,10}, {1341441,11}, {1370113,10}, {1440769,11}, {1443841,10}, {1445889,11}, {1467393,10}, {1472513,11}, {1481729,10}, {1489921,11}, {1501185,10}, {1503233,11}, {1505281,10}, {1506817,12}, {1568769,11}, {1636353,10}, {1643521,11}, {1650689,10}, {1662977,11}, {1668097,10}, {1677313,11}, {1681409,10}, {1683457,11}, {1687553,10}, {1702913,11}, {1965057,13}, {2088961,12}, {2093057,11}, {2227201,12}, {2248705,11}, {2252801,12}, {2355201,11}, {2492417,12}, {2617345,11}, {MP_SIZE_T_MAX, 0}}

#define SQR_FFT_TABLE2 {{1,4}, {369,5}, {673,6}, {1601,7}, {3457,8}, {3841,7}, {4481,8}, {9985,9}, {11777,8}, {13057,9}, {15873,8}, {17153,9}, {24321,10}, {31745,9}, {40449,10}, {48129,9}, {48641,11}, {63489,10}, {64513,9}, {69121,8}, {69377,9}, {73217,10}, {100353,11}, {102401,10}, {113665,11}, {129025,10}, {163329,11}, {194561,10}, {196609,12}, {258049,11}, {260097,10}, {263681,9}, {264193,10}, {290817,11}, {325633,10}, {326657,8}, {327169,9}, {333825,10}, {334849,9}, {340993,8}, {342017,9}, {343553,11}, {391169,9}, {393217,8}, {393473,10}, {394241,8}, {394497,9}, {395521,8}, {395777,9}, {396289,10}, {397313,9}, {398337,8}, {399873,9}, {404481,10}, {407553,9}, {409089,11}, {450561,12}, {520193,11}, {522241,10}, {523265,9}, {523777,10}, {556033,9}, {556545,11}, {587777,10}, {622337,11}, {649217,10}, {687105,9}, {711169,10}, {711681,12}, {782337,11}, {784385,10}, {821249,11}, {827393,10}, {829441,11}, {837633,10}, {883713,9}, {884225,11}, {884737,13}, {1040385,12}, {1044481,11}, {1244673,12}, {1306625,11}, {1374209,10}, {1442817,11}, {1470465,10}, {1471489,11}, {1495041,10}, {1499137,11}, {1507329,12}, {1527809,11}, {1536001,12}, {1540097,11}, {1554433,12}, {1560577,11}, {1562625,12}, {1564673,11}, {1595393,10}, {1596417,11}, {1599489,10}, {1600513,11}, {1638401,10}, {1644545,11}, {1646593,10}, {1650689,11}, {1652737,10}, {1655809,11}, {1656833,10}, {1657857,11}, {1660929,10}, {1664001,11}, {1671169,10}, {1674241,11}, {1675265,10}, {1677313,11}, {1681409,10}, {1685505,11}, {1689601,10}, {1691649,11}, {1694721,10}, {1700865,11}, {1767425,10}, {1900545,11}, {1965057,13}, {MP_SIZE_T_MAX, 0}}
