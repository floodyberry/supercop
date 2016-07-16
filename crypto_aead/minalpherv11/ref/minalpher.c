/*
  Minalpher v1.1 reference code version 1.1.0

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

#include "minalpher.h"


/*==== Constants ====*/
const static unsigned char s[16] = {
  0x0B,0x03,0x04,0x01,0x02,0x08,0x0C,0x0F,0x05,0x0D,0x0E,0x00,0x06,0x09,0x0A,0x07};
const static int SR1[4]  = {3,0,1,2};
const static int SR2[4]  = {2,0,3,1};
const static int iSR1[4] = {1,2,3,0};
const static int iSR2[4] = {1,3,0,2};
const static unsigned char R = 0xA3;

/*==== System parameters ====*/
#define FLG_AD  0x00
#define FLG_M   0x40
#define FLG_MAC 0x80

/*== Directions of Permutation ==*/
#define FORWARD  0
#define BACKWARD 1
 


/*==== Subfunctions in the round function of Minalpher-P ====*/
/********************************************
 *  Name:       S                           *
 *  Function:   S-Function                  *
 *              (SubNibbles)                *
 *  Return:     Void                        *
 ********************************************/
static void S( 
  unsigned char *_m_      /* I/O  Message     */
  )       
{
  int i;
  unsigned char t;

  /*--- SubNibbles ---*/
  for( i=0; i<BLOCK_SIZE; i++ ){
    t = _m_[i];
    _m_[i] = (s[t>>4]<<4) | s[t&0x0f];
  }
}
    

/********************************************
 *  Name:       T                           *
 *  Function:   T-Function                  *
 *              (ShuffleRows, SwapMatrices) *
 *  Return:     Void                        *
 ********************************************/
static void T( 
  unsigned char *_m_      /* I/O  Message     */
  )
{
  int i,j;
  unsigned char t0,t1,t2,t3,temp[16];

  /*--- ShuffleRows ---*/
  for( i=0; i<4; i++ ){
    t0 = _m_[SR1[i]];
    t1 = _m_[SR2[i]+8];
    t2 = _m_[iSR1[i]+16];
    t3 = _m_[iSR2[i]+24];

    if( i == 0 ){
      t2 = (t2>>4) | (t2<<4);
    }else if( i == 1 ){
      t0 = (t0>>4) | (t0<<4);
    }else if( i == 2 ){
      t1 = (t1>>4) | (t1<<4);
    }else if( i == 3 ){
      t3 = (t3>>4) | (t3<<4);
    }

    temp[i]    = t0;
    temp[i+4]  = t1;
    temp[i+8]  = t2;
    temp[i+12] = t3;
  }

  for( i=0; i<4; i++ ){
    _m_[i]    = temp[i];
    _m_[i+8]  = temp[i+4];
    _m_[i+16] = temp[i+8];
    _m_[i+24] = temp[i+12];
  }       

  for( i=0; i<4; i++ ){
    t0 = _m_[iSR1[i]+4];
    t1 = _m_[iSR2[i]+8+4];
    t2 = _m_[SR1[i]+16+4];
    t3 = _m_[SR2[i]+24+4];

    if( i == 0 ){
      t0 = (t0>>4) | (t0<<4);
    }else if( i == 1 ){
      t2 = (t2>>4) | (t2<<4);
    }else if( i == 2 ){
      t3 = (t3>>4) | (t3<<4);
    }else if( i == 3 ){
      t1 = (t1>>4) | (t1<<4);
    }

    temp[i]    = t0;
    temp[i+4]  = t1;
    temp[i+8]  = t2;
    temp[i+12] = t3;
  }

  for( i=0; i<4; i++ ){
    _m_[i+4]    = temp[i];
    _m_[i+8+4]  = temp[i+4];
    _m_[i+16+4] = temp[i+8];
    _m_[i+24+4] = temp[i+12];
  }       

  /*=== SwapMatrices ===*/
  for( i=0; i<BLOCK_SIZE; i+=8 ){
    for( j=0; j<4; j++ ){
      t0 = _m_[i+j];
      _m_[i+j] = _m_[i+j+4];
      _m_[i+j+4] = t0;
    }
  }
}


/********************************************
 *  Name:       M                           *
 *  Function:   M-Function                  *
 *              (XorMatrix, MixColumns)     *
 *  Return:     Void                        *
 ********************************************/
static void M( 
  unsigned char *_m_      /* I/O  Message     */
  )
{
  int i;
  unsigned char t0,t1,t2,t3;

  /*--- XorMatrix ---*/
  for( i=0; i<BLOCK_SIZE; i+=8 ){
    _m_[i+4] ^= _m_[i];
    _m_[i+5] ^= _m_[i+1];
    _m_[i+6] ^= _m_[i+2];
    _m_[i+7] ^= _m_[i+3];
  }

  /*--- MixColumns ---*/
  for( i=0; i<8; i++ ){
    t0 = _m_[i];
    t1 = _m_[i+8];
    t2 = _m_[i+16];
    t3 = _m_[i+24];

    _m_[i]  = t0 ^ t1 ^ t3;
    _m_[i+ 8] = t1 ^ t2 ^ t0;
    _m_[i+16] = t2 ^ t3 ^ t1;
    _m_[i+24] = t3 ^ t0 ^ t2;
  }
}


/********************************************
 *  Name:       E                           *
 *  Function:   E-Function                  *
 *              (Add the round constant)    *
 *  Return:     Void                        *
 ********************************************/
static void E( 
    unsigned char   *_m_,   /* I/O  Message         */
    int             _r      /* I    Round number    */
    )
{
  int i,j;
  unsigned char t;

  j=0;
  for( i=0; i<4; i++ ){
    t = ( ( ((unsigned char)i) ^ (((unsigned char)_r)&0x0f) )<<4 ) | ( ((unsigned char)i) ^ (((unsigned char)_r)&0x0f) );
    _m_[j+4] ^= 0x01 ^ t;
    _m_[j+5] ^= 0x23 ^ t;
    j+=8;
  }   
}



/*==== Tweakable Even-Mansour and Minalpher-P ====*/
/************************************
 *  Name:       minalpher_P         *
 *  Function:   Permutation         *
 *  Return:     Void                *
 ************************************/
static void minalpher_P(
  unsigned char   *_msg_,     /* I/O  Message                                 */
  unsigned char   _dir        /* I    Direction (0x00)Forward, (0x01)Backward */
)
{
  int r,rn;
  unsigned char dat[BLOCK_SIZE];

  Copy( dat, _msg_, BLOCK_SIZE );
  r = RNUM;

  while( r > 0 ){
    S( dat );
    T( dat );

    if( _dir == FORWARD ){
      rn = RNUM - r;
      M( dat );
      E( dat,rn );
    }else if( _dir == BACKWARD ){
      rn = r-1;
      E( dat,rn );
      M( dat );
    }
    r--;
  }

  S( dat );
  T( dat );

  Copy( _msg_, dat, BLOCK_SIZE );
}


/********************************************
 *  Name:       TweakGen                    *
 *  Function:   Generate a tweak            *
 *  Return:     Void                        *
 *  Note:       Tweak _L_ is overwritten    *
 ********************************************/
static void TweakGen(
  unsigned char       *_L_,   /* I/O  Tweak       */
  unsigned long long  _i,     /* I    an integer  */
  unsigned long long  _j      /* I    an integer  */
  )
{
  int d;
  unsigned char t,dat[BLOCK_SIZE];

  /*-- y^{i}(y+1)^{j}L --*/
  while( _j>0 ){

    Copy( dat, _L_, BLOCK_SIZE );
    t = _L_[0];

    for( d=0; d<(BLOCK_SIZE-1); d++ ) _L_[d] = _L_[d+1];
    _L_[31]  = t<<1;
    _L_[28] ^= t;
    _L_[29] ^= t; 

    if( (t&0x80) == 0x80 ) _L_[31] ^= R;
    Xor( _L_, dat, BLOCK_SIZE );

    _j--;
  }

  while( _i>0 ){

    Copy( dat, _L_, BLOCK_SIZE );
    t = _L_[0];

    for( d=0; d<(BLOCK_SIZE-1); d++ ) _L_[d] = _L_[d+1];
    _L_[31]  = t<<1;
    _L_[28] ^= t;
    _L_[29] ^= t; 

    if( (t&0x80) == 0x80 ) _L_[31] ^= R;

    _i--;
  }
}


/********************************************************************
 *  Name:       TEM_ENC                                             *
 *  Function:   Encryption Algorithm of Tweakable Even-Mansour      *
 *              (Algorithm 1)                                       *
 *  Return:     Void                                                *
 *  Note:       return C in argument *C_                            *
 ********************************************************************/
static void TEM_ENC(
  const unsigned char     *_K,    /* I    Secret key              */
  unsigned char           _flag,  /* I    Flag for the padding    */
  const unsigned char     *_N,    /* I    Nonce                   */
  unsigned long long      _i,     /* I    an integer              */
  unsigned long long      _j,     /* I    an integer              */
  unsigned char           *_M,    /* I    Message                 */

  unsigned char           *C_     /* O    Ciphertext              */
  )
{
  int d;
  unsigned char L[BLOCK_SIZE];

  /*-- L=(K||flag||N) + P(K||flag||N) --*/
  Copy( L, _K, KEYBYTES );
  L[KEYBYTES]   = _flag;
  L[KEYBYTES+1] = 0x00;
  L[KEYBYTES+2] = 0x00;
  for( d=0; d<NONCEBYTES; d++ ) L[d+KEYBYTES+3] = _N[d];

  minalpher_P( L, FORWARD );

  Xor( L, _K, KEYBYTES );
  L[KEYBYTES]   ^= _flag;
  L[KEYBYTES+1] ^= 0x00;
  L[KEYBYTES+2] ^= 0x00;
  for( d=0; d<NONCEBYTES; d++ ) L[d+KEYBYTES+3] ^= _N[d];

  /* C=y^{i}(y+1)^{j}L + P(M+y^{i}(y+1)^{j}L) --*/
  Copy( C_, _M, BLOCK_SIZE );
  TweakGen( L, _i, _j );
  Xor(  C_,  L, BLOCK_SIZE );
  minalpher_P( C_, FORWARD );
  Xor(  C_,  L, BLOCK_SIZE );
}


/********************************************************************
 *  Name:       TEM_DEC                                             *
 *  Function:   Decryption Algorithm of Tweakable Even-Mansour      *
 *              (Algorithm 2)                                       *
 *  Return:     Void                                                *
 *  Note:       return M in argument *M_                            *
 ********************************************************************/
static void TEM_DEC(
  const unsigned char     *_K,    /* I    Secret key              */
  unsigned char           _flag,  /* I    Flag for the padding    */
  const unsigned char     *_N,    /* I    Nonce                   */
  unsigned long long      _i,     /* I    an integer              */
  unsigned long long      _j,     /* I    an integer              */
  unsigned char           *_C,    /* I    Ciphertext              */

  unsigned char           *M_     /* O    Message                 */
  )
{
  int d;
  unsigned char L[BLOCK_SIZE];

  /*-- L=(K||flag||N) + P(K||flag||N) --*/
  Copy( L, _K, KEYBYTES );
  L[KEYBYTES]   = _flag;
  L[KEYBYTES+1] = 0x00;
  L[KEYBYTES+2] = 0x00;
  for( d=0; d<NONCEBYTES; d++ ) L[d+KEYBYTES+3] = _N[d];

  minalpher_P( L, FORWARD );

  Xor( L, _K, KEYBYTES );
  L[KEYBYTES]   ^= _flag;
  L[KEYBYTES+1] ^= 0x00;
  L[KEYBYTES+2] ^= 0x00;
  for( d=0; d<NONCEBYTES; d++ ) L[d+KEYBYTES+3] ^= _N[d];

  /* M=y^{i}(y+1)^{j}L + P^{-1}(C+y^{i}(y+1)^{j}L)    --*/
  Copy( M_, _C, BLOCK_SIZE );
  TweakGen( L, _i, _j );
  Xor(  M_,  L, BLOCK_SIZE );
  minalpher_P( M_, BACKWARD );
  Xor(  M_,  L, BLOCK_SIZE );
}



/*==== Minalpher Modes ====*/
/********************************************************************
 *  Name:       AEAD_CGEN                                           *
 *  Function:   Ciphertext Generation Algorithm of AEAD Mode        *
 *              (Algorithm 3)                                       *
 *  Return:     Void                                                *
 *  Note:       return C & its length in arguments *C_ & clen_      *
 ********************************************************************/
static void AEAD_CGEN(
  const unsigned char     *_K,    /* I    Secret key              */
  const unsigned char     *_N,    /* I    Nonce                   */
  const unsigned char     *_M,    /* I    Message                 */
  unsigned long long      _mlen,  /* I    Length of Message       */

  unsigned char           *C_,    /* O    Ciphertext              */
  unsigned long long      *clen_  /* O    Length of Ciphertext    */
  )
{
  int d, pad;
  unsigned long long i, blocknum;
  const unsigned char *mp;
  unsigned char *cp, in[BLOCK_SIZE], out[BLOCK_SIZE];

  i = 1;
  mp = _M;
  cp = C_;

  pad = _mlen%BLOCK_SIZE;
  blocknum = _mlen/BLOCK_SIZE+1;
  *clen_ = blocknum*BLOCK_SIZE;

  while( blocknum > 1 ){

    Copy( in, mp, BLOCK_SIZE );
    TEM_ENC( _K, FLG_M, _N, i, 0, in, out );
    Copy( cp, out, BLOCK_SIZE );

    i += 2;
    blocknum--;
    mp += BLOCK_SIZE;
    cp += BLOCK_SIZE;
  }

  /* blocknum == 1 */
  Copy( in, mp, pad );
  in[pad] = 0x80;
  for( d=pad+1; d<BLOCK_SIZE; d++ ) in[d] = 0x00;
  TEM_ENC( _K, FLG_M, _N, i, 0, in, out );
  Copy( cp, out, BLOCK_SIZE );
}


/********************************************************************
 *  Name:       AEAD_TGEN                                           *
 *  Function:   Tag Generation Algorithm of AEAD Mode               *
 *              (Algorithm 4)                                       *
 *  Return:     Void                                                *
 *  Note:       return Tag in argument *tag_                        *
 ********************************************************************/
static void AEAD_TGEN(
  const unsigned char     *_K,    /* I    Secret key                  */
  const unsigned char     *_N,    /* I    Nonce                       */
  const unsigned char     *_A,    /* I    Associated data             */
  unsigned long long      _alen,  /* I    Length of Associated data   */
  const unsigned char     *_C,    /* I    Ciphertext                  */
  unsigned long long      _clen,  /* I    Length of Ciphertext        */

  unsigned char           *tag_   /* O    Tag                         */
  )
{
  int d, pad;
  unsigned long long i, j, blocknum;
  const unsigned char *ap, *cp;
  unsigned char in[BLOCK_SIZE], out[BLOCK_SIZE], t[BLOCK_SIZE], zero[NONCEBYTES];

  i = 1;
  j = 1;
  ap = _A;
  cp = _C;

  /*-- Associated data --*/
  pad = _alen%BLOCK_SIZE;
  blocknum = _alen/BLOCK_SIZE;
  if( pad != 0 ) blocknum += 1;
  Clear( t, BLOCK_SIZE );
  Clear( zero, NONCEBYTES );

  while( blocknum > 1 ){

    Copy( in, ap, BLOCK_SIZE );
    TEM_ENC( _K, FLG_AD, zero, i, 0, in, out );
    Xor( t, out, BLOCK_SIZE );

    i++;
    blocknum--;
    ap += BLOCK_SIZE;
  }

  if( blocknum == 1 ){

    if( (pad == 0) && (_alen != 0) ){
      Copy( in, ap, BLOCK_SIZE );
    }else{
      Copy( in, ap, pad );
      in[pad] = 0x80;
      for( d=pad+1; d<BLOCK_SIZE; d++ ) in[d] = 0x00;
    }
    Xor( in, t, BLOCK_SIZE );

    if( pad == 0 ){
      TEM_ENC( _K, FLG_AD, zero, i-1, 1, in, out );
    }else{
      TEM_ENC( _K, FLG_AD, zero, i-1, 2, in, out );
    }

    Copy( t, out, BLOCK_SIZE );
  }


  /*-- Ciphertext --*/
  i=1;
  blocknum = _clen/BLOCK_SIZE;

  while( blocknum > 1 ){

    Copy( in, cp, BLOCK_SIZE );
    TEM_ENC( _K, FLG_M, _N, 2*i, 0, in, out );
    Xor( t, out, BLOCK_SIZE );

    i++;
    blocknum--;
    cp += BLOCK_SIZE;
  }

  /* blocknum == 1 */
  for( d=0; d<BLOCK_SIZE; d++ ) in[d] = cp[d] ^ t[d];
  TEM_ENC( _K, FLG_M, _N, 2*i-1, 1, in, out );
  Copy( tag_, out, TAGBYTES );
}


/********************************************************************
 *  Name:       AEAD_MGEN                                           *
 *  Function:   Message Generation Algorithm of AEAD Mode           *
 *              (Algorithm 6)                                       *
 *  Return:     Accept(0)/Reject(-1)                                *
 *  Note:       return M & its length in arguments *M_ & mlen_      *
 ********************************************************************/
static int AEAD_MGEN(
  const unsigned char     *_K,    /* I    Secret key              */
  const unsigned char     *_N,    /* I    Nonce                   */
  const unsigned char     *_C,    /* I    Ciphertext              */
  unsigned long long      _clen,  /* I    Length of Ciphertext    */

  unsigned char           *M_,    /* O    Message                 */
  unsigned long long      *mlen_  /* O    Length of Message       */
  )
{
  int d, pad, cnt;
  unsigned long long i, blocknum, len;
  const unsigned char *cp;
  unsigned char *mp, in[BLOCK_SIZE], out[BLOCK_SIZE];

  i = 1;
  cp = _C;
  mp = M_;

  pad = 0;
  cnt = 0;
  len = 0;
  blocknum = _clen/BLOCK_SIZE;

  while( blocknum > 1 ){

    Copy( in, cp, BLOCK_SIZE );
    TEM_DEC( _K, FLG_M, _N, i, 0, in, out );
    Copy( mp, out, BLOCK_SIZE );

    i += 2;
    blocknum--;
    cp += BLOCK_SIZE;
    mp += BLOCK_SIZE;
    len += BLOCK_SIZE;
  }

  Copy( in, cp, BLOCK_SIZE );
  TEM_DEC( _K, FLG_M, _N, i, 0, in, out );
  for(d=BLOCK_SIZE-1; d>=0; d--){
    if( out[d]==0x80 ){
      Copy( mp, out, d );
      *mlen_ = len + d;
      return 0;
    }
    if( out[d]!=0x00 ) break;
  }
  return -1;
}


/********************************************************************
 *  Name:       AEAD_ENC                                            *
 *  Function:   Encryption Algorithm of AEAD Mode                   *
 *              (Algorithm 5)                                       *
 *  Return:     0                                                   *
 *  Note:       return *C_ & its length in arguments *clen_ & *tag_ *
 ********************************************************************/
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
)
{
  AEAD_CGEN( _K, _N, _M, _mlen, C_, clen_ );
  AEAD_TGEN( _K, _N, _AD, _adlen, C_, *clen_, tag_ );

  return 0;
}


/********************************************************************
 *  Name:       AEAD_DEC                                            *
 *  Function:   Decryption Algorithm of AEAD Mode                   *
 *              (Algorithm 7)                                       *
 *  Return:     Valid(0) / Invalid(-1)                              *
 *  Note:       return tag & its length in arguments *C_ & clen_    *
 ********************************************************************/
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
)
{
  int d, ret=0;
  unsigned char tagS[TAGBYTES];

  if( _clen < BLOCK_SIZE ) return -1;
  AEAD_TGEN( _K, _N, _AD, _adlen, _C, _clen, tagS );
  for( d=0; d<TAGBYTES; d++ ){
    if( _tag[d] != tagS[d] ) ret |= 1;
  }
  if( ret != 0 )  return -1;
  if(AEAD_MGEN( _K, _N, _C, _clen, M_, mlen_ ) < 0){
    return -1;
  }

  return 0;
}


/********************************************************************
 *  Name:       MAC_GEN                                             *
 *  Function:   Tag Generation Algorithm of MAC Mode                *
 *              (Algorithm 8)                                       *
 *  Return:     0                                                   *
 *  Note:       return tag & its length in arguments *C_ & clen_    *
 ********************************************************************/
int MAC_GEN(
  const unsigned char     *_K,    /* I    Secret key              */
  const unsigned char     *_M,    /* I    Message                 */
  unsigned long long      _mlen,  /* I    Length of Message       */

  unsigned char           *C_,    /* O    Tag                     */
  unsigned long long      *clen_  /* O    Length of Tag           */
  )
{
  int d, pad;
  unsigned long long i, blocknum;
  const unsigned char *mp;
  unsigned char *cp, in[BLOCK_SIZE], out[BLOCK_SIZE], t[BLOCK_SIZE], zero[NONCEBYTES];

  i = 1;
  mp = _M;
  cp = C_;

  pad = _mlen%BLOCK_SIZE;
  blocknum = _mlen/BLOCK_SIZE;
  if( (pad!=0) || (_mlen==0) ) blocknum += 1;
  Clear( t, BLOCK_SIZE );
  Clear( zero, NONCEBYTES );

  while( blocknum > 1 ){

    Copy( in, mp, BLOCK_SIZE );
    TEM_ENC( _K, FLG_MAC, zero, i, 0, in, out );
    Xor( t, out, BLOCK_SIZE );

    i++;
    blocknum--;
    mp += BLOCK_SIZE;
  }

  /* blocknum == 1 */
  if( (pad==0) && (_mlen!=0) ){
    Copy( in, mp, BLOCK_SIZE );
  }else{
    Copy( in, mp, pad );
    in[pad] = 0x80;
    for( d=pad+1; d<BLOCK_SIZE; d++ ) in[d] = 0x00;
  }

  Xor( in, t, BLOCK_SIZE );
  if( (pad==0) && (_mlen!=0) ){
    TEM_ENC( _K, FLG_MAC, zero, i-1, 1, in, out );
  }else{
    TEM_ENC( _K, FLG_MAC, zero, i-1, 2, in, out );
  }
  Copy( cp, out, TAGBYTES );
  *clen_ = TAGBYTES;

  return 0;
}


/********************************************************************
 *  Name:       MAC_VERIF                                           *
 *  Function:   Tag Verification Algorithm of MAC Mode              *
 *              (Algorithm 9)                                       *
 *  Return:     Accept(0)/Reject(-1)                                *
 ********************************************************************/
int MAC_VERIF(
  const unsigned char     *_K,    /* I    Secret key              */
  const unsigned char     *_M,    /* I    Message                 */
  unsigned long long      _mlen,  /* I    Length of Message       */

  const unsigned char     *_C,    /* I    Tag to be verified      */
  unsigned long long      _clen   /* I    Length of Tag           */
  )
{
  int result=0;
  unsigned long long d, len=0;
  unsigned char tag[TAGBYTES];

  result = MAC_GEN( _K, _M, _mlen, tag, &len );

  if( len != _clen ) result |= 1;
  for( d=0; d<len; d++ ){
    if( tag[d] != _C[d] ) result |= 1;
  }

  if( result != 0 ) return -1;
  return 0;
}
