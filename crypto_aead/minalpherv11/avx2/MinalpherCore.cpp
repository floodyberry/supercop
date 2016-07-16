/*
  Minalpher v1.1 optimized code (primitive part) on AVX2 environment version 1.1.0

Copyright (c) 2014-2015
NTT (Nippon Telegraph and Telephone Corporation)
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

1. Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
"AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#include "define.h"

/*==== Minalpher Core (single block) ====*/
/********************************************************************
 *  Name:       minalpher_core_single_block                         *
 *  Function:   Output data without format returning                *
 *  Return:     Void                                                *
 ********************************************************************/
const __m256i RoundConstSingleBlock[16][2] = {
    { _mm256_set_epi32(0x0000000, 0x03020100, 0x00000000, 0x0000000, 0x0000000, 0x02030001, 0x0000000, 0x0000000), 
      _mm256_set_epi32(0x0000000, 0x01000302, 0x00000000, 0x0000000, 0x0000000, 0x00010203, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x02030001, 0x00000000, 0x0000000, 0x0000000, 0x03020100, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x00010203, 0x00000000, 0x0000000, 0x0000000, 0x01000302, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x01000302, 0x00000000, 0x0000000, 0x0000000, 0x00010203, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x03020100, 0x00000000, 0x0000000, 0x0000000, 0x02030001, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x00010203, 0x00000000, 0x0000000, 0x0000000, 0x01000302, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x02030001, 0x00000000, 0x0000000, 0x0000000, 0x03020100, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x07060504, 0x00000000, 0x0000000, 0x0000000, 0x06070405, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x05040706, 0x00000000, 0x0000000, 0x0000000, 0x04050607, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x06070405, 0x00000000, 0x0000000, 0x0000000, 0x07060504, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x04050607, 0x00000000, 0x0000000, 0x0000000, 0x05040706, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x05040706, 0x00000000, 0x0000000, 0x0000000, 0x04050607, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x07060504, 0x00000000, 0x0000000, 0x0000000, 0x06070405, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x04050607, 0x00000000, 0x0000000, 0x0000000, 0x05040706, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x06070405, 0x00000000, 0x0000000, 0x0000000, 0x07060504, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x0B0A0908, 0x00000000, 0x0000000, 0x0000000, 0x0A0B0809, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x09080B0A, 0x00000000, 0x0000000, 0x0000000, 0x08090A0B, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x0A0B0809, 0x00000000, 0x0000000, 0x0000000, 0x0B0A0908, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x08090A0B, 0x00000000, 0x0000000, 0x0000000, 0x09080B0A, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x09080B0A, 0x00000000, 0x0000000, 0x0000000, 0x08090A0B, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x0B0A0908, 0x00000000, 0x0000000, 0x0000000, 0x0A0B0809, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x08090A0B, 0x00000000, 0x0000000, 0x0000000, 0x09080B0A, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x0A0B0809, 0x00000000, 0x0000000, 0x0000000, 0x0B0A0908, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x0F0E0D0C, 0x00000000, 0x0000000, 0x0000000, 0x0E0F0C0D, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x0D0C0F0E, 0x00000000, 0x0000000, 0x0000000, 0x0C0D0E0F, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x0E0F0C0D, 0x00000000, 0x0000000, 0x0000000, 0x0F0E0D0C, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x0C0D0E0F, 0x00000000, 0x0000000, 0x0000000, 0x0D0C0F0E, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x0D0C0F0E, 0x00000000, 0x0000000, 0x0000000, 0x0C0D0E0F, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x0F0E0D0C, 0x00000000, 0x0000000, 0x0000000, 0x0E0F0C0D, 0x0000000, 0x0000000)},
    { _mm256_set_epi32(0x0000000, 0x0C0D0E0F, 0x00000000, 0x0000000, 0x0000000, 0x0D0C0F0E, 0x0000000, 0x0000000),
      _mm256_set_epi32(0x0000000, 0x0E0F0C0D, 0x00000000, 0x0000000, 0x0000000, 0x0F0E0D0C, 0x0000000, 0x0000000)}
};
const __m256i ShuffleSingleBlock0 = _mm256_set_epi8(3, 2, 6, 7, 1, 0, 5, 4, 12, 13, 9, 8, 15, 14, 11, 10, 5, 4, 3, 2, 0, 1, 7, 6, 9, 8, 15, 14, 13, 12, 10, 11);
const __m256i ShuffleSingleBlock1 = _mm256_set_epi8(4, 5, 1, 0, 7, 6, 3, 2, 11, 10, 14, 15, 9, 8, 13, 12, 1, 0, 7, 6, 5, 4, 2, 3, 13, 12, 11, 10, 8, 9, 15, 14);
void minalpher_core_single_block(
  const __m256i           &DATA,   /* I                            */
  __m256i                 &ymm0_,  /* O    ymm0                    */
  __m256i                 &ymm1_   /* O    ymm1                    */
  )
{
  /*==== FORMAT CHANGE ====*/
  //Constant Load
  const __m256i ymmMask = _mm256_set_epi32(0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F);

  //VPERMQ
  __m256i tmp = _mm256_permute4x64_epi64(DATA, 0xD8);

  //AND
  __m256i tmp0, tmp1;
  tmp0 = _mm256_and_si256(ymmMask, tmp);
  tmp1 = _mm256_andnot_si256(ymmMask, tmp);

  //SHIFT
  tmp1 = _mm256_srli_epi16(tmp1, 4);

  //UNPACK
  __m256i ymm0 = _mm256_unpacklo_epi8(tmp0, tmp1);
  __m256i ymm1 = _mm256_unpackhi_epi8(tmp0, tmp1);
  /*==== END FORMAT CHANGE ====*/


  /*==== Minalpher-P ====*/
  //Constant Load
  const __m256i ymmSbox = _mm256_set_epi8(0x07, 0x0A, 0x09, 0x06, 0x00, 0x0E, 0x0D, 0x05, 0x0F, 0x0C, 0x08, 0x02, 0x01, 0x04, 0x03, 0x0B,
    0x07, 0x0A, 0x09, 0x06, 0x00, 0x0E, 0x0D, 0x05, 0x0F, 0x0C, 0x08, 0x02, 0x01, 0x04, 0x03, 0x0B);


  /*==== single round function ====*/
  #define singleRoundFunctionH(i, ymm0, ymm1 ) {\
    ymm0 = _mm256_shuffle_epi8( ymmSbox, ymm0 );\
    ymm1 = _mm256_shuffle_epi8( ymmSbox, ymm1 );\
    ymm0 = _mm256_shuffle_epi8( ymm0, ShuffleSingleBlock0 );\
    ymm1 = _mm256_shuffle_epi8( ymm1, ShuffleSingleBlock1 );\
    __m256i tmp01 = _mm256_xor_si256(ymm0, ymm1);\
    ymm0 = _mm256_xor_si256( ymm0, RoundConstSingleBlock[i][0] );\
    ymm1 = _mm256_xor_si256( ymm1, RoundConstSingleBlock[i][1] );\
    tmp01 = _mm256_permute4x64_epi64(tmp01, 0x4E);\
    ymm0 = _mm256_xor_si256(tmp01, ymm0); \
    ymm1 = _mm256_xor_si256(tmp01, ymm1); \
    tmp0 = _mm256_slli_si256( ymm0, 8 );\
    tmp1 = _mm256_slli_si256( ymm1, 8 );\
    ymm0 = _mm256_xor_si256( tmp0, ymm0 );\
    ymm1 = _mm256_xor_si256( tmp1, ymm1 );\
  }

  singleRoundFunctionH( 0, ymm0, ymm1);
  singleRoundFunctionH( 1, ymm0, ymm1);
  singleRoundFunctionH( 2, ymm0, ymm1);
  singleRoundFunctionH( 3, ymm0, ymm1);
  singleRoundFunctionH( 4, ymm0, ymm1);
  singleRoundFunctionH( 5, ymm0, ymm1);
  singleRoundFunctionH( 6, ymm0, ymm1);
  singleRoundFunctionH( 7, ymm0, ymm1);
  singleRoundFunctionH( 8, ymm0, ymm1);
  singleRoundFunctionH( 9, ymm0, ymm1);
  singleRoundFunctionH(10, ymm0, ymm1);
  singleRoundFunctionH(11, ymm0, ymm1);
  singleRoundFunctionH(12, ymm0, ymm1);
  singleRoundFunctionH(13, ymm0, ymm1);
  singleRoundFunctionH(14, ymm0, ymm1);
  singleRoundFunctionH(15, ymm0, ymm1);
  singleRoundFunctionH( 0, ymm0, ymm1);

  ymm0  = _mm256_shuffle_epi8(ymmSbox, ymm0);
  ymm0_ = _mm256_shuffle_epi8(ymm0, ShuffleSingleBlock0);

  ymm1  = _mm256_shuffle_epi8(ymmSbox, ymm1);
  ymm1_ = _mm256_shuffle_epi8(ymm1, ShuffleSingleBlock1);
  /*==== END Minalpher-P ====*/
}
void minalpher_core_single_block_inverse(
  const __m256i           &DATA,   /* I                            */
  __m256i                 &ymm0_,  /* O    ymm0                    */
  __m256i                 &ymm1_   /* O    ymm1                    */
  )
{
  /*==== FORMAT CHANGE ====*/
  //Constant Load
  const __m256i ymmMask = _mm256_set_epi32(0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F);

  //VPERMQ
  __m256i tmp = _mm256_permute4x64_epi64(DATA, 0xD8);

  //AND
  __m256i tmp0, tmp1;
  tmp0 = _mm256_and_si256(ymmMask, tmp);
  tmp1 = _mm256_andnot_si256(ymmMask, tmp);

  //SHIFT
  tmp1 = _mm256_srli_epi16(tmp1, 4);

  //UNPACK
  __m256i ymm0 = _mm256_unpacklo_epi8(tmp0, tmp1);
  __m256i ymm1 = _mm256_unpackhi_epi8(tmp0, tmp1);
  /*==== END FORMAT CHANGE ====*/


  /*==== Minalpher-P ====*/
  //Constant Load
  const __m256i ymmSbox = _mm256_set_epi8(0x07, 0x0A, 0x09, 0x06, 0x00, 0x0E, 0x0D, 0x05, 0x0F, 0x0C, 0x08, 0x02, 0x01, 0x04, 0x03, 0x0B,
    0x07, 0x0A, 0x09, 0x06, 0x00, 0x0E, 0x0D, 0x05, 0x0F, 0x0C, 0x08, 0x02, 0x01, 0x04, 0x03, 0x0B);


  /*==== single round function ====*/
#define singleRoundFunctionH(i, ymm0, ymm1 ) {\
    ymm0 = _mm256_shuffle_epi8( ymmSbox, ymm0 );\
    ymm1 = _mm256_shuffle_epi8( ymmSbox, ymm1 );\
    ymm0 = _mm256_shuffle_epi8( ymm0, ShuffleSingleBlock0 );\
    ymm1 = _mm256_shuffle_epi8( ymm1, ShuffleSingleBlock1 );\
    __m256i tmp01 = _mm256_xor_si256(ymm0, ymm1);\
    ymm0 = _mm256_xor_si256( ymm0, RoundConstSingleBlock[i][0] );\
    ymm1 = _mm256_xor_si256( ymm1, RoundConstSingleBlock[i][1] );\
    tmp01 = _mm256_permute4x64_epi64(tmp01, 0x4E);\
    ymm0 = _mm256_xor_si256(tmp01, ymm0); \
    ymm1 = _mm256_xor_si256(tmp01, ymm1); \
    tmp0 = _mm256_slli_si256( ymm0, 8 );\
    tmp1 = _mm256_slli_si256( ymm1, 8 );\
    ymm0 = _mm256_xor_si256( tmp0, ymm0 );\
    ymm1 = _mm256_xor_si256( tmp1, ymm1 );\
    }

  singleRoundFunctionH(2, ymm0, ymm1);
  singleRoundFunctionH(13, ymm0, ymm1);
  singleRoundFunctionH(12, ymm0, ymm1);
  singleRoundFunctionH(15, ymm0, ymm1);
  singleRoundFunctionH(14, ymm0, ymm1);
  singleRoundFunctionH(9, ymm0, ymm1);
  singleRoundFunctionH(8, ymm0, ymm1);
  singleRoundFunctionH(11, ymm0, ymm1);
  singleRoundFunctionH(10, ymm0, ymm1);
  singleRoundFunctionH(5, ymm0, ymm1);
  singleRoundFunctionH(4, ymm0, ymm1);
  singleRoundFunctionH(7, ymm0, ymm1);
  singleRoundFunctionH(6, ymm0, ymm1);
  singleRoundFunctionH(1, ymm0, ymm1);
  singleRoundFunctionH(0, ymm0, ymm1);
  singleRoundFunctionH(3, ymm0, ymm1);
  singleRoundFunctionH(2, ymm0, ymm1);

  ymm0  = _mm256_shuffle_epi8(ymmSbox, ymm0);
  ymm0_ = _mm256_shuffle_epi8(ymm0, ShuffleSingleBlock0);

  ymm1  = _mm256_shuffle_epi8(ymmSbox, ymm1);
  ymm1_ = _mm256_shuffle_epi8(ymm1, ShuffleSingleBlock1);
  /*==== END Minalpher-P ====*/
}
/*==== Minalpher Core (single block) ====*/
/********************************************************************
 *  Name:       format_return_single_block                          *
 *  Function:   format change from 2 ymm to 1 ymm                   *
 *  Return:     Void                                                *
 ********************************************************************/
void format_return_single_block(
  const __m256i             &ymm0,   /* I    ymm0                    */
  const __m256i             &ymm1,   /* I    ymm1                    */
  __m256i                   &DATA    /* O                            */
  ){
  /*==== FORMAT CHANGE ====*/
  //Constant Load
  const __m256i ymmMaskFF = _mm256_set_epi16(0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF);

  //SHIFT
  __m256i tmp0, tmp1;
  tmp0 = _mm256_srli_epi16(ymm0, 4);
  tmp0 = _mm256_xor_si256(tmp0, ymm0);
  tmp0 = _mm256_and_si256(ymmMaskFF, tmp0);

  tmp1 = _mm256_srli_epi16(ymm1, 4);
  tmp1 = _mm256_xor_si256(tmp1, ymm1);
  tmp1 = _mm256_and_si256(ymmMaskFF, tmp1);
  
  DATA = _mm256_packus_epi16(tmp0, tmp1);
  DATA = _mm256_permute4x64_epi64(DATA, 0xD8);
  /*==== END FORMAT CHANGE ====*/
}

/*==== Minalpher Core (single block) ====*/
/********************************************************************
 *  Name:       minalpher_core_single_block                         *
 *  Function:   Minalpher-P function for one block                  *
 *  Return:     Void                                                *
 ********************************************************************/
void minalpher_core_single_block(
  __m256i           &DATA    /* I                            */
  ){
  __m256i ymm0, ymm1;
  minalpher_core_single_block(DATA, ymm0, ymm1);
  format_return_single_block(ymm0, ymm1, DATA);
}
void minalpher_core_single_block_inverse(
  __m256i           &DATA    /* I                            */
  ){
  __m256i ymm0, ymm1;
  minalpher_core_single_block_inverse(DATA, ymm0, ymm1);
  format_return_single_block(ymm0, ymm1, DATA);
}






/*==== Minalpher Core (double block) ====*/
/********************************************************************
 *  Name:       minalpher_core_double_block                         *
 *  Function:   Output data without format returning                *
 *  Return:     Void                                                *
 ********************************************************************/
const __m256i RoundConstDoubleBlock[16][4] = {
  { _mm256_set_epi32(0x00000000, 0x02030001, 0x00000000, 0x00000000, 0x00000000, 0x02030001, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x03020100, 0x00000000, 0x00000000, 0x00000000, 0x03020100, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x00010203, 0x00000000, 0x00000000, 0x00000000, 0x00010203, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x01000302, 0x00000000, 0x00000000, 0x00000000, 0x01000302, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x03020100, 0x00000000, 0x00000000, 0x00000000, 0x03020100, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x02030001, 0x00000000, 0x00000000, 0x00000000, 0x02030001, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x01000302, 0x00000000, 0x00000000, 0x00000000, 0x01000302, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x00010203, 0x00000000, 0x00000000, 0x00000000, 0x00010203, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x00010203, 0x00000000, 0x00000000, 0x00000000, 0x00010203, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x01000302, 0x00000000, 0x00000000, 0x00000000, 0x01000302, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x02030001, 0x00000000, 0x00000000, 0x00000000, 0x02030001, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x03020100, 0x00000000, 0x00000000, 0x00000000, 0x03020100, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x01000302, 0x00000000, 0x00000000, 0x00000000, 0x01000302, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x00010203, 0x00000000, 0x00000000, 0x00000000, 0x00010203, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x03020100, 0x00000000, 0x00000000, 0x00000000, 0x03020100, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x02030001, 0x00000000, 0x00000000, 0x00000000, 0x02030001, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x06070405, 0x00000000, 0x00000000, 0x00000000, 0x06070405, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x07060504, 0x00000000, 0x00000000, 0x00000000, 0x07060504, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x04050607, 0x00000000, 0x00000000, 0x00000000, 0x04050607, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x05040706, 0x00000000, 0x00000000, 0x00000000, 0x05040706, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x07060504, 0x00000000, 0x00000000, 0x00000000, 0x07060504, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x06070405, 0x00000000, 0x00000000, 0x00000000, 0x06070405, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x05040706, 0x00000000, 0x00000000, 0x00000000, 0x05040706, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x04050607, 0x00000000, 0x00000000, 0x00000000, 0x04050607, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x04050607, 0x00000000, 0x00000000, 0x00000000, 0x04050607, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x05040706, 0x00000000, 0x00000000, 0x00000000, 0x05040706, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x06070405, 0x00000000, 0x00000000, 0x00000000, 0x06070405, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x07060504, 0x00000000, 0x00000000, 0x00000000, 0x07060504, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x05040706, 0x00000000, 0x00000000, 0x00000000, 0x05040706, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x04050607, 0x00000000, 0x00000000, 0x00000000, 0x04050607, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x07060504, 0x00000000, 0x00000000, 0x00000000, 0x07060504, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x06070405, 0x00000000, 0x00000000, 0x00000000, 0x06070405, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x0A0B0809, 0x00000000, 0x00000000, 0x00000000, 0x0A0B0809, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0B0A0908, 0x00000000, 0x00000000, 0x00000000, 0x0B0A0908, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x08090A0B, 0x00000000, 0x00000000, 0x00000000, 0x08090A0B, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x09080B0A, 0x00000000, 0x00000000, 0x00000000, 0x09080B0A, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x0B0A0908, 0x00000000, 0x00000000, 0x00000000, 0x0B0A0908, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0A0B0809, 0x00000000, 0x00000000, 0x00000000, 0x0A0B0809, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x09080B0A, 0x00000000, 0x00000000, 0x00000000, 0x09080B0A, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x08090A0B, 0x00000000, 0x00000000, 0x00000000, 0x08090A0B, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x08090A0B, 0x00000000, 0x00000000, 0x00000000, 0x08090A0B, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x09080B0A, 0x00000000, 0x00000000, 0x00000000, 0x09080B0A, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0A0B0809, 0x00000000, 0x00000000, 0x00000000, 0x0A0B0809, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0B0A0908, 0x00000000, 0x00000000, 0x00000000, 0x0B0A0908, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x09080B0A, 0x00000000, 0x00000000, 0x00000000, 0x09080B0A, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x08090A0B, 0x00000000, 0x00000000, 0x00000000, 0x08090A0B, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0B0A0908, 0x00000000, 0x00000000, 0x00000000, 0x0B0A0908, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0A0B0809, 0x00000000, 0x00000000, 0x00000000, 0x0A0B0809, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x0E0F0C0D, 0x00000000, 0x00000000, 0x00000000, 0x0E0F0C0D, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0F0E0D0C, 0x00000000, 0x00000000, 0x00000000, 0x0F0E0D0C, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0C0D0E0F, 0x00000000, 0x00000000, 0x00000000, 0x0C0D0E0F, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0D0C0F0E, 0x00000000, 0x00000000, 0x00000000, 0x0D0C0F0E, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x0F0E0D0C, 0x00000000, 0x00000000, 0x00000000, 0x0F0E0D0C, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0E0F0C0D, 0x00000000, 0x00000000, 0x00000000, 0x0E0F0C0D, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0D0C0F0E, 0x00000000, 0x00000000, 0x00000000, 0x0D0C0F0E, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0C0D0E0F, 0x00000000, 0x00000000, 0x00000000, 0x0C0D0E0F, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x0C0D0E0F, 0x00000000, 0x00000000, 0x00000000, 0x0C0D0E0F, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0D0C0F0E, 0x00000000, 0x00000000, 0x00000000, 0x0D0C0F0E, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0E0F0C0D, 0x00000000, 0x00000000, 0x00000000, 0x0E0F0C0D, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0F0E0D0C, 0x00000000, 0x00000000, 0x00000000, 0x0F0E0D0C, 0x00000000, 0x00000000) },
  { _mm256_set_epi32(0x00000000, 0x0D0C0F0E, 0x00000000, 0x00000000, 0x00000000, 0x0D0C0F0E, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0C0D0E0F, 0x00000000, 0x00000000, 0x00000000, 0x0C0D0E0F, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0F0E0D0C, 0x00000000, 0x00000000, 0x00000000, 0x0F0E0D0C, 0x00000000, 0x00000000),
    _mm256_set_epi32(0x00000000, 0x0E0F0C0D, 0x00000000, 0x00000000, 0x00000000, 0x0E0F0C0D, 0x00000000, 0x00000000) }
};
__m256i ShuffleDoubleBlock0 = _mm256_set_epi8(5, 4, 3, 2, 0, 1, 7, 6, 9, 8, 15, 14, 13, 12, 10, 11, 5, 4, 3, 2, 0, 1, 7, 6, 9, 8, 15, 14, 13, 12, 10, 11);
__m256i ShuffleDoubleBlock1 = _mm256_set_epi8(3, 2, 6, 7, 1, 0, 5, 4, 12, 13, 9, 8, 15, 14, 11, 10, 3, 2, 6, 7, 1, 0, 5, 4, 12, 13, 9, 8, 15, 14, 11, 10);
__m256i ShuffleDoubleBlock2 = _mm256_set_epi8(1, 0, 7, 6, 5, 4, 2, 3, 13, 12, 11, 10, 8, 9, 15, 14, 1, 0, 7, 6, 5, 4, 2, 3, 13, 12, 11, 10, 8, 9, 15, 14);
__m256i ShuffleDoubleBlock3 = _mm256_set_epi8(4, 5, 1, 0, 7, 6, 3, 2, 11, 10, 14, 15, 9, 8, 13, 12, 4, 5, 1, 0, 7, 6, 3, 2, 11, 10, 14, 15, 9, 8, 13, 12);
void minalpher_core_double_block(
  const __m256i           &DATA1,  /* I    HI                      */
  const __m256i           &DATA2,  /* I    LOW                     */
  __m256i                 ymm[4]   /* O    ymm                     */
  )
{
  /*==== FORMAT CHANGE ====*/
  //BLEND
  __m256i DATA_A = _mm256_permute2x128_si256(DATA2, DATA1, 0x02);
  __m256i DATA_B = _mm256_permute2x128_si256(DATA2, DATA1, 0x13);

  //Constant Load
  const __m256i ymmMask = _mm256_set_epi32(0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F);

  //AND
  __m256i tmp0 = _mm256_and_si256(ymmMask, DATA_A);
  __m256i tmp1 = _mm256_andnot_si256(ymmMask, DATA_A);
  __m256i tmp2 = _mm256_and_si256(ymmMask, DATA_B);
  __m256i tmp3 = _mm256_andnot_si256(ymmMask, DATA_B);

  //SHIFT
  tmp1 = _mm256_srli_epi16(tmp1, 4);
  tmp3 = _mm256_srli_epi16(tmp3, 4);

  //UNPACK
  __m256i ymm0, ymm1, ymm2, ymm3;
  ymm0 = _mm256_unpacklo_epi8(tmp0, tmp1);
  ymm1 = _mm256_unpackhi_epi8(tmp0, tmp1);
  ymm2 = _mm256_unpacklo_epi8(tmp2, tmp3);
  ymm3 = _mm256_unpackhi_epi8(tmp2, tmp3);
  /*==== END FORMAT CHANGE ====*/


  /*==== Minalpher-P ====*/
  //Constant Load
  const __m256i ymmSbox = _mm256_set_epi8(0x07, 0x0A, 0x09, 0x06, 0x00, 0x0E, 0x0D, 0x05, 0x0F, 0x0C, 0x08, 0x02, 0x01, 0x04, 0x03, 0x0B,
    0x07, 0x0A, 0x09, 0x06, 0x00, 0x0E, 0x0D, 0x05, 0x0F, 0x0C, 0x08, 0x02, 0x01, 0x04, 0x03, 0x0B);

  #define doubleRoundFunction(i, ymm0, ymm1, ymm2, ymm3 ) {\
    ymm0 = _mm256_shuffle_epi8( ymmSbox, ymm0 );\
    ymm2 = _mm256_shuffle_epi8( ymmSbox, ymm2 );\
    ymm0 = _mm256_shuffle_epi8( ymm0, ShuffleDoubleBlock0 );\
    ymm2 = _mm256_shuffle_epi8( ymm2, ShuffleDoubleBlock2 );\
    __m256i tmp02 = _mm256_xor_si256(ymm0, ymm2);\
    ymm1 = _mm256_shuffle_epi8( ymmSbox, ymm1 );\
    ymm3 = _mm256_shuffle_epi8( ymmSbox, ymm3 );\
    ymm1 = _mm256_shuffle_epi8( ymm1, ShuffleDoubleBlock1 );\
    ymm3 = _mm256_shuffle_epi8( ymm3, ShuffleDoubleBlock3 );\
    __m256i tmp13 = _mm256_xor_si256(ymm1, ymm3);\
    ymm0 = _mm256_xor_si256(tmp13, ymm0);\
    ymm1 = _mm256_xor_si256(tmp02, ymm1);\
    ymm2 = _mm256_xor_si256(tmp13, ymm2);\
    ymm3 = _mm256_xor_si256(tmp02, ymm3);\
    tmp0 = _mm256_slli_si256( ymm0, 8 );\
    tmp1 = _mm256_slli_si256( ymm1, 8 );\
    tmp2 = _mm256_slli_si256( ymm2, 8 );\
    tmp3 = _mm256_slli_si256( ymm3, 8 );\
    ymm0 = _mm256_xor_si256( tmp0, ymm0 );\
    ymm1 = _mm256_xor_si256( tmp1, ymm1 );\
    ymm2 = _mm256_xor_si256( tmp2, ymm2 );\
    ymm3 = _mm256_xor_si256( tmp3, ymm3 );\
    ymm0 = _mm256_xor_si256( ymm0, RoundConstDoubleBlock[i][0] );\
    ymm1 = _mm256_xor_si256( ymm1, RoundConstDoubleBlock[i][1] );\
    ymm2 = _mm256_xor_si256( ymm2, RoundConstDoubleBlock[i][2] );\
    ymm3 = _mm256_xor_si256( ymm3, RoundConstDoubleBlock[i][3] );\
  }

  doubleRoundFunction(0, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(1, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(2, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(3, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(4, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(5, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(6, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(7, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(8, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(9, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(10, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(11, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(12, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(13, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(14, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(15, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(0, ymm0, ymm1, ymm2, ymm3);


  ymm0   = _mm256_shuffle_epi8(ymmSbox, ymm0);
  ymm1   = _mm256_shuffle_epi8(ymmSbox, ymm1);
  ymm[0] = _mm256_shuffle_epi8(ymm0, ShuffleDoubleBlock0);
  ymm[1] = _mm256_shuffle_epi8(ymm1, ShuffleDoubleBlock1);

  ymm2   = _mm256_shuffle_epi8(ymmSbox, ymm2);
  ymm3   = _mm256_shuffle_epi8(ymmSbox, ymm3);
  ymm[2] = _mm256_shuffle_epi8(ymm2, ShuffleDoubleBlock2);
  ymm[3] = _mm256_shuffle_epi8(ymm3, ShuffleDoubleBlock3);
  /*==== END Minalpher-P ====*/
}
void minalpher_core_double_block_inverse(
  const __m256i           &DATA1,  /* I    HI                      */
  const __m256i           &DATA2,  /* I    LOW                     */
  __m256i                 ymm[4]   /* O    ymm                     */
  )
{
  /*==== FORMAT CHANGE ====*/
  //BLEND
  __m256i DATA_A = _mm256_permute2x128_si256(DATA2, DATA1, 0x02);
  __m256i DATA_B = _mm256_permute2x128_si256(DATA2, DATA1, 0x13);

  //Constant Load
  const __m256i ymmMask = _mm256_set_epi32(0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F);

  //AND
  __m256i tmp0 = _mm256_and_si256(ymmMask, DATA_A);
  __m256i tmp1 = _mm256_andnot_si256(ymmMask, DATA_A);
  __m256i tmp2 = _mm256_and_si256(ymmMask, DATA_B);
  __m256i tmp3 = _mm256_andnot_si256(ymmMask, DATA_B);

  //SHIFT
  tmp1 = _mm256_srli_epi16(tmp1, 4);
  tmp3 = _mm256_srli_epi16(tmp3, 4);

  //UNPACK
  __m256i ymm0, ymm1, ymm2, ymm3;
  ymm0 = _mm256_unpacklo_epi8(tmp0, tmp1);
  ymm1 = _mm256_unpackhi_epi8(tmp0, tmp1);
  ymm2 = _mm256_unpacklo_epi8(tmp2, tmp3);
  ymm3 = _mm256_unpackhi_epi8(tmp2, tmp3);
  /*==== END FORMAT CHANGE ====*/


  /*==== Minalpher-P ====*/
  //Constant Load
  const __m256i ymmSbox = _mm256_set_epi8(0x07, 0x0A, 0x09, 0x06, 0x00, 0x0E, 0x0D, 0x05, 0x0F, 0x0C, 0x08, 0x02, 0x01, 0x04, 0x03, 0x0B,
    0x07, 0x0A, 0x09, 0x06, 0x00, 0x0E, 0x0D, 0x05, 0x0F, 0x0C, 0x08, 0x02, 0x01, 0x04, 0x03, 0x0B);

#define doubleRoundFunction(i, ymm0, ymm1, ymm2, ymm3 ) {\
    ymm0 = _mm256_shuffle_epi8( ymmSbox, ymm0 );\
    ymm2 = _mm256_shuffle_epi8( ymmSbox, ymm2 );\
    ymm0 = _mm256_shuffle_epi8( ymm0, ShuffleDoubleBlock0 );\
    ymm2 = _mm256_shuffle_epi8( ymm2, ShuffleDoubleBlock2 );\
    __m256i tmp02 = _mm256_xor_si256(ymm0, ymm2);\
    ymm1 = _mm256_shuffle_epi8( ymmSbox, ymm1 );\
    ymm3 = _mm256_shuffle_epi8( ymmSbox, ymm3 );\
    ymm1 = _mm256_shuffle_epi8( ymm1, ShuffleDoubleBlock1 );\
    ymm3 = _mm256_shuffle_epi8( ymm3, ShuffleDoubleBlock3 );\
    __m256i tmp13 = _mm256_xor_si256(ymm1, ymm3);\
    ymm0 = _mm256_xor_si256(tmp13, ymm0);\
    ymm1 = _mm256_xor_si256(tmp02, ymm1);\
    ymm2 = _mm256_xor_si256(tmp13, ymm2);\
    ymm3 = _mm256_xor_si256(tmp02, ymm3);\
    tmp0 = _mm256_slli_si256( ymm0, 8 );\
    tmp1 = _mm256_slli_si256( ymm1, 8 );\
    tmp2 = _mm256_slli_si256( ymm2, 8 );\
    tmp3 = _mm256_slli_si256( ymm3, 8 );\
    ymm0 = _mm256_xor_si256( tmp0, ymm0 );\
    ymm1 = _mm256_xor_si256( tmp1, ymm1 );\
    ymm2 = _mm256_xor_si256( tmp2, ymm2 );\
    ymm3 = _mm256_xor_si256( tmp3, ymm3 );\
    ymm0 = _mm256_xor_si256( ymm0, RoundConstDoubleBlock[i][0] );\
    ymm1 = _mm256_xor_si256( ymm1, RoundConstDoubleBlock[i][1] );\
    ymm2 = _mm256_xor_si256( ymm2, RoundConstDoubleBlock[i][2] );\
    ymm3 = _mm256_xor_si256( ymm3, RoundConstDoubleBlock[i][3] );\
    }


  doubleRoundFunction(2, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(13, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(12, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(15, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(14, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(9, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(8, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(11, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(10, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(5, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(4, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(7, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(6, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(1, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(0, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(3, ymm0, ymm1, ymm2, ymm3);
  doubleRoundFunction(2, ymm0, ymm1, ymm2, ymm3);

  ymm0 = _mm256_shuffle_epi8(ymmSbox, ymm0);
  ymm1 = _mm256_shuffle_epi8(ymmSbox, ymm1);
  ymm[0] = _mm256_shuffle_epi8(ymm0, ShuffleDoubleBlock0);
  ymm[1] = _mm256_shuffle_epi8(ymm1, ShuffleDoubleBlock1);

  ymm2 = _mm256_shuffle_epi8(ymmSbox, ymm2);
  ymm3 = _mm256_shuffle_epi8(ymmSbox, ymm3);
  ymm[2] = _mm256_shuffle_epi8(ymm2, ShuffleDoubleBlock2);
  ymm[3] = _mm256_shuffle_epi8(ymm3, ShuffleDoubleBlock3);
  /*==== END Minalpher-P ====*/
}


/*==== Minalpher Core (double block) ====*/
/********************************************************************
 *  Name:       format_return_double_block                          *
 *  Function:   format change from 4 ymm to 2 ymm                   *
 *  Return:     Void                                                *
 ********************************************************************/
void format_return_double_block(
  const __m256i             ymm[4],  /* I    ymm                     */
  __m256i                   &DATA1,  /* O    HI                      */
  __m256i                   &DATA2   /* O    LOW                     */
  )
{
  /*==== FORMAT CHANGE ====*/
  //Constant Load
  const __m256i ymmMaskFF = _mm256_set_epi16(0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF);

  __m256i DATA_A, DATA_B;
  __m256i tmp0, tmp1, tmp2, tmp3;

  tmp0 = _mm256_srli_epi16(ymm[0], 4);
  tmp0 = _mm256_xor_si256(tmp0, ymm[0]);
  tmp0 = _mm256_and_si256(ymmMaskFF, tmp0);
  tmp1 = _mm256_srli_epi16(ymm[1], 4);
  tmp1 = _mm256_xor_si256(tmp1, ymm[1]);
  tmp1 = _mm256_and_si256(ymmMaskFF, tmp1);
  DATA_A = _mm256_packus_epi16(tmp0, tmp1);

  tmp2 = _mm256_srli_epi16(ymm[2], 4);
  tmp2 = _mm256_xor_si256(tmp2, ymm[2]);
  tmp2 = _mm256_and_si256(ymmMaskFF, tmp2);
  tmp3 = _mm256_srli_epi16(ymm[3], 4);
  tmp3 = _mm256_xor_si256(tmp3, ymm[3]);
  tmp3 = _mm256_and_si256(ymmMaskFF, tmp3);
  DATA_B = _mm256_packus_epi16(tmp2, tmp3);

  DATA1 = _mm256_permute2x128_si256(DATA_B, DATA_A, 0x02);
  DATA2 = _mm256_permute2x128_si256(DATA_B, DATA_A, 0x13);
  /*==== END FORMAT CHANGE ====*/
}

/*==== Minalpher Core (double block) ====*/
/********************************************************************
 *  Name:       minalpher_core_double_block                         *
 *  Function:   Minalpher-P function for two blocks                 *
 *  Return:     Void                                                *
 ********************************************************************/
void minalpher_core_double_block(
  __m256i           &DATA1,     /* I    HI                      */
  __m256i           &DATA2      /* I    LOW                     */
  ){
  __m256i ymm[4];
  minalpher_core_double_block(DATA1, DATA2, ymm);
  format_return_double_block(ymm, DATA1, DATA2);
}
void minalpher_core_double_block_inverse(
  __m256i           &DATA1,     /* I    HI                      */
  __m256i           &DATA2      /* I    LOW                     */
  ){
  __m256i ymm[4];
  minalpher_core_double_block_inverse(DATA1, DATA2, ymm);
  format_return_double_block(ymm, DATA1, DATA2);
}










/*==== Minalpher Core (quadruple block) ====*/
/********************************************************************
 *  Name:       minalpher_core_quadruple_block                      *
 *  Function:   Output data without format returning                *
 *  Return:     Void                                                *
 ********************************************************************/
const __m256i RoundConstQuadrupleBlock[16][4] = {
  {_mm256_set_epi32(0x00000000, 0x02030001, 0x00000000, 0x02030001, 0x00000000, 0x02030001, 0x00000000, 0x02030001),
   _mm256_set_epi32(0x00000000, 0x03020100, 0x00000000, 0x03020100, 0x00000000, 0x03020100, 0x00000000, 0x03020100),
   _mm256_set_epi32(0x00000000, 0x00010203, 0x00000000, 0x00010203, 0x00000000, 0x00010203, 0x00000000, 0x00010203),
   _mm256_set_epi32(0x00000000, 0x01000302, 0x00000000, 0x01000302, 0x00000000, 0x01000302, 0x00000000, 0x01000302)},
  {_mm256_set_epi32(0x00000000, 0x03020100, 0x00000000, 0x03020100, 0x00000000, 0x03020100, 0x00000000, 0x03020100),
   _mm256_set_epi32(0x00000000, 0x02030001, 0x00000000, 0x02030001, 0x00000000, 0x02030001, 0x00000000, 0x02030001),
   _mm256_set_epi32(0x00000000, 0x01000302, 0x00000000, 0x01000302, 0x00000000, 0x01000302, 0x00000000, 0x01000302),
   _mm256_set_epi32(0x00000000, 0x00010203, 0x00000000, 0x00010203, 0x00000000, 0x00010203, 0x00000000, 0x00010203)},
  {_mm256_set_epi32(0x00000000, 0x00010203, 0x00000000, 0x00010203, 0x00000000, 0x00010203, 0x00000000, 0x00010203),
   _mm256_set_epi32(0x00000000, 0x01000302, 0x00000000, 0x01000302, 0x00000000, 0x01000302, 0x00000000, 0x01000302),
   _mm256_set_epi32(0x00000000, 0x02030001, 0x00000000, 0x02030001, 0x00000000, 0x02030001, 0x00000000, 0x02030001),
   _mm256_set_epi32(0x00000000, 0x03020100, 0x00000000, 0x03020100, 0x00000000, 0x03020100, 0x00000000, 0x03020100)},
  {_mm256_set_epi32(0x00000000, 0x01000302, 0x00000000, 0x01000302, 0x00000000, 0x01000302, 0x00000000, 0x01000302),
   _mm256_set_epi32(0x00000000, 0x00010203, 0x00000000, 0x00010203, 0x00000000, 0x00010203, 0x00000000, 0x00010203),
   _mm256_set_epi32(0x00000000, 0x03020100, 0x00000000, 0x03020100, 0x00000000, 0x03020100, 0x00000000, 0x03020100),
   _mm256_set_epi32(0x00000000, 0x02030001, 0x00000000, 0x02030001, 0x00000000, 0x02030001, 0x00000000, 0x02030001)},
  {_mm256_set_epi32(0x00000000, 0x06070405, 0x00000000, 0x06070405, 0x00000000, 0x06070405, 0x00000000, 0x06070405),
   _mm256_set_epi32(0x00000000, 0x07060504, 0x00000000, 0x07060504, 0x00000000, 0x07060504, 0x00000000, 0x07060504),
   _mm256_set_epi32(0x00000000, 0x04050607, 0x00000000, 0x04050607, 0x00000000, 0x04050607, 0x00000000, 0x04050607),
   _mm256_set_epi32(0x00000000, 0x05040706, 0x00000000, 0x05040706, 0x00000000, 0x05040706, 0x00000000, 0x05040706)},
  {_mm256_set_epi32(0x00000000, 0x07060504, 0x00000000, 0x07060504, 0x00000000, 0x07060504, 0x00000000, 0x07060504),
   _mm256_set_epi32(0x00000000, 0x06070405, 0x00000000, 0x06070405, 0x00000000, 0x06070405, 0x00000000, 0x06070405),
   _mm256_set_epi32(0x00000000, 0x05040706, 0x00000000, 0x05040706, 0x00000000, 0x05040706, 0x00000000, 0x05040706),
   _mm256_set_epi32(0x00000000, 0x04050607, 0x00000000, 0x04050607, 0x00000000, 0x04050607, 0x00000000, 0x04050607)},
  {_mm256_set_epi32(0x00000000, 0x04050607, 0x00000000, 0x04050607, 0x00000000, 0x04050607, 0x00000000, 0x04050607),
   _mm256_set_epi32(0x00000000, 0x05040706, 0x00000000, 0x05040706, 0x00000000, 0x05040706, 0x00000000, 0x05040706),
   _mm256_set_epi32(0x00000000, 0x06070405, 0x00000000, 0x06070405, 0x00000000, 0x06070405, 0x00000000, 0x06070405),
   _mm256_set_epi32(0x00000000, 0x07060504, 0x00000000, 0x07060504, 0x00000000, 0x07060504, 0x00000000, 0x07060504)},
  {_mm256_set_epi32(0x00000000, 0x05040706, 0x00000000, 0x05040706, 0x00000000, 0x05040706, 0x00000000, 0x05040706),
   _mm256_set_epi32(0x00000000, 0x04050607, 0x00000000, 0x04050607, 0x00000000, 0x04050607, 0x00000000, 0x04050607),
   _mm256_set_epi32(0x00000000, 0x07060504, 0x00000000, 0x07060504, 0x00000000, 0x07060504, 0x00000000, 0x07060504),
   _mm256_set_epi32(0x00000000, 0x06070405, 0x00000000, 0x06070405, 0x00000000, 0x06070405, 0x00000000, 0x06070405)},
  {_mm256_set_epi32(0x00000000, 0x0A0B0809, 0x00000000, 0x0A0B0809, 0x00000000, 0x0A0B0809, 0x00000000, 0x0A0B0809),
   _mm256_set_epi32(0x00000000, 0x0B0A0908, 0x00000000, 0x0B0A0908, 0x00000000, 0x0B0A0908, 0x00000000, 0x0B0A0908),
   _mm256_set_epi32(0x00000000, 0x08090A0B, 0x00000000, 0x08090A0B, 0x00000000, 0x08090A0B, 0x00000000, 0x08090A0B),
   _mm256_set_epi32(0x00000000, 0x09080B0A, 0x00000000, 0x09080B0A, 0x00000000, 0x09080B0A, 0x00000000, 0x09080B0A)},
  {_mm256_set_epi32(0x00000000, 0x0B0A0908, 0x00000000, 0x0B0A0908, 0x00000000, 0x0B0A0908, 0x00000000, 0x0B0A0908),
   _mm256_set_epi32(0x00000000, 0x0A0B0809, 0x00000000, 0x0A0B0809, 0x00000000, 0x0A0B0809, 0x00000000, 0x0A0B0809),
   _mm256_set_epi32(0x00000000, 0x09080B0A, 0x00000000, 0x09080B0A, 0x00000000, 0x09080B0A, 0x00000000, 0x09080B0A),
   _mm256_set_epi32(0x00000000, 0x08090A0B, 0x00000000, 0x08090A0B, 0x00000000, 0x08090A0B, 0x00000000, 0x08090A0B)},
  {_mm256_set_epi32(0x00000000, 0x08090A0B, 0x00000000, 0x08090A0B, 0x00000000, 0x08090A0B, 0x00000000, 0x08090A0B),
   _mm256_set_epi32(0x00000000, 0x09080B0A, 0x00000000, 0x09080B0A, 0x00000000, 0x09080B0A, 0x00000000, 0x09080B0A),
   _mm256_set_epi32(0x00000000, 0x0A0B0809, 0x00000000, 0x0A0B0809, 0x00000000, 0x0A0B0809, 0x00000000, 0x0A0B0809),
   _mm256_set_epi32(0x00000000, 0x0B0A0908, 0x00000000, 0x0B0A0908, 0x00000000, 0x0B0A0908, 0x00000000, 0x0B0A0908)},
  {_mm256_set_epi32(0x00000000, 0x09080B0A, 0x00000000, 0x09080B0A, 0x00000000, 0x09080B0A, 0x00000000, 0x09080B0A),
   _mm256_set_epi32(0x00000000, 0x08090A0B, 0x00000000, 0x08090A0B, 0x00000000, 0x08090A0B, 0x00000000, 0x08090A0B),
   _mm256_set_epi32(0x00000000, 0x0B0A0908, 0x00000000, 0x0B0A0908, 0x00000000, 0x0B0A0908, 0x00000000, 0x0B0A0908),
   _mm256_set_epi32(0x00000000, 0x0A0B0809, 0x00000000, 0x0A0B0809, 0x00000000, 0x0A0B0809, 0x00000000, 0x0A0B0809)},
  {_mm256_set_epi32(0x00000000, 0x0E0F0C0D, 0x00000000, 0x0E0F0C0D, 0x00000000, 0x0E0F0C0D, 0x00000000, 0x0E0F0C0D),
   _mm256_set_epi32(0x00000000, 0x0F0E0D0C, 0x00000000, 0x0F0E0D0C, 0x00000000, 0x0F0E0D0C, 0x00000000, 0x0F0E0D0C),
   _mm256_set_epi32(0x00000000, 0x0C0D0E0F, 0x00000000, 0x0C0D0E0F, 0x00000000, 0x0C0D0E0F, 0x00000000, 0x0C0D0E0F),
   _mm256_set_epi32(0x00000000, 0x0D0C0F0E, 0x00000000, 0x0D0C0F0E, 0x00000000, 0x0D0C0F0E, 0x00000000, 0x0D0C0F0E)},
  {_mm256_set_epi32(0x00000000, 0x0F0E0D0C, 0x00000000, 0x0F0E0D0C, 0x00000000, 0x0F0E0D0C, 0x00000000, 0x0F0E0D0C),
   _mm256_set_epi32(0x00000000, 0x0E0F0C0D, 0x00000000, 0x0E0F0C0D, 0x00000000, 0x0E0F0C0D, 0x00000000, 0x0E0F0C0D),
   _mm256_set_epi32(0x00000000, 0x0D0C0F0E, 0x00000000, 0x0D0C0F0E, 0x00000000, 0x0D0C0F0E, 0x00000000, 0x0D0C0F0E),
   _mm256_set_epi32(0x00000000, 0x0C0D0E0F, 0x00000000, 0x0C0D0E0F, 0x00000000, 0x0C0D0E0F, 0x00000000, 0x0C0D0E0F)},
  {_mm256_set_epi32(0x00000000, 0x0C0D0E0F, 0x00000000, 0x0C0D0E0F, 0x00000000, 0x0C0D0E0F, 0x00000000, 0x0C0D0E0F),
   _mm256_set_epi32(0x00000000, 0x0D0C0F0E, 0x00000000, 0x0D0C0F0E, 0x00000000, 0x0D0C0F0E, 0x00000000, 0x0D0C0F0E),
   _mm256_set_epi32(0x00000000, 0x0E0F0C0D, 0x00000000, 0x0E0F0C0D, 0x00000000, 0x0E0F0C0D, 0x00000000, 0x0E0F0C0D),
   _mm256_set_epi32(0x00000000, 0x0F0E0D0C, 0x00000000, 0x0F0E0D0C, 0x00000000, 0x0F0E0D0C, 0x00000000, 0x0F0E0D0C)},
  {_mm256_set_epi32(0x00000000, 0x0D0C0F0E, 0x00000000, 0x0D0C0F0E, 0x00000000, 0x0D0C0F0E, 0x00000000, 0x0D0C0F0E),
   _mm256_set_epi32(0x00000000, 0x0C0D0E0F, 0x00000000, 0x0C0D0E0F, 0x00000000, 0x0C0D0E0F, 0x00000000, 0x0C0D0E0F),
   _mm256_set_epi32(0x00000000, 0x0F0E0D0C, 0x00000000, 0x0F0E0D0C, 0x00000000, 0x0F0E0D0C, 0x00000000, 0x0F0E0D0C),
   _mm256_set_epi32(0x00000000, 0x0E0F0C0D, 0x00000000, 0x0E0F0C0D, 0x00000000, 0x0E0F0C0D, 0x00000000, 0x0E0F0C0D)}
};
const __m256i ymmSbox = _mm256_set_epi8(0x7, 0xa, 0x9, 0x6, 0x0, 0xe, 0xd, 0x5, 0xf, 0xc, 0x8, 0x2, 0x1, 0x4, 0x3, 0xb, 0x7, 0xa, 0x9, 0x6, 0x0, 0xe, 0xd, 0x5, 0xf, 0xc, 0x8, 0x2, 0x1, 0x4, 0x3, 0xb);
const __m256i ShuffleQuadrupleBlock0 = _mm256_set_epi8(0xd, 0xc, 0xb, 0xa, 0x8, 0x9, 0xf, 0xe, 0x5, 0x4, 0x3, 0x2, 0x0, 0x1, 0x7, 0x6, 0xd, 0xc, 0xb, 0xa, 0x8, 0x9, 0xf, 0xe, 0x5, 0x4, 0x3, 0x2, 0x0, 0x1, 0x7, 0x6);
const __m256i ShuffleQuadrupleBlock1 = _mm256_set_epi8(0xb, 0xa, 0xe, 0xf, 0x9, 0x8, 0xd, 0xc, 0x3, 0x2, 0x6, 0x7, 0x1, 0x0, 0x5, 0x4, 0xb, 0xa, 0xe, 0xf, 0x9, 0x8, 0xd, 0xc, 0x3, 0x2, 0x6, 0x7, 0x1, 0x0, 0x5, 0x4);
const __m256i ShuffleQuadrupleBlock2 = _mm256_set_epi8(0x9, 0x8, 0xf, 0xe, 0xd, 0xc, 0xa, 0xb, 0x1, 0x0, 0x7, 0x6, 0x5, 0x4, 0x2, 0x3, 0x9, 0x8, 0xf, 0xe, 0xd, 0xc, 0xa, 0xb, 0x1, 0x0, 0x7, 0x6, 0x5, 0x4, 0x2, 0x3);
const __m256i ShuffleQuadrupleBlock3 = _mm256_set_epi8(0xc, 0xd, 0x9, 0x8, 0xf, 0xe, 0xb, 0xa, 0x4, 0x5, 0x1, 0x0, 0x7, 0x6, 0x3, 0x2, 0xc, 0xd, 0x9, 0x8, 0xf, 0xe, 0xb, 0xa, 0x4, 0x5, 0x1, 0x0, 0x7, 0x6, 0x3, 0x2);
void minalpher_core_quadruple_block(
  const __m256i     &DATA1,     /* I                            */
  const __m256i     &DATA2,     /* I                            */
  const __m256i     &DATA3,     /* I                            */
  const __m256i     &DATA4,     /* I                            */
  __m256i           ymmA_[4],   /* O                            */
  __m256i           ymmB_[4]    /* O                            */
  ){

  /*==== FORMAT CHANGE ====*/
  __m256i tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7;
  __m256i ymmA[4], ymmB[4];

  //Constant Load
  const __m256i ymmMask = _mm256_set_epi32(0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F);

  //UNPACK
  tmp0 = _mm256_unpacklo_epi32(DATA1, DATA2);
  tmp1 = _mm256_unpackhi_epi32(DATA1, DATA2);
  tmp2 = _mm256_unpacklo_epi32(DATA3, DATA4);
  tmp3 = _mm256_unpackhi_epi32(DATA3, DATA4);

  //PERM
  __m256i DATA_A = _mm256_permute2x128_si256(tmp0, tmp2, 0x20);
  __m256i DATA_B = _mm256_permute2x128_si256(tmp1, tmp3, 0x20);
  __m256i DATA_C = _mm256_permute2x128_si256(tmp0, tmp2, 0x31);
  __m256i DATA_D = _mm256_permute2x128_si256(tmp1, tmp3, 0x31);

  //AND
  tmp0 = _mm256_and_si256(ymmMask, DATA_A);
  tmp1 = _mm256_andnot_si256(ymmMask, DATA_A);
  tmp2 = _mm256_and_si256(ymmMask, DATA_B);
  tmp3 = _mm256_andnot_si256(ymmMask, DATA_B);
  tmp4 = _mm256_and_si256(ymmMask, DATA_C);
  tmp5 = _mm256_andnot_si256(ymmMask, DATA_C);
  tmp6 = _mm256_and_si256(ymmMask, DATA_D);
  tmp7 = _mm256_andnot_si256(ymmMask, DATA_D);

  //SHIFT
  tmp1 = _mm256_srli_epi16(tmp1, 4);
  tmp3 = _mm256_srli_epi16(tmp3, 4);
  tmp5 = _mm256_srli_epi16(tmp5, 4);
  tmp7 = _mm256_srli_epi16(tmp7, 4);

  //UNPACK
  ymmA[0] = _mm256_unpacklo_epi8(tmp0, tmp1);
  ymmA[1] = _mm256_unpacklo_epi8(tmp2, tmp3);
  ymmA[2] = _mm256_unpacklo_epi8(tmp4, tmp5);
  ymmA[3] = _mm256_unpacklo_epi8(tmp6, tmp7);
  ymmB[0] = _mm256_unpackhi_epi8(tmp0, tmp1);
  ymmB[1] = _mm256_unpackhi_epi8(tmp2, tmp3);
  ymmB[2] = _mm256_unpackhi_epi8(tmp4, tmp5);
  ymmB[3] = _mm256_unpackhi_epi8(tmp6, tmp7);
  /*==== END FORMAT CHANGE ====*/
  
  #define quadrupleRoundFunction(i, ymmA0, ymmA1, ymmA2, ymmA3, ymmB0, ymmB1, ymmB2, ymmB3) {\
    ymmA0 = _mm256_shuffle_epi8( ymmSbox, ymmA0 );\
    ymmA2 = _mm256_shuffle_epi8( ymmSbox, ymmA2 );\
    ymmA0 = _mm256_shuffle_epi8( ymmA0, ShuffleQuadrupleBlock0 );\
    ymmA2 = _mm256_shuffle_epi8( ymmA2, ShuffleQuadrupleBlock2 );\
    ymmA1 = _mm256_shuffle_epi8( ymmSbox, ymmA1 );\
    ymmA3 = _mm256_shuffle_epi8( ymmSbox, ymmA3 );\
    __m256i ymmA02 = _mm256_xor_si256(ymmA0, ymmA2);\
    ymmA1 = _mm256_shuffle_epi8( ymmA1, ShuffleQuadrupleBlock1 );\
    ymmA3 = _mm256_shuffle_epi8( ymmA3, ShuffleQuadrupleBlock3 );\
    __m256i ymmA13 = _mm256_xor_si256(ymmA1, ymmA3);\
    ymmA1 = _mm256_xor_si256(ymmA02, ymmA1);\
    ymmA3 = _mm256_xor_si256(ymmA02, ymmA3);\
    ymmA0 = _mm256_xor_si256(ymmA13, ymmA0);\
    ymmA2 = _mm256_xor_si256(ymmA13, ymmA2);\
    ymmA1 = _mm256_xor_si256( ymmA1, RoundConstQuadrupleBlock[i][1] );\
    ymmB0 = _mm256_shuffle_epi8( ymmSbox, ymmB0 );\
    ymmB2 = _mm256_shuffle_epi8( ymmSbox, ymmB2 );\
    ymmA3 = _mm256_xor_si256( ymmA3, RoundConstQuadrupleBlock[i][3] );\
    ymmB0 = _mm256_shuffle_epi8( ymmB0, ShuffleQuadrupleBlock2 );\
    ymmB2 = _mm256_shuffle_epi8( ymmB2, ShuffleQuadrupleBlock0 );\
    ymmA0 = _mm256_xor_si256( ymmA0, RoundConstQuadrupleBlock[i][0] );\
    ymmB1 = _mm256_shuffle_epi8( ymmSbox, ymmB1 );\
    ymmB3 = _mm256_shuffle_epi8( ymmSbox, ymmB3 );\
    ymmA2 = _mm256_xor_si256( ymmA2, RoundConstQuadrupleBlock[i][2] );\
    ymmB1 = _mm256_shuffle_epi8( ymmB1, ShuffleQuadrupleBlock3 );\
    ymmB3 = _mm256_shuffle_epi8( ymmB3, ShuffleQuadrupleBlock1 );\
    __m256i ymmB02 = _mm256_xor_si256(ymmB0, ymmB2);\
    __m256i ymmB13 = _mm256_xor_si256(ymmB1, ymmB3);\
    ymmB1 = _mm256_xor_si256(ymmB02, ymmB1);\
    ymmB3 = _mm256_xor_si256(ymmB02, ymmB3);\
    ymmB0 = _mm256_xor_si256(ymmB13, ymmB0);\
    ymmB2 = _mm256_xor_si256(ymmB13, ymmB2);\
    ymmA1 = _mm256_xor_si256(ymmB1, ymmA1);\
    ymmA3 = _mm256_xor_si256(ymmB3, ymmA3);\
    ymmA0 = _mm256_xor_si256(ymmB0, ymmA0);\
    ymmA2 = _mm256_xor_si256(ymmB2, ymmA2);\
    }


  quadrupleRoundFunction( 0, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction( 1, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction( 2, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction( 3, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction( 4, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction( 5, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction( 6, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction( 7, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction( 8, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction( 9, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction(10, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction(11, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction(12, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction(13, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction(14, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction(15, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction( 0, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);

  __m256i tmpA0 = _mm256_shuffle_epi8(ymmSbox, ymmA[0]);
  __m256i tmpA1 = _mm256_shuffle_epi8(ymmSbox, ymmA[1]);
  __m256i tmpA2 = _mm256_shuffle_epi8(ymmSbox, ymmA[2]);
  __m256i tmpA3 = _mm256_shuffle_epi8(ymmSbox, ymmA[3]);

  __m256i tmpB0 = _mm256_shuffle_epi8(ymmSbox, ymmB[0]);
  __m256i tmpB1 = _mm256_shuffle_epi8(ymmSbox, ymmB[1]);
  __m256i tmpB2 = _mm256_shuffle_epi8(ymmSbox, ymmB[2]);
  __m256i tmpB3 = _mm256_shuffle_epi8(ymmSbox, ymmB[3]);

  ymmA_[0] = _mm256_shuffle_epi8(tmpA0, ShuffleQuadrupleBlock2); 
  ymmA_[1] = _mm256_shuffle_epi8(tmpA1, ShuffleQuadrupleBlock3);
  ymmA_[2] = _mm256_shuffle_epi8(tmpA2, ShuffleQuadrupleBlock0);
  ymmA_[3] = _mm256_shuffle_epi8(tmpA3, ShuffleQuadrupleBlock1);

  ymmB_[0] = _mm256_shuffle_epi8(tmpB0, ShuffleQuadrupleBlock0);
  ymmB_[1] = _mm256_shuffle_epi8(tmpB1, ShuffleQuadrupleBlock1);
  ymmB_[2] = _mm256_shuffle_epi8(tmpB2, ShuffleQuadrupleBlock2);
  ymmB_[3] = _mm256_shuffle_epi8(tmpB3, ShuffleQuadrupleBlock3);
}
void minalpher_core_quadruple_block_inverse(
  const __m256i     &DATA1,     /* I                            */
  const __m256i     &DATA2,     /* I                            */
  const __m256i     &DATA3,     /* I                            */
  const __m256i     &DATA4,     /* I                            */
  __m256i           ymmA_[4],   /* O                            */
  __m256i           ymmB_[4]    /* O                            */
  ){

  /*==== FORMAT CHANGE ====*/
  __m256i tmp0, tmp1, tmp2, tmp3, tmp4, tmp5, tmp6, tmp7;
  __m256i ymmA[4], ymmB[4];

  //Constant Load
  const __m256i ymmMask = _mm256_set_epi32(0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F);

  //UNPACK
  tmp0 = _mm256_unpacklo_epi32(DATA1, DATA2);
  tmp1 = _mm256_unpackhi_epi32(DATA1, DATA2);
  tmp2 = _mm256_unpacklo_epi32(DATA3, DATA4);
  tmp3 = _mm256_unpackhi_epi32(DATA3, DATA4);

  //PERM
  __m256i DATA_A = _mm256_permute2x128_si256(tmp0, tmp2, 0x20);
  __m256i DATA_B = _mm256_permute2x128_si256(tmp1, tmp3, 0x20);
  __m256i DATA_C = _mm256_permute2x128_si256(tmp0, tmp2, 0x31);
  __m256i DATA_D = _mm256_permute2x128_si256(tmp1, tmp3, 0x31);

  //AND
  tmp0 = _mm256_and_si256(ymmMask, DATA_A);
  tmp1 = _mm256_andnot_si256(ymmMask, DATA_A);
  tmp2 = _mm256_and_si256(ymmMask, DATA_B);
  tmp3 = _mm256_andnot_si256(ymmMask, DATA_B);
  tmp4 = _mm256_and_si256(ymmMask, DATA_C);
  tmp5 = _mm256_andnot_si256(ymmMask, DATA_C);
  tmp6 = _mm256_and_si256(ymmMask, DATA_D);
  tmp7 = _mm256_andnot_si256(ymmMask, DATA_D);

  //SHIFT
  tmp1 = _mm256_srli_epi16(tmp1, 4);
  tmp3 = _mm256_srli_epi16(tmp3, 4);
  tmp5 = _mm256_srli_epi16(tmp5, 4);
  tmp7 = _mm256_srli_epi16(tmp7, 4);

  //UNPACK
  ymmA[0] = _mm256_unpacklo_epi8(tmp0, tmp1);
  ymmA[1] = _mm256_unpacklo_epi8(tmp2, tmp3);
  ymmA[2] = _mm256_unpacklo_epi8(tmp4, tmp5);
  ymmA[3] = _mm256_unpacklo_epi8(tmp6, tmp7);
  ymmB[0] = _mm256_unpackhi_epi8(tmp0, tmp1);
  ymmB[1] = _mm256_unpackhi_epi8(tmp2, tmp3);
  ymmB[2] = _mm256_unpackhi_epi8(tmp4, tmp5);
  ymmB[3] = _mm256_unpackhi_epi8(tmp6, tmp7);
  /*==== END FORMAT CHANGE ====*/

#define quadrupleRoundFunction(i, ymmA0, ymmA1, ymmA2, ymmA3, ymmB0, ymmB1, ymmB2, ymmB3) {\
    ymmA0 = _mm256_shuffle_epi8( ymmSbox, ymmA0 );\
    ymmA2 = _mm256_shuffle_epi8( ymmSbox, ymmA2 );\
    ymmA0 = _mm256_shuffle_epi8( ymmA0, ShuffleQuadrupleBlock0 );\
    ymmA2 = _mm256_shuffle_epi8( ymmA2, ShuffleQuadrupleBlock2 );\
    ymmA1 = _mm256_shuffle_epi8( ymmSbox, ymmA1 );\
    ymmA3 = _mm256_shuffle_epi8( ymmSbox, ymmA3 );\
    __m256i ymmA02 = _mm256_xor_si256(ymmA0, ymmA2);\
    ymmA1 = _mm256_shuffle_epi8( ymmA1, ShuffleQuadrupleBlock1 );\
    ymmA3 = _mm256_shuffle_epi8( ymmA3, ShuffleQuadrupleBlock3 );\
    __m256i ymmA13 = _mm256_xor_si256(ymmA1, ymmA3);\
    ymmA1 = _mm256_xor_si256(ymmA02, ymmA1);\
    ymmA3 = _mm256_xor_si256(ymmA02, ymmA3);\
    ymmA0 = _mm256_xor_si256(ymmA13, ymmA0);\
    ymmA2 = _mm256_xor_si256(ymmA13, ymmA2);\
    ymmA1 = _mm256_xor_si256( ymmA1, RoundConstQuadrupleBlock[i][1] );\
    ymmB0 = _mm256_shuffle_epi8( ymmSbox, ymmB0 );\
    ymmB2 = _mm256_shuffle_epi8( ymmSbox, ymmB2 );\
    ymmA3 = _mm256_xor_si256( ymmA3, RoundConstQuadrupleBlock[i][3] );\
    ymmB0 = _mm256_shuffle_epi8( ymmB0, ShuffleQuadrupleBlock2 );\
    ymmB2 = _mm256_shuffle_epi8( ymmB2, ShuffleQuadrupleBlock0 );\
    ymmA0 = _mm256_xor_si256( ymmA0, RoundConstQuadrupleBlock[i][0] );\
    ymmB1 = _mm256_shuffle_epi8( ymmSbox, ymmB1 );\
    ymmB3 = _mm256_shuffle_epi8( ymmSbox, ymmB3 );\
    ymmA2 = _mm256_xor_si256( ymmA2, RoundConstQuadrupleBlock[i][2] );\
    ymmB1 = _mm256_shuffle_epi8( ymmB1, ShuffleQuadrupleBlock3 );\
    ymmB3 = _mm256_shuffle_epi8( ymmB3, ShuffleQuadrupleBlock1 );\
    __m256i ymmB02 = _mm256_xor_si256(ymmB0, ymmB2);\
    __m256i ymmB13 = _mm256_xor_si256(ymmB1, ymmB3);\
    ymmB1 = _mm256_xor_si256(ymmB02, ymmB1);\
    ymmB3 = _mm256_xor_si256(ymmB02, ymmB3);\
    ymmB0 = _mm256_xor_si256(ymmB13, ymmB0);\
    ymmB2 = _mm256_xor_si256(ymmB13, ymmB2);\
    ymmA1 = _mm256_xor_si256(ymmB1, ymmA1);\
    ymmA3 = _mm256_xor_si256(ymmB3, ymmA3);\
    ymmA0 = _mm256_xor_si256(ymmB0, ymmA0);\
    ymmA2 = _mm256_xor_si256(ymmB2, ymmA2);\
      }



  quadrupleRoundFunction(2, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction(13, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction(12, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction(15, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction(14, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction(9, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction(8, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction(11, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction(10, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction(5, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction(4, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction(7, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction(6, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction(1, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction(0, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);
  quadrupleRoundFunction(3, ymmB[0], ymmB[1], ymmB[2], ymmB[3], ymmA[0], ymmA[1], ymmA[2], ymmA[3]);
  quadrupleRoundFunction(2, ymmA[0], ymmA[1], ymmA[2], ymmA[3], ymmB[0], ymmB[1], ymmB[2], ymmB[3]);

  __m256i tmpA0 = _mm256_shuffle_epi8(ymmSbox, ymmA[0]);
  __m256i tmpA1 = _mm256_shuffle_epi8(ymmSbox, ymmA[1]);
  __m256i tmpA2 = _mm256_shuffle_epi8(ymmSbox, ymmA[2]);
  __m256i tmpA3 = _mm256_shuffle_epi8(ymmSbox, ymmA[3]);

  __m256i tmpB0 = _mm256_shuffle_epi8(ymmSbox, ymmB[0]);
  __m256i tmpB1 = _mm256_shuffle_epi8(ymmSbox, ymmB[1]);
  __m256i tmpB2 = _mm256_shuffle_epi8(ymmSbox, ymmB[2]);
  __m256i tmpB3 = _mm256_shuffle_epi8(ymmSbox, ymmB[3]);

  ymmA_[0] = _mm256_shuffle_epi8(tmpA0, ShuffleQuadrupleBlock2);
  ymmA_[1] = _mm256_shuffle_epi8(tmpA1, ShuffleQuadrupleBlock3);
  ymmA_[2] = _mm256_shuffle_epi8(tmpA2, ShuffleQuadrupleBlock0);
  ymmA_[3] = _mm256_shuffle_epi8(tmpA3, ShuffleQuadrupleBlock1);

  ymmB_[0] = _mm256_shuffle_epi8(tmpB0, ShuffleQuadrupleBlock0);
  ymmB_[1] = _mm256_shuffle_epi8(tmpB1, ShuffleQuadrupleBlock1);
  ymmB_[2] = _mm256_shuffle_epi8(tmpB2, ShuffleQuadrupleBlock2);
  ymmB_[3] = _mm256_shuffle_epi8(tmpB3, ShuffleQuadrupleBlock3);
}
/*==== Minalpher Core (quadruple block) ====*/
/********************************************************************
 *  Name:       format_return_quadruple_block                       *
 *  Function:   format change from 8 ymm to 4 ymm                   *
 *  Return:     Void                                                *
 ********************************************************************/
void format_return_quadruple_block(
  const __m256i             ymmA[4], /* I                            */
  const __m256i             ymmB[4], /* I                            */
  __m256i                   &DATA1,  /* O                            */
  __m256i                   &DATA2,  /* O                            */
  __m256i                   &DATA3,  /* O                            */
  __m256i                   &DATA4   /* O                            */
  )
{
  /*==== FORMAT CHANGE ====*/
  //Constant Load
  const __m256i ymmMaskFF = _mm256_set_epi16(0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF, 0x00FF);

  //FORMAT RETRUN
  __m256i tmp0 = _mm256_srli_epi16(ymmA[0], 4);
  __m256i tmp1 = _mm256_srli_epi16(ymmB[0], 4);
  __m256i tmp2 = _mm256_srli_epi16(ymmA[1], 4);
  __m256i tmp3 = _mm256_srli_epi16(ymmB[1], 4);
  __m256i tmp4 = _mm256_srli_epi16(ymmA[2], 4);
  __m256i tmp5 = _mm256_srli_epi16(ymmB[2], 4);
  __m256i tmp6 = _mm256_srli_epi16(ymmA[3], 4);
  __m256i tmp7 = _mm256_srli_epi16(ymmB[3], 4);

  tmp0 = _mm256_xor_si256(tmp0, ymmA[0]);
  tmp1 = _mm256_xor_si256(tmp1, ymmB[0]);
  tmp2 = _mm256_xor_si256(tmp2, ymmA[1]);
  tmp3 = _mm256_xor_si256(tmp3, ymmB[1]);
  tmp4 = _mm256_xor_si256(tmp4, ymmA[2]);
  tmp5 = _mm256_xor_si256(tmp5, ymmB[2]);
  tmp6 = _mm256_xor_si256(tmp6, ymmA[3]);
  tmp7 = _mm256_xor_si256(tmp7, ymmB[3]);

  tmp0 = _mm256_and_si256(ymmMaskFF, tmp0);
  tmp1 = _mm256_and_si256(ymmMaskFF, tmp1);
  tmp2 = _mm256_and_si256(ymmMaskFF, tmp2);
  tmp3 = _mm256_and_si256(ymmMaskFF, tmp3);
  tmp4 = _mm256_and_si256(ymmMaskFF, tmp4);
  tmp5 = _mm256_and_si256(ymmMaskFF, tmp5);
  tmp6 = _mm256_and_si256(ymmMaskFF, tmp6);
  tmp7 = _mm256_and_si256(ymmMaskFF, tmp7);

  //PACK
  __m256i DATA_A = _mm256_packus_epi16(tmp0, tmp1);
  __m256i DATA_B = _mm256_packus_epi16(tmp2, tmp3);
  __m256i DATA_C = _mm256_packus_epi16(tmp4, tmp5);
  __m256i DATA_D = _mm256_packus_epi16(tmp6, tmp7);

  //PERM
  tmp0 = _mm256_permute2x128_si256(DATA_A, DATA_C, 0x20);
  tmp1 = _mm256_permute2x128_si256(DATA_B, DATA_D, 0x20);
  tmp2 = _mm256_permute2x128_si256(DATA_A, DATA_C, 0x31);
  tmp3 = _mm256_permute2x128_si256(DATA_B, DATA_D, 0x31);

  //UNPACK
  DATA_A = _mm256_unpacklo_epi32(tmp0, tmp1);
  DATA_B = _mm256_unpackhi_epi32(tmp0, tmp1);
  DATA_C = _mm256_unpacklo_epi32(tmp2, tmp3);
  DATA_D = _mm256_unpackhi_epi32(tmp2, tmp3);

  DATA1 = _mm256_unpacklo_epi32(DATA_A, DATA_B);
  DATA2 = _mm256_unpackhi_epi32(DATA_A, DATA_B);
  DATA3 = _mm256_unpacklo_epi32(DATA_C, DATA_D);
  DATA4 = _mm256_unpackhi_epi32(DATA_C, DATA_D);
  /*==== END FORMAT CHANGE ====*/
}

/********************************************************************
 *  Name:       minalpher_core_quadruple_block                      *
 *  Function:   Minalpher-P function for four blocks                *
 *  Return:     Void                                                *
 ********************************************************************/
void minalpher_core_quadruple_block(
  __m256i           &DATA1,     /* I    1st data                */
  __m256i           &DATA2,     /* I    2nd data                */
  __m256i           &DATA3      /* I    3rd data                */
  ){
  __m256i DATA4;
  __m256i ymmA[4], ymmB[4];
  minalpher_core_quadruple_block(DATA1, DATA2, DATA3, DATA4, ymmA, ymmB);
  format_return_quadruple_block(ymmA, ymmB, DATA1, DATA2, DATA3, DATA4);
}
void minalpher_core_quadruple_block_inverse(
  __m256i           &DATA1,     /* I    1st data                */
  __m256i           &DATA2,     /* I    2nd data                */
  __m256i           &DATA3      /* I    3rd data                */
  ){
  __m256i DATA4;
  __m256i ymmA[4], ymmB[4];
  minalpher_core_quadruple_block_inverse(DATA1, DATA2, DATA3, DATA4, ymmA, ymmB);
  format_return_quadruple_block(ymmA, ymmB, DATA1, DATA2, DATA3, DATA4);
}
void minalpher_core_quadruple_block(
  __m256i           &DATA1,     /* I    1st data                */
  __m256i           &DATA2,     /* I    2nd data                */
  __m256i           &DATA3,     /* I    3ed data                */
  __m256i           &DATA4      /* I    4th data                */
  ){
  __m256i ymmA[4], ymmB[4];
  minalpher_core_quadruple_block(DATA1, DATA2, DATA3, DATA4, ymmA, ymmB);
  format_return_quadruple_block(ymmA, ymmB, DATA1, DATA2, DATA3, DATA4);
}
void minalpher_core_quadruple_block_inverse(
  __m256i           &DATA1,     /* I    1st data                */
  __m256i           &DATA2,     /* I    2nd data                */
  __m256i           &DATA3,     /* I    4rd data                */
  __m256i           &DATA4      /* I    4th data                */
  ){
  __m256i ymmA[4], ymmB[4];
  minalpher_core_quadruple_block_inverse(DATA1, DATA2, DATA3, DATA4, ymmA, ymmB);
  format_return_quadruple_block(ymmA, ymmB, DATA1, DATA2, DATA3, DATA4);
}
