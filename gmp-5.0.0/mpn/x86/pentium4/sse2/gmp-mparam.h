/* Intel Pentium-4 gmp-mparam.h -- Compiler/machine parameter header file.

Copyright 1991, 1993, 1994, 2000, 2001, 2002, 2003, 2004, 2005, 2007, 2008,
2009, 2010 Free Software Foundation, Inc.

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


#define MOD_1_NORM_THRESHOLD                24
#define MOD_1_UNNORM_THRESHOLD           MP_SIZE_T_MAX  /* never */
#define MOD_1N_TO_MOD_1_1_THRESHOLD         26
#define MOD_1U_TO_MOD_1_1_THRESHOLD          9
#define MOD_1_1_TO_MOD_1_2_THRESHOLD         0
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        10
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     34
#define USE_PREINV_DIVREM_1                  1  /* native */
#define DIVEXACT_1_THRESHOLD                 0  /* always (native) */
#define BMOD_1_TO_MOD_1_THRESHOLD           22

#define MUL_TOOM22_THRESHOLD                30
#define MUL_TOOM33_THRESHOLD               120
#define MUL_TOOM44_THRESHOLD               296
#define MUL_TOOM6H_THRESHOLD               414
#define MUL_TOOM8H_THRESHOLD               620

#define MUL_TOOM32_TO_TOOM43_THRESHOLD     198
#define MUL_TOOM32_TO_TOOM53_THRESHOLD     216
#define MUL_TOOM42_TO_TOOM53_THRESHOLD     194
#define MUL_TOOM42_TO_TOOM63_THRESHOLD     209

#define SQR_BASECASE_THRESHOLD               0  /* always (native) */
#define SQR_TOOM2_THRESHOLD                 48
#define SQR_TOOM3_THRESHOLD                170
#define SQR_TOOM4_THRESHOLD                454
#define SQR_TOOM6_THRESHOLD                454
#define SQR_TOOM8_THRESHOLD                915

#define MULMOD_BNM1_THRESHOLD               19
#define SQRMOD_BNM1_THRESHOLD               24

#define MUL_FFT_TABLE  { 592, 928, 1920, 3584, 14336, 40960, 163840, 393216, 0 }
#define MUL_FFT_MODF_THRESHOLD             960
#define MUL_FFT_THRESHOLD                 7808

#define SQR_FFT_TABLE  { 592, 928, 1920, 3584, 14336, 40960, 98304, 393216, 0 }
#define SQR_FFT_MODF_THRESHOLD             848
#define SQR_FFT_THRESHOLD                 6784

#define MULLO_BASECASE_THRESHOLD            12
#define MULLO_DC_THRESHOLD                  51
#define MULLO_MUL_N_THRESHOLD            13463

#define DC_DIV_QR_THRESHOLD                 28
#define DC_DIVAPPR_Q_THRESHOLD              61
#define DC_BDIV_QR_THRESHOLD                55
#define DC_BDIV_Q_THRESHOLD                 82

#define INV_MULMOD_BNM1_THRESHOLD           58
#define INV_NEWTON_THRESHOLD               157
#define INV_APPR_THRESHOLD                  16

#define BINV_NEWTON_THRESHOLD              327
#define REDC_1_TO_REDC_N_THRESHOLD          63

#define MU_DIV_QR_THRESHOLD               2350
#define MU_DIVAPPR_Q_THRESHOLD            2089
#define MUPI_DIV_QR_THRESHOLD                7
#define MU_BDIV_QR_THRESHOLD              2089
#define MU_BDIV_Q_THRESHOLD               2089

#define MATRIX22_STRASSEN_THRESHOLD         34
#define HGCD_THRESHOLD                      74
#define GCD_DC_THRESHOLD                   321
#define GCDEXT_DC_THRESHOLD                209
#define JACOBI_BASE_METHOD                   1

#define GET_STR_DC_THRESHOLD                12
#define GET_STR_PRECOMPUTE_THRESHOLD        28
#define SET_STR_DC_THRESHOLD               123
#define SET_STR_PRECOMPUTE_THRESHOLD      1265

#define MUL_FFT_TABLE2 {{1,4}, {529,5}, {1025,6}, {1217,5}, {1249,6}, {2113,7}, {2177,6}, {2241,7}, {2433,6}, {2625,7}, {5505,8}, {5889,7}, {6529,8}, {11009,9}, {11777,8}, {14081,9}, {15873,8}, {17409,9}, {28161,10}, {31745,9}, {40449,10}, {48129,9}, {52737,11}, {63489,9}, {69121,10}, {113665,11}, {129025,10}, {165889,11}, {194561,10}, {195585,12}, {258049,11}, {260097,10}, {278529,11}, {331777,10}, {343041,11}, {392705,12}, {393217,11}, {415745,12}, {417793,11}, {452609,12}, {520193,11}, {589825,10}, {620545,11}, {653313,10}, {654337,12}, {782337,11}, {784385,10}, {818177,11}, {819201,13}, {1040385,12}, {1044481,11}, {1208321,12}, {1220609,11}, {1222657,12}, {1228801,11}, {1243137,12}, {1306625,11}, {1374209,10}, {1440769,11}, {1506305,12}, {1568769,11}, {1768449,12}, {1830913,13}, {2088961,12}, {2093057,11}, {2226177,9}, {2260993,11}, {2263041,12}, {2355201,11}, {2489345,9}, {2555393,11}, {2555905,12}, {2617345,11}, {3012609,13}, {3137537,12}, {3141633,11}, {3274753,12}, {3403777,11}, {3536897,10}, {3537921,12}, {3547137,14}, {3559425,12}, {3604481,14}, {3620865,12}, {3653633,14}, {MP_SIZE_T_MAX, 0}}

#define SQR_FFT_TABLE2 {{1,4}, {529,5}, {1057,6}, {1729,7}, {1921,6}, {2113,7}, {2177,6}, {2241,7}, {2433,6}, {2625,7}, {5249,8}, {5889,7}, {6273,8}, {11009,9}, {11777,8}, {14081,9}, {15873,8}, {18177,9}, {28161,10}, {31745,9}, {40449,10}, {48129,9}, {52737,11}, {63489,10}, {97793,11}, {129025,10}, {160769,11}, {194561,10}, {195585,12}, {258049,11}, {261121,10}, {274433,11}, {327681,9}, {328193,11}, {333825,10}, {338945,11}, {391169,9}, {396289,11}, {397313,9}, {407553,11}, {413697,12}, {520193,11}, {523265,10}, {542721,11}, {548865,10}, {556033,11}, {587777,10}, {622081,11}, {653313,10}, {654337,12}, {782337,11}, {784385,10}, {834561,11}, {835585,13}, {1040385,12}, {1044481,11}, {1244161,12}, {1306625,11}, {1374209,10}, {1439745,11}, {1506817,12}, {1568769,11}, {1768449,12}, {1830913,11}, {1964033,13}, {2088961,12}, {2093057,11}, {2226177,12}, {2355201,11}, {2489345,12}, {2617345,11}, {3013633,13}, {3137537,12}, {3141633,11}, {3274753,12}, {3403777,11}, {3537921,12}, {3928065,14}, {MP_SIZE_T_MAX, 0}}
