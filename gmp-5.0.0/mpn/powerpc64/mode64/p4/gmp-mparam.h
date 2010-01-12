/* PowerPC970 gmp-mparam.h -- Compiler/machine parameter header file.

Copyright 2008, 2009, 2010 Free Software Foundation, Inc.

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
#define MOD_1N_TO_MOD_1_1_THRESHOLD          7
#define MOD_1U_TO_MOD_1_1_THRESHOLD          6
#define MOD_1_1_TO_MOD_1_2_THRESHOLD         9
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        26
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     14
#define USE_PREINV_DIVREM_1                  0
#define DIVEXACT_1_THRESHOLD                 0  /* always (native) */
#define BMOD_1_TO_MOD_1_THRESHOLD           43

#define MUL_TOOM22_THRESHOLD                14
#define MUL_TOOM33_THRESHOLD                54
#define MUL_TOOM44_THRESHOLD               154
#define MUL_TOOM6H_THRESHOLD               206
#define MUL_TOOM8H_THRESHOLD               309

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      89
#define MUL_TOOM32_TO_TOOM53_THRESHOLD      99
#define MUL_TOOM42_TO_TOOM53_THRESHOLD      97
#define MUL_TOOM42_TO_TOOM63_THRESHOLD      97

#define SQR_BASECASE_THRESHOLD               5
#define SQR_TOOM2_THRESHOLD                 36
#define SQR_TOOM3_THRESHOLD                 61
#define SQR_TOOM4_THRESHOLD                154
#define SQR_TOOM6_THRESHOLD                206
#define SQR_TOOM8_THRESHOLD                309

#define MULMOD_BNM1_THRESHOLD               12
#define SQRMOD_BNM1_THRESHOLD               14

#define MUL_FFT_TABLE  { 368, 544, 1856, 2816, 7168, 20480, 81920, 327680, 0 }
#define MUL_FFT_MODF_THRESHOLD             384
#define MUL_FFT_THRESHOLD                 9472

#define SQR_FFT_TABLE  { 304, 672, 1600, 2816, 7168, 20480, 81920, 196608, 0 }
#define SQR_FFT_MODF_THRESHOLD             320
#define SQR_FFT_THRESHOLD                 7424

#define MULLO_BASECASE_THRESHOLD             5
#define MULLO_DC_THRESHOLD                  34
#define MULLO_MUL_N_THRESHOLD            18629

#define DC_DIV_QR_THRESHOLD                 30
#define DC_DIVAPPR_Q_THRESHOLD             103
#define DC_BDIV_QR_THRESHOLD                48
#define DC_BDIV_Q_THRESHOLD                120

#define INV_MULMOD_BNM1_THRESHOLD           92
#define INV_NEWTON_THRESHOLD               147
#define INV_APPR_THRESHOLD                 122

#define BINV_NEWTON_THRESHOLD              206
#define REDC_1_TO_REDC_N_THRESHOLD          56

#define MU_DIV_QR_THRESHOLD               1589
#define MU_DIVAPPR_Q_THRESHOLD            1308
#define MUPI_DIV_QR_THRESHOLD               62
#define MU_BDIV_QR_THRESHOLD              1308
#define MU_BDIV_Q_THRESHOLD               1334

#define MATRIX22_STRASSEN_THRESHOLD         17
#define HGCD_THRESHOLD                      86
#define GCD_DC_THRESHOLD                   233
#define GCDEXT_DC_THRESHOLD                221
#define JACOBI_BASE_METHOD                   1

#define GET_STR_DC_THRESHOLD                11
#define GET_STR_PRECOMPUTE_THRESHOLD        24
#define SET_STR_DC_THRESHOLD               532
#define SET_STR_PRECOMPUTE_THRESHOLD      1790

#define MUL_FFT_TABLE2 {{1,4}, {209,5}, {609,6}, {1345,7}, {3457,8}, {6913,9}, {7681,8}, {8961,9}, {13825,10}, {15361,9}, {19969,10}, {23553,9}, {28161,11}, {30721,10}, {31745,9}, {35329,10}, {39937,9}, {42497,10}, {48641,9}, {50689,10}, {56321,11}, {63489,10}, {80897,11}, {96257,10}, {105473,12}, {126977,11}, {129025,10}, {139009,11}, {142337,10}, {145409,11}, {161793,10}, {171009,11}, {194561,10}, {212481,11}, {227329,12}, {258049,11}, {261121,9}, {278017,11}, {292865,10}, {293889,9}, {310785,10}, {326657,9}, {327425,10}, {331265,9}, {336897,10}, {337921,9}, {343553,10}, {359425,12}, {389121,11}, {424961,13}, {516097,12}, {520193,11}, {522241,10}, {556545,11}, {587777,10}, {621569,11}, {653313,10}, {687105,11}, {719873,12}, {782337,11}, {851457,12}, {913409,11}, {980993,13}, {1040385,12}, {1044481,11}, {1113089,12}, {1175553,11}, {1243137,12}, {1306625,11}, {1374209,12}, {1440769,13}, {1564673,12}, {1961985,14}, {2080769,13}, {2088961,12}, {2488321,13}, {2613249,12}, {2881537,13}, {MP_SIZE_T_MAX, 0}}

#define SQR_FFT_TABLE2 {{1,4}, {209,5}, {609,6}, {1345,7}, {3073,8}, {6913,9}, {7681,8}, {8449,9}, {9729,8}, {10241,9}, {13825,10}, {15361,9}, {19969,10}, {23553,9}, {26113,11}, {30721,10}, {31745,9}, {34305,10}, {56321,11}, {63489,10}, {80897,11}, {96257,10}, {102401,12}, {126977,11}, {129025,10}, {130049,9}, {139009,11}, {161793,10}, {179713,11}, {194561,10}, {212481,12}, {258049,11}, {260097,10}, {278273,11}, {359425,12}, {389121,11}, {457729,13}, {516097,12}, {520193,11}, {589313,12}, {651265,11}, {718849,12}, {782337,11}, {850945,12}, {913409,11}, {982017,13}, {983041,12}, {999425,13}, {1024001,12}, {1028097,13}, {1040385,12}, {1044481,11}, {1113089,12}, {1175553,11}, {1244161,12}, {1437697,13}, {1564673,12}, {1965057,13}, {2088961,12}, {2488321,13}, {2613249,12}, {2748417,11}, {2881537,13}, {MP_SIZE_T_MAX, 0}}
