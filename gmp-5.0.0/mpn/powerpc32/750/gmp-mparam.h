/* PowerPC-32 gmp-mparam.h -- Compiler/machine parameter header file.

Copyright 2002, 2004, 2009, 2010 Free Software Foundation, Inc.

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


/* This file is used for 75x (G3) and for 7400/7410 (G4), both which have
   much slow multiply instructions.  */

/* 450 MHz PPC 7400 */

#define DIVREM_1_NORM_THRESHOLD              0  /* always */
#define DIVREM_1_UNNORM_THRESHOLD            0  /* always */
#define MOD_1_NORM_THRESHOLD                 3
#define MOD_1_UNNORM_THRESHOLD               0  /* always */
#define MOD_1N_TO_MOD_1_1_THRESHOLD         11
#define MOD_1U_TO_MOD_1_1_THRESHOLD          7
#define MOD_1_1_TO_MOD_1_2_THRESHOLD        11
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        18
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     38
#define USE_PREINV_DIVREM_1                  1
#define DIVEXACT_1_THRESHOLD                 0  /* always */
#define BMOD_1_TO_MOD_1_THRESHOLD        MP_SIZE_T_MAX  /* never */

#define MUL_TOOM22_THRESHOLD                10
#define MUL_TOOM33_THRESHOLD                38
#define MUL_TOOM44_THRESHOLD                99
#define MUL_TOOM6H_THRESHOLD               141
#define MUL_TOOM8H_THRESHOLD               212

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      65
#define MUL_TOOM32_TO_TOOM53_THRESHOLD      69
#define MUL_TOOM42_TO_TOOM53_THRESHOLD      65
#define MUL_TOOM42_TO_TOOM63_THRESHOLD      66

#define SQR_BASECASE_THRESHOLD               4
#define SQR_TOOM2_THRESHOLD                 18
#define SQR_TOOM3_THRESHOLD                 57
#define SQR_TOOM4_THRESHOLD                 88
#define SQR_TOOM6_THRESHOLD                189
#define SQR_TOOM8_THRESHOLD                309

#define MULMOD_BNM1_THRESHOLD                9
#define SQRMOD_BNM1_THRESHOLD               11

#define MUL_FFT_TABLE  { 240, 672, 896, 2560, 6144, 40960, 98304, 393216, 0 }
#define MUL_FFT_MODF_THRESHOLD             256
#define MUL_FFT_THRESHOLD                 3456

#define SQR_FFT_TABLE  { 240, 544, 896, 2560, 6144, 24576, 98304, 393216, 0 }
#define SQR_FFT_MODF_THRESHOLD             256
#define SQR_FFT_THRESHOLD                 2688

#define MULLO_BASECASE_THRESHOLD             0  /* always */
#define MULLO_DC_THRESHOLD                  33
#define MULLO_MUL_N_THRESHOLD             6633

#define DC_DIV_QR_THRESHOLD                 31
#define DC_DIVAPPR_Q_THRESHOLD             108
#define DC_BDIV_QR_THRESHOLD                35
#define DC_BDIV_Q_THRESHOLD                 88

#define INV_MULMOD_BNM1_THRESHOLD           76
#define INV_NEWTON_THRESHOLD               149
#define INV_APPR_THRESHOLD                 125

#define BINV_NEWTON_THRESHOLD              156
#define REDC_1_TO_REDC_N_THRESHOLD          39

#define MU_DIV_QR_THRESHOLD                807
#define MU_DIVAPPR_Q_THRESHOLD             807
#define MUPI_DIV_QR_THRESHOLD               66
#define MU_BDIV_QR_THRESHOLD               667
#define MU_BDIV_Q_THRESHOLD                807

#define MATRIX22_STRASSEN_THRESHOLD         11
#define HGCD_THRESHOLD                      87
#define GCD_DC_THRESHOLD                   233
#define GCDEXT_DC_THRESHOLD                198
#define JACOBI_BASE_METHOD                   1

#define GET_STR_DC_THRESHOLD                12
#define GET_STR_PRECOMPUTE_THRESHOLD        28
#define SET_STR_DC_THRESHOLD               390
#define SET_STR_PRECOMPUTE_THRESHOLD       814
