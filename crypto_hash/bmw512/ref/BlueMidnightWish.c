/* Blue Midnight Wish hash function as it will be submitted to 
   NIST for the second round of SHA-3 competition.
   Changes in this version (compared to the version submitted for the Round 1):

   1. Corrected IV for 224 and 384 version.

   2. Tweaked f0() and f1()

   3. Use of final compression function invocation.

*/													

/* 
   This is a reference C code for Blue Midnight Wish hash function 
   as it will be submitted to NIST for the second round of SHA-3 competition.

   Programmed by Danilo Gligoroski, August 2009.
*/
#include <string.h> 
#include "BlueMidnightWish.h"

#define rotl32(x,n)   (((x) << (n)) | ((x) >> (32 - (n))))
#define rotr32(x,n)   (((x) >> (n)) | ((x) << (32 - (n))))

#define rotl64(x,n)   (((x) << (n)) | ((x) >> (64 - (n))))
#define rotr64(x,n)   (((x) >> (n)) | ((x) << (64 - (n))))

#define shl(x,n)      ((x) << n)
#define shr(x,n)      ((x) >> n)

/* BlueMidnightWish224 initial double chaining pipe */
const u_int32_t i224p2[16] =
{   0x00010203ul, 0x04050607ul, 0x08090a0bul, 0x0c0d0e0ful,
    0x10111213ul, 0x14151617ul, 0x18191a1bul, 0x1c1d1e1ful,
    0x20212223ul, 0x24252627ul, 0x28292a2bul, 0x2c2d2e2ful,
    0x30313233ul, 0x34353637ul, 0x38393a3bul, 0x3c3d3e3ful,
};

/* BlueMidnightWish256 initial double chaining pipe */
const u_int32_t i256p2[16] =
{   0x40414243ul, 0x44454647ul, 
    0x48494a4bul, 0x4c4d4e4ful,
    0x50515253ul, 0x54555657ul, 
	0x58595a5bul, 0x5c5d5e5ful,
    0x60616263ul, 0x64656667ul, 
	0x68696a6bul, 0x6c6d6e6ful,
    0x70717273ul, 0x74757677ul, 
	0x78797a7bul, 0x7c7d7e7ful,
};

/* BlueMidnightWish384 initial double chaining pipe */
const u_int64_t i384p2[16] =
{
    0x0001020304050607ull, 0x08090a0b0c0d0e0full,
    0x1011121314151617ull, 0x18191a1b1c1d1e1full,
    0x2021222324252627ull, 0x28292a2b2c2d2e2full,
    0x3031323334353637ull, 0x38393a3b3c3d3e3full,
    0x4041424344454647ull, 0x48494a4b4c4d4e4full,
    0x5051525354555657ull, 0x58595a5b5c5d5e5full,
    0x6061626364656667ull, 0x68696a6b6c6d6e6full,
    0x7071727374757677ull, 0x78797a7b7c7d7e7full
};

/* BlueMidnightWish512 initial double chaining pipe */
const u_int64_t i512p2[16] =
{
    0x8081828384858687ull, 0x88898a8b8c8d8e8full,
    0x9091929394959697ull, 0x98999a9b9c9d9e9full,
    0xa0a1a2a3a4a5a6a7ull, 0xa8a9aaabacadaeafull,
    0xb0b1b2b3b4b5b6b7ull, 0xb8b9babbbcbdbebfull,
    0xc0c1c2c3c4c5c6c7ull, 0xc8c9cacbcccdcecfull,
    0xd0d1d2d3d4d5d6d7ull, 0xd8d9dadbdcdddedfull,
    0xe0e1e2e3e4e5e6e7ull, 0xe8e9eaebecedeeefull,
    0xf0f1f2f3f4f5f6f7ull, 0xf8f9fafbfcfdfeffull
};


#define hashState224(x)  ((x)->pipe->p256)
#define hashState256(x)  ((x)->pipe->p256)
#define hashState384(x)  ((x)->pipe->p512)
#define hashState512(x)  ((x)->pipe->p512)

/* Components used for 224 and 256 bit version */
#define s32_0(x)  (shr((x), 1) ^ shl((x), 3) ^ rotl32((x),  4) ^ rotl32((x), 19))
#define s32_1(x)  (shr((x), 1) ^ shl((x), 2) ^ rotl32((x),  8) ^ rotl32((x), 23))
#define s32_2(x)  (shr((x), 2) ^ shl((x), 1) ^ rotl32((x), 12) ^ rotl32((x), 25))
#define s32_3(x)  (shr((x), 2) ^ shl((x), 2) ^ rotl32((x), 15) ^ rotl32((x), 29))
#define s32_4(x)  (shr((x), 1) ^ (x))
#define s32_5(x)  (shr((x), 2) ^ (x))
#define r32_01(x) rotl32((x),  3)
#define r32_02(x) rotl32((x),  7)
#define r32_03(x) rotl32((x), 13)
#define r32_04(x) rotl32((x), 16)
#define r32_05(x) rotl32((x), 19)
#define r32_06(x) rotl32((x), 23)
#define r32_07(x) rotl32((x), 27)

/* Message expansion function 1 */
u_int32_t expand32_1(int i, u_int32_t *M32, u_int32_t *H, u_int32_t *Q)
{
return ( s32_1(Q[i - 16])      + s32_2(Q[i - 15])   + s32_3(Q[i - 14]  ) + s32_0(Q[i - 13] )
           + s32_1(Q[i - 12])      + s32_2(Q[i - 11])   + s32_3(Q[i - 10]  ) + s32_0(Q[i -  9] )
		   + s32_1(Q[i -  8])      + s32_2(Q[i -  7])   + s32_3(Q[i -  6]  ) + s32_0(Q[i -  5] )
		   + s32_1(Q[i -  4])      + s32_2(Q[i -  3])   + s32_3(Q[i -  2]  ) + s32_0(Q[i -  1] )
		   + ((i*(0x05555555ul) + rotl32(M32[(i-16)%16],((i-16)%16)+1) + rotl32(M32[(i-13)%16],((i-13)%16)+1) - rotl32(M32[(i-6)%16],((i-6)%16)+1)) ^ H[(i-16+7)%16]) );
}

/* Message expansion function 2 */
u_int32_t expand32_2(int i, u_int32_t *M32, u_int32_t *H, u_int32_t *Q)
{
	return ( Q[i - 16]             + r32_01(Q[i - 15])  +        Q[i - 14]   + r32_02(Q[i - 13])
           + Q[i - 12]             + r32_03(Q[i - 11])  +        Q[i - 10]   + r32_04(Q[i -  9])
		   + Q[i -  8]             + r32_05(Q[i -  7])  +        Q[i -  6]   + r32_06(Q[i -  5])
		   + Q[i -  4]             + r32_07(Q[i -  3])  + s32_4( Q[i -  2] ) + s32_5( Q[i -  1])
		   + ((i*(0x05555555ul) + rotl32(M32[(i-16)%16],((i-16)%16)+1) + rotl32(M32[(i-13)%16],((i-13)%16)+1) - rotl32(M32[(i-6)%16],((i-6)%16)+1)) ^ H[(i-16+7)%16]) );
}

void Compression256(u_int32_t *M32, u_int32_t *H)
{
	int i;
	u_int32_t XL32, XH32, W[32], Q[32];

	/*  This part is the function f0 - in the documentation */

	/*  First we mix the message block *M32 (M in the documatation)        */
	/*  with the previous double pipe *H.                                  */
	/*  For a fixed previous double pipe, or fixed message block, this     */
	/*  part is bijection.                                                 */
	/*  This transformation diffuses every one bit difference in 5 words.  */
    W[ 0] = (M32[ 5] ^ H[ 5]) - (M32[ 7] ^ H[ 7]) + (M32[10] ^ H[10]) + (M32[13] ^ H[13]) + (M32[14] ^ H[14]);
    W[ 1] = (M32[ 6] ^ H[ 6]) - (M32[ 8] ^ H[ 8]) + (M32[11] ^ H[11]) + (M32[14] ^ H[14]) - (M32[15] ^ H[15]);
    W[ 2] = (M32[ 0] ^ H[ 0]) + (M32[ 7] ^ H[ 7]) + (M32[ 9] ^ H[ 9]) - (M32[12] ^ H[12]) + (M32[15] ^ H[15]);
    W[ 3] = (M32[ 0] ^ H[ 0]) - (M32[ 1] ^ H[ 1]) + (M32[ 8] ^ H[ 8]) - (M32[10] ^ H[10]) + (M32[13] ^ H[13]);
    W[ 4] = (M32[ 1] ^ H[ 1]) + (M32[ 2] ^ H[ 2]) + (M32[ 9] ^ H[ 9]) - (M32[11] ^ H[11]) - (M32[14] ^ H[14]);
    W[ 5] = (M32[ 3] ^ H[ 3]) - (M32[ 2] ^ H[ 2]) + (M32[10] ^ H[10]) - (M32[12] ^ H[12]) + (M32[15] ^ H[15]);
    W[ 6] = (M32[ 4] ^ H[ 4]) - (M32[ 0] ^ H[ 0]) - (M32[ 3] ^ H[ 3]) - (M32[11] ^ H[11]) + (M32[13] ^ H[13]);
    W[ 7] = (M32[ 1] ^ H[ 1]) - (M32[ 4] ^ H[ 4]) - (M32[ 5] ^ H[ 5]) - (M32[12] ^ H[12]) - (M32[14] ^ H[14]);
    W[ 8] = (M32[ 2] ^ H[ 2]) - (M32[ 5] ^ H[ 5]) - (M32[ 6] ^ H[ 6]) + (M32[13] ^ H[13]) - (M32[15] ^ H[15]);
    W[ 9] = (M32[ 0] ^ H[ 0]) - (M32[ 3] ^ H[ 3]) + (M32[ 6] ^ H[ 6]) - (M32[ 7] ^ H[ 7]) + (M32[14] ^ H[14]);
    W[10] = (M32[ 8] ^ H[ 8]) - (M32[ 1] ^ H[ 1]) - (M32[ 4] ^ H[ 4]) - (M32[ 7] ^ H[ 7]) + (M32[15] ^ H[15]);
    W[11] = (M32[ 8] ^ H[ 8]) - (M32[ 0] ^ H[ 0]) - (M32[ 2] ^ H[ 2]) - (M32[ 5] ^ H[ 5]) + (M32[ 9] ^ H[ 9]);
    W[12] = (M32[ 1] ^ H[ 1]) + (M32[ 3] ^ H[ 3]) - (M32[ 6] ^ H[ 6]) - (M32[ 9] ^ H[ 9]) + (M32[10] ^ H[10]);
    W[13] = (M32[ 2] ^ H[ 2]) + (M32[ 4] ^ H[ 4]) + (M32[ 7] ^ H[ 7]) + (M32[10] ^ H[10]) + (M32[11] ^ H[11]);
    W[14] = (M32[ 3] ^ H[ 3]) - (M32[ 5] ^ H[ 5]) + (M32[ 8] ^ H[ 8]) - (M32[11] ^ H[11]) - (M32[12] ^ H[12]);
    W[15] = (M32[12] ^ H[12]) - (M32[ 4] ^ H[ 4]) - (M32[ 6] ^ H[ 6]) - (M32[ 9] ^ H[ 9]) + (M32[13] ^ H[13]);

	/*  Diffuse the differences in every word in a bijective manner with s32_i, and then add the values of the previous double pipe.*/
	Q[ 0] = s32_0(W[ 0]) + H[ 1];
	Q[ 1] = s32_1(W[ 1]) + H[ 2];
	Q[ 2] = s32_2(W[ 2]) + H[ 3];
	Q[ 3] = s32_3(W[ 3]) + H[ 4];
	Q[ 4] = s32_4(W[ 4]) + H[ 5];
	Q[ 5] = s32_0(W[ 5]) + H[ 6];
	Q[ 6] = s32_1(W[ 6]) + H[ 7];
	Q[ 7] = s32_2(W[ 7]) + H[ 8];
	Q[ 8] = s32_3(W[ 8]) + H[ 9];
	Q[ 9] = s32_4(W[ 9]) + H[10];
	Q[10] = s32_0(W[10]) + H[11];
	Q[11] = s32_1(W[11]) + H[12];
	Q[12] = s32_2(W[12]) + H[13];
	Q[13] = s32_3(W[13]) + H[14];
	Q[14] = s32_4(W[14]) + H[15];
	Q[15] = s32_0(W[15]) + H[ 0];

	/* This is the Message expansion or f_1 in the documentation.       */
	/* It has 16 rounds.                                                */
	/* Blue Midnight Wish has two tunable security parameters.          */
	/* The parameters are named EXPAND_1_ROUNDS and EXPAND_2_ROUNDS.    */
	/* The following relation for these parameters should is satisfied: */
	/* EXPAND_1_ROUNDS + EXPAND_2_ROUNDS = 16                           */

	for (i=0; i<EXPAND_1_ROUNDS; i++)
		Q[i+16] = expand32_1(i+16, M32, H, Q);
	for (i=EXPAND_1_ROUNDS; i<EXPAND_1_ROUNDS + EXPAND_2_ROUNDS; i++)
		Q[i+16] = expand32_2(i+16, M32, H, Q);

	/* Blue Midnight Wish has two temporary cummulative variables that accumulate via XORing */
	/* 16 new variables that are prooduced in the Message Expansion part.                    */
	XL32 = Q[16]^Q[17]^Q[18]^Q[19]^Q[20]^Q[21]^Q[22]^Q[23];
	XH32 = XL32^Q[24]^Q[25]^Q[26]^Q[27]^Q[28]^Q[29]^Q[30]^Q[31];


	/*  This part is the function f_2 - in the documentation            */

	/*  Compute the double chaining pipe for the next message block.    */
	H[0] =                    (shl(XH32, 5) ^ shr(Q[16],5) ^ M32[ 0]) + (    XL32    ^ Q[24] ^ Q[ 0]);
	H[1] =                    (shr(XH32, 7) ^ shl(Q[17],8) ^ M32[ 1]) + (    XL32    ^ Q[25] ^ Q[ 1]);
	H[2] =                    (shr(XH32, 5) ^ shl(Q[18],5) ^ M32[ 2]) + (    XL32    ^ Q[26] ^ Q[ 2]);
	H[3] =                    (shr(XH32, 1) ^ shl(Q[19],5) ^ M32[ 3]) + (    XL32    ^ Q[27] ^ Q[ 3]);
	H[4] =                    (shr(XH32, 3) ^     Q[20]    ^ M32[ 4]) + (    XL32    ^ Q[28] ^ Q[ 4]);
	H[5] =                    (shl(XH32, 6) ^ shr(Q[21],6) ^ M32[ 5]) + (    XL32    ^ Q[29] ^ Q[ 5]);
	H[6] =                    (shr(XH32, 4) ^ shl(Q[22],6) ^ M32[ 6]) + (    XL32    ^ Q[30] ^ Q[ 6]);
	H[7] =                    (shr(XH32,11) ^ shl(Q[23],2) ^ M32[ 7]) + (    XL32    ^ Q[31] ^ Q[ 7]);

	H[ 8] = rotl32(H[4], 9) + (    XH32     ^     Q[24]    ^ M32[ 8]) + (shl(XL32,8) ^ Q[23] ^ Q[ 8]);
	H[ 9] = rotl32(H[5],10) + (    XH32     ^     Q[25]    ^ M32[ 9]) + (shr(XL32,6) ^ Q[16] ^ Q[ 9]);
	H[10] = rotl32(H[6],11) + (    XH32     ^     Q[26]    ^ M32[10]) + (shl(XL32,6) ^ Q[17] ^ Q[10]);
	H[11] = rotl32(H[7],12) + (    XH32     ^     Q[27]    ^ M32[11]) + (shl(XL32,4) ^ Q[18] ^ Q[11]);
	H[12] = rotl32(H[0],13) + (    XH32     ^     Q[28]    ^ M32[12]) + (shr(XL32,3) ^ Q[19] ^ Q[12]);
	H[13] = rotl32(H[1],14) + (    XH32     ^     Q[29]    ^ M32[13]) + (shr(XL32,4) ^ Q[20] ^ Q[13]);
	H[14] = rotl32(H[2],15) + (    XH32     ^     Q[30]    ^ M32[14]) + (shr(XL32,7) ^ Q[21] ^ Q[14]);
	H[15] = rotl32(H[3],16) + (    XH32     ^     Q[31]    ^ M32[15]) + (shr(XL32,2) ^ Q[22] ^ Q[15]);
}


/* Components used for 384 and 512 bit version */
#define s64_0(x)  (shr((x), 1) ^ shl((x), 3) ^ rotl64((x),  4) ^ rotl64((x), 37))
#define s64_1(x)  (shr((x), 1) ^ shl((x), 2) ^ rotl64((x), 13) ^ rotl64((x), 43))
#define s64_2(x)  (shr((x), 2) ^ shl((x), 1) ^ rotl64((x), 19) ^ rotl64((x), 53))
#define s64_3(x)  (shr((x), 2) ^ shl((x), 2) ^ rotl64((x), 28) ^ rotl64((x), 59))
#define s64_4(x)  (shr((x), 1) ^ (x))
#define s64_5(x)  (shr((x), 2) ^ (x))
#define r64_01(x) rotl64((x),  5)
#define r64_02(x) rotl64((x), 11)
#define r64_03(x) rotl64((x), 27)
#define r64_04(x) rotl64((x), 32)
#define r64_05(x) rotl64((x), 37)
#define r64_06(x) rotl64((x), 43)
#define r64_07(x) rotl64((x), 53)


/* Message expansion function 1 */
u_int64_t expand64_1(int i, u_int64_t *M64, u_int64_t *H, u_int64_t *Q)
{
	return ( s64_1(Q[i - 16])          + s64_2(Q[i - 15])   + s64_3(Q[i - 14]  ) + s64_0(Q[i - 13] )
           + s64_1(Q[i - 12])          + s64_2(Q[i - 11])   + s64_3(Q[i - 10]  ) + s64_0(Q[i -  9] )
		   + s64_1(Q[i -  8])          + s64_2(Q[i -  7])   + s64_3(Q[i -  6]  ) + s64_0(Q[i -  5] )
		   + s64_1(Q[i -  4])          + s64_2(Q[i -  3])   + s64_3(Q[i -  2]  ) + s64_0(Q[i -  1] )
		   + ((i*(0x0555555555555555ull) + rotl64(M64[(i-16)%16],((i-16)%16)+1) + rotl64(M64[(i-13)%16],((i-13)%16)+1) - rotl64(M64[(i-6)%16],((i-6)%16)+1)) ^ H[(i-16+7)%16]) );
}

/* Message expansion function 2 */
u_int64_t expand64_2(int i, u_int64_t *M64, u_int64_t *H, u_int64_t *Q)
{
	return ( Q[i - 16]                 + r64_01(Q[i - 15])  +        Q[i - 14]   + r64_02(Q[i - 13])
           + Q[i - 12]                 + r64_03(Q[i - 11])  +        Q[i - 10]   + r64_04(Q[i -  9])
		   + Q[i -  8]                 + r64_05(Q[i -  7])  +        Q[i -  6]   + r64_06(Q[i -  5])
		   + Q[i -  4]                 + r64_07(Q[i -  3])  + s64_4( Q[i -  2] ) + s64_5( Q[i -  1])
		   + ((i*(0x0555555555555555ull) + rotl64(M64[(i-16)%16],((i-16)%16)+1) + rotl64(M64[(i-13)%16],((i-13)%16)+1) - rotl64(M64[(i-6)%16],((i-6)%16)+1)) ^ H[(i-16+7)%16]) );
}

void Compression512(u_int64_t *M64, u_int64_t *H)
{
	int i;
	u_int64_t XL64, XH64, W[32], Q[32];

	/*  This part is the function f0 - in the documentation */

	/*  First we mix the message block *M64 (M in the documatation)        */
	/*  with the previous double pipe *P.                                  */
	/*  For a fixed previous double pipe, or fixed message block, this     */
	/*  part is bijection.                                                 */
	/*  This transformation diffuses every one bit difference in 5 words.  */
    W[ 0] = (M64[ 5] ^ H[ 5]) - (M64[ 7] ^ H[ 7]) + (M64[10] ^ H[10]) + (M64[13] ^ H[13]) + (M64[14] ^ H[14]);
    W[ 1] = (M64[ 6] ^ H[ 6]) - (M64[ 8] ^ H[ 8]) + (M64[11] ^ H[11]) + (M64[14] ^ H[14]) - (M64[15] ^ H[15]);
    W[ 2] = (M64[ 0] ^ H[ 0]) + (M64[ 7] ^ H[ 7]) + (M64[ 9] ^ H[ 9]) - (M64[12] ^ H[12]) + (M64[15] ^ H[15]);
    W[ 3] = (M64[ 0] ^ H[ 0]) - (M64[ 1] ^ H[ 1]) + (M64[ 8] ^ H[ 8]) - (M64[10] ^ H[10]) + (M64[13] ^ H[13]);
    W[ 4] = (M64[ 1] ^ H[ 1]) + (M64[ 2] ^ H[ 2]) + (M64[ 9] ^ H[ 9]) - (M64[11] ^ H[11]) - (M64[14] ^ H[14]);
    W[ 5] = (M64[ 3] ^ H[ 3]) - (M64[ 2] ^ H[ 2]) + (M64[10] ^ H[10]) - (M64[12] ^ H[12]) + (M64[15] ^ H[15]);
    W[ 6] = (M64[ 4] ^ H[ 4]) - (M64[ 0] ^ H[ 0]) - (M64[ 3] ^ H[ 3]) - (M64[11] ^ H[11]) + (M64[13] ^ H[13]);
    W[ 7] = (M64[ 1] ^ H[ 1]) - (M64[ 4] ^ H[ 4]) - (M64[ 5] ^ H[ 5]) - (M64[12] ^ H[12]) - (M64[14] ^ H[14]);
    W[ 8] = (M64[ 2] ^ H[ 2]) - (M64[ 5] ^ H[ 5]) - (M64[ 6] ^ H[ 6]) + (M64[13] ^ H[13]) - (M64[15] ^ H[15]);
    W[ 9] = (M64[ 0] ^ H[ 0]) - (M64[ 3] ^ H[ 3]) + (M64[ 6] ^ H[ 6]) - (M64[ 7] ^ H[ 7]) + (M64[14] ^ H[14]);
    W[10] = (M64[ 8] ^ H[ 8]) - (M64[ 1] ^ H[ 1]) - (M64[ 4] ^ H[ 4]) - (M64[ 7] ^ H[ 7]) + (M64[15] ^ H[15]);
    W[11] = (M64[ 8] ^ H[ 8]) - (M64[ 0] ^ H[ 0]) - (M64[ 2] ^ H[ 2]) - (M64[ 5] ^ H[ 5]) + (M64[ 9] ^ H[ 9]);
    W[12] = (M64[ 1] ^ H[ 1]) + (M64[ 3] ^ H[ 3]) - (M64[ 6] ^ H[ 6]) - (M64[ 9] ^ H[ 9]) + (M64[10] ^ H[10]);
    W[13] = (M64[ 2] ^ H[ 2]) + (M64[ 4] ^ H[ 4]) + (M64[ 7] ^ H[ 7]) + (M64[10] ^ H[10]) + (M64[11] ^ H[11]);
    W[14] = (M64[ 3] ^ H[ 3]) - (M64[ 5] ^ H[ 5]) + (M64[ 8] ^ H[ 8]) - (M64[11] ^ H[11]) - (M64[12] ^ H[12]);
    W[15] = (M64[12] ^ H[12]) - (M64[ 4] ^ H[ 4]) - (M64[ 6] ^ H[ 6]) - (M64[ 9] ^ H[ 9]) + (M64[13] ^ H[13]);

	/*  Diffuse the differences in every word in a bijective manner with s64_i, and then add the values of the previous double pipe.*/
	Q[ 0] = s64_0(W[ 0]) + H[ 1];
	Q[ 1] = s64_1(W[ 1]) + H[ 2];
	Q[ 2] = s64_2(W[ 2]) + H[ 3];
	Q[ 3] = s64_3(W[ 3]) + H[ 4];
	Q[ 4] = s64_4(W[ 4]) + H[ 5];
	Q[ 5] = s64_0(W[ 5]) + H[ 6];
	Q[ 6] = s64_1(W[ 6]) + H[ 7];
	Q[ 7] = s64_2(W[ 7]) + H[ 8];
	Q[ 8] = s64_3(W[ 8]) + H[ 9];
	Q[ 9] = s64_4(W[ 9]) + H[10];
	Q[10] = s64_0(W[10]) + H[11];
	Q[11] = s64_1(W[11]) + H[12];
	Q[12] = s64_2(W[12]) + H[13];
	Q[13] = s64_3(W[13]) + H[14];
	Q[14] = s64_4(W[14]) + H[15];
	Q[15] = s64_0(W[15]) + H[ 0];

	/* This is the Message expansion or f_1 in the documentation.       */
	/* It has 16 rounds.                                                */
	/* Blue Midnight Wish has two tunable security parameters.          */
	/* The parameters are named EXPAND_1_ROUNDS and EXPAND_2_ROUNDS.    */
	/* The following relation for these parameters should is satisfied: */
	/* EXPAND_1_ROUNDS + EXPAND_2_ROUNDS = 16                           */

	for (i=0; i<EXPAND_1_ROUNDS; i++)
		Q[i+16] = expand64_1(i+16, M64, H, Q);
	for (i=EXPAND_1_ROUNDS; i<EXPAND_1_ROUNDS + EXPAND_2_ROUNDS; i++)
		Q[i+16] = expand64_2(i+16, M64, H, Q);

	/* Blue Midnight Wish has two temporary cummulative variables that accumulate via XORing */
	/* 16 new variables that are prooduced in the Message Expansion part.                    */
	XL64 = Q[16]^Q[17]^Q[18]^Q[19]^Q[20]^Q[21]^Q[22]^Q[23];
	XH64 = XL64^Q[24]^Q[25]^Q[26]^Q[27]^Q[28]^Q[29]^Q[30]^Q[31];


	/*  This part is the function f_2 - in the documentation            */

	/*  Compute the double chaining pipe for the next message block.    */
	H[0] =                    (shl(XH64, 5) ^ shr(Q[16],5) ^ M64[ 0]) + (    XL64    ^ Q[24] ^ Q[ 0]);
	H[1] =                    (shr(XH64, 7) ^ shl(Q[17],8) ^ M64[ 1]) + (    XL64    ^ Q[25] ^ Q[ 1]);
	H[2] =                    (shr(XH64, 5) ^ shl(Q[18],5) ^ M64[ 2]) + (    XL64    ^ Q[26] ^ Q[ 2]);
	H[3] =                    (shr(XH64, 1) ^ shl(Q[19],5) ^ M64[ 3]) + (    XL64    ^ Q[27] ^ Q[ 3]);
	H[4] =                    (shr(XH64, 3) ^     Q[20]    ^ M64[ 4]) + (    XL64    ^ Q[28] ^ Q[ 4]);
	H[5] =                    (shl(XH64, 6) ^ shr(Q[21],6) ^ M64[ 5]) + (    XL64    ^ Q[29] ^ Q[ 5]);
	H[6] =                    (shr(XH64, 4) ^ shl(Q[22],6) ^ M64[ 6]) + (    XL64    ^ Q[30] ^ Q[ 6]);
	H[7] =                    (shr(XH64,11) ^ shl(Q[23],2) ^ M64[ 7]) + (    XL64    ^ Q[31] ^ Q[ 7]);

	H[ 8] = rotl64(H[4], 9) + (    XH64     ^     Q[24]    ^ M64[ 8]) + (shl(XL64,8) ^ Q[23] ^ Q[ 8]);
	H[ 9] = rotl64(H[5],10) + (    XH64     ^     Q[25]    ^ M64[ 9]) + (shr(XL64,6) ^ Q[16] ^ Q[ 9]);
	H[10] = rotl64(H[6],11) + (    XH64     ^     Q[26]    ^ M64[10]) + (shl(XL64,6) ^ Q[17] ^ Q[10]);
	H[11] = rotl64(H[7],12) + (    XH64     ^     Q[27]    ^ M64[11]) + (shl(XL64,4) ^ Q[18] ^ Q[11]);
	H[12] = rotl64(H[0],13) + (    XH64     ^     Q[28]    ^ M64[12]) + (shr(XL64,3) ^ Q[19] ^ Q[12]);
	H[13] = rotl64(H[1],14) + (    XH64     ^     Q[29]    ^ M64[13]) + (shr(XL64,4) ^ Q[20] ^ Q[13]);
	H[14] = rotl64(H[2],15) + (    XH64     ^     Q[30]    ^ M64[14]) + (shr(XL64,7) ^ Q[21] ^ Q[14]);
	H[15] = rotl64(H[3],16) + (    XH64     ^     Q[31]    ^ M64[15]) + (shr(XL64,2) ^ Q[22] ^ Q[15]);
}


HashReturn Init(hashState *state, int hashbitlen)
{
	switch(hashbitlen)
	{
		case 224:
		state->hashbitlen = 224;
		// #1 Between comments #1 and #2 add algorithm specific initialization
		state->bits_processed = 0;
		state->unprocessed_bits = 0;
		memcpy(hashState224(state)->DoublePipe, i224p2,  16 * sizeof(u_int32_t));
		// #2 Between comments #1 and #2 add algorithm specific initialization
		return(SUCCESS);

		case 256:
		state->hashbitlen = 256;
		// #1 Between comments #1 and #2 add algorithm specific initialization
		state->bits_processed = 0;
		state->unprocessed_bits = 0;
		memcpy(hashState256(state)->DoublePipe, i256p2,  16 * sizeof(u_int32_t));
		// #2 Between comments #1 and #2 add algorithm specific initialization
		return(SUCCESS);

		case 384:		
		state->hashbitlen = 384;
		// #1 Between comments #1 and #2 add algorithm specific initialization
		state->bits_processed = 0;
		state->unprocessed_bits = 0;
		memcpy(hashState384(state)->DoublePipe, i384p2,  16 * sizeof(u_int64_t));
		// #2 Between comments #1 and #2 add algorithm specific initialization
		return(SUCCESS);

		case 512:
		state->hashbitlen = 512;
		// #1 Between comments #1 and #2 add algorithm specific initialization
		state->bits_processed = 0;
		state->unprocessed_bits = 0;
		memcpy(hashState224(state)->DoublePipe, i512p2,  16 * sizeof(u_int64_t));
		// #2 Between comments #1 and #2 add algorithm specific initialization
		return(SUCCESS);

        default:    return(BAD_HASHLEN);
    }
}


HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen)
{
	u_int32_t *M32, *H256;
	u_int64_t *M64, *H512;
	int LastBytes;

	switch(state->hashbitlen)
	{
		case 224:
		case 256:
			if (state->unprocessed_bits > 0)
			{
				if ( state->unprocessed_bits + databitlen > BlueMidnightWish256_BLOCK_SIZE * 8)
				{
					return BAD_CONSECUTIVE_CALL_TO_UPDATE;
				}
				else
				{
					LastBytes = (int)databitlen >> 3; // LastBytes = databitlen / 8
					memcpy(hashState256(state)->LastPart + (state->unprocessed_bits >> 3), data, LastBytes );
					state->unprocessed_bits += (int)databitlen;
					databitlen = state->unprocessed_bits;
					M32 = (u_int32_t *)hashState256(state)->LastPart;
				}
			}
			else 
				M32 = (u_int32_t *)data;

			H256   = hashState256(state)->DoublePipe;
			while (databitlen >= BlueMidnightWish256_BLOCK_SIZE * 8)
			{
				databitlen -= BlueMidnightWish256_BLOCK_SIZE * 8;
				// #1 Between comments #1 and #2 add algorithm specifics

				state->bits_processed += BlueMidnightWish256_BLOCK_SIZE * 8;
				Compression256(M32, H256);
				M32 += 16;
			}
			state->unprocessed_bits = (int)databitlen;
			if (databitlen > 0)
			{
				LastBytes = ((~(((- (int)databitlen)>>3) & 0x01ff)) + 1) & 0x01ff;  // LastBytes = Ceil(databitlen / 8)
				memcpy(hashState256(state)->LastPart, M32, LastBytes );
			}
			// #2 Between comments #1 and #2 add algorithm specifics
			return(SUCCESS);


		case 384:
		case 512:
			if (state->unprocessed_bits > 0)
			{
				if ( state->unprocessed_bits + databitlen > BlueMidnightWish512_BLOCK_SIZE * 8)
				{
					return BAD_CONSECUTIVE_CALL_TO_UPDATE;
				}
				else
				{
					LastBytes = (int)databitlen >> 3; // LastBytes = databitlen / 8
					memcpy(hashState512(state)->LastPart + (state->unprocessed_bits >> 3), data, LastBytes );
					state->unprocessed_bits += (int)databitlen;
					databitlen = state->unprocessed_bits;
					M64 = (u_int64_t *)hashState512(state)->LastPart;
				}
			}
			else 
				M64 = (u_int64_t *)data;

			H512   = hashState512(state)->DoublePipe;
			while (databitlen >= BlueMidnightWish512_BLOCK_SIZE * 8)
			{
				databitlen -= BlueMidnightWish512_BLOCK_SIZE * 8;
				// #1 Between comments #1 and #2 add algorithm specifics

				state->bits_processed += BlueMidnightWish512_BLOCK_SIZE * 8;
				Compression512(M64, H512);
				M64 += 16;
			}
			state->unprocessed_bits = (int)databitlen;
			if (databitlen > 0)
			{
				LastBytes = ((~(((- (int)databitlen)>>3) & 0x03ff)) + 1) & 0x03ff; // LastBytes = Ceil(databitlen / 8)
				memcpy(hashState512(state)->LastPart, M64, LastBytes );
			}
			// #2 Between comments #1 and #2 add algorithm specifics
			return(SUCCESS);
		
		default:    return(BAD_HASHLEN); //This should never happen
	}
}


HashReturn Final(hashState *state, BitSequence *hashval)
{
	u_int32_t *M32, *H256;
	u_int64_t *M64, *H512;
	DataLength databitlen;
	int LastByte, PadOnePosition;
	u_int32_t CONST32final[16] =
	{
		0xaaaaaaa0ul,  0xaaaaaaa1ul,  0xaaaaaaa2ul, 0xaaaaaaa3ul,
		0xaaaaaaa4ul,  0xaaaaaaa5ul,  0xaaaaaaa6ul, 0xaaaaaaa7ul,
		0xaaaaaaa8ul,  0xaaaaaaa9ul,  0xaaaaaaaaul, 0xaaaaaaabul,
		0xaaaaaaacul,  0xaaaaaaadul,  0xaaaaaaaeul, 0xaaaaaaaful
	};
	
	u_int64_t CONST64final[16] =
	{
		0xaaaaaaaaaaaaaaa0ull,  0xaaaaaaaaaaaaaaa1ull,
		0xaaaaaaaaaaaaaaa2ull,  0xaaaaaaaaaaaaaaa3ull, 
		0xaaaaaaaaaaaaaaa4ull,  0xaaaaaaaaaaaaaaa5ull, 
		0xaaaaaaaaaaaaaaa6ull,  0xaaaaaaaaaaaaaaa7ull, 
		0xaaaaaaaaaaaaaaa8ull,  0xaaaaaaaaaaaaaaa9ull, 
		0xaaaaaaaaaaaaaaaaull,  0xaaaaaaaaaaaaaaabull, 
		0xaaaaaaaaaaaaaaacull,  0xaaaaaaaaaaaaaaadull, 
		0xaaaaaaaaaaaaaaaeull,  0xaaaaaaaaaaaaaaafull
	};

	H256 = NULL, H512 = NULL;

	switch(state->hashbitlen)
	{
		case 224:
		case 256:
			LastByte = (int)state->unprocessed_bits >> 3;
			PadOnePosition = 7 - (state->unprocessed_bits & 0x07);
			hashState256(state)->LastPart[LastByte] = (hashState256(state)->LastPart[LastByte] & (0xff << (PadOnePosition + 1) )) \
				                                    ^ (0x01 << PadOnePosition);
			M64 = (u_int64_t *)hashState256(state)->LastPart;

			if (state->unprocessed_bits < 448)
			{
				memset( (hashState256(state)->LastPart) + LastByte + 1, 0x00, BlueMidnightWish256_BLOCK_SIZE - LastByte - 9 );
				databitlen = BlueMidnightWish256_BLOCK_SIZE * 8;
				M64[7] = state->bits_processed + state->unprocessed_bits;
			}
			else
			{
				memset( (hashState256(state)->LastPart) + LastByte + 1, 0x00, BlueMidnightWish256_BLOCK_SIZE * 2 - LastByte - 9 );
				databitlen = BlueMidnightWish256_BLOCK_SIZE * 16;
				M64[15] = state->bits_processed + state->unprocessed_bits;
			}

			M32   = (u_int32_t *)hashState256(state)->LastPart;
			H256     = hashState256(state)->DoublePipe;
			while (databitlen >= BlueMidnightWish256_BLOCK_SIZE * 8)
			{
				databitlen -= BlueMidnightWish256_BLOCK_SIZE * 8;
				// #1 Between comments #1 and #2 add algorithm specifics
				Compression256(M32, H256);
				M32 += 16;
			}
			// #2 Between comments #1 and #2 add algorithm specifics
			break;


		case 384:
		case 512:
			LastByte = (int)state->unprocessed_bits >> 3;
			PadOnePosition = 7 - (state->unprocessed_bits & 0x07);
			hashState512(state)->LastPart[LastByte] = (hashState512(state)->LastPart[LastByte] & (0xff << (PadOnePosition + 1) )) \
				                                    ^ (0x01 << PadOnePosition);
			M64 = (u_int64_t *)hashState512(state)->LastPart;

			if (state->unprocessed_bits < 960)
			{
				memset( (hashState512(state)->LastPart) + LastByte + 1, 0x00, BlueMidnightWish512_BLOCK_SIZE - LastByte - 9 );
				databitlen = BlueMidnightWish512_BLOCK_SIZE * 8;
				M64[15] = state->bits_processed + state->unprocessed_bits;
			}
			else
			{
				memset( (hashState512(state)->LastPart) + LastByte + 1, 0x00, BlueMidnightWish512_BLOCK_SIZE * 2 - LastByte - 9 );
				databitlen = BlueMidnightWish512_BLOCK_SIZE * 16;
				M64[31] = state->bits_processed + state->unprocessed_bits;
			}

			H512   = hashState512(state)->DoublePipe;
			while (databitlen >= BlueMidnightWish512_BLOCK_SIZE * 8)
			{
				databitlen -= BlueMidnightWish512_BLOCK_SIZE * 8;
				// #1 Between comments #1 and #2 add algorithm specifics
				Compression512(M64, H512);
				M64 += 16;
			}
			break;
			// #2 Between comments #1 and #2 add algorithm specifics
		
		default:    return(BAD_HASHLEN); //This should never happen
	}

	// This is the tweak for Blue Midnight Wish, to be submitted on 15 September 2009.
	// Below is a code for final invocation of the compression function after digesting the
	// whole padded message. Here, the role of the message has the obtained final double pipe, 
	// and the role of the initial double pipe is a constant.
	switch(state->hashbitlen)
	{
		case 224:
		case 256:
			Compression256(H256, CONST32final);
			break;


		case 384:
		case 512:
			Compression512(H512, CONST64final);
			break;
		
		default:    return(BAD_HASHLEN); //This should never happen
	}


	switch(state->hashbitlen)
	{
		case 224:
			memcpy(hashval, CONST32final + 9, BlueMidnightWish224_DIGEST_SIZE );
			return(SUCCESS);
		case 256:
			memcpy(hashval, CONST32final + 8, BlueMidnightWish256_DIGEST_SIZE );
			return(SUCCESS);
		case 384:
			memcpy(hashval, CONST64final + 10, BlueMidnightWish384_DIGEST_SIZE );
			return(SUCCESS);
		case 512:
			memcpy(hashval, CONST64final + 8,  BlueMidnightWish512_DIGEST_SIZE );
			return(SUCCESS);
		default:    return(BAD_HASHLEN); //This should never happen
	}
}

HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval)
{
	HashReturn qq;
	hashState state;

	qq = Init(&state, hashbitlen);
	if (qq != SUCCESS) return(qq);
	qq = Update(&state, data, databitlen);
	if (qq != SUCCESS) return(qq);
	qq = Final(&state, hashval);
	return(qq);
}
