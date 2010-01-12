/* AMD K8 gmp-mparam.h -- Compiler/machine parameter header file.

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
#define MOD_1N_TO_MOD_1_1_THRESHOLD          4
#define MOD_1U_TO_MOD_1_1_THRESHOLD          5
#define MOD_1_1_TO_MOD_1_2_THRESHOLD         0
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        15
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     14
#define USE_PREINV_DIVREM_1                  1  /* native */
#define DIVEXACT_1_THRESHOLD                 0  /* always (native) */
#define BMOD_1_TO_MOD_1_THRESHOLD           20

#define MUL_TOOM22_THRESHOLD                28
#define MUL_TOOM33_THRESHOLD                77
#define MUL_TOOM44_THRESHOLD               260
#define MUL_TOOM6H_THRESHOLD               393
#define MUL_TOOM8H_THRESHOLD               517

#define MUL_TOOM32_TO_TOOM43_THRESHOLD     113
#define MUL_TOOM32_TO_TOOM53_THRESHOLD     138
#define MUL_TOOM42_TO_TOOM53_THRESHOLD     163
#define MUL_TOOM42_TO_TOOM63_THRESHOLD     175

#define SQR_BASECASE_THRESHOLD               0  /* always (native) */
#define SQR_TOOM2_THRESHOLD                 38
#define SQR_TOOM3_THRESHOLD                121
#define SQR_TOOM4_THRESHOLD                512
#define SQR_TOOM6_THRESHOLD                686
#define SQR_TOOM8_THRESHOLD                686

#define MULMOD_BNM1_THRESHOLD               17
#define SQRMOD_BNM1_THRESHOLD               17

#define MUL_FFT_TABLE  { 400, 992, 1984, 3840, 11264, 28672, 81920, 0 }
#define MUL_FFT_MODF_THRESHOLD             656
#define MUL_FFT_THRESHOLD                 7808

#define SQR_FFT_TABLE  { 400, 800, 2240, 3840, 11264, 28672, 114688, 0 }
#define SQR_FFT_MODF_THRESHOLD             528
#define SQR_FFT_THRESHOLD                 5312

#define MULLO_BASECASE_THRESHOLD             9
#define MULLO_DC_THRESHOLD                  29
#define MULLO_MUL_N_THRESHOLD            14709

#define DC_DIV_QR_THRESHOLD                 48
#define DC_DIVAPPR_Q_THRESHOLD             270
#define DC_BDIV_QR_THRESHOLD                45
#define DC_BDIV_Q_THRESHOLD                152

#define INV_MULMOD_BNM1_THRESHOLD          152
#define INV_NEWTON_THRESHOLD               252
#define INV_APPR_THRESHOLD                 250

#define BINV_NEWTON_THRESHOLD              345
#define REDC_1_TO_REDC_2_THRESHOLD          11
#define REDC_2_TO_REDC_N_THRESHOLD          84

#define MU_DIV_QR_THRESHOLD               1932
#define MU_DIVAPPR_Q_THRESHOLD            1895
#define MUPI_DIV_QR_THRESHOLD              106
#define MU_BDIV_QR_THRESHOLD              1620
#define MU_BDIV_Q_THRESHOLD               1787

#define MATRIX22_STRASSEN_THRESHOLD         21
#define HGCD_THRESHOLD                     139
#define GCD_DC_THRESHOLD                   555
#define GCDEXT_DC_THRESHOLD                496
#define JACOBI_BASE_METHOD                   1

#define GET_STR_DC_THRESHOLD                18
#define GET_STR_PRECOMPUTE_THRESHOLD        23
#define SET_STR_DC_THRESHOLD               248
#define SET_STR_PRECOMPUTE_THRESHOLD      1648

#define MUL_FFT_TABLE2 {{1,4}, {337,5}, {737,6}, {1665,7}, {4097,8}, {10497,9}, {11777,8}, {13057,9}, {13825,8}, {14081,10}, {15361,9}, {15873,8}, {16129,9}, {22017,10}, {23553,9}, {28161,10}, {28673,9}, {29697,10}, {31745,9}, {36353,10}, {39937,9}, {42497,10}, {48129,9}, {49153,10}, {56321,11}, {63489,10}, {64513,9}, {69633,10}, {72705,9}, {77825,11}, {96257,10}, {97281,12}, {122881,11}, {129025,10}, {145409,11}, {161793,10}, {179201,11}, {227329,10}, {241665,12}, {258049,11}, {260097,10}, {269313,9}, {272385,11}, {293377,9}, {294401,10}, {297473,11}, {301057,9}, {309249,11}, {325633,9}, {327425,10}, {343041,9}, {343809,11}, {358401,12}, {389121,11}, {391169,9}, {392705,8}, {392961,9}, {396289,11}, {399361,9}, {408577,10}, {409601,11}, {466945,12}, {471041,13}, {475137,12}, {487425,13}, {491521,12}, {503809,13}, {516097,12}, {520193,11}, {522241,10}, {551937,11}, {552961,10}, {607233,12}, {610305,10}, {612353,12}, {651265,11}, {681985,10}, {683009,11}, {686081,10}, {687617, 11}, {692225,10}, {696321,11}, {701441,10}, {703489,11}, {708609,10}, {709633,11}, {711681,10}, {712705,11}, {714753,10}, {731137,12}, {741377,10}, {752641,12}, {782337,11}, {784385,10}, {817153,11}, {849921,10}, {850945,12}, {913409,11}, {915457,10}, {949249,11}, {980993,13}, {1040385,11}, {1388545,12}, {1394689,11}, {1404929,12}, {1409025,11}, {1505281,13}, {1564673,12}, {1568769,11}, {1637377,12}, {1699841,11}, {1768449,12}, {1830913,11}, {1898497,12}, {1961985,14}, {2080769,12}, {3536897,13}, {3661825,12}, {3928065,13}, {4186113,12}, {4452353,13}, {4710401,12}, {4976641,13}, {5238785,12}, {5513217,13}, {5550081,12}, {5574657,13}, {5734401,12}, {6025217,13}, {6283265,12}, {6549505,13}, {6815745,12}, {6852609,13}, {6873089,12}, {6881281,13}, {6889473,12}, {6946817,13}, {6955009,12}, {MP_SIZE_T_MAX, 0}}

#define SQR_FFT_TABLE2 {{1,4}, {369,5}, {801,6}, {1729,7}, {4097,8}, {8961,9}, {9729,8}, {10497,9}, {11777,8}, {13057,9}, {13825,8}, {14081,10}, {15361,9}, {22017,10}, {23553,9}, {28161,11}, {28673,10}, {31745,9}, {35841,10}, {39937,9}, {42497,10}, {56321,11}, {63489,10}, {87041,11}, {96257,10}, {106497,12}, {126977,11}, {129025,10}, {138753,8}, {139265,10}, {146433,8}, {147457,10}, {149505,8}, {150017,10}, {155649,11}, {161793,10}, {162817,8}, {164097,10}, {167937,8}, {189441,10}, {190465,11}, {194561,10}, {196097,8}, {196609,10}, {204289,8}, {204673,9}, {212737,11}, {223233,12}, {258049,11}, {260097,9}, {280577,11}, {282625,9}, {284161,11}, {284673,9}, {299009,10}, {300033,9}, {335873,8}, {336129,9}, {366593,11}, {368641,12}, {372737,11}, {374785,9}, {389121,11}, {391169,9}, {409601,10}, {427009,11}, {428033,9}, {428545,8}, {429057,10}, {438273,11}, {440321,10}, {454657,11}, {456705,10}, {467457,9}, {467969,10}, {475137,12}, {479233,13}, {516097,12}, {520193,10}, {546817,11}, {550913,10}, {588801,9}, {589313,10}, {706561,11}, {708609,10}, {755713,11}, {757761,10}, {758785,12}, {761857,10}, {771073,11}, {774145,10}, {777217,12}, {778241,10}, {779265,11}, {780289,10}, {801793,9}, {802305,10}, {818689,11}, {849921,9}, {851457,11}, {852993,9}, {854017,11}, {856065,9}, {856577,11}, {864257,9}, {865281,11}, {868865,9}, {870401,11}, {1540097,13}, {1550337,11}, {1637377,12}, {1701889,10}, {1703937,12}, {1708033,10}, {1712129,12}, {1717249,10}, {1721345,12}, {1724417,10}, {1725441,12}, {1728513,10}, {1744897,12}, {1835009,14}, {1851393,12}, {1867777,14}, {1884161,12}, {1892353,14}, {1900545,12}, {1921025,14}, {2000001,12}, {3403777,11}, {3536897,13}, {3661825,12}, {3743745,11}, {3749889,12}, {3928065,13}, {4186113,12}, {4456449,13}, {4464641,12}, {4472833,13}, {4710401,12}, {4976641,13}, {5234689,12}, {5500929,13}, {5758977,12}, {MP_SIZE_T_MAX, 0}}
