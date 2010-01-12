/* Sparc64 gmp-mparam.h -- Compiler/machine parameter header file.

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

/* 500 MHz ultrasparc2 running GNU/Linux */

#define DIVREM_1_NORM_THRESHOLD              3
#define DIVREM_1_UNNORM_THRESHOLD            4
#define MOD_1_NORM_THRESHOLD                 3
#define MOD_1_UNNORM_THRESHOLD               3
#define MOD_1N_TO_MOD_1_1_THRESHOLD      MP_SIZE_T_MAX  /* never */
#define MOD_1U_TO_MOD_1_1_THRESHOLD      MP_SIZE_T_MAX
#define MOD_1_1_TO_MOD_1_2_THRESHOLD     MP_SIZE_T_MAX
#define MOD_1_2_TO_MOD_1_4_THRESHOLD     MP_SIZE_T_MAX
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD  MP_SIZE_T_MAX  /* never */
#define USE_PREINV_DIVREM_1                  1
#define DIVREM_2_THRESHOLD                   7
#define DIVEXACT_1_THRESHOLD                 0  /* always */
#define BMOD_1_TO_MOD_1_THRESHOLD        MP_SIZE_T_MAX  /* never */

#define MUL_TOOM22_THRESHOLD                30
#define MUL_TOOM33_THRESHOLD               187
#define MUL_TOOM44_THRESHOLD               278
#define MUL_TOOM6H_THRESHOLD               278
#define MUL_TOOM8H_THRESHOLD               357

#define MUL_TOOM32_TO_TOOM43_THRESHOLD     201
#define MUL_TOOM32_TO_TOOM53_THRESHOLD     199
#define MUL_TOOM42_TO_TOOM53_THRESHOLD     154
#define MUL_TOOM42_TO_TOOM63_THRESHOLD     107

#define SQR_BASECASE_THRESHOLD              13
#define SQR_TOOM2_THRESHOLD                 69
#define SQR_TOOM3_THRESHOLD                116
#define SQR_TOOM4_THRESHOLD                336
#define SQR_TOOM6_THRESHOLD                336
#define SQR_TOOM8_THRESHOLD                454

#define MULMOD_BNM1_THRESHOLD               17
#define SQRMOD_BNM1_THRESHOLD               23

#define MUL_FFT_TABLE  { 240, 544, 1344, 2304, 7168, 12288, 81920, 196608, 0 }
#define MUL_FFT_MODF_THRESHOLD             216
#define MUL_FFT_THRESHOLD                 2752

#define SQR_FFT_TABLE  { 304, 672, 1600, 2816, 7168, 20480, 49152, 196608, 0 }
#define SQR_FFT_MODF_THRESHOLD             216
#define SQR_FFT_THRESHOLD                 1728

#define MULLO_BASECASE_THRESHOLD            16
#define MULLO_DC_THRESHOLD                  41
#define MULLO_MUL_N_THRESHOLD             5397

#define DC_DIV_QR_THRESHOLD                 20
#define DC_DIVAPPR_Q_THRESHOLD              82
#define DC_BDIV_QR_THRESHOLD                34
#define DC_BDIV_Q_THRESHOLD                111

#define INV_MULMOD_BNM1_THRESHOLD           58
#define INV_NEWTON_THRESHOLD                13
#define INV_APPR_THRESHOLD                   9

#define BINV_NEWTON_THRESHOLD              187
#define REDC_1_TO_REDC_2_THRESHOLD          10
#define REDC_2_TO_REDC_N_THRESHOLD         115

#define MU_DIV_QR_THRESHOLD                680
#define MU_DIVAPPR_Q_THRESHOLD             618
#define MUPI_DIV_QR_THRESHOLD                0  /* always */
#define MU_BDIV_QR_THRESHOLD               748
#define MU_BDIV_Q_THRESHOLD                889

#define MATRIX22_STRASSEN_THRESHOLD         13
#define HGCD_THRESHOLD                      53
#define GCD_DC_THRESHOLD                   283
#define GCDEXT_DC_THRESHOLD                186
#define JACOBI_BASE_METHOD                   2

#define GET_STR_DC_THRESHOLD                13
#define GET_STR_PRECOMPUTE_THRESHOLD        16
#define SET_STR_DC_THRESHOLD               390
#define SET_STR_PRECOMPUTE_THRESHOLD      1665
