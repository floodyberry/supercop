/* Intel P55 gmp-mparam.h -- Compiler/machine parameter header file.

Copyright 1991, 1993, 1994, 1999, 2000, 2001, 2002, 2004, 2009, 2010 Free
Software Foundation, Inc.

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


/* For mpn/x86/pentium/mod_1.asm */
#define COUNT_LEADING_ZEROS_NEED_CLZ_TAB


/* 233MHz P55 */

#define MOD_1_NORM_THRESHOLD                 5
#define MOD_1_UNNORM_THRESHOLD           MP_SIZE_T_MAX  /* never */
#define MOD_1N_TO_MOD_1_1_THRESHOLD      MP_SIZE_T_MAX  /* never */
#define MOD_1U_TO_MOD_1_1_THRESHOLD         12
#define MOD_1_1_TO_MOD_1_2_THRESHOLD         0
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        11
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD  MP_SIZE_T_MAX  /* never */
#define USE_PREINV_DIVREM_1                  0
#define DIVEXACT_1_THRESHOLD                 0  /* always (native) */
#define BMOD_1_TO_MOD_1_THRESHOLD           51

#define MUL_TOOM22_THRESHOLD                16
#define MUL_TOOM33_THRESHOLD                53
#define MUL_TOOM44_THRESHOLD               128
#define MUL_TOOM6H_THRESHOLD               189
#define MUL_TOOM8H_THRESHOLD               260

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      89
#define MUL_TOOM32_TO_TOOM53_THRESHOLD      91
#define MUL_TOOM42_TO_TOOM53_THRESHOLD      90
#define MUL_TOOM42_TO_TOOM63_THRESHOLD      88

#define SQR_BASECASE_THRESHOLD               0  /* always (native) */
#define SQR_TOOM2_THRESHOLD                 20
#define SQR_TOOM3_THRESHOLD                 73
#define SQR_TOOM4_THRESHOLD                178
#define SQR_TOOM6_THRESHOLD                210
#define SQR_TOOM8_THRESHOLD                375

#define MULMOD_BNM1_THRESHOLD               11
#define SQRMOD_BNM1_THRESHOLD               12

#define MUL_FFT_TABLE  { 304, 672, 1152, 3584, 10240, 40960, 163840, 0 }
#define MUL_FFT_MODF_THRESHOLD             368
#define MUL_FFT_THRESHOLD                 4736

#define SQR_FFT_TABLE  { 272, 672, 1152, 4608, 10240, 40960, 98304, 393216, 0 }
#define SQR_FFT_MODF_THRESHOLD             288
#define SQR_FFT_THRESHOLD                 5504

#define MULLO_BASECASE_THRESHOLD             0  /* always */
#define MULLO_DC_THRESHOLD                  45
#define MULLO_MUL_N_THRESHOLD             9174

#define DC_DIV_QR_THRESHOLD                 43
#define DC_DIVAPPR_Q_THRESHOLD             170
#define DC_BDIV_QR_THRESHOLD                43
#define DC_BDIV_Q_THRESHOLD                113

#define INV_MULMOD_BNM1_THRESHOLD           54
#define INV_NEWTON_THRESHOLD               179
#define INV_APPR_THRESHOLD                 173

#define BINV_NEWTON_THRESHOLD              197
#define REDC_1_TO_REDC_N_THRESHOLD          47

#define MU_DIV_QR_THRESHOLD               1142
#define MU_DIVAPPR_Q_THRESHOLD            1142
#define MUPI_DIV_QR_THRESHOLD               90
#define MU_BDIV_QR_THRESHOLD               942
#define MU_BDIV_Q_THRESHOLD               1017

#define MATRIX22_STRASSEN_THRESHOLD         12
#define HGCD_THRESHOLD                      88
#define GCD_DC_THRESHOLD                   293
#define GCDEXT_DC_THRESHOLD                233
#define JACOBI_BASE_METHOD                   2

#define GET_STR_DC_THRESHOLD                14
#define GET_STR_PRECOMPUTE_THRESHOLD        26
#define SET_STR_DC_THRESHOLD               272
#define SET_STR_PRECOMPUTE_THRESHOLD       920
