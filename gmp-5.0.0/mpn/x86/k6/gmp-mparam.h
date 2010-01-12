/* AMD K6 gmp-mparam.h -- Compiler/machine parameter header file.

Copyright 1991, 1993, 1994, 2000, 2001, 2002, 2003, 2004, 2009, 2010
Free Software Foundation, Inc.

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


/* 450MHz K6-2 */

#define MOD_1_NORM_THRESHOLD                12
#define MOD_1_UNNORM_THRESHOLD           MP_SIZE_T_MAX  /* never */
#define MOD_1N_TO_MOD_1_1_THRESHOLD         28
#define MOD_1U_TO_MOD_1_1_THRESHOLD         18
#define MOD_1_1_TO_MOD_1_2_THRESHOLD         0
#define MOD_1_2_TO_MOD_1_4_THRESHOLD     MP_SIZE_T_MAX
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     82
#define USE_PREINV_DIVREM_1                  0
#define DIVEXACT_1_THRESHOLD                 0  /* always (native) */
#define BMOD_1_TO_MOD_1_THRESHOLD        MP_SIZE_T_MAX  /* never */

#define MUL_TOOM22_THRESHOLD                20
#define MUL_TOOM33_THRESHOLD                69
#define MUL_TOOM44_THRESHOLD               106
#define MUL_TOOM6H_THRESHOLD               157
#define MUL_TOOM8H_THRESHOLD               199

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      73
#define MUL_TOOM32_TO_TOOM53_THRESHOLD      69
#define MUL_TOOM42_TO_TOOM53_THRESHOLD      65
#define MUL_TOOM42_TO_TOOM63_THRESHOLD      64

#define SQR_BASECASE_THRESHOLD               0  /* always (native) */
#define SQR_TOOM2_THRESHOLD                 32
#define SQR_TOOM3_THRESHOLD                 97
#define SQR_TOOM4_THRESHOLD                143
#define SQR_TOOM6_THRESHOLD                222
#define SQR_TOOM8_THRESHOLD                272

#define MULMOD_BNM1_THRESHOLD               13
#define SQRMOD_BNM1_THRESHOLD               17

#define MUL_FFT_TABLE  { 368, 672, 1152, 3584, 10240, 24576, 163840, 0 }
#define MUL_FFT_MODF_THRESHOLD             624
#define MUL_FFT_THRESHOLD                 7808

#define SQR_FFT_TABLE  { 400, 672, 1408, 4608, 10240, 24576, 98304, 393216, 0 }
#define SQR_FFT_MODF_THRESHOLD             528
#define SQR_FFT_THRESHOLD                 9600

#define MULLO_BASECASE_THRESHOLD             3
#define MULLO_DC_THRESHOLD                  60
#define MULLO_MUL_N_THRESHOLD            13463

#define DC_DIV_QR_THRESHOLD                 78
#define DC_DIVAPPR_Q_THRESHOLD             252
#define DC_BDIV_QR_THRESHOLD                84
#define DC_BDIV_Q_THRESHOLD                171

#define INV_MULMOD_BNM1_THRESHOLD           55
#define INV_NEWTON_THRESHOLD               234
#define INV_APPR_THRESHOLD                 236

#define BINV_NEWTON_THRESHOLD              268
#define REDC_1_TO_REDC_N_THRESHOLD          67

#define MU_DIV_QR_THRESHOLD               1308
#define MU_DIVAPPR_Q_THRESHOLD            1142
#define MUPI_DIV_QR_THRESHOLD              134
#define MU_BDIV_QR_THRESHOLD              1164
#define MU_BDIV_Q_THRESHOLD               1164

#define MATRIX22_STRASSEN_THRESHOLD         15
#define HGCD_THRESHOLD                     182
#define GCD_DC_THRESHOLD                   591
#define GCDEXT_DC_THRESHOLD                472
#define JACOBI_BASE_METHOD                   2

#define GET_STR_DC_THRESHOLD                24
#define GET_STR_PRECOMPUTE_THRESHOLD        40
#define SET_STR_DC_THRESHOLD               834
#define SET_STR_PRECOMPUTE_THRESHOLD      2042
