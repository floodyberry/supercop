/* PowerPC-32 gmp-mparam.h -- Compiler/machine parameter header file.

Copyright 1991, 1993, 1994, 1999, 2000, 2001, 2002, 2003, 2004, 2008, 2009,
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

#define GMP_LIMB_BITS 32
#define BYTES_PER_MP_LIMB 4


/* This file is supposed to be used for 604, 604e, 744x/745x/747x (G4+), i.e.,
   32-bit PowerPC processors with reasonably fast integer multiply insns.  The
   values below are chosen to be best for the latter processors, since 604 is
   largely irrelevant today.

   In mpn/powerpc32/750/gmp-mparam.h there are values for 75x (G3) and for
   7400/7410 (G4), both which have much slower multiply instructions.  */

/* 1417 MHz PPC 7447A */

#define DIVREM_1_NORM_THRESHOLD              0  /* always */
#define DIVREM_1_UNNORM_THRESHOLD            0  /* always */
#define MOD_1_NORM_THRESHOLD                 0  /* always */
#define MOD_1_UNNORM_THRESHOLD               0  /* always */
#define MOD_1N_TO_MOD_1_1_THRESHOLD          5
#define MOD_1U_TO_MOD_1_1_THRESHOLD          8
#define MOD_1_1_TO_MOD_1_2_THRESHOLD        16
#define MOD_1_2_TO_MOD_1_4_THRESHOLD        65
#define PREINV_MOD_1_TO_MOD_1_THRESHOLD     17
#define USE_PREINV_DIVREM_1                  1
#define DIVEXACT_1_THRESHOLD                 0  /* always */
#define BMOD_1_TO_MOD_1_THRESHOLD           98

#define MUL_TOOM22_THRESHOLD                14
#define MUL_TOOM33_THRESHOLD                73
#define MUL_TOOM44_THRESHOLD               106
#define MUL_TOOM6H_THRESHOLD               157
#define MUL_TOOM8H_THRESHOLD               236

#define MUL_TOOM32_TO_TOOM43_THRESHOLD      73
#define MUL_TOOM32_TO_TOOM53_THRESHOLD      71
#define MUL_TOOM42_TO_TOOM53_THRESHOLD      73
#define MUL_TOOM42_TO_TOOM63_THRESHOLD      72

#define SQR_BASECASE_THRESHOLD               0  /* always */
#define SQR_TOOM2_THRESHOLD                 24
#define SQR_TOOM3_THRESHOLD                 77
#define SQR_TOOM4_THRESHOLD                130
#define SQR_TOOM6_THRESHOLD                189
#define SQR_TOOM8_THRESHOLD                284

#define MULMOD_BNM1_THRESHOLD                9
#define SQRMOD_BNM1_THRESHOLD               14

#define MUL_FFT_TABLE  { 304, 672, 896, 2560, 6144, 24576, 98304, 0 }
#define MUL_FFT_MODF_THRESHOLD             320
#define MUL_FFT_THRESHOLD                 3712

#define SQR_FFT_TABLE  { 272, 672, 1152, 2560, 10240, 40960, 98304, 0 }
#define SQR_FFT_MODF_THRESHOLD             288
#define SQR_FFT_THRESHOLD                 2688

#define MULLO_BASECASE_THRESHOLD             0  /* always */
#define MULLO_DC_THRESHOLD                  45
#define MULLO_MUL_N_THRESHOLD             6633

#define DC_DIV_QR_THRESHOLD                 43
#define DC_DIVAPPR_Q_THRESHOLD             154
#define DC_BDIV_QR_THRESHOLD                55
#define DC_BDIV_Q_THRESHOLD                124

#define INV_MULMOD_BNM1_THRESHOLD          108
#define INV_NEWTON_THRESHOLD               179
#define INV_APPR_THRESHOLD                 166

#define BINV_NEWTON_THRESHOLD              232
#define REDC_1_TO_REDC_N_THRESHOLD          54

#define MU_DIV_QR_THRESHOLD               1057
#define MU_DIVAPPR_Q_THRESHOLD            1142
#define MUPI_DIV_QR_THRESHOLD               83
#define MU_BDIV_QR_THRESHOLD               872
#define MU_BDIV_Q_THRESHOLD               1142

#define MATRIX22_STRASSEN_THRESHOLD         15
#define HGCD_THRESHOLD                     122
#define GCD_DC_THRESHOLD                   339
#define GCDEXT_DC_THRESHOLD                278
#define JACOBI_BASE_METHOD                   1

#define GET_STR_DC_THRESHOLD                17
#define GET_STR_PRECOMPUTE_THRESHOLD        38
#define SET_STR_DC_THRESHOLD               781
#define SET_STR_PRECOMPUTE_THRESHOLD      1505
