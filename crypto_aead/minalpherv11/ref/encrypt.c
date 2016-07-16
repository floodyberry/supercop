/*
  Minalpher wrapper code for SUPERCOP

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

#include "crypto_aead.h"
#include "api.h"
#include "minalpher.h"


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
  unsigned char tag[TAGBYTES];

  cr = mlen + adlen;
  if( (cr<mlen) && (cr<adlen) ) return -1;

  AEAD_ENC( k, npub, ad, adlen, m, mlen, c, clen, tag );

  Copy( c+*clen, tag, TAGBYTES );
  *clen += TAGBYTES;

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
  unsigned char tag[TAGBYTES];

  cr = clen + adlen;
  if( (cr<clen) && (cr<adlen) ) return -1;

  clen -= TAGBYTES;
  if( clen % BLOCK_SIZE ) return -1;
  Copy( tag, c+clen, TAGBYTES );

  return AEAD_DEC( k, npub, ad, adlen, c, clen, tag, m, mlen );
}


/************************************************************
 *  Name:       crypto_mac_gen                              *
 *  Function:   sign to a message                           *
 *  Return:     Valid(0)/Invalid(-1)                        *
 ************************************************************/
int crypto_mac_gen(
  unsigned char       *c,     /* O    Tag                                 */
  unsigned long long  *clen,  /* O    Length of Tag                       */
  const unsigned char *m,     /* I    Message                             */
  unsigned long long  mlen,   /* I    Length of Message                   */
  const unsigned char *nsec,  /* I    Secret message number (not used)    */
  const unsigned char *npub,  /* I    Public message number (not used)    */
  const unsigned char *k      /* I    Secret key                          */
  )
{
  int ret;

  ret = MAC_GEN(  k, 
                  m, mlen, 
                  c, clen );

  return 0;
}


/************************************************************
 *  Name:       crypto_mac_verif                            *
 *  Function:   verify a signature                          *
 *  Return:     Valid(0)/Invalid(-1)                        *
 ************************************************************/
int crypto_mac_verif(
  const unsigned char *c,     /* I    Tag to verified                     */
  unsigned long long  clen,   /* I    Length of Tag                       */
  const unsigned char *m,     /* I    Message                             */
  unsigned long long  mlen,   /* I    Length of Message                   */
  const unsigned char *nsec,  /* I    Secret message number (not used)    */  
  const unsigned char *npub,  /* I    Public message number (not used)    */
  const unsigned char *k      /* I    Secret key                          */
  )
{
  int ret;

  ret = MAC_VERIF( k, 
                   m, mlen, 
                   c, clen );

  if( ret != 0 ) return -1;

  return 0;
}
