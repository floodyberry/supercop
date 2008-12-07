#include <string.h> 
#include "BlueMidnightWish.h"

#define rotl32(x,n)   (((x) << n) | ((x) >> (32 - n)))
#define rotr32(x,n)   (((x) >> n) | ((x) << (32 - n)))
//#define rotl32 _lrotl
//#define rotr32 _lrotr

#define rotl64(x,n)   (((x) << n) | ((x) >> (64 - n)))
#define rotr64(x,n)   (((x) >> n) | ((x) << (64 - n)))
//#define rotl64 _rotl64
//#define rotr64 _rotr64

#define shl(x,n)      ((x) << n)
#define shr(x,n)      ((x) >> n)

/* BlueMidnightWish224 initial double chaining pipe */
const u_int32_t i224p2[16] =
{   0x00010203ul, 0x04050607ul, 0x08090a0bul, 0x0c0d0e0ful,
    0x10111213ul, 0x14151617ul, 0x18191a1bul, 0x1c1d1e1ful,
    0x20212223ul, 0x24252627ul, 0x28292a2bul, 0x2c2d2e2ful,
    0x30313233ul, 0x24353637ul, 0x38393a3bul, 0x3c3d3e3ful,
};

/* BlueMidnightWish256 initial double chaining pipe */
const u_int32_t i256p2[16] =
{   0x40414243ul, 0x44454647ul, 0x48494a4bul, 0x4c4d4e4ful,
    0x50515253ul, 0x54555657ul, 0x58595a5bul, 0x5c5d5e5ful,
    0x60616263ul, 0x64656667ul, 0x68696a6bul, 0x6c6d6e6ful,
    0x70717273ul, 0x74757677ul, 0x78797a7bul, 0x7c7d7e7ful,
};

/* BlueMidnightWish384 initial double chaining pipe */
const u_int64_t i384p2[16] =
{
    0x0001020304050607ull, 0x08090a0b0c0d0e0full,
    0x1011121314151617ull, 0x18191a1b1c1d1e1full,
    0x2021222324252627ull, 0x28292a2b2c2d2e2full,
    0x3031323324353637ull, 0x38393a3b3c3d3e3full,
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


#define Compression256()\
{\
				/*  Mix the message block with the previous double pipe.       */\
                p256_00=p256[ 0]^data32[ 0]; p256_01=p256[ 1]^data32[ 1]; p256_02=p256[ 2]^data32[ 2]; p256_03=p256[ 3]^data32[ 3];\
                p256_04=p256[ 4]^data32[ 4]; p256_05=p256[ 5]^data32[ 5]; p256_06=p256[ 6]^data32[ 6]; p256_07=p256[ 7]^data32[ 7];\
                p256_08=p256[ 8]^data32[ 8]; p256_09=p256[ 9]^data32[ 9]; p256_10=p256[10]^data32[10]; p256_11=p256[11]^data32[11];\
                p256_12=p256[12]^data32[12]; p256_13=p256[13]^data32[13]; p256_14=p256[14]^data32[14]; p256_15=p256[15]^data32[15];\
\
				p256_16 = ( p256_05-p256_07+p256_10+p256_13+p256_14);\
				p256_17 = ( p256_06-p256_08+p256_11+p256_14-p256_15);\
				p256_18 = ( p256_00+p256_07+p256_09-p256_12+p256_15);\
				p256_19 = ( p256_00-p256_01+p256_08-p256_10+p256_13);\
				p256_20 = ( p256_01+p256_02+p256_09-p256_11-p256_14);\
	 			p256_21 = ( p256_03-p256_02+p256_10-p256_12+p256_15);\
				p256_22 = ( p256_04-p256_00-p256_03-p256_11+p256_13);\
				p256_23 = ( p256_01-p256_04-p256_05-p256_12-p256_14);\
				p256_24 = ( p256_02-p256_05-p256_06+p256_13-p256_15);\
				p256_25 = ( p256_00-p256_03+p256_06-p256_07+p256_14);\
				p256_26 = ( p256_08-p256_01-p256_04-p256_07+p256_15);\
				p256_27 = ( p256_08-p256_00-p256_02-p256_05+p256_09);\
				p256_28 = ( p256_01+p256_03-p256_06-p256_09+p256_10);\
				p256_29 = ( p256_02+p256_04+p256_07+p256_10+p256_11);\
				p256_30 = ( p256_03-p256_05+p256_08-p256_11-p256_12);\
				p256_31 = ( p256_12-p256_04-p256_06-p256_09+p256_13);\
\
				p256_00  = s32_0(p256_16);\
				p256_01  = s32_1(p256_17);\
				p256_02  = s32_2(p256_18);\
				p256_03  = s32_3(p256_19);\
				p256_04  = s32_4(p256_20);\
				p256_05  = s32_0(p256_21);\
				p256_06  = s32_1(p256_22);\
				p256_07  = s32_2(p256_23);\
				p256_08  = s32_3(p256_24);\
				p256_09  = s32_4(p256_25);\
				p256_10  = s32_0(p256_26);\
				p256_11  = s32_1(p256_27);\
				p256_12  = s32_2(p256_28);\
				p256_13  = s32_3(p256_29);\
				p256_14  = s32_4(p256_30);\
				p256_15  = s32_0(p256_31);\
\
				/* This is the Message expansion. */\
				/* It has 16 rounds.              */\
				p256_16  = s32_1(p256_00)    + s32_2(p256_01) + s32_3(p256_02) + s32_0(p256_03)\
                         + s32_1(p256_04)    + s32_2(p256_05) + s32_3(p256_06) + s32_0(p256_07)\
						 + s32_1(p256_08)    + s32_2(p256_09) + s32_3(p256_10) + s32_0(p256_11)\
						 + s32_1(p256_12)    + s32_2(p256_13) + s32_3(p256_14) + s32_0(p256_15)\
						 + 0x55555550ul + data32[0]      + data32[3]      - data32[10];\
				XL32 =  p256_16;\
				p256_17  = s32_1(p256_01)    + s32_2(p256_02) + s32_3(p256_03) + s32_0(p256_04)\
                         + s32_1(p256_05)    + s32_2(p256_06) + s32_3(p256_07) + s32_0(p256_08)\
						 + s32_1(p256_09)    + s32_2(p256_10) + s32_3(p256_11) + s32_0(p256_12)\
						 + s32_1(p256_13)    + s32_2(p256_14) + s32_3(p256_15) + s32_0(p256_16)\
						 + 0x5aaaaaa5ul + data32[1]      + data32[4]      - data32[11];\
				XL32 ^= p256_17;\
				TempEven32 = p256_14  + p256_12  + p256_10  + p256_08  + p256_06  + p256_04  + p256_02;\
				TempOdd32  = p256_15  + p256_13  + p256_11  + p256_09  + p256_07  + p256_05  + p256_03;\
\
				/* expand32_22(18); */\
				p256_18  = TempEven32 + r32_01(p256_03)  + r32_02(p256_05)\
					                  + r32_03(p256_07)  + r32_04(p256_09)\
									  + r32_05(p256_11)  + r32_06(p256_13)\
									  + r32_07(p256_15)  + s32_5( p256_16 ) + s32_4( p256_17)\
									  + 0x5ffffffaul + data32[2] + data32[5] - data32[12];\
				XL32 ^= p256_18;\
				/* expand32_21(19); */\
				p256_19 = TempOdd32   + r32_01(p256_04)  + r32_02(p256_06)\
                                      + r32_03(p256_08)  + r32_04(p256_10)\
							          + r32_05(p256_12)  + r32_06(p256_14)\
							          + r32_07(p256_16)  + s32_5( p256_17 ) + s32_4( p256_18)\
							          + 0x6555554ful + data32[3] + data32[6] - data32[13];\
				XL32 ^= p256_19;\
				TempEven32+=p256_16; TempEven32-=p256_02;\
				/* expand32_22(20); */\
				p256_20  = TempEven32 + r32_01(p256_05)  + r32_02(p256_07)\
					                  + r32_03(p256_09)  + r32_04(p256_11)\
									  + r32_05(p256_13)  + r32_06(p256_15)\
									  + r32_07(p256_17)  + s32_5( p256_18 ) + s32_4( p256_19)\
									  + 0x6aaaaaa4ul + data32[4] + data32[7] - data32[14];\
				XL32 ^= p256_20;\
				TempOdd32 +=p256_17; TempOdd32 -=p256_03;\
				/* expand32_21(21); */\
				p256_21 = TempOdd32   + r32_01(p256_06)  + r32_02(p256_08)\
                                      + r32_03(p256_10)  + r32_04(p256_12)\
							          + r32_05(p256_14)  + r32_06(p256_16)\
							          + r32_07(p256_18)  + s32_5( p256_19 ) + s32_4( p256_20)\
							          + 0x6ffffff9ul + data32[5] + data32[8] - data32[15];\
				XL32 ^= p256_21;\
				TempEven32+=p256_18; TempEven32-=p256_04;\
				/* expand32_22(22); */\
				p256_22  = TempEven32 + r32_01(p256_07)  + r32_02(p256_09)\
					                  + r32_03(p256_11)  + r32_04(p256_13)\
									  + r32_05(p256_15)  + r32_06(p256_17)\
									  + r32_07(p256_19)  + s32_5( p256_20 ) + s32_4( p256_21)\
									  + 0x7555554eul + data32[6] + data32[9] - data32[ 0];\
				XL32 ^= p256_22;\
				TempOdd32 +=p256_19; TempOdd32 -=p256_05;\
				/* expand32_21(23); */\
				p256_23 = TempOdd32   + r32_01(p256_08)  + r32_02(p256_10)\
                                      + r32_03(p256_12)  + r32_04(p256_14)\
							          + r32_05(p256_16)  + r32_06(p256_18)\
							          + r32_07(p256_20)  + s32_5( p256_21 ) + s32_4( p256_22)\
							          + 0x7aaaaaa3ul + data32[7] + data32[10] - data32[ 1];\
				XL32 ^= p256_23;\
				TempEven32+=p256_20; TempEven32-=p256_06;\
				/* expand32_22(24); */\
				p256_24  = TempEven32 + r32_01(p256_09)  + r32_02(p256_11)\
					                  + r32_03(p256_13)  + r32_04(p256_15)\
									  + r32_05(p256_17)  + r32_06(p256_19)\
									  + r32_07(p256_21)  + s32_5( p256_22 ) + s32_4( p256_23)\
									  + 0x7ffffff8ul + data32[8] + data32[11] - data32[ 2];\
				XH32 =  XL32^p256_24;\
				TempOdd32 +=p256_21; TempOdd32 -=p256_07;\
				/* expand32_21(25); */\
				p256_25 = TempOdd32   + r32_01(p256_10)  + r32_02(p256_12)\
                                      + r32_03(p256_14)  + r32_04(p256_16)\
							          + r32_05(p256_18)  + r32_06(p256_20)\
							          + r32_07(p256_22)  + s32_5( p256_23 ) + s32_4( p256_24)\
							          + 0x8555554dul + data32[9] + data32[12] - data32[ 3];\
				XH32 ^= p256_25;\
				TempEven32+=p256_22; TempEven32-=p256_08;\
				/* expand32_22(26); */\
				p256_26  = TempEven32 + r32_01(p256_11)  + r32_02(p256_13)\
					                  + r32_03(p256_15)  + r32_04(p256_17)\
									  + r32_05(p256_19)  + r32_06(p256_21)\
									  + r32_07(p256_23)  + s32_5( p256_24 ) + s32_4( p256_25)\
									  + 0x8aaaaaa2ul + data32[10] + data32[13] - data32[ 4];\
				XH32 ^= p256_26;\
				TempOdd32 +=p256_23; TempOdd32 -=p256_09;\
				/* expand32_21(27); */\
				p256_27 = TempOdd32   + r32_01(p256_12)  + r32_02(p256_14)\
                                      + r32_03(p256_16)  + r32_04(p256_18)\
							          + r32_05(p256_20)  + r32_06(p256_22)\
							          + r32_07(p256_24)  + s32_5( p256_25 ) + s32_4( p256_26)\
							          + 0x8ffffff7ul + data32[11] + data32[14] - data32[ 5];\
				XH32 ^= p256_27;\
				TempEven32+=p256_24; TempEven32-=p256_10;\
				/* expand32_22(28); */\
				p256_28  = TempEven32 + r32_01(p256_13)  + r32_02(p256_15)\
					                  + r32_03(p256_17)  + r32_04(p256_19)\
									  + r32_05(p256_21)  + r32_06(p256_23)\
									  + r32_07(p256_25)  + s32_5( p256_26 ) + s32_4( p256_27)\
									  + 0x9555554cul + data32[12] + data32[15] - data32[ 6];\
				XH32 ^= p256_28;\
				TempOdd32 +=p256_25; TempOdd32 -=p256_11;\
				/* expand32_21(29); */\
				p256_29 = TempOdd32   + r32_01(p256_14)  + r32_02(p256_16)\
                                      + r32_03(p256_18)  + r32_04(p256_20)\
							          + r32_05(p256_22)  + r32_06(p256_24)\
							          + r32_07(p256_26)  + s32_5( p256_27 ) + s32_4( p256_28)\
							          + 0x9aaaaaa1ul + data32[13] + data32[ 0] - data32[ 7];\
				XH32 ^= p256_29;\
				TempEven32+=p256_26; TempEven32-=p256_12;\
				/* expand32_22(30); */\
				p256_30  = TempEven32 + r32_01(p256_15)  + r32_02(p256_17)\
					                  + r32_03(p256_19)  + r32_04(p256_21)\
									  + r32_05(p256_23)  + r32_06(p256_25)\
									  + r32_07(p256_27)  + s32_5( p256_28 ) + s32_4( p256_29)\
									  + 0x9ffffff6ul + data32[14] + data32[ 1] - data32[ 8];\
				XH32 ^= p256_30;\
				TempOdd32 +=p256_27; TempOdd32 -=p256_13;\
				/* expand32_21(31); */\
				p256_31 = TempOdd32   + r32_01(p256_16)  + r32_02(p256_18)\
                                      + r32_03(p256_20)  + r32_04(p256_22)\
							          + r32_05(p256_24)  + r32_06(p256_26)\
							          + r32_07(p256_28)  + s32_5( p256_29 ) + s32_4( p256_30)\
							          + 0xa555554bul + data32[15] + data32[ 2] - data32[ 9];\
				XH32 ^= p256_31;\
\
				/*  Compute the double chaining pipe for the next message block. */\
				p256[0] =                       (shl(XH32, 5) ^ shr(p256_16,5) ^ data32[ 0]) + (    XL32    ^ p256_24 ^ p256_00);\
				p256[1] =                       (shr(XH32, 7) ^ shl(p256_17,8) ^ data32[ 1]) + (    XL32    ^ p256_25 ^ p256_01);\
				p256[2] =                       (shr(XH32, 5) ^ shl(p256_18,5) ^ data32[ 2]) + (    XL32    ^ p256_26 ^ p256_02);\
				p256[3] =                       (shr(XH32, 1) ^ shl(p256_19,5) ^ data32[ 3]) + (    XL32    ^ p256_27 ^ p256_03);\
				p256[4] =                       (shr(XH32, 3) ^     p256_20    ^ data32[ 4]) + (    XL32    ^ p256_28 ^ p256_04);\
				p256[5] =                       (shl(XH32, 6) ^ shr(p256_21,6) ^ data32[ 5]) + (    XL32    ^ p256_29 ^ p256_05);\
				p256[6] =                       (shr(XH32, 4) ^ shl(p256_22,6) ^ data32[ 6]) + (    XL32    ^ p256_30 ^ p256_06);\
				p256[7] =                       (shr(XH32,11) ^ shl(p256_23,2) ^ data32[ 7]) + (    XL32    ^ p256_31 ^ p256_07);\
\
				p256[ 8] = rotl32(p256[4], 9) + (    XH32     ^     p256_24    ^ data32[ 8]) + (shl(XL32,8) ^ p256_23 ^ p256_08);\
				p256[ 9] = rotl32(p256[5],10) + (    XH32     ^     p256_25    ^ data32[ 9]) + (shr(XL32,6) ^ p256_16 ^ p256_09);\
				p256[10] = rotl32(p256[6],11) + (    XH32     ^     p256_26    ^ data32[10]) + (shl(XL32,6) ^ p256_17 ^ p256_10);\
				p256[11] = rotl32(p256[7],12) + (    XH32     ^     p256_27    ^ data32[11]) + (shl(XL32,4) ^ p256_18 ^ p256_11);\
				p256[12] = rotl32(p256[0],13) + (    XH32     ^     p256_28    ^ data32[12]) + (shr(XL32,3) ^ p256_19 ^ p256_12);\
				p256[13] = rotl32(p256[1],14) + (    XH32     ^     p256_29    ^ data32[13]) + (shr(XL32,4) ^ p256_20 ^ p256_13);\
				p256[14] = rotl32(p256[2],15) + (    XH32     ^     p256_30    ^ data32[14]) + (shr(XL32,7) ^ p256_21 ^ p256_14);\
				p256[15] = rotl32(p256[3],16) + (    XH32     ^     p256_31    ^ data32[15]) + (shr(XL32,2) ^ p256_22 ^ p256_15);\
}


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

#define Compression512()\
{\
                p512_00=p512[ 0]^data64[ 0]; p512_01=p512[ 1]^data64[ 1]; p512_02=p512[ 2]^data64[ 2]; p512_03=p512[ 3]^data64[ 3];\
                p512_04=p512[ 4]^data64[ 4]; p512_05=p512[ 5]^data64[ 5]; p512_06=p512[ 6]^data64[ 6]; p512_07=p512[ 7]^data64[ 7];\
                p512_08=p512[ 8]^data64[ 8]; p512_09=p512[ 9]^data64[ 9]; p512_10=p512[10]^data64[10]; p512_11=p512[11]^data64[11];\
                p512_12=p512[12]^data64[12]; p512_13=p512[13]^data64[13]; p512_14=p512[14]^data64[14]; p512_15=p512[15]^data64[15];\
\
				p512_16 = ( p512_05-p512_07+p512_10+p512_13+p512_14);\
				p512_17 = ( p512_06-p512_08+p512_11+p512_14-p512_15);\
				p512_18 = ( p512_00+p512_07+p512_09-p512_12+p512_15);\
				p512_19 = ( p512_00-p512_01+p512_08-p512_10+p512_13);\
				p512_20 = ( p512_01+p512_02+p512_09-p512_11-p512_14);\
	 			p512_21 = ( p512_03-p512_02+p512_10-p512_12+p512_15);\
				p512_22 = ( p512_04-p512_00-p512_03-p512_11+p512_13);\
				p512_23 = ( p512_01-p512_04-p512_05-p512_12-p512_14);\
				p512_24 = ( p512_02-p512_05-p512_06+p512_13-p512_15);\
				p512_25 = ( p512_00-p512_03+p512_06-p512_07+p512_14);\
				p512_26 = ( p512_08-p512_01-p512_04-p512_07+p512_15);\
				p512_27 = ( p512_08-p512_00-p512_02-p512_05+p512_09);\
				p512_28 = ( p512_01+p512_03-p512_06-p512_09+p512_10);\
				p512_29 = ( p512_02+p512_04+p512_07+p512_10+p512_11);\
				p512_30 = ( p512_03-p512_05+p512_08-p512_11-p512_12);\
				p512_31 = ( p512_12-p512_04-p512_06-p512_09+p512_13);\
\
				p512_00  = s64_0(p512_16);\
				p512_01  = s64_1(p512_17);\
				p512_02  = s64_2(p512_18);\
				p512_03  = s64_3(p512_19);\
				p512_04  = s64_4(p512_20);\
				p512_05  = s64_0(p512_21);\
				p512_06  = s64_1(p512_22);\
				p512_07  = s64_2(p512_23);\
				p512_08  = s64_3(p512_24);\
				p512_09  = s64_4(p512_25);\
				p512_10  = s64_0(p512_26);\
				p512_11  = s64_1(p512_27);\
				p512_12  = s64_2(p512_28);\
				p512_13  = s64_3(p512_29);\
				p512_14  = s64_4(p512_30);\
				p512_15  = s64_0(p512_31);\
\
				/* This is the Message expansion. */\
				/* It has 16 rounds.              */\
				p512_16  = s64_1(p512_00)    + s64_2(p512_01) + s64_3(p512_02) + s64_0(p512_03)\
                         + s64_1(p512_04)    + s64_2(p512_05) + s64_3(p512_06) + s64_0(p512_07)\
						 + s64_1(p512_08)    + s64_2(p512_09) + s64_3(p512_10) + s64_0(p512_11)\
						 + s64_1(p512_12)    + s64_2(p512_13) + s64_3(p512_14) + s64_0(p512_15)\
						 + 0x5555555555555550ull + data64[0]      + data64[3]      - data64[10];\
				XL64 =  p512_16;\
				p512_17  = s64_1(p512_01)    + s64_2(p512_02) + s64_3(p512_03) + s64_0(p512_04)\
                         + s64_1(p512_05)    + s64_2(p512_06) + s64_3(p512_07) + s64_0(p512_08)\
						 + s64_1(p512_09)    + s64_2(p512_10) + s64_3(p512_11) + s64_0(p512_12)\
						 + s64_1(p512_13)    + s64_2(p512_14) + s64_3(p512_15) + s64_0(p512_16)\
						 + 0x5aaaaaaaaaaaaaa5ull + data64[1]      + data64[4]      - data64[11];\
				XL64 ^= p512_17;\
				TempEven64 = p512_14  + p512_12  + p512_10  + p512_08  + p512_06  + p512_04  + p512_02;\
				TempOdd64  = p512_15  + p512_13  + p512_11  + p512_09  + p512_07  + p512_05  + p512_03;\
\
				/* expand64_22(18); */\
				p512_18  = TempEven64 + r64_01(p512_03)  + r64_02(p512_05)\
					                  + r64_03(p512_07)  + r64_04(p512_09)\
									  + r64_05(p512_11)  + r64_06(p512_13)\
									  + r64_07(p512_15)  + s64_5( p512_16 ) + s64_4( p512_17)\
									  + 0x5ffffffffffffffaull + data64[2] + data64[5] - data64[12];\
				XL64 ^= p512_18;\
				/* expand64_21(19); */\
				p512_19 = TempOdd64   + r64_01(p512_04)  + r64_02(p512_06)\
                                      + r64_03(p512_08)  + r64_04(p512_10)\
							          + r64_05(p512_12)  + r64_06(p512_14)\
							          + r64_07(p512_16)  + s64_5( p512_17 ) + s64_4( p512_18)\
							          + 0x655555555555554full + data64[3] + data64[6] - data64[13];\
				XL64 ^= p512_19;\
				TempEven64+=p512_16; TempEven64-=p512_02;\
				/* expand64_22(20); */\
				p512_20  = TempEven64 + r64_01(p512_05)  + r64_02(p512_07)\
					                  + r64_03(p512_09)  + r64_04(p512_11)\
									  + r64_05(p512_13)  + r64_06(p512_15)\
									  + r64_07(p512_17)  + s64_5( p512_18 ) + s64_4( p512_19)\
									  + 0x6aaaaaaaaaaaaaa4ull + data64[4] + data64[7] - data64[14];\
				XL64 ^= p512_20;\
				TempOdd64 +=p512_17; TempOdd64 -=p512_03;\
				/* expand64_21(21); */\
				p512_21 = TempOdd64   + r64_01(p512_06)  + r64_02(p512_08)\
                                      + r64_03(p512_10)  + r64_04(p512_12)\
							          + r64_05(p512_14)  + r64_06(p512_16)\
							          + r64_07(p512_18)  + s64_5( p512_19 ) + s64_4( p512_20)\
							          + 0x6ffffffffffffff9ull + data64[5] + data64[8] - data64[15];\
				XL64 ^= p512_21;\
				TempEven64+=p512_18; TempEven64-=p512_04;\
				/* expand64_22(22); */\
				p512_22  = TempEven64 + r64_01(p512_07)  + r64_02(p512_09)\
					                  + r64_03(p512_11)  + r64_04(p512_13)\
									  + r64_05(p512_15)  + r64_06(p512_17)\
									  + r64_07(p512_19)  + s64_5( p512_20 ) + s64_4( p512_21)\
									  + 0x755555555555554eull + data64[6] + data64[9] - data64[ 0];\
				XL64 ^= p512_22;\
				TempOdd64 +=p512_19; TempOdd64 -=p512_05;\
				/* expand64_21(23); */\
				p512_23 = TempOdd64   + r64_01(p512_08)  + r64_02(p512_10)\
                                      + r64_03(p512_12)  + r64_04(p512_14)\
							          + r64_05(p512_16)  + r64_06(p512_18)\
							          + r64_07(p512_20)  + s64_5( p512_21 ) + s64_4( p512_22)\
							          + 0x7aaaaaaaaaaaaaa3ull + data64[7] + data64[10] - data64[ 1];\
				XL64 ^= p512_23;\
				TempEven64+=p512_20; TempEven64-=p512_06;\
				/* expand64_22(24); */\
				p512_24  = TempEven64 + r64_01(p512_09)  + r64_02(p512_11)\
					                  + r64_03(p512_13)  + r64_04(p512_15)\
									  + r64_05(p512_17)  + r64_06(p512_19)\
									  + r64_07(p512_21)  + s64_5( p512_22 ) + s64_4( p512_23)\
									  + 0x7ffffffffffffff8ull + data64[8] + data64[11] - data64[ 2];\
				XH64 =  XL64^p512_24;\
				TempOdd64 +=p512_21; TempOdd64 -=p512_07;\
				/* expand64_21(25); */\
				p512_25 = TempOdd64   + r64_01(p512_10)  + r64_02(p512_12)\
                                      + r64_03(p512_14)  + r64_04(p512_16)\
							          + r64_05(p512_18)  + r64_06(p512_20)\
							          + r64_07(p512_22)  + s64_5( p512_23 ) + s64_4( p512_24)\
							          + 0x855555555555554dull + data64[9] + data64[12] - data64[ 3];\
				XH64 ^= p512_25;\
				TempEven64+=p512_22; TempEven64-=p512_08;\
				/* expand64_22(26); */\
				p512_26  = TempEven64 + r64_01(p512_11)  + r64_02(p512_13)\
					                  + r64_03(p512_15)  + r64_04(p512_17)\
									  + r64_05(p512_19)  + r64_06(p512_21)\
									  + r64_07(p512_23)  + s64_5( p512_24 ) + s64_4( p512_25)\
									  + 0x8aaaaaaaaaaaaaa2ull + data64[10] + data64[13] - data64[ 4];\
				XH64 ^= p512_26;\
				TempOdd64 +=p512_23; TempOdd64 -=p512_09;\
				/* expand64_21(27); */\
				p512_27 = TempOdd64   + r64_01(p512_12)  + r64_02(p512_14)\
                                      + r64_03(p512_16)  + r64_04(p512_18)\
							          + r64_05(p512_20)  + r64_06(p512_22)\
							          + r64_07(p512_24)  + s64_5( p512_25 ) + s64_4( p512_26)\
							          + 0x8ffffffffffffff7ull + data64[11] + data64[14] - data64[ 5];\
				XH64 ^= p512_27;\
				TempEven64+=p512_24; TempEven64-=p512_10;\
				/* expand64_22(28); */\
				p512_28  = TempEven64 + r64_01(p512_13)  + r64_02(p512_15)\
					                  + r64_03(p512_17)  + r64_04(p512_19)\
									  + r64_05(p512_21)  + r64_06(p512_23)\
									  + r64_07(p512_25)  + s64_5( p512_26 ) + s64_4( p512_27)\
									  + 0x955555555555554cull + data64[12] + data64[15] - data64[ 6];\
				XH64 ^= p512_28;\
				TempOdd64 +=p512_25; TempOdd64 -=p512_11;\
				/* expand64_21(29); */\
				p512_29 = TempOdd64   + r64_01(p512_14)  + r64_02(p512_16)\
                                      + r64_03(p512_18)  + r64_04(p512_20)\
							          + r64_05(p512_22)  + r64_06(p512_24)\
							          + r64_07(p512_26)  + s64_5( p512_27 ) + s64_4( p512_28)\
							          + 0x9aaaaaaaaaaaaaa1ull + data64[13] + data64[ 0] - data64[ 7];\
				XH64 ^= p512_29;\
				TempEven64+=p512_26; TempEven64-=p512_12;\
				/* expand64_22(30); */\
				p512_30  = TempEven64 + r64_01(p512_15)  + r64_02(p512_17)\
					                  + r64_03(p512_19)  + r64_04(p512_21)\
									  + r64_05(p512_23)  + r64_06(p512_25)\
									  + r64_07(p512_27)  + s64_5( p512_28 ) + s64_4( p512_29)\
									  + 0x9ffffffffffffff6ull + data64[14] + data64[ 1] - data64[ 8];\
				XH64 ^= p512_30;\
				TempOdd64 +=p512_27; TempOdd64 -=p512_13;\
				/* expand64_21(31); */\
				p512_31 = TempOdd64   + r64_01(p512_16)  + r64_02(p512_18)\
                                      + r64_03(p512_20)  + r64_04(p512_22)\
							          + r64_05(p512_24)  + r64_06(p512_26)\
							          + r64_07(p512_28)  + s64_5( p512_29 ) + s64_4( p512_30)\
							          + 0xa55555555555554bull + data64[15] + data64[ 2] - data64[ 9];\
				XH64 ^= p512_31;\
\
				/*  Compute the double chaining pipe for the next message block. */\
				p512[0] =                       (shl(XH64, 5) ^ shr(p512_16,5) ^ data64[ 0]) + (    XL64    ^ p512_24 ^ p512_00);\
				p512[1] =                       (shr(XH64, 7) ^ shl(p512_17,8) ^ data64[ 1]) + (    XL64    ^ p512_25 ^ p512_01);\
				p512[2] =                       (shr(XH64, 5) ^ shl(p512_18,5) ^ data64[ 2]) + (    XL64    ^ p512_26 ^ p512_02);\
				p512[3] =                       (shr(XH64, 1) ^ shl(p512_19,5) ^ data64[ 3]) + (    XL64    ^ p512_27 ^ p512_03);\
				p512[4] =                       (shr(XH64, 3) ^     p512_20    ^ data64[ 4]) + (    XL64    ^ p512_28 ^ p512_04);\
				p512[5] =                       (shl(XH64, 6) ^ shr(p512_21,6) ^ data64[ 5]) + (    XL64    ^ p512_29 ^ p512_05);\
				p512[6] =                       (shr(XH64, 4) ^ shl(p512_22,6) ^ data64[ 6]) + (    XL64    ^ p512_30 ^ p512_06);\
				p512[7] =                       (shr(XH64,11) ^ shl(p512_23,2) ^ data64[ 7]) + (    XL64    ^ p512_31 ^ p512_07);\
\
				p512[ 8] = rotl64(p512[4], 9) + (    XH64     ^     p512_24    ^ data64[ 8]) + (shl(XL64,8) ^ p512_23 ^ p512_08);\
				p512[ 9] = rotl64(p512[5],10) + (    XH64     ^     p512_25    ^ data64[ 9]) + (shr(XL64,6) ^ p512_16 ^ p512_09);\
				p512[10] = rotl64(p512[6],11) + (    XH64     ^     p512_26    ^ data64[10]) + (shl(XL64,6) ^ p512_17 ^ p512_10);\
				p512[11] = rotl64(p512[7],12) + (    XH64     ^     p512_27    ^ data64[11]) + (shl(XL64,4) ^ p512_18 ^ p512_11);\
				p512[12] = rotl64(p512[0],13) + (    XH64     ^     p512_28    ^ data64[12]) + (shr(XL64,3) ^ p512_19 ^ p512_12);\
				p512[13] = rotl64(p512[1],14) + (    XH64     ^     p512_29    ^ data64[13]) + (shr(XL64,4) ^ p512_20 ^ p512_13);\
				p512[14] = rotl64(p512[2],15) + (    XH64     ^     p512_30    ^ data64[14]) + (shr(XL64,7) ^ p512_21 ^ p512_14);\
				p512[15] = rotl64(p512[3],16) + (    XH64     ^     p512_31    ^ data64[15]) + (shr(XL64,2) ^ p512_22 ^ p512_15);\
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
	u_int32_t *data32, *p256;
	u_int32_t XL32, XH32, TempEven32, TempOdd32;
    u_int32_t p256_00, p256_01, p256_02, p256_03, p256_04, p256_05, p256_06, p256_07;
    u_int32_t p256_08, p256_09, p256_10, p256_11, p256_12, p256_13, p256_14, p256_15;
    u_int32_t p256_16, p256_17, p256_18, p256_19, p256_20, p256_21, p256_22, p256_23;
    u_int32_t p256_24, p256_25, p256_26, p256_27, p256_28, p256_29, p256_30, p256_31;

	u_int64_t *data64, *p512;
	u_int64_t XL64, XH64, TempEven64, TempOdd64;
    u_int64_t p512_00, p512_01, p512_02, p512_03, p512_04, p512_05, p512_06, p512_07;
    u_int64_t p512_08, p512_09, p512_10, p512_11, p512_12, p512_13, p512_14, p512_15;
    u_int64_t p512_16, p512_17, p512_18, p512_19, p512_20, p512_21, p512_22, p512_23;
    u_int64_t p512_24, p512_25, p512_26, p512_27, p512_28, p512_29, p512_30, p512_31;

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
					data32 = (u_int32_t *)hashState256(state)->LastPart;
				}
			}
			else 
				data32 = (u_int32_t *)data;

			p256   = hashState256(state)->DoublePipe;
			while (databitlen >= BlueMidnightWish256_BLOCK_SIZE * 8)
			{
				databitlen -= BlueMidnightWish256_BLOCK_SIZE * 8;
				// #1 Between comments #1 and #2 add algorithm specifics

				state->bits_processed += BlueMidnightWish256_BLOCK_SIZE * 8;
				Compression256();
				data32 += 16;
			}
			state->unprocessed_bits = (int)databitlen;
			if (databitlen > 0)
			{
				LastBytes = ((~(((- (int)databitlen)>>3) & 0x01ff)) + 1) & 0x01ff;  // LastBytes = Ceil(databitlen / 8)
				memcpy(hashState256(state)->LastPart, data32, LastBytes );
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
					data64 = (u_int64_t *)hashState512(state)->LastPart;
				}
			}
			else 
				data64 = (u_int64_t *)data;

			p512   = hashState512(state)->DoublePipe;
			while (databitlen >= BlueMidnightWish512_BLOCK_SIZE * 8)
			{
				databitlen -= BlueMidnightWish512_BLOCK_SIZE * 8;
				// #1 Between comments #1 and #2 add algorithm specifics

				state->bits_processed += BlueMidnightWish512_BLOCK_SIZE * 8;
				Compression512();
				data64 += 16;
			}
			state->unprocessed_bits = (int)databitlen;
			if (databitlen > 0)
			{
				LastBytes = ((~(((- (int)databitlen)>>3) & 0x03ff)) + 1) & 0x03ff; // LastBytes = Ceil(databitlen / 8)
				memcpy(hashState512(state)->LastPart, data64, LastBytes );
			}
			// #2 Between comments #1 and #2 add algorithm specifics
			return(SUCCESS);
		
		default:    return(BAD_HASHLEN); //This should never happen
	}
}


HashReturn Final(hashState *state, BitSequence *hashval)
{
	u_int32_t *data32, *p256;
	u_int32_t XL32, XH32, TempEven32, TempOdd32;
    u_int32_t p256_00, p256_01, p256_02, p256_03, p256_04, p256_05, p256_06, p256_07;
    u_int32_t p256_08, p256_09, p256_10, p256_11, p256_12, p256_13, p256_14, p256_15;
    u_int32_t p256_16, p256_17, p256_18, p256_19, p256_20, p256_21, p256_22, p256_23;
    u_int32_t p256_24, p256_25, p256_26, p256_27, p256_28, p256_29, p256_30, p256_31;

	u_int64_t *data64, *p512;
	u_int64_t XL64, XH64, TempEven64, TempOdd64;
    u_int64_t p512_00, p512_01, p512_02, p512_03, p512_04, p512_05, p512_06, p512_07;
    u_int64_t p512_08, p512_09, p512_10, p512_11, p512_12, p512_13, p512_14, p512_15;
    u_int64_t p512_16, p512_17, p512_18, p512_19, p512_20, p512_21, p512_22, p512_23;
    u_int64_t p512_24, p512_25, p512_26, p512_27, p512_28, p512_29, p512_30, p512_31;

	DataLength databitlen;

	int LastByte, PadOnePosition;

	switch(state->hashbitlen)
	{
		case 224:
		case 256:
			LastByte = (int)state->unprocessed_bits >> 3;
			PadOnePosition = 7 - (state->unprocessed_bits & 0x07);
			hashState256(state)->LastPart[LastByte] = hashState256(state)->LastPart[LastByte] & (0xff << (PadOnePosition + 1) )\
				                                    ^ (0x01 << PadOnePosition);
			data64 = (u_int64_t *)hashState256(state)->LastPart;

			if (state->unprocessed_bits < 448)
			{
				memset( (hashState256(state)->LastPart) + LastByte + 1, 0x00, BlueMidnightWish256_BLOCK_SIZE - LastByte - 9 );
				databitlen = BlueMidnightWish256_BLOCK_SIZE * 8;
				data64[7] = state->bits_processed + state->unprocessed_bits;
			}
			else
			{
				memset( (hashState256(state)->LastPart) + LastByte + 1, 0x00, BlueMidnightWish256_BLOCK_SIZE * 2 - LastByte - 9 );
				databitlen = BlueMidnightWish256_BLOCK_SIZE * 16;
				data64[15] = state->bits_processed + state->unprocessed_bits;
			}

			data32   = (u_int32_t *)hashState256(state)->LastPart;
			p256     = hashState256(state)->DoublePipe;
			while (databitlen >= BlueMidnightWish256_BLOCK_SIZE * 8)
			{
				databitlen -= BlueMidnightWish256_BLOCK_SIZE * 8;
				// #1 Between comments #1 and #2 add algorithm specifics
				Compression256();
				data32 += 16;
			}
			// #2 Between comments #1 and #2 add algorithm specifics
			break;


		case 384:
		case 512:
			LastByte = (int)state->unprocessed_bits >> 3;
			PadOnePosition = 7 - (state->unprocessed_bits & 0x07);
			hashState512(state)->LastPart[LastByte] = hashState512(state)->LastPart[LastByte] & (0xff << (PadOnePosition + 1) )\
				                                    ^ (0x01 << PadOnePosition);
			data64 = (u_int64_t *)hashState512(state)->LastPart;

			if (state->unprocessed_bits < 960)
			{
				memset( (hashState512(state)->LastPart) + LastByte + 1, 0x00, BlueMidnightWish512_BLOCK_SIZE - LastByte - 9 );
				databitlen = BlueMidnightWish512_BLOCK_SIZE * 8;
				data64[15] = state->bits_processed + state->unprocessed_bits;
			}
			else
			{
				memset( (hashState512(state)->LastPart) + LastByte + 1, 0x00, BlueMidnightWish512_BLOCK_SIZE * 2 - LastByte - 9 );
				databitlen = BlueMidnightWish512_BLOCK_SIZE * 16;
				data64[31] = state->bits_processed + state->unprocessed_bits;
			}

			p512   = hashState512(state)->DoublePipe;
			while (databitlen >= BlueMidnightWish512_BLOCK_SIZE * 8)
			{
				databitlen -= BlueMidnightWish512_BLOCK_SIZE * 8;
				// #1 Between comments #1 and #2 add algorithm specifics
				Compression512();
				data64 += 16;
			}
			break;
			// #2 Between comments #1 and #2 add algorithm specifics
		
		default:    return(BAD_HASHLEN); //This should never happen
	}


	switch(state->hashbitlen)
	{
		case 224:
			memcpy(hashval, p256 + 9, BlueMidnightWish224_DIGEST_SIZE );
			return(SUCCESS);
		case 256:
			memcpy(hashval, p256 + 8, BlueMidnightWish256_DIGEST_SIZE );
			return(SUCCESS);
		case 384:
			memcpy(hashval, p512 + 10, BlueMidnightWish384_DIGEST_SIZE );
			return(SUCCESS);
		case 512:
			memcpy(hashval, p512 + 8,  BlueMidnightWish512_DIGEST_SIZE );
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
