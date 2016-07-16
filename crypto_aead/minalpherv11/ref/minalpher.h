/*
  header file for minalpher.c

Copyright (c) 2014-2015
NTT (Nippon Telegraph and Telephone Corporation)
and Mitsubishi Electric Corporation
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

#ifndef _MINALPHER_H_
#define _MINALPHER_H_


/*==== Macros ====*/
#define Copy(p1,p2,n) do{int u; for( u=0; u<n; u++ ) (p1)[u]  = (p2)[u];}while(0)
#define Xor(p1,p2,n)  do{int u; for( u=0; u<n; u++ ) (p1)[u] ^= (p2)[u];}while(0)
#define Clear(p,n)    do{int u; for( u=0; u<n; u++ ) (p)[u] = 0x00;}while(0)


/*==== Constants ====*/
#ifdef CRYPTO_KEYBYTES
#define KEYBYTES CRYPTO_KEYBYTES
#else
#define KEYBYTES 16
#endif
#ifdef CRYPTO_NPUBBYTES
#define NONCEBYTES CRYPTO_NPUBBYTES
#else
#define NONCEBYTES 13
#endif
#define BLOCK_SIZE 32
#define TAGBYTES   16
#define RNUM       17



int AEAD_ENC(
  const unsigned char     *_K,    /* I    Secret key              */
  const unsigned char     *_N,    /* I    Nonce                   */
  const unsigned char     *_AD,   /* I    Associate Data          */
  const unsigned long long _adlen,/* I    Length of Associate Data*/
  const unsigned char     *_M,    /* I    Message                 */
  const unsigned long long _mlen, /* I    Length of Message       */

  unsigned char           *C_,    /* O    Ciphertext              */
  unsigned long long      *clen_, /* O    Length of Ciphertext    */
  unsigned char           *tag_   /* O    Tag                     */
);

int AEAD_DEC(
  const unsigned char     *_K,    /* I    Secret key              */
  const unsigned char     *_N,    /* I    Nonce                   */
  const unsigned char     *_AD,   /* I    Associate Data          */
  const unsigned long long _adlen,/* I    Length of Associate Data*/
  const unsigned char     *_C,    /* I    Ciphertext              */
  const unsigned long long _clen, /* I    Length of Ciphertext    */
  const unsigned char     *_tag,  /* I    Tag                     */

  unsigned char           *M_,    /* O    Message                 */
  unsigned long long      *mlen_  /* O    Length of Message       */
);

int MAC_GEN(
  const unsigned char     *_K,    /* I    Secret key              */
  const unsigned char     *_M,    /* I    Message                 */
  unsigned long long      _mlen,  /* I    Length of Message       */

  unsigned char           *C_,    /* O    Tag                     */
  unsigned long long      *clen_  /* O    Length of Tag           */
  );

int MAC_VERIF(
  const unsigned char     *_K,    /* I    Secret key              */
  const unsigned char     *_M,    /* I    Message                 */
  unsigned long long      _mlen,  /* I    Length of Message       */

  const unsigned char     *_C,    /* I    Tag to be verified      */
  unsigned long long      _clen   /* I    Length of Tag           */
  );



#endif  /* _MINALPHER_H_ */
