/* gmp-mparam.h -- Compiler/machine parameter header file.

Copyright 1991, 1993, 1994, 1999, 2000, 2001, 2002, 2003, 2004, 2008, 2009,
2010 Free Software Foundation, Inc.

This file is part of the GNU MP Library.

The GNU MP Library is free software; you can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as published by the
Free Software Foundation; either version 3 of the License, or (at your
option) any later version.

The GNU MP Library is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public License
for more details.

You should have received a copy of the GNU Lesser General Public License along
with the GNU MP Library.  If not, see http://www.gnu.org/licenses/.  */

#define GMP_LIMB_BITS 64
#define BYTES_PER_MP_LIMB 8

/* 440MHz PA8200 */

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
#define MUL_TOOM33_THRESHOLD               113
#define MUL_TOOM44_THRESHOLD               195
#define MUL_TOOM6H_THRESHOLD               222
#define MUL_TOOM8H_THRESHOLD               236

#define MUL_TOOM32_TO_TOOM43_THRESHOLD     130
#define MUL_TOOM32_TO_TOOM53_THRESHOLD     229
#define MUL_TOOM42_TO_TOOM53_THRESHOLD     132
#define MUL_TOOM42_TO_TOOM63_THRESHOLD      54

#define SQR_BASECASE_THRESHOLD               4
#define SQR_TOOM2_THRESHOLD                 54
#define SQR_TOOM3_THRESHOLD                169
#define SQR_TOOM4_THRESHOLD                280
#define SQR_TOOM6_THRESHOLD                280
#define SQR_TOOM8_THRESHOLD                296

#define MULMOD_BNM1_THRESHOLD               15
#define SQRMOD_BNM1_THRESHOLD               17

#define MUL_FFT_TABLE  { 400, 800, 1600, 2816, 7168, 20480, 81920, 327680, 0 }
#define MUL_FFT_MODF_THRESHOLD             360
#define MUL_FFT_THRESHOLD                 2368

#define SQR_FFT_TABLE  { 368, 800, 1728, 3328, 7168, 20480, 81920, 327680, 0 }
#define SQR_FFT_MODF_THRESHOLD             264
#define SQR_FFT_THRESHOLD                 1856

#define MULLO_BASECASE_THRESHOLD             0  /* always */
#define MULLO_DC_THRESHOLD                 132
#define MULLO_MUL_N_THRESHOLD             4275

#define DC_DIV_QR_THRESHOLD                132
#define DC_DIVAPPR_Q_THRESHOLD             372
#define DC_BDIV_QR_THRESHOLD               142
#define DC_BDIV_Q_THRESHOLD                312

#define INV_MULMOD_BNM1_THRESHOLD           58
#define INV_NEWTON_THRESHOLD               315
#define INV_APPR_THRESHOLD                 318

#define BINV_NEWTON_THRESHOLD              360
#define REDC_1_TO_REDC_N_THRESHOLD         101

#define MU_DIV_QR_THRESHOLD                979
#define MU_DIVAPPR_Q_THRESHOLD             998
#define MUPI_DIV_QR_THRESHOLD                0  /* always */
#define MU_BDIV_QR_THRESHOLD               889
#define MU_BDIV_Q_THRESHOLD               1187

#define MATRIX22_STRASSEN_THRESHOLD         11
#define HGCD_THRESHOLD                     238
#define GCD_DC_THRESHOLD                   684
#define GCDEXT_DC_THRESHOLD                535
#define JACOBI_BASE_METHOD                   3

#define GET_STR_DC_THRESHOLD                21
#define GET_STR_PRECOMPUTE_THRESHOLD        24
#define SET_STR_DC_THRESHOLD              1877
#define SET_STR_PRECOMPUTE_THRESHOLD      4036
