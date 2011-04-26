/* hash.c   January 2011
 *
 * Groestl implementation using MMX intrinsics.
 * Has been tested on Intel processors using the gcc compiler only
 * (include the '-std=c99' and '-mmmx' flags when compiling in gcc on a
 * 32-bit machine).
 * 
 * Author: Soeren S. Thomsen
 *
 * This code is placed in the public domain
 */

#if defined (__MMX__)
#include <stdio.h>
#include <stdlib.h>
#include <mmintrin.h>
#include "hash.h"
#include "tables.h"

/* compute a round of P512 */
#define ROUNDP512(m_in, m, r) do {					\
    __m64* T_m64 = (__m64*)T;						\
    __m64 zero;								\
    u32* x = (u32*)m_in;						\
    zero = _mm_setzero_si64();						\
    m[0] = _mm_xor_si64(T_m64[0*256+((r)^EXT_BYTE(x[ 0],0))], zero);	\
    m[7] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 0],1)], zero);		\
    m[6] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 0],2)], zero);		\
    m[5] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 0],3)], zero);		\
    m[4] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 1],0)], zero);		\
    m[3] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 1],1)], zero);		\
    m[2] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 1],2)], zero);		\
    m[1] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[ 1],3)], zero);		\
    m[7] = _mm_xor_si64(T_m64[0*256+((r)^0x70^EXT_BYTE(x[14],0))], m[7]); \
    m[6] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[14],1)], m[6]);		\
    m[5] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[14],2)], m[5]);		\
    m[4] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[14],3)], m[4]);		\
    m[3] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[15],0)], m[3]);		\
    m[2] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[15],1)], m[2]);		\
    m[1] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[15],2)], m[1]);		\
    m[0] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[15],3)], m[0]);		\
    m[6] = _mm_xor_si64(T_m64[0*256+((r)^0x60^EXT_BYTE(x[12],0))], m[6]); \
    m[5] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[12],1)], m[5]);		\
    m[4] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[12],2)], m[4]);		\
    m[3] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[12],3)], m[3]);		\
    m[2] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[13],0)], m[2]);		\
    m[1] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[13],1)], m[1]);		\
    m[0] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[13],2)], m[0]);		\
    m[7] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[13],3)], m[7]);		\
    m[5] = _mm_xor_si64(T_m64[0*256+((r)^0x50^EXT_BYTE(x[10],0))], m[5]); \
    m[4] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[10],1)], m[4]);		\
    m[3] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[10],2)], m[3]);		\
    m[2] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[10],3)], m[2]);		\
    m[1] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[11],0)], m[1]);		\
    m[0] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[11],1)], m[0]);		\
    m[7] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[11],2)], m[7]);		\
    m[6] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[11],3)], m[6]);		\
    m[4] = _mm_xor_si64(T_m64[0*256+((r)^0x40^EXT_BYTE(x[ 8],0))], m[4]); \
    m[3] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 8],1)], m[3]);		\
    m[2] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 8],2)], m[2]);		\
    m[1] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 8],3)], m[1]);		\
    m[0] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 9],0)], m[0]);		\
    m[7] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 9],1)], m[7]);		\
    m[6] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 9],2)], m[6]);		\
    m[5] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[ 9],3)], m[5]);		\
    m[3] = _mm_xor_si64(T_m64[0*256+((r)^0x30^EXT_BYTE(x[ 6],0))], m[3]); \
    m[2] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 6],1)], m[2]);		\
    m[1] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 6],2)], m[1]);		\
    m[0] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 6],3)], m[0]);		\
    m[7] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 7],0)], m[7]);		\
    m[6] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 7],1)], m[6]);		\
    m[5] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 7],2)], m[5]);		\
    m[4] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[ 7],3)], m[4]);		\
    m[2] = _mm_xor_si64(T_m64[0*256+((r)^0x20^EXT_BYTE(x[ 4],0))], m[2]); \
    m[1] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 4],1)], m[1]);		\
    m[0] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 4],2)], m[0]);		\
    m[7] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 4],3)], m[7]);		\
    m[6] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 5],0)], m[6]);		\
    m[5] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 5],1)], m[5]);		\
    m[4] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 5],2)], m[4]);		\
    m[3] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[ 5],3)], m[3]);		\
    m[1] = _mm_xor_si64(T_m64[0*256+((r)^0x10^EXT_BYTE(x[ 2],0))], m[1]); \
    m[0] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 2],1)], m[0]);		\
    m[7] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 2],2)], m[7]);		\
    m[6] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 2],3)], m[6]);		\
    m[5] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 3],0)], m[5]);		\
    m[4] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 3],1)], m[4]);		\
    m[3] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 3],2)], m[3]);		\
    m[2] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[ 3],3)], m[2]);		\
  } while (0)

/* compute a round of Q512 */
#define ROUNDQ512(m_in, m, r) do {					\
    __m64* T_m64 = (__m64*)T;						\
    __m64 zero;								\
    __m64 ff;								\
    u32* x = (u32*)m_in;						\
    zero = _mm_setzero_si64();						\
    ff   = _mm_set_pi32(0xffffffff,0xffffffff);				\
									\
    m_in[0] = _mm_xor_si64(m_in[0],ff);					\
    m_in[1] = _mm_xor_si64(m_in[1],ff);					\
    m_in[2] = _mm_xor_si64(m_in[2],ff);					\
    m_in[3] = _mm_xor_si64(m_in[3],ff);					\
    m_in[4] = _mm_xor_si64(m_in[4],ff);					\
    m_in[5] = _mm_xor_si64(m_in[5],ff);					\
    m_in[6] = _mm_xor_si64(m_in[6],ff);					\
    m_in[7] = _mm_xor_si64(m_in[7],ff);					\
									\
    m[7] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[ 0],0)], zero);		\
    m[5] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 0],1)], zero);		\
    m[3] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 0],2)], zero);		\
    m[1] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 0],3)], zero);		\
    m[0] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 1],0)], zero);		\
    m[6] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 1],1)], zero);		\
    m[4] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 1],2)], zero);		\
    m[2] = _mm_xor_si64(T_m64[7*256+((r)^EXT_BYTE(x[ 1],3))], zero);	\
									\
    m[6] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[14],0)], m[6]);		\
    m[4] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[14],1)], m[4]);		\
    m[2] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[14],2)], m[2]);		\
    m[0] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[14],3)], m[0]);		\
    m[7] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[15],0)], m[7]);		\
    m[5] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[15],1)], m[5]);		\
    m[3] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[15],2)], m[3]);		\
    m[1] = _mm_xor_si64(T_m64[7*256+((r)^0x70^EXT_BYTE(x[15],3))], m[1]); \
									\
    m[5] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[12],0)], m[5]);		\
    m[3] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[12],1)], m[3]);		\
    m[1] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[12],2)], m[1]);		\
    m[7] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[12],3)], m[7]);		\
    m[6] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[13],0)], m[6]);		\
    m[4] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[13],1)], m[4]);		\
    m[2] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[13],2)], m[2]);		\
    m[0] = _mm_xor_si64(T_m64[7*256+((r)^0x60^EXT_BYTE(x[13],3))], m[0]); \
									\
    m[4] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[10],0)], m[4]);		\
    m[2] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[10],1)], m[2]);		\
    m[0] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[10],2)], m[0]);		\
    m[6] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[10],3)], m[6]);		\
    m[5] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[11],0)], m[5]);		\
    m[3] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[11],1)], m[3]);		\
    m[1] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[11],2)], m[1]);		\
    m[7] = _mm_xor_si64(T_m64[7*256+((r)^0x50^EXT_BYTE(x[11],3))], m[7]); \
									\
    m[3] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[ 8],0)], m[3]);		\
    m[1] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 8],1)], m[1]);		\
    m[7] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 8],2)], m[7]);		\
    m[5] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 8],3)], m[5]);		\
    m[4] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 9],0)], m[4]);		\
    m[2] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 9],1)], m[2]);		\
    m[0] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 9],2)], m[0]);		\
    m[6] = _mm_xor_si64(T_m64[7*256+((r)^0x40^EXT_BYTE(x[ 9],3))], m[6]); \
									\
    m[2] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[ 6],0)], m[2]);		\
    m[0] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 6],1)], m[0]);		\
    m[6] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 6],2)], m[6]);		\
    m[4] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 6],3)], m[4]);		\
    m[3] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 7],0)], m[3]);		\
    m[1] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 7],1)], m[1]);		\
    m[7] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 7],2)], m[7]);		\
    m[5] = _mm_xor_si64(T_m64[7*256+((r)^0x30^EXT_BYTE(x[ 7],3))], m[5]); \
									\
    m[1] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[ 4],0)], m[1]);		\
    m[7] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 4],1)], m[7]);		\
    m[5] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 4],2)], m[5]);		\
    m[3] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 4],3)], m[3]);		\
    m[2] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 5],0)], m[2]);		\
    m[0] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 5],1)], m[0]);		\
    m[6] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 5],2)], m[6]);		\
    m[4] = _mm_xor_si64(T_m64[7*256+((r)^0x20^EXT_BYTE(x[ 5],3))], m[4]); \
									\
    m[0] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[ 2],0)], m[0]);		\
    m[6] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 2],1)], m[6]);		\
    m[4] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 2],2)], m[4]);		\
    m[2] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 2],3)], m[2]);		\
    m[1] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 3],0)], m[1]);		\
    m[7] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 3],1)], m[7]);		\
    m[5] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 3],2)], m[5]);		\
    m[3] = _mm_xor_si64(T_m64[7*256+((r)^0x10^EXT_BYTE(x[ 3],3))], m[3]); \
  } while (0)

/* compute one round of Q1024 */
void ROUNDP1024(__m64 *m_in, __m64 *m, u8 r) {
  __m64* T_m64 = (__m64*)T, zero;
  u32* x = (u32*)m_in;

  _mm_empty();

  zero = _mm_setzero_si64();

  m[ 0] = _mm_xor_si64(T_m64[0*256+((r)^EXT_BYTE(x[ 0],0))], zero);
  m[15] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 0],1)], zero);
  m[14] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 0],2)], zero);
  m[13] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 0],3)], zero);
  m[12] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 1],0)], zero);
  m[11] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 1],1)], zero);
  m[10] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 1],2)], zero);
  m[ 5] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[ 1],3)], zero);

  m[15] = _mm_xor_si64(T_m64[0*256+((r)^(0xf0)^EXT_BYTE(x[30],0))], m[15]);
  m[14] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[30],1)], m[14]);
  m[13] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[30],2)], m[13]);
  m[12] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[30],3)], m[12]);
  m[11] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[31],0)], m[11]);
  m[10] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[31],1)], m[10]);
  m[ 9] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[31],2)], zero);
  m[ 4] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[31],3)], zero);

  m[14] = _mm_xor_si64(T_m64[0*256+((r)^(0xe0)^EXT_BYTE(x[28],0))], m[14]);
  m[13] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[28],1)], m[13]);
  m[12] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[28],2)], m[12]);
  m[11] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[28],3)], m[11]);
  m[10] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[29],0)], m[10]);
  m[ 9] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[29],1)], m[ 9]);
  m[ 8] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[29],2)], zero);
  m[ 3] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[29],3)], zero);

  m[13] = _mm_xor_si64(T_m64[0*256+((r)^(0xd0)^EXT_BYTE(x[26],0))], m[13]);
  m[12] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[26],1)], m[12]);
  m[11] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[26],2)], m[11]);
  m[10] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[26],3)], m[10]);
  m[ 9] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[27],0)], m[ 9]);
  m[ 8] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[27],1)], m[ 8]);
  m[ 7] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[27],2)], zero);
  m[ 2] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[27],3)], zero);

  m[12] = _mm_xor_si64(T_m64[0*256+((r)^(0xc0)^EXT_BYTE(x[24],0))], m[12]);
  m[11] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[24],1)], m[11]);
  m[10] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[24],2)], m[10]);
  m[ 9] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[24],3)], m[ 9]);
  m[ 8] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[25],0)], m[ 8]);
  m[ 7] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[25],1)], m[ 7]);
  m[ 6] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[25],2)], zero);
  m[ 1] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[25],3)], zero);

  m[11] = _mm_xor_si64(T_m64[0*256+((r)^(0xb0)^EXT_BYTE(x[22],0))], m[11]);
  m[10] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[22],1)], m[10]);
  m[ 9] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[22],2)], m[ 9]);
  m[ 8] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[22],3)], m[ 8]);
  m[ 7] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[23],0)], m[ 7]);
  m[ 6] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[23],1)], m[ 6]);
  m[ 5] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[23],2)], m[ 5]);
  m[ 0] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[23],3)], m[ 0]);

  m[10] = _mm_xor_si64(T_m64[0*256+((r)^(0xa0)^EXT_BYTE(x[20],0))], m[10]);
  m[ 9] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[20],1)], m[ 9]);
  m[ 8] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[20],2)], m[ 8]);
  m[ 7] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[20],3)], m[ 7]);
  m[ 6] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[21],0)], m[ 6]);
  m[ 5] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[21],1)], m[ 5]);
  m[ 4] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[21],2)], m[ 4]);
  m[15] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[21],3)], m[15]);

  m[ 9] = _mm_xor_si64(T_m64[0*256+((r)^(0x90)^EXT_BYTE(x[18],0))], m[ 9]);
  m[ 8] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[18],1)], m[ 8]);
  m[ 7] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[18],2)], m[ 7]);
  m[ 6] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[18],3)], m[ 6]);
  m[ 5] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[19],0)], m[ 5]);
  m[ 4] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[19],1)], m[ 4]);
  m[ 3] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[19],2)], m[ 3]);
  m[14] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[19],3)], m[14]);

  m[ 8] = _mm_xor_si64(T_m64[0*256+((r)^(0x80)^EXT_BYTE(x[16],0))], m[ 8]);
  m[ 7] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[16],1)], m[ 7]);
  m[ 6] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[16],2)], m[ 6]);
  m[ 5] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[16],3)], m[ 5]);
  m[ 4] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[17],0)], m[ 4]);
  m[ 3] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[17],1)], m[ 3]);
  m[ 2] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[17],2)], m[ 2]);
  m[13] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[17],3)], m[13]);

  m[ 7] = _mm_xor_si64(T_m64[0*256+((r)^(0x70)^EXT_BYTE(x[14],0))], m[ 7]);
  m[ 6] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[14],1)], m[ 6]);
  m[ 5] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[14],2)], m[ 5]);
  m[ 4] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[14],3)], m[ 4]);
  m[ 3] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[15],0)], m[ 3]);
  m[ 2] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[15],1)], m[ 2]);
  m[ 1] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[15],2)], m[ 1]);
  m[12] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[15],3)], m[12]);

  m[ 6] = _mm_xor_si64(T_m64[0*256+((r)^(0x60)^EXT_BYTE(x[12],0))], m[ 6]);
  m[ 5] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[12],1)], m[ 5]);
  m[ 4] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[12],2)], m[ 4]);
  m[ 3] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[12],3)], m[ 3]);
  m[ 2] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[13],0)], m[ 2]);
  m[ 1] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[13],1)], m[ 1]);
  m[ 0] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[13],2)], m[ 0]);
  m[11] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[13],3)], m[11]);

  m[ 5] = _mm_xor_si64(T_m64[0*256+((r)^(0x50)^EXT_BYTE(x[10],0))], m[ 5]);
  m[ 4] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[10],1)], m[ 4]);
  m[ 3] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[10],2)], m[ 3]);
  m[ 2] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[10],3)], m[ 2]);
  m[ 1] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[11],0)], m[ 1]);
  m[ 0] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[11],1)], m[ 0]);
  m[15] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[11],2)], m[15]);
  m[10] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[11],3)], m[10]);

  m[ 4] = _mm_xor_si64(T_m64[0*256+((r)^(0x40)^EXT_BYTE(x[ 8],0))], m[ 4]);
  m[ 3] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 8],1)], m[ 3]);
  m[ 2] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 8],2)], m[ 2]);
  m[ 1] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 8],3)], m[ 1]);
  m[ 0] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 9],0)], m[ 0]);
  m[15] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 9],1)], m[15]);
  m[14] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 9],2)], m[14]);
  m[ 9] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[ 9],3)], m[ 9]);

  m[ 3] = _mm_xor_si64(T_m64[0*256+((r)^(0x30)^EXT_BYTE(x[ 6],0))], m[ 3]);
  m[ 2] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 6],1)], m[ 2]);
  m[ 1] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 6],2)], m[ 1]);
  m[ 0] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 6],3)], m[ 0]);
  m[15] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 7],0)], m[15]);
  m[14] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 7],1)], m[14]);
  m[13] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 7],2)], m[13]);
  m[ 8] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[ 7],3)], m[ 8]);

  m[ 2] = _mm_xor_si64(T_m64[0*256+((r)^(0x20)^EXT_BYTE(x[ 4],0))], m[ 2]);
  m[ 1] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 4],1)], m[ 1]);
  m[ 0] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 4],2)], m[ 0]);
  m[15] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 4],3)], m[15]);
  m[14] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 5],0)], m[14]);
  m[13] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 5],1)], m[13]);
  m[12] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 5],2)], m[12]);
  m[ 7] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[ 5],3)], m[ 7]);

  m[ 1] = _mm_xor_si64(T_m64[0*256+((r)^(0x10)^EXT_BYTE(x[ 2],0))], m[ 1]);
  m[ 0] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 2],1)], m[ 0]);
  m[15] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 2],2)], m[15]);
  m[14] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 2],3)], m[14]);
  m[13] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 3],0)], m[13]);
  m[12] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 3],1)], m[12]);
  m[11] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 3],2)], m[11]);
  m[ 6] = _mm_xor_si64(T_m64[7*256+EXT_BYTE(x[ 3],3)], m[ 6]);


  _mm_empty();
}

/* compute one round of Q1024 */
void ROUNDQ1024(__m64 *m_in, __m64 *m, u8 r) {
  int i;
  __m64* T_m64 = (__m64*)T;
  __m64 ff, zero;
  u32* x = (u32*)m_in;

  _mm_empty();

  zero = _mm_setzero_si64();
  ff   = _mm_set_pi32(0xffffffff,0xffffffff);

  for (i = 0; i < COLS1024; i++)
    m_in[i] = _mm_xor_si64(m_in[i],ff);

  m[15] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[ 0],0)], zero);
  m[13] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 0],1)], zero);
  m[11] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 0],2)], zero);
  m[ 5] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 0],3)], zero);
  m[ 0] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 1],0)], zero);
  m[14] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 1],1)], zero);
  m[12] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 1],2)], zero);
  m[10] = _mm_xor_si64(T_m64[7*256+((r)^EXT_BYTE(x[ 1],3))], zero);

  m[14] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[30],0)], m[14]);
  m[12] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[30],1)], m[12]);
  m[10] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[30],2)], m[10]);
  m[ 4] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[30],3)], zero);
  m[15] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[31],0)], m[15]);
  m[13] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[31],1)], m[13]);
  m[11] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[31],2)], m[11]);
  m[ 9] = _mm_xor_si64(T_m64[7*256+((r)^(0xf0)^EXT_BYTE(x[31],3))], zero);

  m[13] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[28],0)], m[13]);
  m[11] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[28],1)], m[11]);
  m[ 9] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[28],2)], m[ 9]);
  m[ 3] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[28],3)], zero);
  m[14] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[29],0)], m[14]);
  m[12] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[29],1)], m[12]);
  m[10] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[29],2)], m[10]);
  m[ 8] = _mm_xor_si64(T_m64[7*256+((r)^(0xe0)^EXT_BYTE(x[29],3))], zero);

  m[12] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[26],0)], m[12]);
  m[10] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[26],1)], m[10]);
  m[ 8] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[26],2)], m[ 8]);
  m[ 2] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[26],3)], zero);
  m[13] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[27],0)], m[13]);
  m[11] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[27],1)], m[11]);
  m[ 9] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[27],2)], m[ 9]);
  m[ 7] = _mm_xor_si64(T_m64[7*256+((r)^(0xd0)^EXT_BYTE(x[27],3))], zero);

  m[11] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[24],0)], m[11]);
  m[ 9] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[24],1)], m[ 9]);
  m[ 7] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[24],2)], m[ 7]);
  m[ 1] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[24],3)], zero);
  m[12] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[25],0)], m[12]);
  m[10] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[25],1)], m[10]);
  m[ 8] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[25],2)], m[ 8]);
  m[ 6] = _mm_xor_si64(T_m64[7*256+((r)^(0xc0)^EXT_BYTE(x[25],3))], zero);

  m[10] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[22],0)], m[10]);
  m[ 8] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[22],1)], m[ 8]);
  m[ 6] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[22],2)], m[ 6]);
  m[ 0] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[22],3)], m[ 0]);
  m[11] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[23],0)], m[11]);
  m[ 9] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[23],1)], m[ 9]);
  m[ 7] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[23],2)], m[ 7]);
  m[ 5] = _mm_xor_si64(T_m64[7*256+((r)^(0xb0)^EXT_BYTE(x[23],3))], m[ 5]);

  m[ 9] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[20],0)], m[ 9]);
  m[ 7] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[20],1)], m[ 7]);
  m[ 5] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[20],2)], m[ 5]);
  m[15] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[20],3)], m[15]);
  m[10] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[21],0)], m[10]);
  m[ 8] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[21],1)], m[ 8]);
  m[ 6] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[21],2)], m[ 6]);
  m[ 4] = _mm_xor_si64(T_m64[7*256+((r)^(0xa0)^EXT_BYTE(x[21],3))], m[ 4]);

  m[ 8] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[18],0)], m[ 8]);
  m[ 6] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[18],1)], m[ 6]);
  m[ 4] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[18],2)], m[ 4]);
  m[14] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[18],3)], m[14]);
  m[ 9] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[19],0)], m[ 9]);
  m[ 7] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[19],1)], m[ 7]);
  m[ 5] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[19],2)], m[ 5]);
  m[ 3] = _mm_xor_si64(T_m64[7*256+((r)^(0x90)^EXT_BYTE(x[19],3))], m[ 3]);

  m[ 7] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[16],0)], m[ 7]);
  m[ 5] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[16],1)], m[ 5]);
  m[ 3] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[16],2)], m[ 3]);
  m[13] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[16],3)], m[13]);
  m[ 8] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[17],0)], m[ 8]);
  m[ 6] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[17],1)], m[ 6]);
  m[ 4] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[17],2)], m[ 4]);
  m[ 2] = _mm_xor_si64(T_m64[7*256+((r)^(0x80)^EXT_BYTE(x[17],3))], m[ 2]);

  m[ 6] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[14],0)], m[ 6]);
  m[ 4] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[14],1)], m[ 4]);
  m[ 2] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[14],2)], m[ 2]);
  m[12] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[14],3)], m[12]);
  m[ 7] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[15],0)], m[ 7]);
  m[ 5] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[15],1)], m[ 5]);
  m[ 3] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[15],2)], m[ 3]);
  m[ 1] = _mm_xor_si64(T_m64[7*256+((r)^(0x70)^EXT_BYTE(x[15],3))], m[ 1]);

  m[ 5] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[12],0)], m[ 5]);
  m[ 3] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[12],1)], m[ 3]);
  m[ 1] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[12],2)], m[ 1]);
  m[11] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[12],3)], m[11]);
  m[ 6] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[13],0)], m[ 6]);
  m[ 4] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[13],1)], m[ 4]);
  m[ 2] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[13],2)], m[ 2]);
  m[ 0] = _mm_xor_si64(T_m64[7*256+((r)^(0x60)^EXT_BYTE(x[13],3))], m[ 0]);

  m[ 4] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[10],0)], m[ 4]);
  m[ 2] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[10],1)], m[ 2]);
  m[ 0] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[10],2)], m[ 0]);
  m[10] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[10],3)], m[10]);
  m[ 5] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[11],0)], m[ 5]);
  m[ 3] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[11],1)], m[ 3]);
  m[ 1] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[11],2)], m[ 1]);
  m[15] = _mm_xor_si64(T_m64[7*256+((r)^(0x50)^EXT_BYTE(x[11],3))], m[15]);

  m[ 3] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[ 8],0)], m[ 3]);
  m[ 1] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 8],1)], m[ 1]);
  m[15] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 8],2)], m[15]);
  m[ 9] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 8],3)], m[ 9]);
  m[ 4] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 9],0)], m[ 4]);
  m[ 2] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 9],1)], m[ 2]);
  m[ 0] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 9],2)], m[ 0]);
  m[14] = _mm_xor_si64(T_m64[7*256+((r)^(0x40)^EXT_BYTE(x[ 9],3))], m[14]);

  m[ 2] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[ 6],0)], m[ 2]);
  m[ 0] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 6],1)], m[ 0]);
  m[14] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 6],2)], m[14]);
  m[ 8] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 6],3)], m[ 8]);
  m[ 3] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 7],0)], m[ 3]);
  m[ 1] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 7],1)], m[ 1]);
  m[15] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 7],2)], m[15]);
  m[13] = _mm_xor_si64(T_m64[7*256+((r)^(0x30)^EXT_BYTE(x[ 7],3))], m[13]);

  m[ 1] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[ 4],0)], m[ 1]);
  m[15] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 4],1)], m[15]);
  m[13] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 4],2)], m[13]);
  m[ 7] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 4],3)], m[ 7]);
  m[ 2] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 5],0)], m[ 2]);
  m[ 0] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 5],1)], m[ 0]);
  m[14] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 5],2)], m[14]);
  m[12] = _mm_xor_si64(T_m64[7*256+((r)^(0x20)^EXT_BYTE(x[ 5],3))], m[12]);

  m[ 0] = _mm_xor_si64(T_m64[0*256+EXT_BYTE(x[ 2],0)], m[ 0]);
  m[14] = _mm_xor_si64(T_m64[1*256+EXT_BYTE(x[ 2],1)], m[14]);
  m[12] = _mm_xor_si64(T_m64[2*256+EXT_BYTE(x[ 2],2)], m[12]);
  m[ 6] = _mm_xor_si64(T_m64[3*256+EXT_BYTE(x[ 2],3)], m[ 6]);
  m[ 1] = _mm_xor_si64(T_m64[4*256+EXT_BYTE(x[ 3],0)], m[ 1]);
  m[15] = _mm_xor_si64(T_m64[5*256+EXT_BYTE(x[ 3],1)], m[15]);
  m[13] = _mm_xor_si64(T_m64[6*256+EXT_BYTE(x[ 3],2)], m[13]);
  m[11] = _mm_xor_si64(T_m64[7*256+((r)^(0x10)^EXT_BYTE(x[ 3],3))], m[11]);


  _mm_empty();
}

/* digest part of a message in short variants */
int Transform512(hashState *ctx, const u8 *msg, int msglen) {
  int i;
  __m64 m64_m[COLS512], *m64_h, m64_hm[COLS512], tmp[COLS512];
  u32 *msg_32;

  _mm_empty();

  while (msglen >= SIZE512) {
    msg_32 = (u32*)msg;
    m64_h = (__m64*)ctx->chaining;

    for (i = 0; i < COLS512; i++) {
      m64_m[i]  = _mm_setr_pi32(msg_32[2*i],msg_32[2*i+1]);
      m64_hm[i] = _mm_xor_si64(m64_h[i], m64_m[i]);
    }

    ROUNDP512(m64_hm, tmp, 0);
    ROUNDP512(tmp, m64_hm, 1);
    ROUNDP512(m64_hm, tmp, 2);
    ROUNDP512(tmp, m64_hm, 3);
    ROUNDP512(m64_hm, tmp, 4);
    ROUNDP512(tmp, m64_hm, 5);
    ROUNDP512(m64_hm, tmp, 6);
    ROUNDP512(tmp, m64_hm, 7);
    ROUNDP512(m64_hm, tmp, 8);
    ROUNDP512(tmp, m64_hm, 9);

    ROUNDQ512(m64_m, tmp, 0);
    ROUNDQ512(tmp, m64_m, 1);
    ROUNDQ512(m64_m, tmp, 2);
    ROUNDQ512(tmp, m64_m, 3);
    ROUNDQ512(m64_m, tmp, 4);
    ROUNDQ512(tmp, m64_m, 5);
    ROUNDQ512(m64_m, tmp, 6);
    ROUNDQ512(tmp, m64_m, 7);
    ROUNDQ512(m64_m, tmp, 8);
    ROUNDQ512(tmp, m64_m, 9);
    
    for (i = 0; i < COLS512; i++) {
      m64_h[i] = _mm_xor_si64(m64_h[i], m64_m [i]);
      m64_h[i] = _mm_xor_si64(m64_h[i], m64_hm[i]);
    }

    _mm_empty();

    ctx->block_counter++;

    msg += SIZE512;
    msglen -= SIZE512;
  }

  return 0;
}

/* digest part of a message in long variants */
int Transform1024(hashState *ctx, const u8 *msg, int msglen) {
  int i;
  __m64 m64_m[COLS1024], *m64_h, m64_hm[COLS1024], tmp[COLS1024];
  u32 *msg_32;
  u64 *mmm = (u64*)tmp;

  _mm_empty();

  while (msglen >= SIZE1024) {
    msg_32 = (u32*)msg;
    m64_h = (__m64*)ctx->chaining;

    for (i = 0; i < COLS1024; i++) {
      m64_m[i]  = _mm_setr_pi32(msg_32[2*i],msg_32[2*i+1]);
      m64_hm[i] = _mm_xor_si64(m64_h[i], m64_m[i]);
    }

    _mm_empty();

    ROUNDP1024(m64_hm, tmp, 0);
    ROUNDP1024(tmp, m64_hm, 1);
    ROUNDP1024(m64_hm, tmp, 2);
    ROUNDP1024(tmp, m64_hm, 3);
    ROUNDP1024(m64_hm, tmp, 4);
    ROUNDP1024(tmp, m64_hm, 5);
    ROUNDP1024(m64_hm, tmp, 6);
    ROUNDP1024(tmp, m64_hm, 7);
    ROUNDP1024(m64_hm, tmp, 8);
    ROUNDP1024(tmp, m64_hm, 9);
    ROUNDP1024(m64_hm, tmp, 10);
    ROUNDP1024(tmp, m64_hm, 11);
    ROUNDP1024(m64_hm, tmp, 12);
    ROUNDP1024(tmp, m64_hm, 13);

    ROUNDQ1024(m64_m, tmp, 0);
    ROUNDQ1024(tmp, m64_m, 1);
    ROUNDQ1024(m64_m, tmp, 2);
    ROUNDQ1024(tmp, m64_m, 3);
    ROUNDQ1024(m64_m, tmp, 4);
    ROUNDQ1024(tmp, m64_m, 5);
    ROUNDQ1024(m64_m, tmp, 6);
    ROUNDQ1024(tmp, m64_m, 7);
    ROUNDQ1024(m64_m, tmp, 8);
    ROUNDQ1024(tmp, m64_m, 9);
    ROUNDQ1024(m64_m, tmp, 10);
    ROUNDQ1024(tmp, m64_m, 11);
    ROUNDQ1024(m64_m, tmp, 12);
    ROUNDQ1024(tmp, m64_m, 13);

    for (i = 0; i < COLS1024; i++) {
      m64_h[i] = _mm_xor_si64(m64_h[i], m64_m [i]);
      m64_h[i] = _mm_xor_si64(m64_h[i], m64_hm[i]);
    }

    _mm_empty();

    ctx->block_counter++;

    msg += SIZE1024;
    msglen -= SIZE1024;
  }

  return 0;
}

/* digest part of a message after identifying variant */
int Transform(hashState *ctx, const u8 *msg, int msglen) {
  if (ctx->hashbitlen <= 256) {
    return Transform512(ctx, msg, msglen);
  }
  else {
    return Transform1024(ctx, msg, msglen);
  }
}

/* apply the output transformation of short variants */
void OutputTransformation512(hashState *ctx) {
  int i;
  __m64 *m64_h, tmp1[COLS512], tmp2[COLS512];
  m64_h = (__m64*)ctx->chaining;

  for (i = 0; i < COLS512; i++) {
    tmp1[i] = m64_h[i];
  }

  ROUNDP512(tmp1, tmp2, 0);
  ROUNDP512(tmp2, tmp1, 1);
  ROUNDP512(tmp1, tmp2, 2);
  ROUNDP512(tmp2, tmp1, 3);
  ROUNDP512(tmp1, tmp2, 4);
  ROUNDP512(tmp2, tmp1, 5);
  ROUNDP512(tmp1, tmp2, 6);
  ROUNDP512(tmp2, tmp1, 7);
  ROUNDP512(tmp1, tmp2, 8);
  ROUNDP512(tmp2, tmp1, 9);

  for (i = 0; i < COLS512; i++) {
    m64_h[i] = _mm_xor_si64(m64_h[i], tmp1[i]);
  }

  _mm_empty();
}

/* apply the output transformation of long variants */
void OutputTransformation1024(hashState *ctx) {
  int i;
  __m64 *m64_h, tmp1[COLS1024], tmp2[COLS1024];
  m64_h = (__m64*)ctx->chaining;

  for (i = 0; i < COLS1024; i++) {
    tmp1[i] = m64_h[i];
  }

  _mm_empty();

  ROUNDP1024(tmp1, tmp2, 0);
  ROUNDP1024(tmp2, tmp1, 1);
  ROUNDP1024(tmp1, tmp2, 2);
  ROUNDP1024(tmp2, tmp1, 3);
  ROUNDP1024(tmp1, tmp2, 4);
  ROUNDP1024(tmp2, tmp1, 5);
  ROUNDP1024(tmp1, tmp2, 6);
  ROUNDP1024(tmp2, tmp1, 7);
  ROUNDP1024(tmp1, tmp2, 8);
  ROUNDP1024(tmp2, tmp1, 9);
  ROUNDP1024(tmp1, tmp2,10);
  ROUNDP1024(tmp2, tmp1,11);
  ROUNDP1024(tmp1, tmp2,12);
  ROUNDP1024(tmp2, tmp1,13);

  for (i = 0; i < COLS1024; i++) {
    m64_h[i] = _mm_xor_si64(m64_h[i], tmp1[i]);
  }

  _mm_empty();
}

/* apply the output transformation after identifying variant */
void OutputTransformation(hashState *ctx) {
  if (ctx->hashbitlen <= 256) {
    OutputTransformation512(ctx);
  }
  else {
    OutputTransformation1024(ctx);
  }
}

/* initialise context */
HashReturn Init(hashState* ctx,
		int hashbitlen) {
  /* output size (in bits) must be a positive integer less than or
     equal to 512, and divisible by 8 */
  if (hashbitlen <= 0 || (hashbitlen%8) || hashbitlen > 512)
    return BAD_HASHLEN;

  /* set number of state columns and state size depending on
     variant */
  if (hashbitlen <= 256) {
    ctx->columns = COLS512;
    ctx->statesize = SIZE512;
  }
  else {
    ctx->columns = COLS1024;
    ctx->statesize = SIZE1024;
  }

  /* allocate memory for state and data buffer */
  ctx->chaining = calloc(ctx->statesize,1);
  ctx->buffer = malloc(ctx->statesize);
  if (ctx->chaining == NULL || ctx->buffer == NULL)
    return FAIL;

  /* set initial value */
  ctx->chaining[2*ctx->columns-1] = U32BIG((u32)hashbitlen);

  /* set other variables */
  ctx->hashbitlen = hashbitlen;
  ctx->buf_ptr = 0;
  ctx->block_counter = 0;
  ctx->bits_in_last_byte = 0;

  return SUCCESS;
}

/* update state with databitlen bits of input */
HashReturn Update(hashState* ctx,
		  const BitSequence* input,
		  DataLength databitlen) {
  int index = 0;
  int msglen = (int)(databitlen/8);
  int rem = (int)(databitlen%8);

  /* non-integral number of message bytes can only be supplied in the
     last call to this function */
  if (ctx->bits_in_last_byte) return FAIL;

  /* if the buffer contains data that has not yet been digested, first
     add data to buffer until full */
  if (ctx->buf_ptr) {
    while (ctx->buf_ptr < ctx->statesize && index < msglen) {
      ctx->buffer[(int)ctx->buf_ptr++] = input[index++];
    }
    if (ctx->buf_ptr < ctx->statesize) {
      /* buffer still not full, return */
      if (rem) {
	ctx->bits_in_last_byte = rem;
	ctx->buffer[(int)ctx->buf_ptr++] = input[index];
      }
      return SUCCESS;
    }

    /* digest buffer */
    ctx->buf_ptr = 0;
    Transform(ctx, ctx->buffer, ctx->statesize);
  }

  /* digest bulk of message */
  Transform(ctx, input+index, msglen-index);
  index += ((msglen-index)/ctx->statesize)*ctx->statesize;

  /* store remaining data in buffer */
  while (index < msglen) {
    ctx->buffer[(int)ctx->buf_ptr++] = input[index++];
  }

  /* if non-integral number of bytes have been supplied, store
     remaining bits in last byte, together with information about
     number of bits */
  if (rem) {
    ctx->bits_in_last_byte = rem;
    ctx->buffer[(int)ctx->buf_ptr++] = input[index];
  }
  return SUCCESS;
}

#define BILB ctx->bits_in_last_byte

/* finalise: process remaining data (including padding), perform
   output transformation, and write hash result to 'output' */
HashReturn Final(hashState* ctx,
		 BitSequence* output) {
  int i, j = 0, hashbytelen = ctx->hashbitlen/8;
  u8 *s = (BitSequence*)ctx->chaining;

  /* pad with '1'-bit and first few '0'-bits */
  if (BILB) {
    ctx->buffer[(int)ctx->buf_ptr-1] &= ((1<<BILB)-1)<<(8-BILB);
    ctx->buffer[(int)ctx->buf_ptr-1] ^= 0x1<<(7-BILB);
    BILB = 0;
  }
  else ctx->buffer[(int)ctx->buf_ptr++] = 0x80;

  /* pad with '0'-bits */
  if (ctx->buf_ptr > ctx->statesize-LENGTHFIELDLEN) {
    /* padding requires two blocks */
    while (ctx->buf_ptr < ctx->statesize) {
      ctx->buffer[(int)ctx->buf_ptr++] = 0;
    }
    /* digest first padding block */
    Transform(ctx, ctx->buffer, ctx->statesize);
    ctx->buf_ptr = 0;
  }
  while (ctx->buf_ptr < ctx->statesize-LENGTHFIELDLEN) {
    ctx->buffer[(int)ctx->buf_ptr++] = 0;
  }

  /* length padding */
  ctx->block_counter++;
  ctx->buf_ptr = ctx->statesize;
  while (ctx->buf_ptr > ctx->statesize-LENGTHFIELDLEN) {
    ctx->buffer[(int)--ctx->buf_ptr] = (u8)ctx->block_counter;
    ctx->block_counter >>= 8;
  }

  /* digest final padding block */
  Transform(ctx, ctx->buffer, ctx->statesize);
  /* perform output transformation */
  OutputTransformation(ctx);

  /* store hash result in output */
  for (i = ctx->statesize-hashbytelen; i < ctx->statesize; i++,j++) {
    output[j] = s[i];
  }

  /* zeroise relevant variables and deallocate memory */
  for (i = 0; i < ctx->columns; i++) {
    ctx->chaining[i] = 0;
  }
  for (i = 0; i < ctx->statesize; i++) {
    ctx->buffer[i] = 0;
  }
  free(ctx->chaining);
  free(ctx->buffer);

  return SUCCESS;
}

/* hash bit sequence */
HashReturn Hash(int hashbitlen,
		const BitSequence* data, 
		DataLength databitlen,
		BitSequence* hashval) {
  HashReturn ret;
  hashState context;

  /* initialise */
  if ((ret = Init(&context, hashbitlen)) != SUCCESS)
    return ret;

  /* process message */
  if ((ret = Update(&context, data, databitlen)) != SUCCESS)
    return ret;

  /* finalise */
  ret = Final(&context, hashval);

  return ret;
}

void PrintHash(const BitSequence* hash,
	       int hashbitlen) {
  int i;
  for (i = 0; i < hashbitlen/8; i++) {
    printf("%02x", hash[i]);
  }
  printf("\n");
}

/* eBash API */
#ifdef crypto_hash_BYTES
int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
  if (Hash(crypto_hash_BYTES * 8, in, inlen * 8,out) == SUCCESS) return 0;
  return -1;
}
#endif

#else
#error "MMX instructions must be enabled"
#endif /* __MMX__ */
