/* groestl-aes64.h     Feb 2011
 *
 * Groestl implementation with inline assembly using AVX
 * instructions.
 * Author: Günther A. Roland
 *
 * This code is placed in the public domain
 */

#include <smmintrin.h>
#include <wmmintrin.h>
#include <immintrin.h>

/* global variables  */
__m128i xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7;
__m128i xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15;
__m128i xmmTemp[5];

__m256d ymm0, ymm1, ymm2, ymm3, ymm4, ymm5, ymm6, ymm7;
__m256d ymm8, ymm9, ymm10, ymm11, ymm12, ymm13, ymm14, ymm15;
__m256d ymmTempD[2];
__m256i ymmI0, ymmI1, ymmI2, ymmI3, ymmI4, ymmI5, ymmI6, ymmI7;
__m256i ymmI8, ymmI9, ymmI10, ymmI11, ymmI12, ymmI13, ymmI14, ymmI15;
__m256i ymmTemp[4];

__m128i GLOBAL_CV_PTR[8];
u32 ROUND_CONST_MUL;
__m128i ROUND_CONST_Lx;
__m128i ROUND_CONST_L0[ROUNDS512];
__m128i ROUND_CONST_L7[ROUNDS512];
__m128i ROUND_CONST_P[ROUNDS1024];
__m128i ROUND_CONST_Q[ROUNDS1024];
__m128i TRANSP_MASK;
__m128i ALL_FF;
__m128i ALL_1B;
__m128i SUBSH_MASK[8];
#if (LENGTH <= 256)
__m128i TMP_MUL1[8];
__m128i TMP_MUL2[8];
__m128i TMP_MUL4;
#endif
#if (LENGTH > 256)
__m256d TMP_MUL1[8];
__m256d TMP_MUL2[8];
__m256d TMP_MUL4;
#endif


#define tos(a)    #a
#define tostr(a)  tos(a)

#define SET_SHARED_CONSTANTS(){\
  TRANSP_MASK = _mm_set_epi32(0x0f070b03, 0x0e060a02, 0x0d050901, 0x0c040800);\
  ALL_1B = _mm_set_epi32(0x1b1b1b1b, 0x1b1b1b1b, 0x1b1b1b1b, 0x1b1b1b1b);\
}/**/

#if (LENGTH <= 256)

#define SET_CONSTANTS(){\
  SET_SHARED_CONSTANTS();\
  SUBSH_MASK[0] = _mm_set_epi32(0x03060a0d, 0x08020509, 0x0c0f0104, 0x070b0e00);\
  SUBSH_MASK[1] = _mm_set_epi32(0x04070c0f, 0x0a03060b, 0x0e090205, 0x000d0801);\
  SUBSH_MASK[2] = _mm_set_epi32(0x05000e09, 0x0c04070d, 0x080b0306, 0x010f0a02);\
  SUBSH_MASK[3] = _mm_set_epi32(0x0601080b, 0x0e05000f, 0x0a0d0407, 0x02090c03);\
  SUBSH_MASK[4] = _mm_set_epi32(0x0702090c, 0x0f060108, 0x0b0e0500, 0x030a0d04);\
  SUBSH_MASK[5] = _mm_set_epi32(0x00030b0e, 0x0907020a, 0x0d080601, 0x040c0f05);\
  SUBSH_MASK[6] = _mm_set_epi32(0x01040d08, 0x0b00030c, 0x0f0a0702, 0x050e0906);\
  SUBSH_MASK[7] = _mm_set_epi32(0x02050f0a, 0x0d01040e, 0x090c0003, 0x06080b07);\
  for(i = 0; i < ROUNDS512; i++)\
  {\
    ROUND_CONST_MUL = i * 0x01010101;\
    ROUND_CONST_L0[i] = _mm_set_epi32(0xffffffff, 0xffffffff, 0x70605040 ^ ROUND_CONST_MUL, 0x30201000 ^ ROUND_CONST_MUL);\
    ROUND_CONST_L7[i] = _mm_set_epi32(0x8f9fafbf ^ ROUND_CONST_MUL, 0xcfdfefff ^ ROUND_CONST_MUL, 0x00000000, 0x00000000);\
  }\
  ROUND_CONST_Lx = _mm_set_epi32(0xffffffff, 0xffffffff, 0x00000000, 0x00000000);\
}while(0);

/* xmm[i] will be multiplied by 2
 * xmm[j] will be lost
 * xmm[k] has to be all 0x1b */
#define MUL2(i, j, k){\
    j = _mm_xor_si128(j, j);\
    j = _mm_cmpgt_epi8(j, i);\
    i = _mm_add_epi8(i, i);\
    j = _mm_and_si128(j, k);\
    i = _mm_xor_si128(i, j);\
}/**/

/* Optimized *2 / *4 calculation
 * inputs:
 * a0-a7 = (row0-row7) * 1
 * t0-t1 = clobbers
 * outputs:
 * a0-a7 = (row0-row7) * 4
 * b0, b1, b3, b4, b5, b7 = helpers
 * TMP_MUL1/2 in memory
 * */
#define Multiply(a0, a1, a2, a3, a4, a5, a6, a7, t0, t1, b0, b1, b3, b4, b5, b7){\
		/* save *1 values and multiply by 2*/\
		TMP_MUL1[1] = a1;\
		TMP_MUL1[2] = a2;\
		t1 = ALL_1B;\
    b4 = a0;\
		MUL2(a0, t0, t1);\
		MUL2(a1, t0, t1);\
		MUL2(a2, t0, t1);\
		TMP_MUL1[3] = a3;\
		TMP_MUL1[5] = a5;\
    b7 = a4;\
		MUL2(a3, t0, t1);\
		MUL2(a4, t0, t1);\
		MUL2(a5, t0, t1);\
		TMP_MUL1[6] = a6;\
		TMP_MUL1[7] = a7;\
		MUL2(a6, t0, t1);\
		MUL2(a7, t0, t1);\
		\
		/* save *2 values and multiply by 2*/\
		TMP_MUL2[0] = a0;\
		TMP_MUL2[1] = a1;\
		TMP_MUL2[2] = a2;\
    b0 = a0;\
		MUL2(a0, t0, t1);\
		MUL2(a1, t0, t1);\
		MUL2(a2, t0, t1);\
		TMP_MUL2[3] = a3;\
		TMP_MUL2[4] = a4;\
		TMP_MUL2[5] = a5;\
    b1 = a3;\
		MUL2(a3, t0, t1);\
		MUL2(a4, t0, t1);\
		MUL2(a5, t0, t1);\
		TMP_MUL2[6] = a6;\
    b5 = a7;\
    b3 = a7;\
		MUL2(a6, t0, t1);\
		MUL2(a7, t0, t1);\
}/**/

/* Optimized MixBytes
 * inputs:
 * a0-a7 = (row0-row7) * 4
 * all * 1 / 2 values must be in TMP_MUL1/2
 * output: b0-b7
 * */
#define MixBytes(a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, b4, b5, b6, b7){\
    /* save one value */\
    TMP_MUL4 = a3;\
    /* 1 */\
    b1 = _mm_xor_si128(b1, a0);\
    b1 = _mm_xor_si128(b1, a5);\
    b1 = _mm_xor_si128(b1, b4); /* -> helper! */\
    b2 = b1;\
    \
    /* 2 */\
    b5 = _mm_xor_si128(b5, a1);\
    b5 = _mm_xor_si128(b5, a4);\
    b5 = _mm_xor_si128(b5, b7); /* -> helper! */\
    b6 = b5;\
    \
    /* 4 */\
    b7 = _mm_xor_si128(b7, a6);\
    b7 = _mm_xor_si128(b7, (TMP_MUL1[6]));\
    b7 = _mm_xor_si128(b7, (TMP_MUL2[1]));\
    b7 = _mm_xor_si128(b7, b3); /* -> helper! */\
    b2 = _mm_xor_si128(b2, b7);\
    \
    /* 3 */\
    b0 = _mm_xor_si128(b0, a7);\
    b0 = _mm_xor_si128(b0, (TMP_MUL1[5]));\
    b0 = _mm_xor_si128(b0, (TMP_MUL1[7]));\
    b0 = _mm_xor_si128(b0, (TMP_MUL2[2]));\
    b3 = b0;\
    b1 = _mm_xor_si128(b1, b0);\
    b0 = _mm_xor_si128(b0, b7); /* moved from 4 */\
    \
    /* 5 */\
    b4 = _mm_xor_si128(b4, a2);\
    b4 = _mm_xor_si128(b4, (TMP_MUL1[2]));\
    b4 = _mm_xor_si128(b4, (TMP_MUL2[3]));\
    b4 = _mm_xor_si128(b4, (TMP_MUL2[5]));\
    b3 = _mm_xor_si128(b3, b4);\
    b6 = _mm_xor_si128(b6, b4);\
    \
    /* 6 */\
    a3 = _mm_xor_si128(a3, (TMP_MUL1[1]));\
    a3 = _mm_xor_si128(a3, (TMP_MUL1[3]));\
    a3 = _mm_xor_si128(a3, (TMP_MUL2[4]));\
    a3 = _mm_xor_si128(a3, (TMP_MUL2[6]));\
    b4 = _mm_xor_si128(b4, a3);\
    b5 = _mm_xor_si128(b5, a3);\
    b7 = _mm_xor_si128(b7, a3);\
    \
    /* 7 */\
    a1 = _mm_xor_si128(a1, (TMP_MUL1[1]));\
    a1 = _mm_xor_si128(a1, (TMP_MUL2[4]));\
    b2 = _mm_xor_si128(b2, a1);\
    b3 = _mm_xor_si128(b3, a1);\
    \
    /* 8 */\
    a5 = _mm_xor_si128(a5, (TMP_MUL1[5]));\
    a5 = _mm_xor_si128(a5, (TMP_MUL2[0]));\
    b6 = _mm_xor_si128(b6, a5);\
    b7 = _mm_xor_si128(b7, a5);\
    \
    /* 9 */\
    a3 = TMP_MUL1[2];\
    a3 = _mm_xor_si128(a3, (TMP_MUL2[5]));\
    b0 = _mm_xor_si128(b0, a3);\
    b5 = _mm_xor_si128(b5, a3);\
    \
    /* 10 */\
    a1 = TMP_MUL1[6];\
    a1 = _mm_xor_si128(a1, (TMP_MUL2[1]));\
    b1 = _mm_xor_si128(b1, a1);\
    b4 = _mm_xor_si128(b4, a1);\
    \
    /* 11 */\
    a5 = TMP_MUL1[3];\
    a5 = _mm_xor_si128(a5, (TMP_MUL2[6]));\
    b1 = _mm_xor_si128(b1, a5);\
    b6 = _mm_xor_si128(b6, a5);\
    \
    /* 12 */\
    a3 = TMP_MUL1[7];\
    a3 = _mm_xor_si128(a3, (TMP_MUL2[2]));\
    b2 = _mm_xor_si128(b2, a3);\
    b5 = _mm_xor_si128(b5, a3);\
    \
    /* 13 */\
    b0 = _mm_xor_si128(b0, (TMP_MUL4));\
    b0 = _mm_xor_si128(b0, a4);\
    b1 = _mm_xor_si128(b1, a4);\
    b3 = _mm_xor_si128(b3, a6);\
    b4 = _mm_xor_si128(b4, a0);\
    b4 = _mm_xor_si128(b4, a7);\
    b5 = _mm_xor_si128(b5, a0);\
    b7 = _mm_xor_si128(b7, a2);\
}/**/

/* one round
 * i = round number
 * a0-a7 = input rows
 * b0-b7 = output rows
 */
#define ROUND(i, a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, b4, b5, b6, b7){\
    /* Add Round Constant */\
    b1 = ROUND_CONST_Lx;\
    a0 = _mm_xor_si128(a0, (ROUND_CONST_L0[i]));\
    a1 = _mm_xor_si128(a1, b1);\
    a2 = _mm_xor_si128(a2, b1);\
    a3 = _mm_xor_si128(a3, b1);\
    a4 = _mm_xor_si128(a4, b1);\
    a5 = _mm_xor_si128(a5, b1);\
    a6 = _mm_xor_si128(a6, b1);\
    a7 = _mm_xor_si128(a7, (ROUND_CONST_L7[i]));\
\
    b0 = _mm_xor_si128(b0,  b0);\
\
    /* ShiftBytes + SubBytes */\
    a0 = _mm_shuffle_epi8(a0, (SUBSH_MASK[0]));\
    a0 = _mm_aesenclast_si128(a0, b0);\
    a1 = _mm_shuffle_epi8(a1, (SUBSH_MASK[1]));\
    a1 = _mm_aesenclast_si128(a1, b0);\
    a2 = _mm_shuffle_epi8(a2, (SUBSH_MASK[2]));\
    a2 = _mm_aesenclast_si128(a2, b0);\
    a3 = _mm_shuffle_epi8(a3, (SUBSH_MASK[3]));\
    a3 = _mm_aesenclast_si128(a3, b0);\
    a4 = _mm_shuffle_epi8(a4, (SUBSH_MASK[4]));\
    a4 = _mm_aesenclast_si128(a4, b0);\
    a5 = _mm_shuffle_epi8(a5, (SUBSH_MASK[5]));\
    a5 = _mm_aesenclast_si128(a5, b0);\
    a6 = _mm_shuffle_epi8(a6, (SUBSH_MASK[6]));\
    a6 = _mm_aesenclast_si128(a6, b0);\
    a7 = _mm_shuffle_epi8(a7, (SUBSH_MASK[7]));\
    a7 = _mm_aesenclast_si128(a7, b0);\
\
    /* MixBytes Version 2 */\
    /* Multiplication */\
    Multiply(a0, a1, a2, a3, a4, a5, a6, a7, b2, b6, b0, b1, b3, b4, b5, b7);\
    /* MixBytes */\
    MixBytes(a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, b4, b5, b6, b7);\
\
}

/* 10 rounds */
#define TRANSFORM(){\
  ROUND(0, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7);\
  ROUND(1, xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15);\
  ROUND(2, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7);\
  ROUND(3, xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15);\
  ROUND(4, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7);\
  ROUND(5, xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15);\
  ROUND(6, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7);\
  ROUND(7, xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15);\
  ROUND(8, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7);\
  ROUND(9, xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15);\
}

/* Matrix Transpose Step 1
 * input is a 512-bit state with two columns in one xmm
 * output is a 512-bit state with two rows in one xmm
 * inputs: i0-i3
 * outputs: i0, o1-o3
 * clobbers: t0
 */
#define Matrix_Transpose_A(i0, i1, i2, i3, o1, o2, o3, t0){\
  t0 = TRANSP_MASK;\
\
  i0 = _mm_shuffle_epi8(i0, t0);\
  i1 = _mm_shuffle_epi8(i1, t0);\
  i2 = _mm_shuffle_epi8(i2, t0);\
  i3 = _mm_shuffle_epi8(i3, t0);\
\
  o1 = _mm_unpackhi_epi16(i0, i1);\
  i0 = _mm_unpacklo_epi16(i0, i1);\
  t0 = _mm_unpackhi_epi16(i2, i3);\
  i2 = _mm_unpacklo_epi16(i2, i3);\
\
  i0 = _mm_shuffle_epi32(i0, 216);\
  o1 = _mm_shuffle_epi32(o1, 216);\
  i2 = _mm_shuffle_epi32(i2, 216);\
  t0 = _mm_shuffle_epi32(t0, 216);\
\
  o2 = _mm_unpackhi_epi32(i0, i2);\
  o3 = _mm_unpackhi_epi32(o1, t0);\
  i0 = _mm_unpacklo_epi32(i0, i2);\
  o1 = _mm_unpacklo_epi32(o1, t0);\
}/**/

/* Matrix Transpose Step 2
 * input are two 512-bit states with two rows in one xmm
 * output are two 512-bit states with one row of each state in one xmm
 * inputs: i0-i3 = P, i4-i7 = Q
 * outputs: (i0, o1-o7) = (P|Q)
 * possible reassignments: (output reg = input reg)
 * * i1 -> o3-7
 * * i2 -> o5-7
 * * i3 -> o7
 * * i4 -> o3-7
 * * i5 -> o6-7
 */
#define Matrix_Transpose_B(i0, i1, i2, i3, i4, i5, i6, i7, o1, o2, o3, o4, o5, o6, o7){\
  o1 = _mm_unpackhi_epi64(i0, i4);\
  i0 = _mm_unpacklo_epi64(i0, i4);\
  o2 = _mm_unpacklo_epi64(i1, i5);\
  o3 = _mm_unpackhi_epi64(i1, i5);\
  o4 = _mm_unpacklo_epi64(i2, i6);\
  o5 = _mm_unpackhi_epi64(i2, i6);\
  o6 = _mm_unpacklo_epi64(i3, i7);\
  o7 = _mm_unpackhi_epi64(i3, i7);\
}/**/

/* Matrix Transpose Inverse Step 2
 * input are two 512-bit states with one row of each state in one xmm
 * output are two 512-bit states with two rows in one xmm
 * inputs: i0-i7 = (P|Q)
 * outputs: (i0, i2, i4, i6) = P, (o0-o3) = Q
 */
#define Matrix_Transpose_B_INV(i0, i1, i2, i3, i4, i5, i6, i7, o0, o1, o2, o3){\
  o0 = _mm_unpackhi_epi64(i0, i1);\
  i0 = _mm_unpacklo_epi64(i0, i1);\
  o1 = _mm_unpackhi_epi64(i2, i3);\
  i2 = _mm_unpacklo_epi64(i2, i3);\
  o2 = _mm_unpackhi_epi64(i4, i5);\
  i4 = _mm_unpacklo_epi64(i4, i5);\
  o3 = _mm_unpackhi_epi64(i6, i7);\
  i6 = _mm_unpacklo_epi64(i6, i7);\
}/**/

/* Matrix Transpose Output Step 2
 * input is one 512-bit state with two rows in one xmm
 * output is one 512-bit state with one row in the low 64-bits of one xmm
 * inputs: i0,i2,i4,i6 = S
 * outputs: (i0-7) = (0|S)
 */
#define Matrix_Transpose_O_B(i0, i1, i2, i3, i4, i5, i6, i7, t0){\
  t0 = _mm_xor_si128(t0, t0);\
  i1 = _mm_unpackhi_epi64(i0, t0);\
  i0 = _mm_unpacklo_epi64(i0, t0);\
  i3 = _mm_unpackhi_epi64(i2, t0);\
  i2 = _mm_unpacklo_epi64(i2, t0);\
  i5 = _mm_unpackhi_epi64(i4, t0);\
  i4 = _mm_unpacklo_epi64(i4, t0);\
  i7 = _mm_unpackhi_epi64(i6, t0);\
  i6 = _mm_unpacklo_epi64(i6, t0);\
}/**/

/* Matrix Transpose Output Inverse Step 2
 * input is one 512-bit state with one row in the low 64-bits of one xmm
 * output is one 512-bit state with two rows in one xmm
 * inputs: i0-i7 = (0|S)
 * outputs: (i0, i2, i4, i6) = S
 */
#define Matrix_Transpose_O_B_INV(i0, i1, i2, i3, i4, i5, i6, i7){\
  i0 = _mm_unpacklo_epi64(i0, i1);\
  i2 = _mm_unpacklo_epi64(i2, i3);\
  i4 = _mm_unpacklo_epi64(i4, i5);\
  i6 = _mm_unpacklo_epi64(i6, i7);\
}/**/


void INIT_CV()
{
  /* load CV (IV) into registers xmm12 - xmm15 */
  xmm12 = GLOBAL_CV_PTR[0];
  xmm13 = GLOBAL_CV_PTR[1];
  xmm14 = GLOBAL_CV_PTR[2];
  xmm15 = GLOBAL_CV_PTR[3];

  /* transpose matrix to get one line of P AND Q in each xmm */
  Matrix_Transpose_A(xmm12, xmm13, xmm14, xmm15, xmm2, xmm6, xmm7, xmm0);

  /* store transposed CV */
  GLOBAL_CV_PTR[0] = xmm12;
  GLOBAL_CV_PTR[1] = xmm2;
  GLOBAL_CV_PTR[2] = xmm6;
  GLOBAL_CV_PTR[3] = xmm7;
}

void TF512(u64* message)
{
  /*  Note : message is in rdi thanks to the  */
  /*  __cdecl calling convention    */
#ifdef IACA_TRACE
  IACA_START;
#endif
  /* load message into registers xmm12 - xmm15 (Q = message) */
  xmm12 = _mm_set_epi32((message)[2*0+1] >> 32, (message)[2*0+1], (message)[2*0+0] >> 32, (message)[2*0+0]);
  xmm13 = _mm_set_epi32((message)[2*1+1] >> 32, (message)[2*1+1], (message)[2*1+0] >> 32, (message)[2*1+0]);
  xmm14 = _mm_set_epi32((message)[2*2+1] >> 32, (message)[2*2+1], (message)[2*2+0] >> 32, (message)[2*2+0]);
  xmm15 = _mm_set_epi32((message)[2*3+1] >> 32, (message)[2*3+1], (message)[2*3+0] >> 32, (message)[2*3+0]);

  /* transpose message to get two rows in each xmm */
  Matrix_Transpose_A(xmm12, xmm13, xmm14, xmm15, xmm2, xmm6, xmm7, xmm0);

  /* xor Q to P to get P = h ^ m */
  xmm8 = _mm_xor_si128(xmm12, (GLOBAL_CV_PTR[0]));
  xmm0 = _mm_xor_si128(xmm2,  (GLOBAL_CV_PTR[1]));
  xmm4 = _mm_xor_si128(xmm6,  (GLOBAL_CV_PTR[2]));
  xmm5 = _mm_xor_si128(xmm7,  (GLOBAL_CV_PTR[3]));

  /* there are now 2 rows in each xmm
   * unpack to get 1 row of P and Q in each xmm */
  Matrix_Transpose_B(xmm8, xmm0, xmm4, xmm5, xmm12, xmm2, xmm6, xmm7, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15);

  /* the real work: */
  TRANSFORM();

  /* transpose matrix to get back input format */
  Matrix_Transpose_B_INV(xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm0, xmm1, xmm2, xmm3);

  /* xor P and Q */
  xmm0 = _mm_xor_si128(xmm0, xmm8);
  xmm1 = _mm_xor_si128(xmm1, xmm10);
  xmm2 = _mm_xor_si128(xmm2, xmm12);
  xmm3 = _mm_xor_si128(xmm3, xmm14);

  /* xor CV */
  xmm0 = _mm_xor_si128(xmm0, (GLOBAL_CV_PTR[0]));
  xmm1 = _mm_xor_si128(xmm1, (GLOBAL_CV_PTR[1]));
  xmm2 = _mm_xor_si128(xmm2, (GLOBAL_CV_PTR[2]));
  xmm3 = _mm_xor_si128(xmm3, (GLOBAL_CV_PTR[3]));

  /* store finished CV */
  GLOBAL_CV_PTR[0] = xmm0;
  GLOBAL_CV_PTR[1] = xmm1;
  GLOBAL_CV_PTR[2] = xmm2;
  GLOBAL_CV_PTR[3] = xmm3;

#ifdef IACA_TRACE
  IACA_END;
#endif
  return;
}

void OF512() {
  /* load CV */
  xmm8 = GLOBAL_CV_PTR[0];
  xmm10 = GLOBAL_CV_PTR[1];
  xmm12 = GLOBAL_CV_PTR[2];
  xmm14 = GLOBAL_CV_PTR[3];

  /* there are now 2 rows in each xmm
   * unpack to get 1 row of P in each xmm */
  Matrix_Transpose_O_B(xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm0);

  /* the real work: */
  TRANSFORM();

  /* transpose matrix to get back input format */
  Matrix_Transpose_O_B_INV(xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15);

  /* xor CV */
  xmm8 = _mm_xor_si128(xmm8,  (GLOBAL_CV_PTR[0]));
  xmm10 = _mm_xor_si128(xmm10, (GLOBAL_CV_PTR[1]));
  xmm12 = _mm_xor_si128(xmm12, (GLOBAL_CV_PTR[2]));
  xmm14 = _mm_xor_si128(xmm14, (GLOBAL_CV_PTR[3]));

  /* transpose output back to two columns per xmm */
  Matrix_Transpose_A(xmm8, xmm10, xmm12, xmm14, xmm4, xmm9, xmm11, xmm0);

  /* store finished CV */
  GLOBAL_CV_PTR[0] = xmm8;
  GLOBAL_CV_PTR[1] = xmm4;
  GLOBAL_CV_PTR[2] = xmm9;
  GLOBAL_CV_PTR[3] = xmm11;

  return;
}//OF512()

#endif

#if (LENGTH > 256)

#define SET_CONSTANTS(){\
  SET_SHARED_CONSTANTS();\
  ALL_FF = _mm_set_epi32(0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff);\
  SUBSH_MASK[0] = _mm_set_epi32(0x0306090c, 0x0f020508, 0x0b0e0104, 0x070a0d00);\
  SUBSH_MASK[1] = _mm_set_epi32(0x04070a0d, 0x00030609, 0x0c0f0205, 0x080b0e01);\
  SUBSH_MASK[2] = _mm_set_epi32(0x05080b0e, 0x0104070a, 0x0d000306, 0x090c0f02);\
  SUBSH_MASK[3] = _mm_set_epi32(0x06090c0f, 0x0205080b, 0x0e010407, 0x0a0d0003);\
  SUBSH_MASK[4] = _mm_set_epi32(0x070a0d00, 0x0306090c, 0x0f020508, 0x0b0e0104);\
  SUBSH_MASK[5] = _mm_set_epi32(0x080b0e01, 0x04070a0d, 0x00030609, 0x0c0f0205);\
  SUBSH_MASK[6] = _mm_set_epi32(0x090c0f02, 0x05080b0e, 0x0104070a, 0x0d000306);\
  SUBSH_MASK[7] = _mm_set_epi32(0x0e010407, 0x0a0d0003, 0x06090c0f, 0x0205080b);\
  for(i = 0; i < ROUNDS1024; i++)\
  {\
    ROUND_CONST_MUL = i * 0x01010101;\
    ROUND_CONST_P[i] = _mm_set_epi32(0xf0e0d0c0 ^ ROUND_CONST_MUL, 0xb0a09080 ^ ROUND_CONST_MUL, 0x70605040 ^ ROUND_CONST_MUL, 0x30201000 ^ ROUND_CONST_MUL);\
    ROUND_CONST_Q[i] = _mm_set_epi32(0x0f1f2f3f ^ ROUND_CONST_MUL, 0x4f5f6f7f ^ ROUND_CONST_MUL, 0x8f9fafbf ^ ROUND_CONST_MUL, 0xcfdfefff ^ ROUND_CONST_MUL);\
  }\
}while(0);

/* AVX MUL2
 * input: i, c0 (must be 0x1b...1b)
 * output i = 2 * i
 * clobbers: t0-t3
 * */
#define MUL2(i, c0){\
    xmmTemp[0] = _mm_xor_si128(xmmTemp[0], xmmTemp[0]);\
    ymmTemp[2] = _mm256_castpd_si256(i);\
    xmmTemp[3] = _mm256_extractf128_si256(ymmTemp[2], 0);\
    xmmTemp[4] = _mm256_extractf128_si256(ymmTemp[2], 1);\
    xmmTemp[1] = _mm_cmpgt_epi8(xmmTemp[0], xmmTemp[3]);\
    xmmTemp[2] = _mm_cmpgt_epi8(xmmTemp[0], xmmTemp[4]);\
    xmmTemp[3] = _mm_add_epi8(xmmTemp[3], xmmTemp[3]);\
    xmmTemp[4] = _mm_add_epi8(xmmTemp[4], xmmTemp[4]);\
    ymmTemp[1] = _mm256_insertf128_si256(ymmTemp[1], xmmTemp[1], 0);\
    ymmTemp[1] = _mm256_insertf128_si256(ymmTemp[1], xmmTemp[2], 1);\
    ymmTemp[2] = _mm256_insertf128_si256(ymmTemp[2], xmmTemp[3], 0);\
    ymmTemp[2] = _mm256_insertf128_si256(ymmTemp[2], xmmTemp[4], 1);\
    ymmTempD[0] = _mm256_castsi256_pd(ymmTemp[1]);\
    ymmTempD[0] = _mm256_and_pd(ymmTempD[0], c0);\
    i = _mm256_castsi256_pd(ymmTemp[2]);\
    i = _mm256_xor_pd(i, ymmTempD[0]);\
}/**/

/* AVX SubShift
 * inputs:
 * * i
 * * c0 (must be 0)
 * * ShiftP
 * * ShiftQ
 * output i = S(Shift(i_1, ShiftQ)|Shift(i_0, ShiftP))
 * clobbers: t0
 * */
#define SubShift(i, ShiftP, ShiftQ){\
    ymmTemp[2] = _mm256_castpd_si256(i);\
    xmmTemp[0] = _mm256_extractf128_si256(ymmTemp[2], 0);\
    xmmTemp[1] = _mm256_extractf128_si256(ymmTemp[2], 1);\
    xmmTemp[0] = _mm_shuffle_epi8(xmmTemp[0], (SUBSH_MASK[ShiftP]));\
    xmmTemp[1] = _mm_shuffle_epi8(xmmTemp[1], (SUBSH_MASK[ShiftQ]));\
    xmmTemp[2] = _mm_xor_si128(xmmTemp[2], xmmTemp[2]);\
    xmmTemp[0] = _mm_aesenclast_si128(xmmTemp[0], xmmTemp[2]);\
    xmmTemp[1] = _mm_aesenclast_si128(xmmTemp[1], xmmTemp[2]);\
    ymmTemp[2] = _mm256_insertf128_si256(ymmTemp[2], xmmTemp[0], 0);\
    ymmTemp[2] = _mm256_insertf128_si256(ymmTemp[2], xmmTemp[1], 1);\
    i = _mm256_castsi256_pd(ymmTemp[2]);\
}/**/


/* Optimized *2 / *4 calculation
 * inputs:
 * a0-a7 = (row0-row7) * 1
 * t0-t1 = clobbers
 * outputs:
 * a0-a7 = (row0-row7) * 4
 * b0, b1, b3, b4, b5, b7 = helpers
 * TMP_MUL1/2 in memory
 * */
#define Multiply(a0, a1, a2, a3, a4, a5, a6, a7, t0, t1, t2, t3, t4, b3, b4, b7){\
    /* save *1 values and multiply by 2*/\
    /*TMP_MUL1[0] = a0; -> helper */\
    TMP_MUL1[1] = a1;\
    TMP_MUL1[2] = a2;\
    b4 = a0;\
    /* init MUL2 constant */\
    ymmTemp[1] = _mm256_insertf128_si256(ymmTemp[1], (ALL_1B), 0);\
    ymmTemp[1] = _mm256_insertf128_si256(ymmTemp[1], (ALL_1B), 1);\
    ymmTempD[1] = _mm256_castsi256_pd(ymmTemp[1]);\
    MUL2(a0, ymmTempD[1]);\
    MUL2(a1, ymmTempD[1]);\
    MUL2(a2, ymmTempD[1]);\
    TMP_MUL1[3] = a3;\
    /*TMP_MUL1[4] = a4; -> helper */\
    TMP_MUL1[5] = a5;\
    b7 = a4;\
    MUL2(a3, ymmTempD[1]);\
    MUL2(a4, ymmTempD[1]);\
    MUL2(a5, ymmTempD[1]);\
    TMP_MUL1[6] = a6;\
    TMP_MUL1[7] = a7;\
    MUL2(a6, ymmTempD[1]);\
    MUL2(a7, ymmTempD[1]);\
    \
    /* save *2 values and multiply by 2*/\
    TMP_MUL2[0] = a0;\
    TMP_MUL2[1] = a1;\
    TMP_MUL2[2] = a2;\
    MUL2(a0, ymmTempD[1]);\
    MUL2(a1, ymmTempD[1]);\
    MUL2(a2, ymmTempD[1]);\
    TMP_MUL2[3] = a3;\
    TMP_MUL2[4] = a4;\
    TMP_MUL2[5] = a5;\
    MUL2(a3, ymmTempD[1]);\
    MUL2(a4, ymmTempD[1]);\
    MUL2(a5, ymmTempD[1]);\
    TMP_MUL2[6] = a6;\
    /*TMP_MUL2[7] = a7; -> helper */\
    b3 = a7;\
    MUL2(a6, ymmTempD[1]);\
    MUL2(a7, ymmTempD[1]);\
}/**/

/* Optimized MixBytes
 * inputs:
 * a0-a7 = (row0-row7) * 4
 * all * 1 / 2 values must be in TMP_MUL1/2
 * output: b0-b7
 * */
#define MixBytes(a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, b4, b5, b6, b7){\
    /* save one value */\
    TMP_MUL4 = a3;\
    /* 1 */\
    b1 = a0;\
    b1 = _mm256_xor_pd(b1, a5);\
    b1 = _mm256_xor_pd(b1, b4); /* -> helper! */\
    b1 = _mm256_xor_pd(b1, TMP_MUL2[3]);\
    b2 = b1;\
    \
    /* 2 */\
    b5 = a1;\
    b5 = _mm256_xor_pd(b5, a4);\
    b5 = _mm256_xor_pd(b5, b7); /* -> helper! */\
    b5 = _mm256_xor_pd(b5, b3); /* -> helper! */\
    b6 = b5;\
    \
    /* 4 */\
    b7 = _mm256_xor_pd(b7, a6);\
    /*b7 = _mm256_xor_pd(b7, TMP_MUL1[4]); -> helper! */\
    b7 = _mm256_xor_pd(b7, TMP_MUL1[6]);\
    b7 = _mm256_xor_pd(b7, TMP_MUL2[1]);\
    b7 = _mm256_xor_pd(b7, b3); /* -> helper! */\
    b2 = _mm256_xor_pd(b2, b7);\
    \
    /* 3 */\
    b0 = a7;\
    b0 = _mm256_xor_pd(b0, TMP_MUL1[5]);\
    b0 = _mm256_xor_pd(b0, TMP_MUL1[7]);\
    b0 = _mm256_xor_pd(b0, TMP_MUL2[0]);\
    b0 = _mm256_xor_pd(b0, TMP_MUL2[2]);\
    b3 = b0;\
    b1 = _mm256_xor_pd(b1, b0);\
    b0 = _mm256_xor_pd(b0, b7); /* moved from 4 */\
    \
    /* 5 */\
    b4 = _mm256_xor_pd(b4, a2);\
    /*b4 = _mm256_xor_pd(b4, TMP_MUL1[0]); -> helper! */\
    b4 = _mm256_xor_pd(b4, TMP_MUL1[2]);\
    b4 = _mm256_xor_pd(b4, TMP_MUL2[3]);\
    b4 = _mm256_xor_pd(b4, TMP_MUL2[5]);\
    b3 = _mm256_xor_pd(b3, b4);\
    b6 = _mm256_xor_pd(b6, b4);\
    \
    /* 6 */\
    a3 = _mm256_xor_pd(a3, TMP_MUL1[1]);\
    a3 = _mm256_xor_pd(a3, TMP_MUL1[3]);\
    a3 = _mm256_xor_pd(a3, TMP_MUL2[4]);\
    a3 = _mm256_xor_pd(a3, TMP_MUL2[6]);\
    b4 = _mm256_xor_pd(b4, a3);\
    b5 = _mm256_xor_pd(b5, a3);\
    b7 = _mm256_xor_pd(b7, a3);\
    \
    /* 7 */\
    a1 = _mm256_xor_pd(a1, TMP_MUL1[1]);\
    a1 = _mm256_xor_pd(a1, TMP_MUL2[4]);\
    b2 = _mm256_xor_pd(b2, a1);\
    b3 = _mm256_xor_pd(b3, a1);\
    \
    /* 8 */\
    a5 = _mm256_xor_pd(a5, TMP_MUL1[5]);\
    a5 = _mm256_xor_pd(a5, TMP_MUL2[0]);\
    b6 = _mm256_xor_pd(b6, a5);\
    b7 = _mm256_xor_pd(b7, a5);\
    \
    /* 9 */\
    a3 = TMP_MUL1[2];\
    a3 = _mm256_xor_pd(a3, TMP_MUL2[5]);\
    b0 = _mm256_xor_pd(b0, a3);\
    b5 = _mm256_xor_pd(b5, a3);\
    \
    /* 10 */\
    a1 = TMP_MUL1[6];\
    a1 = _mm256_xor_pd(a1, TMP_MUL2[1]);\
    b1 = _mm256_xor_pd(b1, a1);\
    b4 = _mm256_xor_pd(b4, a1);\
    \
    /* 11 */\
    a5 = TMP_MUL1[3];\
    a5 = _mm256_xor_pd(a5, TMP_MUL2[6]);\
    b1 = _mm256_xor_pd(b1, a5);\
    b6 = _mm256_xor_pd(b6, a5);\
    \
    /* 12 */\
    a3 = TMP_MUL1[7];\
    a3 = _mm256_xor_pd(a3, TMP_MUL2[2]);\
    b2 = _mm256_xor_pd(b2, a3);\
    b5 = _mm256_xor_pd(b5, a3);\
    \
    /* 13 */\
    b0 = _mm256_xor_pd(b0, TMP_MUL4);\
    b0 = _mm256_xor_pd(b0, a4);\
    b1 = _mm256_xor_pd(b1, a4);\
    b3 = _mm256_xor_pd(b3, a6);\
    b4 = _mm256_xor_pd(b4, a0);\
    b4 = _mm256_xor_pd(b4, a7);\
    b5 = _mm256_xor_pd(b5, a0);\
    b7 = _mm256_xor_pd(b7, a2);\
}/**/

/* one round
 * a0-a7 = input rows
 * b0-b7 = output rows
 */
#define ROUND(a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, b4, b5, b6, b7){\
    /* ShiftBytes + SubBytes */\
    SubShift(a0, 0, 1);\
    SubShift(a1, 1, 3);\
    SubShift(a2, 2, 5);\
    SubShift(a3, 3, 7);\
    SubShift(a4, 4, 0);\
    SubShift(a5, 5, 2);\
    SubShift(a6, 6, 4);\
    SubShift(a7, 7, 6);\
\
    /* MixBytes Version 2 */\
    /* Multiplication */\
    Multiply(a0, a1, a2, a3, a4, a5, a6, a7, b2, b6, b0, b1, b5, b3, b4, b7);\
    /* MixBytes */\
    MixBytes(a0, a1, a2, a3, a4, a5, a6, a7, b0, b1, b2, b3, b4, b5, b6, b7);\
\
}

#define TRANSFORM(){\
    u8 round_counter = 0;\
    for(round_counter = 0; round_counter < 14; round_counter++) {\
      /* AddConstant */\
      ymm6 = _mm256_xor_pd(ymm6, ymm6);\
      ymmI6 = _mm256_castpd_si256(ymm6);\
      ymmI7 = _mm256_insertf128_si256(ymmI6, (ROUND_CONST_Q[round_counter]), 1);\
      ymmI6 = _mm256_insertf128_si256(ymmI6, (ALL_FF), 1);\
      ymmI0 = _mm256_insertf128_si256(ymmI6, (ROUND_CONST_P[round_counter]), 0);\
      ymm7 = _mm256_castsi256_pd(ymmI7);\
      ymm6 = _mm256_castsi256_pd(ymmI6);\
      ymm0 = _mm256_castsi256_pd(ymmI0);\
      ymm0 = _mm256_xor_pd(ymm8, ymm0);\
      ymm1 = _mm256_xor_pd(ymm9, ymm6);\
      ymm2 = _mm256_xor_pd(ymm10, ymm6);\
      ymm3 = _mm256_xor_pd(ymm11, ymm6);\
      ymm4 = _mm256_xor_pd(ymm12, ymm6);\
      ymm5 = _mm256_xor_pd(ymm13, ymm6);\
      ymm6 = _mm256_xor_pd(ymm14, ymm6);\
      ymm7 = _mm256_xor_pd(ymm15, ymm7);\
      /* one round */\
      ROUND(ymm0, ymm1, ymm2, ymm3, ymm4, ymm5, ymm6, ymm7, ymm8, ymm9, ymm10, ymm11, ymm12, ymm13, ymm14, ymm15);\
    }\
}

/* Matrix Transpose
 * input is a 1024-bit state with two columns in one xmm
 * output is a 1024-bit state with two rows in one xmm
 * inputs: i0-i7
 * outputs: i0-i7
 * clobbers: t0-t7
 */
#define Matrix_Transpose(i0, i1, i2, i3, i4, i5, i6, i7, t0, t1, t2, t3, t4, t5, t6, t7){\
  t0 = TRANSP_MASK;\
\
  i6 = _mm_shuffle_epi8(i6, t0);\
  i0 = _mm_shuffle_epi8(i0, t0);\
  i1 = _mm_shuffle_epi8(i1, t0);\
  i2 = _mm_shuffle_epi8(i2, t0);\
  i3 = _mm_shuffle_epi8(i3, t0);\
  i4 = _mm_shuffle_epi8(i4, t0);\
  i5 = _mm_shuffle_epi8(i5, t0);\
  i7 = _mm_shuffle_epi8(i7, t0);\
\
  /* continue with unpack */\
  t0 = _mm_unpackhi_epi16(i0, i1);\
  t1 = _mm_unpackhi_epi16(i2, i3);\
  t2 = _mm_unpackhi_epi16(i4, i5);\
  t3 = _mm_unpackhi_epi16(i6, i7);\
  i0 = _mm_unpacklo_epi16(i0, i1);\
  i2 = _mm_unpacklo_epi16(i2, i3);\
  i4 = _mm_unpacklo_epi16(i4, i5);\
  i6 = _mm_unpacklo_epi16(i6, i7);\
\
  /* shuffle with immediate */\
  t0 = _mm_shuffle_epi32(t0, 216);\
  t1 = _mm_shuffle_epi32(t1, 216);\
  t2 = _mm_shuffle_epi32(t2, 216);\
  t3 = _mm_shuffle_epi32(t3, 216);\
  i0 = _mm_shuffle_epi32(i0, 216);\
  i2 = _mm_shuffle_epi32(i2, 216);\
  i4 = _mm_shuffle_epi32(i4, 216);\
  i6 = _mm_shuffle_epi32(i6, 216);\
\
  /* continue with unpack */\
  t4 = _mm_unpackhi_epi32(i0,  i2);\
  i0 = _mm_unpacklo_epi32(i0,  i2);\
  t5 = _mm_unpackhi_epi32(t0,  t1);\
  t0 = _mm_unpacklo_epi32(t0,  t1);\
  t6 = _mm_unpackhi_epi32(i4,  i6);\
  i4 = _mm_unpacklo_epi32(i4, i6);\
  t7 = _mm_unpackhi_epi32(t2,  t3);\
  t2 = _mm_unpacklo_epi32(t2,  t3);\
\
  /* there are now 2 rows in each xmm */\
  /* unpack to get 1 row of CV in each xmm */\
  i1 = _mm_unpackhi_epi64(i0, i4);\
  i0 = _mm_unpacklo_epi64(i0, i4);\
  i2 = _mm_unpacklo_epi64(t0, t2);\
  i3 = _mm_unpackhi_epi64(t0, t2);\
  i4 = _mm_unpacklo_epi64(t4, t6);\
  i5 = _mm_unpackhi_epi64(t4, t6);\
  i6 = _mm_unpacklo_epi64(t5, t7);\
  i7 = _mm_unpackhi_epi64(t5, t7);\
  /* transpose done */\
}/**/

/* Matrix Transpose Inverse
 * input is a 1024-bit state with two rows in one xmm
 * output is a 1024-bit state with two columns in one xmm
 * inputs: i0-i7
 * outputs: (i0, o0, i1, i3, o1, o2, i5, i7)
 * clobbers: t0-t4
 */
#define Matrix_Transpose_INV(i0, i1, i2, i3, i4, i5, i6, i7, o0, o1, o2, t0, t1, t2, t3, t4){\
  o0 = TRANSP_MASK;\
  /*  transpose matrix to get output format */\
  o1 = _mm_unpackhi_epi64(i0, i1);\
  i0 = _mm_unpacklo_epi64(i0, i1);\
  t0 = _mm_unpackhi_epi64(i2, i3);\
  i2 = _mm_unpacklo_epi64(i2, i3);\
  t1 = _mm_unpackhi_epi64(i4, i5);\
  i4 = _mm_unpacklo_epi64(i4, i5);\
  t2 = _mm_unpackhi_epi64(i6, i7);\
  i6 = _mm_unpacklo_epi64(i6, i7);\
  /* load transpose mask into a register, because it will be used 8 times */\
  i0 = _mm_shuffle_epi8(i0, o0);\
  i2 = _mm_shuffle_epi8(i2, o0);\
  i4 = _mm_shuffle_epi8(i4, o0);\
  i6 = _mm_shuffle_epi8(i6, o0);\
  o1 = _mm_shuffle_epi8(o1, o0);\
  t0 = _mm_shuffle_epi8(t0, o0);\
  t1 = _mm_shuffle_epi8(t1, o0);\
  t2 = _mm_shuffle_epi8(t2, o0);\
  /* continue with unpack */\
  t3 = _mm_unpackhi_epi16(i4, i6);\
  i4 = _mm_unpacklo_epi16(i4, i6);\
  o0 = _mm_unpackhi_epi16(i0, i2);\
  i0 = _mm_unpacklo_epi16(i0, i2);\
  o2 = _mm_unpackhi_epi16(o1, t0);\
  o1 = _mm_unpacklo_epi16(o1, t0);\
  t4 = _mm_unpackhi_epi16(t1, t2);\
  t1 = _mm_unpacklo_epi16(t1, t2);\
  /* shuffle with immediate */\
  i4 = _mm_shuffle_epi32(i4, 216);\
  t3 = _mm_shuffle_epi32(t3, 216);\
  o1 = _mm_shuffle_epi32(o1, 216);\
  o2 = _mm_shuffle_epi32(o2, 216);\
  i0 = _mm_shuffle_epi32(i0, 216);\
  o0 = _mm_shuffle_epi32(o0, 216);\
  t1 = _mm_shuffle_epi32(t1, 216);\
  t4 = _mm_shuffle_epi32(t4, 216);\
  /* continue with unpack */\
  i1 = _mm_unpackhi_epi32(i0, i4);\
  i0 = _mm_unpacklo_epi32(i0, i4);\
  i3 = _mm_unpackhi_epi32(o0, t3);\
  o0 = _mm_unpacklo_epi32(o0, t3);\
  i5 = _mm_unpackhi_epi32(o1, t1);\
  o1 = _mm_unpacklo_epi32(o1, t1);\
  i7 = _mm_unpackhi_epi32(o2, t4);\
  o2 = _mm_unpacklo_epi32(o2, t4);\
  /* transpose done */\
}/**/


void INIT_CV()
{
  /* load CV (IV) into registers xmm8 - xmm15 */
  xmm8 = GLOBAL_CV_PTR[0];
  xmm9 = GLOBAL_CV_PTR[1];
  xmm10 = GLOBAL_CV_PTR[2];
  xmm11 = GLOBAL_CV_PTR[3];
  xmm12 = GLOBAL_CV_PTR[4];
  xmm13 = GLOBAL_CV_PTR[5];
  xmm14 = GLOBAL_CV_PTR[6];
  xmm15 = GLOBAL_CV_PTR[7];

  Matrix_Transpose(xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7);

  /* store transposed CV */
  GLOBAL_CV_PTR[0] = xmm8;
  GLOBAL_CV_PTR[1] = xmm9;
  GLOBAL_CV_PTR[2] = xmm10;
  GLOBAL_CV_PTR[3] = xmm11;
  GLOBAL_CV_PTR[4] = xmm12;
  GLOBAL_CV_PTR[5] = xmm13;
  GLOBAL_CV_PTR[6] = xmm14;
  GLOBAL_CV_PTR[7] = xmm15;
}

void TF1024(u64* message)
{
  /*  Note : message is in rdi thanks to the  */
  /*  __cdecl calling convention    */
#ifdef IACA_TRACE
  IACA_START;
#endif

  /* load message into registers (Q = message) */
  xmm0 = _mm_set_epi32((message)[2*0+1] >> 32, (message)[2*0+1], (message)[2*0+0] >> 32, (message)[2*0+0]);
  xmm1 = _mm_set_epi32((message)[2*1+1] >> 32, (message)[2*1+1], (message)[2*1+0] >> 32, (message)[2*1+0]);
  xmm2 = _mm_set_epi32((message)[2*2+1] >> 32, (message)[2*2+1], (message)[2*2+0] >> 32, (message)[2*2+0]);
  xmm3 = _mm_set_epi32((message)[2*3+1] >> 32, (message)[2*3+1], (message)[2*3+0] >> 32, (message)[2*3+0]);
  xmm4 = _mm_set_epi32((message)[2*4+1] >> 32, (message)[2*4+1], (message)[2*4+0] >> 32, (message)[2*4+0]);
  xmm5 = _mm_set_epi32((message)[2*5+1] >> 32, (message)[2*5+1], (message)[2*5+0] >> 32, (message)[2*5+0]);
  xmm6 = _mm_set_epi32((message)[2*6+1] >> 32, (message)[2*6+1], (message)[2*6+0] >> 32, (message)[2*6+0]);
  xmm7 = _mm_set_epi32((message)[2*7+1] >> 32, (message)[2*7+1], (message)[2*7+0] >> 32, (message)[2*7+0]);

  /* transpose message */
  Matrix_Transpose(xmm0, xmm1, xmm2, xmm3, xmm4, xmm5, xmm6, xmm7, xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15);

  /* xor CV to get P */
  xmm8 = _mm_xor_si128(xmm0, (GLOBAL_CV_PTR[0]));
  xmm9 = _mm_xor_si128(xmm1, (GLOBAL_CV_PTR[1]));
  xmm10 = _mm_xor_si128(xmm2, (GLOBAL_CV_PTR[2]));
  xmm11 = _mm_xor_si128(xmm3, (GLOBAL_CV_PTR[3]));
  xmm12 = _mm_xor_si128(xmm4, (GLOBAL_CV_PTR[4]));
  xmm13 = _mm_xor_si128(xmm5, (GLOBAL_CV_PTR[5]));
  xmm14 = _mm_xor_si128(xmm6, (GLOBAL_CV_PTR[6]));
  xmm15 = _mm_xor_si128(xmm7, (GLOBAL_CV_PTR[7]));

  /* generate AVX registers with Q in high and P in low 128 bits */
  ymmI8 =  _mm256_insertf128_si256(ymmI8,  xmm8,  0);
  ymmI9 =  _mm256_insertf128_si256(ymmI9,  xmm9,  0);
  ymmI10 = _mm256_insertf128_si256(ymmI10, xmm10, 0);
  ymmI11 = _mm256_insertf128_si256(ymmI11, xmm11, 0);
  ymmI12 = _mm256_insertf128_si256(ymmI12, xmm12, 0);
  ymmI13 = _mm256_insertf128_si256(ymmI13, xmm13, 0);
  ymmI14 = _mm256_insertf128_si256(ymmI14, xmm14, 0);
  ymmI15 = _mm256_insertf128_si256(ymmI15, xmm15, 0);

  ymmI8 =  _mm256_insertf128_si256(ymmI8,  xmm0, 1);
  ymmI9 =  _mm256_insertf128_si256(ymmI9,  xmm1, 1);
  ymmI10 = _mm256_insertf128_si256(ymmI10, xmm2, 1);
  ymmI11 = _mm256_insertf128_si256(ymmI11, xmm3, 1);
  ymmI12 = _mm256_insertf128_si256(ymmI12, xmm4, 1);
  ymmI13 = _mm256_insertf128_si256(ymmI13, xmm5, 1);
  ymmI14 = _mm256_insertf128_si256(ymmI14, xmm6, 1);
  ymmI15 = _mm256_insertf128_si256(ymmI15, xmm7, 1);

  ymm8 =  _mm256_castsi256_pd(ymmI8);
  ymm9 =  _mm256_castsi256_pd(ymmI9);
  ymm10 = _mm256_castsi256_pd(ymmI10);
  ymm11 = _mm256_castsi256_pd(ymmI11);
  ymm12 = _mm256_castsi256_pd(ymmI12);
  ymm13 = _mm256_castsi256_pd(ymmI13);
  ymm14 = _mm256_castsi256_pd(ymmI14);
  ymm15 = _mm256_castsi256_pd(ymmI15);

  TRANSFORM();

  ymmI8 =  _mm256_castpd_si256(ymm8);
  ymmI9 =  _mm256_castpd_si256(ymm9);
  ymmI10 = _mm256_castpd_si256(ymm10);
  ymmI11 = _mm256_castpd_si256(ymm11);
  ymmI12 = _mm256_castpd_si256(ymm12);
  ymmI13 = _mm256_castpd_si256(ymm13);
  ymmI14 = _mm256_castpd_si256(ymm14);
  ymmI15 = _mm256_castpd_si256(ymm15);

  /* extract Q to xmm */
  xmm0 = _mm256_extractf128_si256(ymmI8,  1);
  xmm1 = _mm256_extractf128_si256(ymmI9,  1);
  xmm2 = _mm256_extractf128_si256(ymmI10, 1);
  xmm3 = _mm256_extractf128_si256(ymmI11, 1);
  xmm4 = _mm256_extractf128_si256(ymmI12, 1);
  xmm5 = _mm256_extractf128_si256(ymmI13, 1);
  xmm6 = _mm256_extractf128_si256(ymmI14, 1);
  xmm7 = _mm256_extractf128_si256(ymmI15, 1);

  xmm8  =  _mm256_extractf128_si256(ymmI8,  0);
  xmm9  =  _mm256_extractf128_si256(ymmI9,  0);
  xmm10 =  _mm256_extractf128_si256(ymmI10, 0);
  xmm11 =  _mm256_extractf128_si256(ymmI11, 0);
  xmm12 =  _mm256_extractf128_si256(ymmI12, 0);
  xmm13 =  _mm256_extractf128_si256(ymmI13, 0);
  xmm14 =  _mm256_extractf128_si256(ymmI14, 0);
  xmm15 =  _mm256_extractf128_si256(ymmI15, 0);

  /* XOR Q to P */
  xmm8 = _mm_xor_si128(xmm8,  xmm0);
  xmm9 = _mm_xor_si128(xmm9,  xmm1);
  xmm10 = _mm_xor_si128(xmm10, xmm2);
  xmm11 = _mm_xor_si128(xmm11, xmm3);
  xmm12 = _mm_xor_si128(xmm12, xmm4);
  xmm13 = _mm_xor_si128(xmm13, xmm5);
  xmm14 = _mm_xor_si128(xmm14, xmm6);
  xmm15 = _mm_xor_si128(xmm15, xmm7);

  /* XOR P to CV */
  xmm8 = _mm_xor_si128(xmm8,  (GLOBAL_CV_PTR[0]));
  xmm9 = _mm_xor_si128(xmm9,  (GLOBAL_CV_PTR[1]));
  xmm10 = _mm_xor_si128(xmm10, (GLOBAL_CV_PTR[2]));
  xmm11 = _mm_xor_si128(xmm11, (GLOBAL_CV_PTR[3]));
  xmm12 = _mm_xor_si128(xmm12, (GLOBAL_CV_PTR[4]));
  xmm13 = _mm_xor_si128(xmm13, (GLOBAL_CV_PTR[5]));
  xmm14 = _mm_xor_si128(xmm14, (GLOBAL_CV_PTR[6]));
  xmm15 = _mm_xor_si128(xmm15, (GLOBAL_CV_PTR[7]));

  /* store CV */
  GLOBAL_CV_PTR[0] = xmm8;
  GLOBAL_CV_PTR[1] = xmm9;
  GLOBAL_CV_PTR[2] = xmm10;
  GLOBAL_CV_PTR[3] = xmm11;
  GLOBAL_CV_PTR[4] = xmm12;
  GLOBAL_CV_PTR[5] = xmm13;
  GLOBAL_CV_PTR[6] = xmm14;
  GLOBAL_CV_PTR[7] = xmm15;

#ifdef IACA_TRACE
  IACA_END;
#endif
  return;
}

void OF1024() {
  /* load CV into registers xmm8 - xmm11 (P = CV)*/
  xmm8 = GLOBAL_CV_PTR[0];
  xmm9 = GLOBAL_CV_PTR[1];
  xmm10 = GLOBAL_CV_PTR[2];
  xmm11 = GLOBAL_CV_PTR[3];
  xmm12 = GLOBAL_CV_PTR[4];
  xmm13 = GLOBAL_CV_PTR[5];
  xmm14 = GLOBAL_CV_PTR[6];
  xmm15 = GLOBAL_CV_PTR[7];
  
  xmm0 = _mm_xor_si128(xmm0, xmm0);

  ymmI8 =  _mm256_insertf128_si256(ymmI8,  xmm0, 1);
  ymmI9 =  _mm256_insertf128_si256(ymmI9,  xmm0, 1);
  ymmI10 = _mm256_insertf128_si256(ymmI10, xmm0, 1);
  ymmI11 = _mm256_insertf128_si256(ymmI11, xmm0, 1);
  ymmI12 = _mm256_insertf128_si256(ymmI12, xmm0, 1);
  ymmI13 = _mm256_insertf128_si256(ymmI13, xmm0, 1);
  ymmI14 = _mm256_insertf128_si256(ymmI14, xmm0, 1);
  ymmI15 = _mm256_insertf128_si256(ymmI15, xmm0, 1);

  ymmI8 =  _mm256_insertf128_si256(ymmI8,  xmm8,  0);
  ymmI9 =  _mm256_insertf128_si256(ymmI9,  xmm9,  0);
  ymmI10 = _mm256_insertf128_si256(ymmI10, xmm10, 0);
  ymmI11 = _mm256_insertf128_si256(ymmI11, xmm11, 0);
  ymmI12 = _mm256_insertf128_si256(ymmI12, xmm12, 0);
  ymmI13 = _mm256_insertf128_si256(ymmI13, xmm13, 0);
  ymmI14 = _mm256_insertf128_si256(ymmI14, xmm14, 0);
  ymmI15 = _mm256_insertf128_si256(ymmI15, xmm15, 0);

  ymm8 =  _mm256_castsi256_pd(ymmI8);
  ymm9 =  _mm256_castsi256_pd(ymmI9);
  ymm10 = _mm256_castsi256_pd(ymmI10);
  ymm11 = _mm256_castsi256_pd(ymmI11);
  ymm12 = _mm256_castsi256_pd(ymmI12);
  ymm13 = _mm256_castsi256_pd(ymmI13);
  ymm14 = _mm256_castsi256_pd(ymmI14);
  ymm15 = _mm256_castsi256_pd(ymmI15);

  TRANSFORM();

  ymmI8 =  _mm256_castpd_si256(ymm8);
  ymmI9 =  _mm256_castpd_si256(ymm9);
  ymmI10 = _mm256_castpd_si256(ymm10);
  ymmI11 = _mm256_castpd_si256(ymm11);
  ymmI12 = _mm256_castpd_si256(ymm12);
  ymmI13 = _mm256_castpd_si256(ymm13);
  ymmI14 = _mm256_castpd_si256(ymm14);
  ymmI15 = _mm256_castpd_si256(ymm15);

  xmm8  =  _mm256_extractf128_si256(ymmI8,  0);
  xmm9  =  _mm256_extractf128_si256(ymmI9,  0);
  xmm10 =  _mm256_extractf128_si256(ymmI10, 0);
  xmm11 =  _mm256_extractf128_si256(ymmI11, 0);
  xmm12 =  _mm256_extractf128_si256(ymmI12, 0);
  xmm13 =  _mm256_extractf128_si256(ymmI13, 0);
  xmm14 =  _mm256_extractf128_si256(ymmI14, 0);
  xmm15 =  _mm256_extractf128_si256(ymmI15, 0);

  /* xor CV */
  xmm8 = _mm_xor_si128(xmm8,  (GLOBAL_CV_PTR[0]));
  xmm9 = _mm_xor_si128(xmm9,  (GLOBAL_CV_PTR[1]));
  xmm10 = _mm_xor_si128(xmm10, (GLOBAL_CV_PTR[2]));
  xmm11 = _mm_xor_si128(xmm11, (GLOBAL_CV_PTR[3]));
  xmm12 = _mm_xor_si128(xmm12, (GLOBAL_CV_PTR[4]));
  xmm13 = _mm_xor_si128(xmm13, (GLOBAL_CV_PTR[5]));
  xmm14 = _mm_xor_si128(xmm14, (GLOBAL_CV_PTR[6]));
  xmm15 = _mm_xor_si128(xmm15, (GLOBAL_CV_PTR[7]));

  /*  transpose state back to original format */
  Matrix_Transpose_INV(xmm8, xmm9, xmm10, xmm11, xmm12, xmm13, xmm14, xmm15, xmm4, xmm0, xmm6, xmm1, xmm2, xmm3, xmm5, xmm7);

  /* store finished "hash" */
  GLOBAL_CV_PTR[0] = xmm8;
  GLOBAL_CV_PTR[1] = xmm4;
  GLOBAL_CV_PTR[2] = xmm9;
  GLOBAL_CV_PTR[3] = xmm11;
  GLOBAL_CV_PTR[4] = xmm0;
  GLOBAL_CV_PTR[5] = xmm6;
  GLOBAL_CV_PTR[6] = xmm13;
  GLOBAL_CV_PTR[7] = xmm15;

  return;
}//OF1024()

#endif

