/* gmp-mparam.h -- Compiler/machine parameter header file.

Copyright 1991, 1993, 1994, 1999, 2000, 2001, 2002, 2003, 2009, 2010 Free
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

#define GMP_LIMB_BITS 64
#define BYTES_PER_MP_LIMB 8

/* POWER5 (friggms.hpc.ntnu.no) */

#define MOD_1_NORM_THRESHOLD                 0  /* always */
#define MOD_1_UNNORM_THRESHOLD               0  /* always */
#define MOD_1N_TO_MOD_1_1_THRESHOLD         13
#define MOD_1U_TO_MOD_1_1_THRESHOLD         10
#define MOD_1_1_TO_MOD_1_2_THRESHOLD         0
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        20
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     33
#define USE_PREINV_DIVREM_1                  0
#define DIVEXACT_1_THRESHOLD                 0  /* always (native) */
#define BMOD_1_TO_MOD_1_THRESHOLD        MP_SIZE_T_MAX  /* never */

#define MUL_TOOM22_THRESHOLD                16
#define MUL_TOOM33_THRESHOLD                56
#define MUL_TOOM44_THRESHOLD               154
#define MUL_TOOM6H_THRESHOLD               206
#define MUL_TOOM8H_THRESHOLD               309

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      82
#define MUL_TOOM32_TO_TOOM53_THRESHOLD      91
#define MUL_TOOM42_TO_TOOM53_THRESHOLD      81
#define MUL_TOOM42_TO_TOOM63_THRESHOLD      88

#define SQR_BASECASE_THRESHOLD              10
#define SQR_TOOM2_THRESHOLD                 36
#define SQR_TOOM3_THRESHOLD                 59
#define SQR_TOOM4_THRESHOLD                112
#define SQR_TOOM6_THRESHOLD                189
#define SQR_TOOM8_THRESHOLD                309

#define MULMOD_BNM1_THRESHOLD               13
#define SQRMOD_BNM1_THRESHOLD                9

#define MUL_FFT_TABLE  { 336, 736, 1728, 2816, 7168, 20480, 81920, 196608, 0 }
#define MUL_FFT_MODF_THRESHOLD             352
#define MUL_FFT_THRESHOLD                 3712

#define SQR_FFT_TABLE  { 304, 608, 1472, 2816, 7168, 20480, 49152, 196608, 0 }
#define SQR_FFT_MODF_THRESHOLD             320
#define SQR_FFT_THRESHOLD                 2752

#define MULLO_BASECASE_THRESHOLD             2
#define MULLO_DC_THRESHOLD                  31
#define MULLO_MUL_N_THRESHOLD             6633

#define DC_DIV_QR_THRESHOLD                 29
#define DC_DIVAPPR_Q_THRESHOLD             102
#define DC_BDIV_QR_THRESHOLD                47
#define DC_BDIV_Q_THRESHOLD                112

#define INV_MULMOD_BNM1_THRESHOLD          107
#define INV_NEWTON_THRESHOLD               130
#define INV_APPR_THRESHOLD                 117

#define BINV_NEWTON_THRESHOLD              246
#define REDC_1_TO_REDC_N_THRESHOLD          54

#define MU_DIV_QR_THRESHOLD                872
#define MU_DIVAPPR_Q_THRESHOLD             855
#define MUPI_DIV_QR_THRESHOLD               53
#define MU_BDIV_QR_THRESHOLD               792
#define MU_BDIV_Q_THRESHOLD                942

#define MATRIX22_STRASSEN_THRESHOLD         11
#define HGCD_THRESHOLD                      86
#define GCD_DC_THRESHOLD                   241
#define GCDEXT_DC_THRESHOLD                229
#define JACOBI_BASE_METHOD                   1

#define GET_STR_DC_THRESHOLD                13
#define GET_STR_PRECOMPUTE_THRESHOLD        23
#define SET_STR_DC_THRESHOLD               532
#define SET_STR_PRECOMPUTE_THRESHOLD      1790
