/*
  Minalpher v1.1 SUPERCOP wrapper for optimized code on AVX2 environment version 1.1.0

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


#include "crypto_aead.h"
#include "define.h"
#include<iostream>


/*==== Encryption Mode of Minalpher ====*/
void minalpher_mode_encrypt(  
  const unsigned char     *_K,    /* I    Secret key                */
  const unsigned char     *_N,    /* I    Nonce                     */
  const unsigned char     *_A,    /* I    Associated data           */
  unsigned long long      _alen,  /* I    Length of Associated data */
  const unsigned char     *_M,    /* I    Message                   */
  unsigned long long      _mlen,  /* I    Length of Message         */
  unsigned char           *C_,    /* O    Ciphertext                */
  unsigned long long      *clen_  /* O    Length of Ciphertext      */
  );

/*==== Decryption Mode of Minalpher ====*/
int minalpher_mode_tag_generation(
  const unsigned char     *_K,    /* I    Secret key                */
  const unsigned char     *_N,    /* I    Nonce                     */
  const unsigned char     *_A,    /* I    Associated data           */
  unsigned long long      _alen,  /* I    Length of Associated data */
  const unsigned char     *_C,    /* I    Ciphertext                */
  unsigned long long      _clen,  /* I    Length of Ciphertext      */
  unsigned char           *_tag   /* I    Tag                       */
  );
int minalpher_mode_decryption(
  const unsigned char     *_K,    /* I    Secret key                */
  const unsigned char     *_N,    /* I    Nonce                     */
  const unsigned char     *_C,    /* I    Ciphertext                */
  unsigned long long      _clen,  /* I    Length of Ciphertext      */
  unsigned char           *M_,    /* O    Message                   */
  unsigned long long      *mlen_  /* O    Length of Message         */
  );


/*==== CAESAR API ====*/
/************************************************************
 *  Name:       crypto_aead_encrypt                         *
 *  Function:   authenticated encryption                    *
 *  Return:     Valid(0)/Invalid(-1)                        *
 ************************************************************/
int crypto_aead_encrypt(
  unsigned char       *c,
  unsigned long long  *clen,
  const unsigned char *m,
  unsigned long long  mlen,
  const unsigned char *ad,
  unsigned long long  adlen,
  const unsigned char *nsec,
  const unsigned char *npub,
  const unsigned char *k
  )
{
  unsigned long long cr;

  cr = mlen + adlen;
  if( (cr<mlen) && (cr<adlen) ) return -1;
  
  //minalpher mode
  minalpher_mode_encrypt(k, npub, ad, adlen, m, mlen, c, clen);
  
  
  return 0;
}






/************************************************************
 *  Name:       crypto_aead_decrypt                         *
 *  Function:   authenticated decryption                    *
 *  Return:     Valid(0)/Invalid(-1)                        *
 ************************************************************/
int crypto_aead_decrypt(
  unsigned char       *m,
  unsigned long long  *mlen,
  unsigned char       *nsec,
  const unsigned char *c,
  unsigned long long  clen,
  const unsigned char *ad,
  unsigned long long  adlen,
  const unsigned char *npub,
  const unsigned char *k
  )
{
  unsigned long long cr;
  int d, ret=0;
  MIE_ALIGN(128) unsigned char tag[32] = { 0 };

  cr = clen + adlen;
  if( (cr<clen) && (cr<adlen) ) return -1;

  clen -= TAGBYTES;
  if( clen % BLOCK_SIZE ) return -1;
  if( clen < BLOCK_SIZE ) return -1;

  //minalpher tag verification
  if (minalpher_mode_tag_generation(k, npub, ad, adlen, c, clen, tag) < 0){
    return -1;
  }
  for( d=0; d<TAGBYTES; d++ ){
    if( tag[d] != c[d+clen] ) ret |= 1;
  }
  if( ret != 0 )  return -1;

  //minalpher decryption
  if (minalpher_mode_decryption(k, npub, c, clen, m, mlen) < 0){
    return -1;
  }

  return 0;
}
