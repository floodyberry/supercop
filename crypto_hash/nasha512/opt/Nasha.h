/*
 ---------------------------------------------------------------------------
 Copyright (c) 2008, Aleksandra Mileva, UGD, Republic of Macedonia. All rights reserved.

 LICENSE TERMS

 The free distribution and use of this software in both source and binary
 form is allowed (with or without changes) provided that:

   1. distributions of this source code include the above copyright
      notice, and this list of conditions and the following disclaimer;

   2. distributions in binary form include the above copyright
      notice, this list of conditions and the following disclaimer
      in the documentation and/or other associated materials;

   3. the copyright holder's name is not used to endorse products
      built using this software without specific written permission.

 ALTERNATIVELY, provided that this notice is retained in full, this product
 may be distributed under the terms of the GNU General Public License (GPL),
 in which case the provisions of the GPL apply INSTEAD OF those given above.

 DISCLAIMER

 This software is provided 'as is' with no explicit or implied warranties
 in respect of its properties, including, but not limited to, correctness
 and/or fitness for purpose.
 ---------------------------------------------------------------------------
 Issue Date: 12/12/2008
*/


#ifndef _Nasha_H
#define _Nasha_H

#include <stdlib.h>

#include "brg_endian.h"
#include <crypto_uint64.h>
#include <crypto_uint32.h>
#include <crypto_uint16.h>
#include <crypto_uint8.h>

typedef crypto_uint64 uint_64t;
typedef crypto_uint32 uint_32t;
typedef crypto_uint16 uint_16t;
typedef crypto_uint8  uint_8t;
#define li_32(h) 0x##h##ul
#define li_64(h) 0x##h##ull

#define Nasha_64BIT

/* define the hash functions that you need  */
#define Nasha_   /* for dynamic hash length  */
#define Nasha_224
#define Nasha_256
#ifdef Nasha_64BIT
#define Nasha_384
#define Nasha_512
#endif

typedef unsigned char BitSequence;
typedef unsigned long long DataLength;
typedef enum {SUCCESS=0, FAIL=1, BAD_HASHLEN=2, BAD_DATABITLEN_FOR_UPDATE=3} HashReturn;

#define Nasha224_DIGEST_SIZE  28
#define Nasha224_BLOCK_SIZE   64
#define Nasha256_DIGEST_SIZE  32
#define Nasha256_BLOCK_SIZE   64

typedef union {
        uint_8t b8[8];
		uint_16t bit16[4];
		uint_32t bit32[2];
        uint_64t bit64;
} B64;

typedef struct {
	uint_64t count[2];
	uint_64t M[8];
    uint_64t H[4];
	uint_64t hash[4];
} hashState256;


#ifndef Nasha_64BIT
typedef struct
{   union
    { hashState256  hs256[1];
    } uu[1];
	int hashbitlen;
} hashState;
#define Nasha_MAX_DIGEST_SIZE    Nasha256_DIGEST_SIZE

#else

#define Nasha384_DIGEST_SIZE  48
#define Nasha384_BLOCK_SIZE  128
#define Nasha512_DIGEST_SIZE  64
#define Nasha512_BLOCK_SIZE  128
#define Nasha_MAX_DIGEST_SIZE    Nasha512_DIGEST_SIZE

typedef struct {
	uint_64t count[2];
	uint_64t M[16];
    uint_64t H[8];
	uint_64t hash[8];
} hashState512;

typedef struct
{   union
    { hashState256  hs256[1];
      hashState512  hs512[1];
    } uu[1];
	int hashbitlen;
} hashState;

void Nasha256_compile(hashState256 *state);
HashReturn Nasha224_Init(hashState *state);
HashReturn Nasha256_Init(hashState *state);
HashReturn Nasha256_Update(hashState256 *state, const BitSequence *data, DataLength databitlen);
HashReturn Nasha_Final1(hashState256 *state, BitSequence *hashval, const unsigned int hlen);
HashReturn Nasha224_Final(hashState256 *state, BitSequence *hashval);
HashReturn Nasha256_Final(hashState256 *state, BitSequence *hashval);
HashReturn Nasha224_Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval);
HashReturn Nasha256_Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval);

void Nasha512_compile(hashState512 *state);
HashReturn Nasha384_Init(hashState *state);
HashReturn Nasha512_Init(hashState *state);
HashReturn Nasha512_Update(hashState512 *state, const BitSequence *data, DataLength databitlen);
HashReturn Nasha_Final2(hashState512 *state, BitSequence *hashval,const unsigned int hlen);
HashReturn Nasha384_Final(hashState512 *state, BitSequence *hashval);
HashReturn Nasha512_Final(hashState512 *state, BitSequence *hashval);
HashReturn Nasha384_Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval);
HashReturn Nasha512_Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval);

HashReturn Init(hashState *state, int hashbitlen);
HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen);
HashReturn Final(hashState *state, BitSequence *hashval);
HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval);

#endif

#endif
