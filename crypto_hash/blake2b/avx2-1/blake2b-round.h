/*
   BLAKE2 reference source code package - optimized C implementations

   Written in 2013 by Samuel Neves <sneves@dei.uc.pt>

   To the extent possible under law, the author(s) have dedicated all copyright
   and related and neighboring rights to this software to the public domain
   worldwide. This software is distributed without any warranty.

   You should have received a copy of the CC0 Public Domain Dedication along with
   this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
*/
#pragma once
#ifndef __BLAKE2B_ROUND_H__
#define __BLAKE2B_ROUND_H__

#define LOAD128(p)  _mm_load_si128( (__m128i *)(p) )
#define STORE128(p,r) _mm_store_si128((__m128i *)(p), r)

#define LOADU128(p)  _mm_loadu_si128( (__m128i *)(p) )
#define STOREU128(p,r) _mm_storeu_si128((__m128i *)(p), r)

#define LOAD(p)  _mm256_load_si256( (__m256i *)(p) )
#define STORE(p,r) _mm256_store_si256((__m256i *)(p), r)

#define LOADU(p)  _mm256_loadu_si256( (__m256i *)(p) )
#define STOREU(p,r) _mm256_storeu_si256((__m256i *)(p), r)

/* Microarchitecture-specific macros */
#define _mm256_roti_epi64(x, c) \
      (-(c) == 32) ? _mm256_shuffle_epi32((x), _MM_SHUFFLE(2,3,0,1))  \
    : (-(c) == 24) ? _mm256_shuffle_epi8((x), r24) \
    : (-(c) == 16) ? _mm256_shuffle_epi8((x), r16) \
    : (-(c) == 63) ? _mm256_or_si256(_mm256_srli_epi64((x), -(c)), _mm256_add_epi64((x), (x)))  \
    : _mm256_or_si256(_mm256_srli_epi64((x), -(c)), _mm256_slli_epi64((x), 64-(-(c))))



#define G1(row1,row2,row3,row4,b0) \
  row1 = _mm256_add_epi64(_mm256_add_epi64(row1, b0), row2); \
  row4 = _mm256_xor_si256(row4, row1); \
  row4 = _mm256_roti_epi64(row4, -32); \
  row3 = _mm256_add_epi64(row3, row4); \
  row2 = _mm256_xor_si256(row2, row3); \
  row2 = _mm256_roti_epi64(row2, -24); 
 
#define G2(row1,row2,row3,row4,b0) \
  row1 = _mm256_add_epi64(_mm256_add_epi64(row1, b0), row2); \
  row4 = _mm256_xor_si256(row4, row1); \
  row4 = _mm256_roti_epi64(row4, -16); \
  row3 = _mm256_add_epi64(row3, row4); \
  row2 = _mm256_xor_si256(row2, row3); \
  row2 = _mm256_roti_epi64(row2, -63); 
 
#define DIAGONALIZE(row1,row2,row3,row4) \
  row4 = _mm256_permute4x64_epi64(row4, _MM_SHUFFLE(2,1,0,3)); \
  row3 = _mm256_permute4x64_epi64(row3, _MM_SHUFFLE(1,0,3,2)); \
  row2 = _mm256_permute4x64_epi64(row2, _MM_SHUFFLE(0,3,2,1));

#define UNDIAGONALIZE(row1,row2,row3,row4) \
  row4 = _mm256_permute4x64_epi64(row4, _MM_SHUFFLE(0,3,2,1)); \
  row3 = _mm256_permute4x64_epi64(row3, _MM_SHUFFLE(1,0,3,2)); \
  row2 = _mm256_permute4x64_epi64(row2, _MM_SHUFFLE(2,1,0,3));

#if defined(PERMUTE_WITH_SHUFFLES)
  #include "blake2b-load-avx2.h"
#elif defined(PERMUTE_WITH_GATHER)
#else
  #include "blake2b-load-avx2-simple.h"
#endif

#define ROUND(r) \
  LOAD_MSG_ ##r ##_1(b0); \
  G1(ymm0,ymm1,ymm2,ymm3,b0); \
  LOAD_MSG_ ##r ##_2(b0); \
  G2(ymm0,ymm1,ymm2,ymm3,b0); \
  DIAGONALIZE(ymm0,ymm1,ymm2,ymm3); \
  LOAD_MSG_ ##r ##_3(b0); \
  G1(ymm0,ymm1,ymm2,ymm3,b0); \
  LOAD_MSG_ ##r ##_4(b0); \
  G2(ymm0,ymm1,ymm2,ymm3,b0); \
  UNDIAGONALIZE(ymm0,ymm1,ymm2,ymm3);

#define GATHER_ROUND(msg) \
  for(i = 0; i < 12; ++i) \
  { \
    b0 = _mm256_i32gather_epi64((void *)msg, LOAD128(&indices[16*i +  0]), 8); \
    G1(ymm0,ymm1,ymm2,ymm3,b0); \
    b0 = _mm256_i32gather_epi64((void *)msg, LOAD128(&indices[16*i +  4]), 8); \
    G2(ymm0,ymm1,ymm2,ymm3,b0); \
    DIAGONALIZE(ymm0,ymm1,ymm2,ymm3); \
    b0 = _mm256_i32gather_epi64((void *)msg, LOAD128(&indices[16*i +  8]), 8); \
    G1(ymm0,ymm1,ymm2,ymm3,b0); \
    b0 = _mm256_i32gather_epi64((void *)msg, LOAD128(&indices[16*i + 12]), 8); \
    G2(ymm0,ymm1,ymm2,ymm3,b0); \
    UNDIAGONALIZE(ymm0,ymm1,ymm2,ymm3); \
  }

#if defined(PERMUTE_WITH_GATHER)
  #define ROUNDS(msg) GATHER_ROUND(msg)
#else
  #define ROUNDS(msg) \
  do \
  { \
    ROUND( 0 ); \
    ROUND( 1 ); \
    ROUND( 2 ); \
    ROUND( 3 ); \
    ROUND( 4 ); \
    ROUND( 5 ); \
    ROUND( 6 ); \
    ROUND( 7 ); \
    ROUND( 8 ); \
    ROUND( 9 ); \
    ROUND( 10 ); \
    ROUND( 11 ); \
  } while(0)
#endif

#endif

