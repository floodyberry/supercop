/*
  Minalpher v1.1 optimized code (mode part) on AVX2 environment version 1.1.0

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

/*==== Constants ====*/
const MIE_ALIGN(128) unsigned char FB[32]  = {0xA3,0xA3,0xA3,0xA3, 0xA3,0xA3,0xA3,0xA3, 0xA3,0xA3,0xA3,0xA3, 0xA3,0xA3,0xA3,0xA3, 
                                              0xA3,0xA3,0xA3,0xA3, 0xA3,0xA3,0xA3,0xA3, 0xA3,0xA3,0xA3,0xA3, 0xA3,0xA3,0xA3,0xA3};
const MIE_ALIGN(128) unsigned char FBY[32] = {0xF0,0xF0,0xF0,0xF0, 0xF0,0xF0,0xF0,0xF0, 0xF0,0xF0,0xF0,0xF0, 0x0F,0x0F,0xF0,0xF0,
                                              0xF0,0xF0,0xF0,0xF0, 0xF0,0xF0,0xF0,0xF0, 0xF0,0xF0,0xF0,0xF0, 0xF0,0xF0,0xF0,0xF0};


/*==== display function ====*/
static void disp(__m128i HI, __m128i LO){
  MIE_ALIGN(128) unsigned char tmp[32] = {0};
  _mm_store_si128( (__m128i *)(tmp), HI);
  _mm_store_si128( (__m128i *)(tmp+16), LO);
  
  //Output
  printf("O \t");
  for(int i=0; i<8; i++){
    for(int j=0; j<4; j++){
      printf("%2x ", tmp[4*i+j]);
    }
    printf(" | ");
  }
  printf("\n");
}
static void disp(__m256i DATA){
  MIE_ALIGN(128) unsigned char tmp[32] = { 0 };
  _mm256_store_si256((__m256i *)(tmp), DATA);

  //Output
  printf("O \t");
  for (int i = 0; i<8; i++){
    for (int j = 0; j<4; j++){
      printf("%2x ", tmp[4 * i + j]);
    }
    printf(" | ");
  }
  printf("\n");
}


/*==== MinalpherCore.cpp ====*/
void minalpher_core_single_block(__m256i &DATA);
void minalpher_core_single_block_inverse(__m256i &DATA);
void format_return_single_block(const __m256i &ymm0, const __m256i &ymm1, __m256i &DATA);

void minalpher_core_double_block(__m256i &DATA1, __m256i &DATA2);
void minalpher_core_double_block_inverse(__m256i &DATA1, __m256i &DATA2);
void format_return_double_block(const __m256i ymm[4], __m256i &DATA1, __m256i &DATA2);

void minalpher_core_quadruple_block(__m256i &DATA1, __m256i &DATA2, __m256i &DATA3);
void minalpher_core_quadruple_block_inverse(__m256i &DATA1, __m256i &DATA2, __m256i &DATA3);
void minalpher_core_quadruple_block(__m256i &DATA1, __m256i &DATA2, __m256i &DATA3, __m256i &DATA4);
void minalpher_core_quadruple_block_inverse(__m256i &DATA1, __m256i &DATA2, __m256i &DATA3, __m256i &DATA4);
void minalpher_core_quadruple_block(const __m256i &DATA1, const __m256i &DATA2, const __m256i &DATA3, const __m256i &DATA4, __m256i ymmA[4], __m256i  ymmB[4]);
void minalpher_core_quadruple_block_inverse(const __m256i &DATA1, const __m256i &DATA2, const __m256i &DATA3, const __m256i &DATA4, __m256i ymmA[4], __m256i  ymmB[4]);
void format_return_quadruple_block(const __m256i ymmA[4], const __m256i ymmB[4], __m256i &DATA1, __m256i &DATA2, __m256i &DATA3, __m256i &DATA4);



/*==== Minalpher Modes ====*/
/********************************************************************
 *  Name:       tweak_update                                        *
 *  Function:   Upadate function for Minalpher tweak                *
 *  Return:     Void                                                *
 ********************************************************************/
static inline void tweak_update( __m128i& LO, __m128i& HI, __m128i& xHI, int& cnt )
{
  if( (cnt%16) == 0 )
  {
    __m128i xmmFB = _mm_load_si128( (__m128i*)FB );
    __m128i zero = _mm_setzero_si128();

    xHI = _mm_and_si128( _mm_cmpgt_epi8(zero, HI) , xmmFB );
    xHI = _mm_xor_si128( xHI, _mm_add_epi8( HI, HI) );
  }
  cnt++;
  
  __m128i tmp = LO;
  LO  = _mm_alignr_epi8( xHI,  LO, 1);
  xHI = _mm_alignr_epi8(  HI, xHI, 1);
  HI  = _mm_alignr_epi8( tmp,  HI, 1);
  
  __m128i xmmFBY = _mm_load_si128( (__m128i*)FBY );
  LO = _mm_xor_si128( LO, _mm_shuffle_epi8( xHI, xmmFBY ));
}
static inline void tweak_update(__m256i& TWEAK, __m256i& xTWEAK, int& cnt)
{
  if ((cnt % 16) == 0)
  {
    __m256i ymmFB = _mm256_load_si256((__m256i*)FB);
    __m256i zero = _mm256_setzero_si256();

    xTWEAK = _mm256_and_si256(_mm256_cmpgt_epi8(zero, TWEAK), ymmFB);
    xTWEAK = _mm256_xor_si256(xTWEAK, _mm256_add_epi8(TWEAK, TWEAK));
  }
  cnt++;

  __m256i tmp = _mm256_permute2x128_si256(xTWEAK, TWEAK, 0x03);
  xTWEAK = _mm256_alignr_epi8(TWEAK, xTWEAK, 1);
  TWEAK  = _mm256_alignr_epi8(tmp, TWEAK, 1);

  __m256i ymmFBY = _mm256_load_si256((__m256i*)FBY);
  ymmFBY = _mm256_shuffle_epi8(xTWEAK, ymmFBY);
  ymmFBY = _mm256_permute2x128_si256(ymmFBY, ymmFBY, 0x0F);
  TWEAK  = _mm256_xor_si256(TWEAK, ymmFBY);
}
/*==== Minalpher Modes ====*/
/********************************************************************
 *  Name:       create_l                                            *
 *  Function:   Create L from key and nonce                         *
 *  Return:     Void                                                *
 ********************************************************************/
static inline void create_l(__m256i& ymmL, const unsigned char *_K, const unsigned char *_N){
  MIE_ALIGN(128) unsigned char tmp[32] = { 0 };
  memcpy(tmp, _K, 16);
  tmp[16] = 0x40;
  memcpy(tmp + 19, _N, 13);

  ymmL = _mm256_load_si256((const __m256i*)(tmp));
  minalpher_core_single_block(ymmL);
  ymmL = _mm256_xor_si256(ymmL, _mm256_load_si256((const __m256i*)(tmp)));
}
/********************************************************************
 *  Name:       create_lprime                                       *
 *  Function:   Create L' from key                                  *
 *  Return:     Void                                                *
 ********************************************************************/
static inline void create_lprime(__m256i& ymmLp, const unsigned char *_K){
  MIE_ALIGN(128) unsigned char tmp[32] = { 0 };
  memcpy(tmp, _K, 16);
  ymmLp = _mm256_load_si256((const __m256i*)(tmp));
  minalpher_core_single_block(ymmLp);
  ymmLp = _mm256_xor_si256(ymmLp, _mm256_load_si256((const __m256i*)(tmp)));
}






/********************************************************************
 *  Name:       minalpher_mode_encrypt                              *
 *  Function:   Ciphertext Generation Algorithm of AEAD Mode        *
 *              Use single, double, and quadruple implementations   *
 *  Return:     Void                                                *
 ********************************************************************/
void minalpher_mode_encrypt(
  const unsigned char     *_K,    /* I    Secret key                */
  const unsigned char     *_N,    /* I    Nonce                     */
  const unsigned char     *_A,    /* I    Associated data           */
  unsigned long long      _alen,  /* I    Length of Associated data */
  const unsigned char     *_M,    /* I    Message                   */
  unsigned long long      _mlen,  /* I    Length of Message         */
  unsigned char           *C_,    /* O    Ciphertext                */
  unsigned long long      *clen_  /* O    Length of Ciphertext      */
  ){
  /*==== Prepare ====*/
  __m256i ymmTweakSum = _mm256_setzero_si256();
  __m256i ymmTagA[4];
  __m256i ymmTagB[4];
  for (int i = 0; i<4; i++){
    ymmTagA[i] = _mm256_setzero_si256();
    ymmTagB[i] = _mm256_setzero_si256();
  }
  __m256i DATA;
  __m256i DATA1, DATA2, DATA3, DATA4;

  /*==== Process Associated data ====*/
  if (_alen != 0){
    /*==== Create L' ====*/
    int cnt = 0;
    __m256i ymmLp, ymmLp_H;
    create_lprime(ymmLp, _K);

    //Main loop
    int p = 0;
    for (p = 0; p<((long long)_alen - 128); p += 128){

      DATA1 = _mm256_load_si256((const __m256i*)(_A + p));
      DATA2 = _mm256_load_si256((const __m256i*)(_A + p + 32));
      DATA3 = _mm256_load_si256((const __m256i*)(_A + p + 64));
      DATA4 = _mm256_load_si256((const __m256i*)(_A + p + 96));

      __m256i tweak1, tweak2, tweak3, tweak4;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak1 = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak2 = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak3 = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak4 = ymmLp;

      DATA1 = _mm256_xor_si256(DATA1, tweak1);
      DATA2 = _mm256_xor_si256(DATA2, tweak2);
      DATA3 = _mm256_xor_si256(DATA3, tweak3);
      DATA4 = _mm256_xor_si256(DATA4, tweak4);
      minalpher_core_quadruple_block(DATA1, DATA2, DATA3, DATA4);
      DATA1 = _mm256_xor_si256(DATA1, tweak1);
      DATA2 = _mm256_xor_si256(DATA2, tweak2);
      DATA3 = _mm256_xor_si256(DATA3, tweak3);
      DATA4 = _mm256_xor_si256(DATA4, tweak4);

      ymmTweakSum = _mm256_xor_si256(DATA1, ymmTweakSum);
      ymmTweakSum = _mm256_xor_si256(DATA2, ymmTweakSum);
      ymmTweakSum = _mm256_xor_si256(DATA3, ymmTweakSum);
      ymmTweakSum = _mm256_xor_si256(DATA4, ymmTweakSum);
    }

    //For odd block
    if ((p + 96) < _alen){
      DATA1 = _mm256_load_si256((const __m256i*)(_A + p));
      DATA2 = _mm256_load_si256((const __m256i*)(_A + p + 32));
      DATA3 = _mm256_load_si256((const __m256i*)(_A + p + 64));

      __m256i tweak1, tweak2, tweak3;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak1 = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak2 = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak3 = ymmLp;

      DATA1 = _mm256_xor_si256(DATA1, tweak1);
      DATA2 = _mm256_xor_si256(DATA2, tweak2);
      DATA3 = _mm256_xor_si256(DATA3, tweak3);
      minalpher_core_quadruple_block(DATA1, DATA2, DATA3);
      DATA1 = _mm256_xor_si256(DATA1, tweak1);
      DATA2 = _mm256_xor_si256(DATA2, tweak2);
      DATA3 = _mm256_xor_si256(DATA3, tweak3);

      ymmTweakSum = _mm256_xor_si256(DATA1, ymmTweakSum);
      ymmTweakSum = _mm256_xor_si256(DATA2, ymmTweakSum);
      ymmTweakSum = _mm256_xor_si256(DATA3, ymmTweakSum);
      p += 96;
    }else if ((p + 64) < _alen){
      DATA1 = _mm256_load_si256((const __m256i*)(_A + p));
      DATA2 = _mm256_load_si256((const __m256i*)(_A + p + 32));

      __m256i tweak1, tweak2;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak1 = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak2 = ymmLp;

      DATA1 = _mm256_xor_si256(DATA1, tweak1);
      DATA2 = _mm256_xor_si256(DATA2, tweak2);
      minalpher_core_double_block(DATA1, DATA2);
      DATA1 = _mm256_xor_si256(DATA1, tweak1);
      DATA2 = _mm256_xor_si256(DATA2, tweak2);

      ymmTweakSum = _mm256_xor_si256(DATA1, ymmTweakSum);
      ymmTweakSum = _mm256_xor_si256(DATA2, ymmTweakSum);
      p += 64;
    }else if ((p + 32) < _alen){
      DATA1 = _mm256_load_si256((const __m256i*)(_A + p));

      tweak_update(ymmLp, ymmLp_H, cnt);
      DATA1 = _mm256_xor_si256(DATA1, ymmLp);
      minalpher_core_single_block(DATA1);
      DATA1 = _mm256_xor_si256(DATA1, ymmLp);

      ymmTweakSum = _mm256_xor_si256(DATA1, ymmTweakSum);
      p += 32;
    }

    //Final block (Associated data)
    if ((_alen % 32) == 0){
      //LOAD
      DATA = _mm256_load_si256((const __m256i*)(_A + p));

      //Tweak update
      __m256i tmpLp = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      ymmLp = _mm256_xor_si256(ymmLp, tmpLp);

      DATA = _mm256_xor_si256(DATA, ymmLp);
    }else{
      //LOAD(padding)
      MIE_ALIGN(128) unsigned char tmp[32] = { 0 };
      int q = 0;
      for (q = 0; q<(_alen - p); q++){
        tmp[q] = _A[q + p];
      }
      tmp[(_alen - p)] = 0x80;
      DATA = _mm256_load_si256((const __m256i*)(tmp));

      //Tweak update
      __m256i tmpLp = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak_update(ymmLp, ymmLp_H, cnt);
      ymmLp = _mm256_xor_si256(ymmLp, tmpLp);

      DATA = _mm256_xor_si256(DATA, ymmLp);
    }

    //Create final input (Associated data)
    DATA = _mm256_xor_si256(DATA, ymmTweakSum);

    ymmTweakSum = ymmLp;
  }



  /*==== Process Message ====*/
  int mblock = (int)((_mlen + 32) / 32);

  /*==== Create L ====*/
  int cnt = 0;
  __m256i ymmL, ymmL_H;
  create_l(ymmL, _K, _N);

  //Main loop
  int p = 0;
  for (p = 0; p <= ((long long)(_mlen)-128); p += 128)
  {
    //Encryption
    DATA1 = _mm256_load_si256((const __m256i*)(_M + p));
    DATA2 = _mm256_load_si256((const __m256i*)(_M + p + 32));
    DATA3 = _mm256_load_si256((const __m256i*)(_M + p + 64));
    DATA4 = _mm256_load_si256((const __m256i*)(_M + p + 96));

    __m256i tweak1, tweak2, tweak3, tweak4, tweak5, tweak6, tweak7, tweak8;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak1 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak5 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak2 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak6 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak3 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak7 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak4 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak8 = ymmL;

    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    DATA3 = _mm256_xor_si256(DATA3, tweak3);
    DATA4 = _mm256_xor_si256(DATA4, tweak4);
    minalpher_core_quadruple_block(DATA1, DATA2, DATA3, DATA4);
    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    DATA3 = _mm256_xor_si256(DATA3, tweak3);
    DATA4 = _mm256_xor_si256(DATA4, tweak4);
    _mm256_store_si256((__m256i *)(C_ + p), DATA1);
    _mm256_store_si256((__m256i *)(C_ + p + 32), DATA2);
    _mm256_store_si256((__m256i *)(C_ + p + 64), DATA3);
    _mm256_store_si256((__m256i *)(C_ + p + 96), DATA4);

    DATA1 = _mm256_xor_si256(DATA1, tweak5);
    DATA2 = _mm256_xor_si256(DATA2, tweak6);
    DATA3 = _mm256_xor_si256(DATA3, tweak7);
    DATA4 = _mm256_xor_si256(DATA4, tweak8);
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, tweak5);
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, tweak6);
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, tweak7);
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, tweak8);
    __m256i tmpA[4];
    __m256i tmpB[4];
    minalpher_core_quadruple_block(DATA1, DATA2, DATA3, DATA4, tmpA, tmpB);
    ymmTagA[0] = _mm256_xor_si256(ymmTagA[0], tmpA[0]);
    ymmTagA[1] = _mm256_xor_si256(ymmTagA[1], tmpA[1]);
    ymmTagA[2] = _mm256_xor_si256(ymmTagA[2], tmpA[2]);
    ymmTagA[3] = _mm256_xor_si256(ymmTagA[3], tmpA[3]);
    ymmTagB[0] = _mm256_xor_si256(ymmTagB[0], tmpB[0]);
    ymmTagB[1] = _mm256_xor_si256(ymmTagB[1], tmpB[1]);
    ymmTagB[2] = _mm256_xor_si256(ymmTagB[2], tmpB[2]);
    ymmTagB[3] = _mm256_xor_si256(ymmTagB[3], tmpB[3]);
  }

  if ((mblock % 4) == 0){
    //padding
    DATA1 = _mm256_load_si256((const __m256i*)(_M + p));
    DATA2 = _mm256_load_si256((const __m256i*)(_M + p + 32));
    DATA3 = _mm256_load_si256((const __m256i*)(_M + p + 64));
    MIE_ALIGN(128) unsigned char tmp[32] = { 0 };
    int q = 0;
    for (q = 0; q<(_mlen - 96 - p); q++){
      tmp[q] = _M[p + 96 + q];
    }
    tmp[(_mlen - 96 - p)] = 0x80;
    DATA4 = _mm256_load_si256((const __m256i*)(tmp));

    //tweak update
    __m256i tweak1, tweak2, tweak3, tweak4, tweak5, tweak6, tweak7, tweak8;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak1 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak5 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak2 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak6 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak3 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak7 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak4 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak8 = ymmL;

    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    DATA3 = _mm256_xor_si256(DATA3, tweak3);
    DATA4 = _mm256_xor_si256(DATA4, tweak4);
    minalpher_core_quadruple_block(DATA1, DATA2, DATA3, DATA4);
    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    DATA3 = _mm256_xor_si256(DATA3, tweak3);
    DATA4 = _mm256_xor_si256(DATA4, tweak4);

    _mm256_store_si256((__m256i *)(C_ + p), DATA1);
    _mm256_store_si256((__m256i *)(C_ + p + 32), DATA2);
    _mm256_store_si256((__m256i *)(C_ + p + 64), DATA3);
    _mm256_store_si256((__m256i *)(C_ + p + 96), DATA4);
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, DATA4);

    if (_alen == 0){
      DATA1 = _mm256_xor_si256(DATA1, tweak5);
      DATA2 = _mm256_xor_si256(DATA2, tweak6);
      DATA3 = _mm256_xor_si256(DATA3, tweak7);
      minalpher_core_quadruple_block(DATA1, DATA2, DATA3);
      DATA1 = _mm256_xor_si256(DATA1, tweak5);
      DATA2 = _mm256_xor_si256(DATA2, tweak6);
      DATA3 = _mm256_xor_si256(DATA3, tweak7);

      DATA = _mm256_xor_si256(DATA1, DATA2);
      DATA = _mm256_xor_si256(DATA, DATA3);
    }else{
      DATA1 = _mm256_xor_si256(DATA1, tweak5);
      DATA2 = _mm256_xor_si256(DATA2, tweak6);
      DATA3 = _mm256_xor_si256(DATA3, tweak7);
      minalpher_core_quadruple_block(DATA, DATA1, DATA2, DATA3);
      DATA1 = _mm256_xor_si256(DATA1, tweak5);
      DATA2 = _mm256_xor_si256(DATA2, tweak6);
      DATA3 = _mm256_xor_si256(DATA3, tweak7);

      DATA = _mm256_xor_si256(DATA, DATA1);
      DATA = _mm256_xor_si256(DATA, DATA2);
      DATA = _mm256_xor_si256(DATA, DATA3);
    }

    //Final block(create input)
    __m256i tmp0, tmp1, tmp2, tmp3;
    DATA = _mm256_xor_si256(ymmTweakSum, DATA);
    format_return_quadruple_block(ymmTagA, ymmTagB, tmp0, tmp1, tmp2, tmp3);
    DATA = _mm256_xor_si256(DATA, tmp0);
    DATA = _mm256_xor_si256(DATA, tmp1);
    DATA = _mm256_xor_si256(DATA, tmp2);
    DATA = _mm256_xor_si256(DATA, tmp3);

    //Final block(tweak update)
    ymmL = _mm256_xor_si256(tweak4, tweak8);

    //Finali block(Final Minalpher-P)
    DATA = _mm256_xor_si256(DATA, ymmL);
    minalpher_core_single_block(DATA);
    DATA = _mm256_xor_si256(DATA, ymmL);
    _mm_store_si128((__m128i *)(C_ + p + 128), _mm256_extracti128_si256(DATA, 0));

  }else if ((mblock % 4) == 3){
    //padding
    DATA1 = _mm256_load_si256((const __m256i*)(_M + p));
    DATA2 = _mm256_load_si256((const __m256i*)(_M + p + 32));
    MIE_ALIGN(128) unsigned char tmp[32] = { 0 };
    int q = 0;
    for (q = 0; q<(_mlen - 64 - p); q++){
      tmp[q] = _M[p + 64 + q];
    }
    tmp[(_mlen - 64 - p)] = 0x80;
    DATA3 = _mm256_load_si256((const __m256i*)(tmp));

    //tweak update
    __m256i tweak1, tweak2, tweak3, tweak4, tweak5, tweak6;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak1 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak4 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak2 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak5 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak3 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak6 = ymmL;

    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    DATA3 = _mm256_xor_si256(DATA3, tweak3);
    minalpher_core_quadruple_block(DATA1, DATA2, DATA3);
    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    DATA3 = _mm256_xor_si256(DATA3, tweak3);

    _mm256_store_si256((__m256i *)(C_ + p), DATA1);
    _mm256_store_si256((__m256i *)(C_ + p + 32), DATA2);
    _mm256_store_si256((__m256i *)(C_ + p + 64), DATA3);
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, DATA3);

    if (_alen == 0){
      DATA1 = _mm256_xor_si256(DATA1, tweak4);
      DATA2 = _mm256_xor_si256(DATA2, tweak5);
      minalpher_core_double_block(DATA1, DATA2);
      DATA1 = _mm256_xor_si256(DATA1, tweak4);
      DATA2 = _mm256_xor_si256(DATA2, tweak5);

      DATA = _mm256_xor_si256(DATA1, DATA2);
    }else{
      DATA1 = _mm256_xor_si256(DATA1, tweak4);
      DATA2 = _mm256_xor_si256(DATA2, tweak5);
      minalpher_core_quadruple_block(DATA, DATA1, DATA2);
      DATA1 = _mm256_xor_si256(DATA1, tweak4);
      DATA2 = _mm256_xor_si256(DATA2, tweak5);

      DATA = _mm256_xor_si256(DATA, DATA1);
      DATA = _mm256_xor_si256(DATA, DATA2);
    }

    //Final block(create input)
    __m256i tmp0, tmp1, tmp2, tmp3;
    DATA = _mm256_xor_si256(ymmTweakSum, DATA);
    format_return_quadruple_block(ymmTagA, ymmTagB, tmp0, tmp1, tmp2, tmp3);
    DATA = _mm256_xor_si256(DATA, tmp0);
    DATA = _mm256_xor_si256(DATA, tmp1);
    DATA = _mm256_xor_si256(DATA, tmp2);
    DATA = _mm256_xor_si256(DATA, tmp3);

    //Final block(tweak update)
    ymmL = _mm256_xor_si256(tweak3, tweak6);

    //Finali block(Final Minalpher-P)
    DATA = _mm256_xor_si256(DATA, ymmL);
    minalpher_core_single_block(DATA);
    DATA = _mm256_xor_si256(DATA, ymmL);
    _mm_store_si128((__m128i *)(C_ + p + 96), _mm256_extracti128_si256(DATA, 0));

  }else if ((mblock % 4) == 2){
    //padding
    DATA1 = _mm256_load_si256((const __m256i*)(_M + p));
    MIE_ALIGN(128) unsigned char tmp[32] = { 0 };
    int q = 0;
    for (q = 0; q<(_mlen - 32 - p); q++){
      tmp[q] = _M[p + 32 + q];
    }
    tmp[(_mlen - 32 - p)] = 0x80;
    DATA2 = _mm256_load_si256((const __m256i*)(tmp));

    //tweak update
    __m256i tweak1, tweak2, tweak3, tweak4;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak1 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak3 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak2 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak4 = ymmL;

    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    minalpher_core_double_block(DATA1, DATA2);
    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);

    _mm256_store_si256((__m256i *)(C_ + p), DATA1);
    _mm256_store_si256((__m256i *)(C_ + p + 32), DATA2);
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, DATA2);

    if (_alen == 0){
      DATA1 = _mm256_xor_si256(DATA1, tweak3);
      minalpher_core_single_block(DATA1);
      DATA  = _mm256_xor_si256(DATA1, tweak3);
    }else{
      DATA1 = _mm256_xor_si256(DATA1, tweak3);
      minalpher_core_double_block(DATA, DATA1);
      DATA1 = _mm256_xor_si256(DATA1, tweak3);

      DATA = _mm256_xor_si256(DATA, DATA1);
    }

    //Final block(create input)
    __m256i tmp0, tmp1, tmp2, tmp3;
    DATA = _mm256_xor_si256(ymmTweakSum, DATA);
    format_return_quadruple_block(ymmTagA, ymmTagB, tmp0, tmp1, tmp2, tmp3);
    DATA = _mm256_xor_si256(DATA, tmp0);
    DATA = _mm256_xor_si256(DATA, tmp1);
    DATA = _mm256_xor_si256(DATA, tmp2);
    DATA = _mm256_xor_si256(DATA, tmp3);

    //Final block(tweak update)
    ymmL = _mm256_xor_si256(tweak2, tweak4);

    //Finali block(Final Minalpher-P)
    DATA = _mm256_xor_si256(DATA, ymmL);
    minalpher_core_single_block(DATA);
    DATA = _mm256_xor_si256(DATA, ymmL);
    _mm_store_si128((__m128i *)(C_ + p + 64), _mm256_extracti128_si256(DATA, 0));

  }else{
    //padding
    MIE_ALIGN(128) unsigned char tmp[32] = { 0 };
    int q = 0;
    for (q = 0; q<(_mlen - p); q++){
      tmp[q] = _M[p + q];
    }
    tmp[(_mlen - p)] = 0x80;
    DATA1 = _mm256_load_si256((const __m256i*)(tmp));

    if (_alen == 0){
      //Encryption
      tweak_update(ymmL, ymmL_H, cnt);
      DATA1 = _mm256_xor_si256(DATA1, ymmL);
      minalpher_core_single_block(DATA1);
      DATA = _mm256_xor_si256(DATA1, ymmL);
      _mm256_store_si256((__m256i *)(C_ + p), DATA);
    }else{
      //Encryption
      tweak_update(ymmL, ymmL_H, cnt);
      DATA1 = _mm256_xor_si256(DATA1, ymmL);
      minalpher_core_double_block(DATA, DATA1);
      DATA1 = _mm256_xor_si256(DATA1, ymmL);
      _mm256_store_si256((__m256i *)(C_ + p), DATA1);
      DATA = _mm256_xor_si256(DATA, DATA1);
    }

    //Final block(create input)
    __m256i tmp0, tmp1, tmp2, tmp3;
    DATA = _mm256_xor_si256(ymmTweakSum, DATA);
    format_return_quadruple_block(ymmTagA, ymmTagB, tmp0, tmp1, tmp2, tmp3);
    DATA = _mm256_xor_si256(DATA, tmp0);
    DATA = _mm256_xor_si256(DATA, tmp1);
    DATA = _mm256_xor_si256(DATA, tmp2);
    DATA = _mm256_xor_si256(DATA, tmp3);

    //Final block(tweak update)
    __m256i tmpL = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    ymmL = _mm256_xor_si256(ymmL, tmpL);

    //Finali block(Final Minalpher-P)
    DATA = _mm256_xor_si256(DATA, ymmL);
    minalpher_core_single_block(DATA);
    DATA = _mm256_xor_si256(DATA, ymmL);
    _mm_store_si128((__m128i *)(C_ + p + 32), _mm256_extracti128_si256(DATA, 0));
  }

  //update *clen
  *clen_ = ((_mlen + 32) / 32) * 32 + 16;
}


/********************************************************************
 *  Name:       minalpher_mode_tag_generation                       *
 *  Function:   Tag Generation Algorithm of AEAD Mode               *
 *              Use single, double, and quadruple implementations   *
 *  Return:     Valid(0)/Invalid(-1)                                *
 ********************************************************************/
int minalpher_mode_tag_generation(
  const unsigned char     *_K,    /* I    Secret key                */
  const unsigned char     *_N,    /* I    Nonce                     */
  const unsigned char     *_A,    /* I    Associated data           */
  unsigned long long      _alen,  /* I    Length of Associated data */
  const unsigned char     *_C,    /* I    Ciphertext                */
  unsigned long long      _clen,  /* I    Length of Ciphertext      */
  unsigned char           *tag_   /* O    Tag                       */
  ){

  /*==== Prepare ====*/
  __m256i ymmTweakSum = _mm256_setzero_si256();
  __m256i ymmTagA[4];
  __m256i ymmTagB[4];
  for (int i = 0; i<4; i++){
    ymmTagA[i] = _mm256_setzero_si256();
    ymmTagB[i] = _mm256_setzero_si256();
  }
  __m256i DATA;
  __m256i DATA1, DATA2, DATA3, DATA4;

  /*==== Process Associated data ====*/
  if (_alen != 0){
    /*==== Create L' ====*/
    int cnt = 0;
    __m256i ymmLp, ymmLp_H;
    create_lprime(ymmLp, _K);

    //Main loop
    int p = 0;
    for (p = 0; p<((long long)_alen - 128); p += 128){

      DATA1 = _mm256_load_si256((const __m256i*)(_A + p));
      DATA2 = _mm256_load_si256((const __m256i*)(_A + p + 32));
      DATA3 = _mm256_load_si256((const __m256i*)(_A + p + 64));
      DATA4 = _mm256_load_si256((const __m256i*)(_A + p + 96));

      __m256i tweak1, tweak2, tweak3, tweak4;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak1 = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak2 = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak3 = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak4 = ymmLp;

      DATA1 = _mm256_xor_si256(DATA1, tweak1);
      DATA2 = _mm256_xor_si256(DATA2, tweak2);
      DATA3 = _mm256_xor_si256(DATA3, tweak3);
      DATA4 = _mm256_xor_si256(DATA4, tweak4);
      minalpher_core_quadruple_block(DATA1, DATA2, DATA3, DATA4);
      DATA1 = _mm256_xor_si256(DATA1, tweak1);
      DATA2 = _mm256_xor_si256(DATA2, tweak2);
      DATA3 = _mm256_xor_si256(DATA3, tweak3);
      DATA4 = _mm256_xor_si256(DATA4, tweak4);

      ymmTweakSum = _mm256_xor_si256(DATA1, ymmTweakSum);
      ymmTweakSum = _mm256_xor_si256(DATA2, ymmTweakSum);
      ymmTweakSum = _mm256_xor_si256(DATA3, ymmTweakSum);
      ymmTweakSum = _mm256_xor_si256(DATA4, ymmTweakSum);
    }

    //For odd block
    if ((p + 96) < _alen){
      DATA1 = _mm256_load_si256((const __m256i*)(_A + p));
      DATA2 = _mm256_load_si256((const __m256i*)(_A + p + 32));
      DATA3 = _mm256_load_si256((const __m256i*)(_A + p + 64));

      __m256i tweak1, tweak2, tweak3;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak1 = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak2 = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak3 = ymmLp;

      DATA1 = _mm256_xor_si256(DATA1, tweak1);
      DATA2 = _mm256_xor_si256(DATA2, tweak2);
      DATA3 = _mm256_xor_si256(DATA3, tweak3);
      minalpher_core_quadruple_block(DATA1, DATA2, DATA3);
      DATA1 = _mm256_xor_si256(DATA1, tweak1);
      DATA2 = _mm256_xor_si256(DATA2, tweak2);
      DATA3 = _mm256_xor_si256(DATA3, tweak3);

      ymmTweakSum = _mm256_xor_si256(DATA1, ymmTweakSum);
      ymmTweakSum = _mm256_xor_si256(DATA2, ymmTweakSum);
      ymmTweakSum = _mm256_xor_si256(DATA3, ymmTweakSum);
      p += 96;
    }
    else if ((p + 64) < _alen){
      DATA1 = _mm256_load_si256((const __m256i*)(_A + p));
      DATA2 = _mm256_load_si256((const __m256i*)(_A + p + 32));

      __m256i tweak1, tweak2;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak1 = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak2 = ymmLp;

      DATA1 = _mm256_xor_si256(DATA1, tweak1);
      DATA2 = _mm256_xor_si256(DATA2, tweak2);
      minalpher_core_double_block(DATA1, DATA2);
      DATA1 = _mm256_xor_si256(DATA1, tweak1);
      DATA2 = _mm256_xor_si256(DATA2, tweak2);

      ymmTweakSum = _mm256_xor_si256(DATA1, ymmTweakSum);
      ymmTweakSum = _mm256_xor_si256(DATA2, ymmTweakSum);
      p += 64;
    }
    else if ((p + 32) < _alen){
      DATA1 = _mm256_load_si256((const __m256i*)(_A + p));

      tweak_update(ymmLp, ymmLp_H, cnt);
      DATA1 = _mm256_xor_si256(DATA1, ymmLp);
      minalpher_core_single_block(DATA1);
      DATA1 = _mm256_xor_si256(DATA1, ymmLp);

      ymmTweakSum = _mm256_xor_si256(DATA1, ymmTweakSum);
      p += 32;
    }

    //Final block (Associated data)
    if ((_alen % 32) == 0){
      //LOAD
      DATA = _mm256_load_si256((const __m256i*)(_A + p));

      //Tweak update
      __m256i tmpLp = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      ymmLp = _mm256_xor_si256(ymmLp, tmpLp);

      DATA = _mm256_xor_si256(DATA, ymmLp);
    }
    else{
      //LOAD(padding)
      MIE_ALIGN(128) unsigned char tmp[32] = { 0 };
      int q = 0;
      for (q = 0; q<(_alen - p); q++){
        tmp[q] = _A[q + p];
      }
      tmp[(_alen - p)] = 0x80;
      DATA = _mm256_load_si256((const __m256i*)(tmp));

      //Tweak update
      __m256i tmpLp = ymmLp;
      tweak_update(ymmLp, ymmLp_H, cnt);
      tweak_update(ymmLp, ymmLp_H, cnt);
      ymmLp = _mm256_xor_si256(ymmLp, tmpLp);

      DATA = _mm256_xor_si256(DATA, ymmLp);
    }

    //Create final input (Associated data)
    DATA = _mm256_xor_si256(DATA, ymmTweakSum);

    ymmTweakSum = ymmLp;
  }



  /*==== Process Ciphertext ====*/
  int cblock = (int)((_clen) / 32);

  /*==== Create L ====*/
  int cnt = 0;
  __m256i ymmL, ymmL_H;
  create_l(ymmL, _K, _N);

  //Main loop
  int p = 0;
  for (p = 0; p < ((long long)(_clen)-128); p += 128)
  {
    __m256i tweak1, tweak2, tweak3, tweak4, tweak5, tweak6, tweak7, tweak8;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak1 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak5 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak2 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak6 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak3 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak7 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak4 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak8 = ymmL;

    //Tag Generation
    DATA1 = _mm256_load_si256((const __m256i*)(_C + p));
    DATA2 = _mm256_load_si256((const __m256i*)(_C + p + 32));
    DATA3 = _mm256_load_si256((const __m256i*)(_C + p + 64));
    DATA4 = _mm256_load_si256((const __m256i*)(_C + p + 96));

    DATA1 = _mm256_xor_si256(DATA1, tweak5);
    DATA2 = _mm256_xor_si256(DATA2, tweak6);
    DATA3 = _mm256_xor_si256(DATA3, tweak7);
    DATA4 = _mm256_xor_si256(DATA4, tweak8);
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, tweak5);
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, tweak6);
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, tweak7);
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, tweak8);
    __m256i tmpA[4];
    __m256i tmpB[4];
    minalpher_core_quadruple_block(DATA1, DATA2, DATA3, DATA4, tmpA, tmpB);
    ymmTagA[0] = _mm256_xor_si256(ymmTagA[0], tmpA[0]);
    ymmTagA[1] = _mm256_xor_si256(ymmTagA[1], tmpA[1]);
    ymmTagA[2] = _mm256_xor_si256(ymmTagA[2], tmpA[2]);
    ymmTagA[3] = _mm256_xor_si256(ymmTagA[3], tmpA[3]);
    ymmTagB[0] = _mm256_xor_si256(ymmTagB[0], tmpB[0]);
    ymmTagB[1] = _mm256_xor_si256(ymmTagB[1], tmpB[1]);
    ymmTagB[2] = _mm256_xor_si256(ymmTagB[2], tmpB[2]);
    ymmTagB[3] = _mm256_xor_si256(ymmTagB[3], tmpB[3]);
  }
  
  if ((cblock % 4) == 0){

    //tweak update
    __m256i tweak1, tweak2, tweak3, tweak4, tweak5, tweak6, tweak7, tweak8;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak1 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak5 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak2 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak6 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak3 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak7 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak4 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak8 = ymmL;

    //Tag generation
    DATA1 = _mm256_load_si256((const __m256i*)(_C + p));
    DATA2 = _mm256_load_si256((const __m256i*)(_C + p + 32));
    DATA3 = _mm256_load_si256((const __m256i*)(_C + p + 64));
    DATA4 = _mm256_load_si256((const __m256i*)(_C + p + 96));
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, DATA4);

    if (_alen == 0){
      DATA1 = _mm256_xor_si256(DATA1, tweak5);
      DATA2 = _mm256_xor_si256(DATA2, tweak6);
      DATA3 = _mm256_xor_si256(DATA3, tweak7);
      minalpher_core_quadruple_block(DATA1, DATA2, DATA3);
      DATA1 = _mm256_xor_si256(DATA1, tweak5);
      DATA2 = _mm256_xor_si256(DATA2, tweak6);
      DATA3 = _mm256_xor_si256(DATA3, tweak7);

      DATA = _mm256_xor_si256(DATA1, DATA2);
      DATA = _mm256_xor_si256(DATA, DATA3);
    }
    else{
      DATA1 = _mm256_xor_si256(DATA1, tweak5);
      DATA2 = _mm256_xor_si256(DATA2, tweak6);
      DATA3 = _mm256_xor_si256(DATA3, tweak7);
      minalpher_core_quadruple_block(DATA, DATA1, DATA2, DATA3);
      DATA1 = _mm256_xor_si256(DATA1, tweak5);
      DATA2 = _mm256_xor_si256(DATA2, tweak6);
      DATA3 = _mm256_xor_si256(DATA3, tweak7);

      DATA = _mm256_xor_si256(DATA, DATA1);
      DATA = _mm256_xor_si256(DATA, DATA2);
      DATA = _mm256_xor_si256(DATA, DATA3);
    }

    //Final block(create input)
    __m256i tmp0, tmp1, tmp2, tmp3;
    DATA = _mm256_xor_si256(ymmTweakSum, DATA);
    format_return_quadruple_block(ymmTagA, ymmTagB, tmp0, tmp1, tmp2, tmp3);
    DATA = _mm256_xor_si256(DATA, tmp0);
    DATA = _mm256_xor_si256(DATA, tmp1);
    DATA = _mm256_xor_si256(DATA, tmp2);
    DATA = _mm256_xor_si256(DATA, tmp3);

    //Final block(tweak update)
    ymmL = _mm256_xor_si256(tweak4, tweak8);

    //Finali block(Final Minalpher-P)
    DATA = _mm256_xor_si256(DATA, ymmL);
    minalpher_core_single_block(DATA);
    DATA = _mm256_xor_si256(DATA, ymmL);
    _mm_store_si128((__m128i *)(tag_), _mm256_extracti128_si256(DATA, 0));

  }
  else if ((cblock % 4) == 3){

    //tweak update
    __m256i tweak1, tweak2, tweak3, tweak4, tweak5, tweak6;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak1 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak4 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak2 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak5 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak3 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak6 = ymmL;

    //Tag generation
    DATA1 = _mm256_load_si256((const __m256i*)(_C + p));
    DATA2 = _mm256_load_si256((const __m256i*)(_C + p + 32));
    DATA3 = _mm256_load_si256((const __m256i*)(_C + p + 64));
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, DATA3);

    if (_alen == 0){
      DATA1 = _mm256_xor_si256(DATA1, tweak4);
      DATA2 = _mm256_xor_si256(DATA2, tweak5);
      minalpher_core_double_block(DATA1, DATA2);
      DATA1 = _mm256_xor_si256(DATA1, tweak4);
      DATA2 = _mm256_xor_si256(DATA2, tweak5);

      DATA = _mm256_xor_si256(DATA1, DATA2);
    }
    else{
      DATA1 = _mm256_xor_si256(DATA1, tweak4);
      DATA2 = _mm256_xor_si256(DATA2, tweak5);
      minalpher_core_quadruple_block(DATA, DATA1, DATA2);
      DATA1 = _mm256_xor_si256(DATA1, tweak4);
      DATA2 = _mm256_xor_si256(DATA2, tweak5);

      DATA = _mm256_xor_si256(DATA, DATA1);
      DATA = _mm256_xor_si256(DATA, DATA2);
    }

    //Final block(create input)
    __m256i tmp0, tmp1, tmp2, tmp3;
    DATA = _mm256_xor_si256(ymmTweakSum, DATA);
    format_return_quadruple_block(ymmTagA, ymmTagB, tmp0, tmp1, tmp2, tmp3);
    DATA = _mm256_xor_si256(DATA, tmp0);
    DATA = _mm256_xor_si256(DATA, tmp1);
    DATA = _mm256_xor_si256(DATA, tmp2);
    DATA = _mm256_xor_si256(DATA, tmp3);

    //Final block(tweak update)
    ymmL = _mm256_xor_si256(tweak3, tweak6);

    //Finali block(Final Minalpher-P)
    DATA = _mm256_xor_si256(DATA, ymmL);
    minalpher_core_single_block(DATA);
    DATA = _mm256_xor_si256(DATA, ymmL);
    _mm_store_si128((__m128i *)(tag_), _mm256_extracti128_si256(DATA, 0));

  }
  else if ((cblock % 4) == 2){

    //tweak update
    __m256i tweak1, tweak2, tweak3, tweak4;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak1 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak3 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak2 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak4 = ymmL;

    //Tag generation
    DATA1 = _mm256_load_si256((const __m256i*)(_C + p));
    DATA2 = _mm256_load_si256((const __m256i*)(_C + p + 32));
    ymmTweakSum = _mm256_xor_si256(ymmTweakSum, DATA2);

    if (_alen == 0){
      DATA1 = _mm256_xor_si256(DATA1, tweak3);
      minalpher_core_single_block(DATA1);
      DATA = _mm256_xor_si256(DATA1, tweak3);
    }
    else{
      DATA1 = _mm256_xor_si256(DATA1, tweak3);
      minalpher_core_double_block(DATA, DATA1);
      DATA1 = _mm256_xor_si256(DATA1, tweak3);

      DATA = _mm256_xor_si256(DATA, DATA1);
    }

    //Final block(create input)
    __m256i tmp0, tmp1, tmp2, tmp3;
    DATA = _mm256_xor_si256(ymmTweakSum, DATA);
    format_return_quadruple_block(ymmTagA, ymmTagB, tmp0, tmp1, tmp2, tmp3);
    DATA = _mm256_xor_si256(DATA, tmp0);
    DATA = _mm256_xor_si256(DATA, tmp1);
    DATA = _mm256_xor_si256(DATA, tmp2);
    DATA = _mm256_xor_si256(DATA, tmp3);

    //Final block(tweak update)
    ymmL = _mm256_xor_si256(tweak2, tweak4);

    //Finali block(Final Minalpher-P)
    DATA = _mm256_xor_si256(DATA, ymmL);
    minalpher_core_single_block(DATA);
    DATA = _mm256_xor_si256(DATA, ymmL);
    _mm_store_si128((__m128i *)(tag_), _mm256_extracti128_si256(DATA, 0));

  }
  else{

    if (_alen == 0){
      //Encryption
      tweak_update(ymmL, ymmL_H, cnt);
      DATA = _mm256_load_si256((const __m256i*)(_C + p));
    }
    else{
      //Encryption
      tweak_update(ymmL, ymmL_H, cnt);
      minalpher_core_single_block(DATA);
      DATA1 = _mm256_load_si256((const __m256i*)(_C + p));
      DATA = _mm256_xor_si256(DATA, DATA1);
    }

    //Final block(create input)
    __m256i tmp0, tmp1, tmp2, tmp3;
    DATA = _mm256_xor_si256(ymmTweakSum, DATA);
    format_return_quadruple_block(ymmTagA, ymmTagB, tmp0, tmp1, tmp2, tmp3);
    DATA = _mm256_xor_si256(DATA, tmp0);
    DATA = _mm256_xor_si256(DATA, tmp1);
    DATA = _mm256_xor_si256(DATA, tmp2);
    DATA = _mm256_xor_si256(DATA, tmp3);

    //Final block(tweak update)
    __m256i tmpL = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    ymmL = _mm256_xor_si256(ymmL, tmpL);

    //Finali block(Final Minalpher-P)
    DATA = _mm256_xor_si256(DATA, ymmL);
    minalpher_core_single_block(DATA);
    DATA = _mm256_xor_si256(DATA, ymmL);

    _mm_store_si128((__m128i *)(tag_), _mm256_extracti128_si256(DATA, 0));
  }
  return 0;
}


/********************************************************************
 *  Name:       minalpher_mode_decryption                           *
 *  Function:   Ciphertext Generation Algorithm of AEAD Mode        *
 *              Use single, double, and quadruple implementations   *
 *  Return:     Valid(0)/Invalid(-1)                                *
 ********************************************************************/
int minalpher_mode_decryption(
  const unsigned char     *_K,    /* I    Secret key                */
  const unsigned char     *_N,    /* I    Nonce                     */
  const unsigned char     *_C,    /* I    Ciphertext                */
  unsigned long long      _clen,  /* I    Length of Ciphertext      */
  unsigned char           *M_,    /* O    Message                   */
  unsigned long long      *mlen_  /* O    Length of Message         */
  ){
  /*==== Prepare ====*/
  __m256i ymmTagA[4];
  __m256i ymmTagB[4];
  for (int i = 0; i<4; i++){
    ymmTagA[i] = _mm256_setzero_si256();
    ymmTagB[i] = _mm256_setzero_si256();
  }
  __m256i DATA;
  __m256i DATA1, DATA2, DATA3, DATA4;

  /*==== Process Message ====*/
  int mblock = (int)((_clen) / 32);

  /*==== Create L ====*/
  int cnt = 0;
  __m256i ymmL, ymmL_H;
  create_l(ymmL, _K, _N);

  //Main loop
  int p = 0;
  for (p = 0; p < ((long long)(_clen)-128); p += 128)
  {
    //Encryption
    DATA1 = _mm256_load_si256((const __m256i*)(_C + p));
    DATA2 = _mm256_load_si256((const __m256i*)(_C + p + 32));
    DATA3 = _mm256_load_si256((const __m256i*)(_C + p + 64));
    DATA4 = _mm256_load_si256((const __m256i*)(_C + p + 96));

    __m256i tweak1, tweak2, tweak3, tweak4, tweak5, tweak6, tweak7, tweak8;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak1 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak5 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak2 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak6 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak3 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak7 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak4 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak8 = ymmL;

    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    DATA3 = _mm256_xor_si256(DATA3, tweak3);
    DATA4 = _mm256_xor_si256(DATA4, tweak4);
    minalpher_core_quadruple_block_inverse(DATA1, DATA2, DATA3, DATA4);
    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    DATA3 = _mm256_xor_si256(DATA3, tweak3);
    DATA4 = _mm256_xor_si256(DATA4, tweak4);
    _mm256_store_si256((__m256i *)(M_ + p), DATA1);
    _mm256_store_si256((__m256i *)(M_ + p + 32), DATA2);
    _mm256_store_si256((__m256i *)(M_ + p + 64), DATA3);
    _mm256_store_si256((__m256i *)(M_ + p + 96), DATA4);
  }

  //length update
  *mlen_ = p;

  if ((mblock % 4) == 0){
    //padding
    DATA1 = _mm256_load_si256((const __m256i*)(_C + p));
    DATA2 = _mm256_load_si256((const __m256i*)(_C + p + 32));
    DATA3 = _mm256_load_si256((const __m256i*)(_C + p + 64));
    DATA4 = _mm256_load_si256((const __m256i*)(_C + p + 96));

    //tweak update
    __m256i tweak1, tweak2, tweak3, tweak4, tweak5, tweak6, tweak7, tweak8;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak1 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak5 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak2 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak6 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak3 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak7 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak4 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak8 = ymmL;

    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    DATA3 = _mm256_xor_si256(DATA3, tweak3);
    DATA4 = _mm256_xor_si256(DATA4, tweak4);
    minalpher_core_quadruple_block_inverse(DATA1, DATA2, DATA3, DATA4);
    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    DATA3 = _mm256_xor_si256(DATA3, tweak3);
    DATA4 = _mm256_xor_si256(DATA4, tweak4);

    _mm256_store_si256((__m256i *)(M_ + p), DATA1);
    _mm256_store_si256((__m256i *)(M_ + p + 32), DATA2);
    _mm256_store_si256((__m256i *)(M_ + p + 64), DATA3);
    _mm256_store_si256((__m256i *)(M_ + p + 96), DATA4);

    //Format Verification
    for (int d = BLOCK_SIZE - 1; d >= 0; d--){
      if ( (M_ + p + 96)[d] == 0x80){
        *mlen_ += 96 + d;
        return 0;
      }
      if ((M_ + p + 96)[d] != 0x00){
        break;
      }
    }
  }
  else if ((mblock % 4) == 3){
    //padding
    DATA1 = _mm256_load_si256((const __m256i*)(_C + p));
    DATA2 = _mm256_load_si256((const __m256i*)(_C + p + 32));
    DATA3 = _mm256_load_si256((const __m256i*)(_C + p + 64));

    //tweak update
    __m256i tweak1, tweak2, tweak3, tweak4, tweak5, tweak6;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak1 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak4 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak2 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak5 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak3 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak6 = ymmL;

    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    DATA3 = _mm256_xor_si256(DATA3, tweak3);
    minalpher_core_quadruple_block_inverse(DATA1, DATA2, DATA3);
    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    DATA3 = _mm256_xor_si256(DATA3, tweak3);

    _mm256_store_si256((__m256i *)(M_ + p), DATA1);
    _mm256_store_si256((__m256i *)(M_ + p + 32), DATA2);
    _mm256_store_si256((__m256i *)(M_ + p + 64), DATA3);

    //Format Verification
    for (int d = BLOCK_SIZE - 1; d >= 0; d--){
      if ((M_ + p + 64)[d] == 0x80){
        *mlen_ += 64 + d;
        return 0;
      }
      if ((M_ + p + 64)[d] != 0x00){
        break;
      }
    }
  }
  else if ((mblock % 4) == 2){
    //padding
    DATA1 = _mm256_load_si256((const __m256i*)(_C + p));
    DATA2 = _mm256_load_si256((const __m256i*)(_C + p + 32));

    //tweak update
    __m256i tweak1, tweak2, tweak3, tweak4;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak1 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak3 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak2 = ymmL;
    tweak_update(ymmL, ymmL_H, cnt);
    tweak4 = ymmL;

    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);
    minalpher_core_double_block_inverse(DATA1, DATA2);
    DATA1 = _mm256_xor_si256(DATA1, tweak1);
    DATA2 = _mm256_xor_si256(DATA2, tweak2);

    _mm256_store_si256((__m256i *)(M_ + p), DATA1);
    _mm256_store_si256((__m256i *)(M_ + p + 32), DATA2);

    //Format Verification
    for (int d = BLOCK_SIZE - 1; d >= 0; d--){
      if ((M_ + p + 32)[d] == 0x80){
        *mlen_ += 32 + d;
        return 0;
      }
      if ((M_ + p + 32)[d] != 0x00){
        break;
      }
    }
  }
  else{
    //padding
    DATA1 = _mm256_load_si256((const __m256i*)(_C + p));

    //Encryption
    tweak_update(ymmL, ymmL_H, cnt);
    DATA1 = _mm256_xor_si256(DATA1, ymmL);
    minalpher_core_single_block_inverse(DATA1);
    DATA = _mm256_xor_si256(DATA1, ymmL);
    _mm256_store_si256((__m256i *)(M_ + p), DATA);

    //Format Verification
    for (int d = BLOCK_SIZE - 1; d >= 0; d--){
      if ((M_ + p)[d] == 0x80){
        *mlen_ += d;
        return 0;
      }
      if ((M_ + p)[d] != 0x00){
        break;
      }
    }
  }

  return -1;
}
