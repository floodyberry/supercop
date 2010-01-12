/* POWER3/PowerPC630 gmp-mparam.h -- Compiler/machine parameter header file.

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
#define MOD_1N_TO_MOD_1_1_THRESHOLD      MP_SIZE_T_MAX  /* never */
#define MOD_1U_TO_MOD_1_1_THRESHOLD      MP_SIZE_T_MAX
#define MOD_1_1_TO_MOD_1_2_THRESHOLD     MP_SIZE_T_MAX
#define MOD_1_2_TO_MOD_1_4_THRESHOLD     MP_SIZE_T_MAX
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD  MP_SIZE_T_MAX  /* never */
#define USE_PREINV_DIVREM_1                  0
#define DIVEXACT_1_THRESHOLD                 0  /* always (native) */
#define BMOD_1_TO_MOD_1_THRESHOLD        MP_SIZE_T_MAX  /* never */

#define MUL_TOOM22_THRESHOLD                10
#define MUL_TOOM33_THRESHOLD                33
#define MUL_TOOM44_THRESHOLD                46
#define MUL_TOOM6H_THRESHOLD                77
#define MUL_TOOM8H_THRESHOLD               115

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      49
#define MUL_TOOM32_TO_TOOM53_THRESHOLD      38
#define MUL_TOOM42_TO_TOOM53_THRESHOLD      33
#define MUL_TOOM42_TO_TOOM63_THRESHOLD      32

#define SQR_BASECASE_THRESHOLD               0  /* always */
#define SQR_TOOM2_THRESHOLD                 14
#define SQR_TOOM3_THRESHOLD                 49
#define SQR_TOOM4_THRESHOLD                 64
#define SQR_TOOM6_THRESHOLD                 84
#define SQR_TOOM8_THRESHOLD                127

#define MULMOD_BNM1_THRESHOLD                8
#define SQRMOD_BNM1_THRESHOLD                9

#define MUL_FFT_TABLE  { 208, 416, 1088, 1792, 5120, 12288, 81920, 196608, 0 }
#define MUL_FFT_MODF_THRESHOLD             224
#define MUL_FFT_THRESHOLD                 2688

#define SQR_FFT_TABLE  { 208, 416, 960, 1792, 5120, 12288, 49152, 196608, 0 }
#define SQR_FFT_MODF_THRESHOLD             224
#define SQR_FFT_THRESHOLD                 2176

#define MULLO_BASECASE_THRESHOLD             3
#define MULLO_DC_THRESHOLD                  27
#define MULLO_MUL_N_THRESHOLD             4940

#define DC_DIV_QR_THRESHOLD                 27
#define DC_DIVAPPR_Q_THRESHOLD              95
#define DC_BDIV_QR_THRESHOLD                28
#define DC_BDIV_Q_THRESHOLD                 62

#define INV_MULMOD_BNM1_THRESHOLD           76
#define INV_NEWTON_THRESHOLD               117
#define INV_APPR_THRESHOLD                 101

#define BINV_NEWTON_THRESHOLD              133
#define REDC_1_TO_REDC_N_THRESHOLD          30

#define MU_DIV_QR_THRESHOLD                618
#define MU_DIVAPPR_Q_THRESHOLD             551
#define MUPI_DIV_QR_THRESHOLD               49
#define MU_BDIV_QR_THRESHOLD               492
#define MU_BDIV_Q_THRESHOLD                541

#define MATRIX22_STRASSEN_THRESHOLD          9
#define HGCD_THRESHOLD                      55
#define GCD_DC_THRESHOLD                   162
#define GCDEXT_DC_THRESHOLD                124
#define JACOBI_BASE_METHOD                   1

#define GET_STR_DC_THRESHOLD                17
#define GET_STR_PRECOMPUTE_THRESHOLD        27
#define SET_STR_DC_THRESHOLD               354
#define SET_STR_PRECOMPUTE_THRESHOLD       812
