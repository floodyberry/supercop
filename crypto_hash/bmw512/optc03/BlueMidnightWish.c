/* 
   Optimized C code for tweaked Blue Midnight Wish - 512 programmed by Rune E. Jensen, December 2009.
*/

#include <stdio.h>
#include <string.h> 
#include "BlueMidnightWish.h"

#define rotl64(x,n)   (((x) << n) | ((x) >> (64 - n)))
#define rotr64(x,n)   (((x) >> n) | ((x) << (64 - n)))

#define shl(x,n)      ((x) << n)
#define shr(x,n)      ((x) >> n)

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

#define hashState512(x)  ((x)->pipe->p512)

/* Components used for 384 and 512 bit version */
//#define s64_0(x)  (shr((x), 1) ^ shl((x), 3) ^ rotl64((x),  4) ^ rotl64((x), 37))
//#define s64_1(x)  (shr((x), 1) ^ shl((x), 2) ^ rotl64((x), 13) ^ rotl64((x), 43))
//#define s64_2(x)  (shr((x), 2) ^ shl((x), 1) ^ rotl64((x), 19) ^ rotl64((x), 53))
//#define s64_3(x)  (shr((x), 2) ^ shl((x), 2) ^ rotl64((x), 28) ^ rotl64((x), 59))
#define s64_4(x)  (shr((x), 1) ^ (x))
#define s64_5(x)  (shr((x), 2) ^ (x))
#define r64_01(x) rotl64((x),  5)
#define r64_02(x) rotl64((x), 11)
#define r64_03(x) rotl64((x), 27)
#define r64_04(x) rotl64((x), 32)
#define r64_05(x) rotl64((x), 37)
#define r64_06(x) rotl64((x), 43)
#define r64_07(x) rotl64((x), 53)

static __inline u_int64_t s64_0( u_int64_t x)
{
	u_int64_t ans = shl(x, 3);
	u_int64_t roll_temp = rotl64(x, 37);
	ans ^= roll_temp;
	ans ^= shr(x, 1);
	ans ^= rotr64(roll_temp, 33);
	return ans; //(shr((x), 1) ^ shl((x), 2) ^ rotl64((x), 13) ^ rotl64((x), 43));
}

static __inline u_int64_t s64_1( u_int64_t x)
{
	u_int64_t ans = shl(x, 2);
	u_int64_t roll_temp = rotl64(x, 43);
	ans ^= roll_temp;
	ans ^= shr(x, 1);
	ans ^= rotr64(roll_temp, 30);
	return ans; //(shr((x), 1) ^ shl((x), 2) ^ rotl64((x), 13) ^ rotl64((x), 43));
}

static __inline u_int64_t s64_2( u_int64_t x)
{
	u_int64_t ans = shl(x, 1);
	u_int64_t roll_temp = rotl64(x, 19);
	ans ^= roll_temp;
	ans ^= shr(x, 2);
	ans ^= rotl64(roll_temp, 34);
	return ans; //(shr((x), 2) ^ shl((x), 1) ^ rotl64((x), 19) ^ rotl64((x), 53));
}

static __inline u_int64_t s64_3( u_int64_t x)
{
	u_int64_t ans = shl(x, 2);
	u_int64_t roll_temp = rotl64(x, 28);
	ans ^= roll_temp;
	ans ^= shr(x, 2);
	ans ^= rotl64(roll_temp, 31);
	return ans; //(shr((x), 2) ^ shl((x), 2) ^ rotl64((x), 28) ^ rotl64((x), 59));
}


#define Compression512()\
{\
				/* Mix the message block with the previous double pipe.  */\
                /*                                This is the tweak      */\
				t512_20=t512_21=p512_08=p512[ 8]^data64[ 8]; td64_08=rotl64(data64[ 8], 9);\
				p512_09=p512[ 9]^data64[ 9]; td64_09=rotl64(data64[ 9],10);\
				p512_10=p512[10]^data64[10]; td64_10=rotl64(data64[10],11);\
				p512_11=p512[11]^data64[11]; td64_11=rotl64(data64[11],12);\
                p512_12=p512[12]^data64[12]; td64_12=rotl64(data64[12],13);\
                p512_06=p512[ 6]^data64[ 6]; td64_06=rotl64(data64[ 6], 7);\
				t512_19=p512_13=p512[13]^data64[13]; td64_13=rotl64(data64[13],14);  t512_19 -= p512_06;\
				p512_07=p512[ 7]^data64[ 7]; td64_07=rotl64(data64[ 7], 8);\
				p512_01=p512[ 1]^data64[ 1]; td64_01=rotl64(data64[ 1], 2);\
				t512_18=p512_14=p512[14]^data64[14]; td64_14=rotl64(data64[14],15);  t512_16 = p512_01-p512_14;  t512_18 -= p512_07;\
				p512_15=p512[15]^data64[15]; td64_15=rotl64(data64[15],16);\
				/* tp512=p512; tdat64=data64;     */\
				/* p512_00=(*tp512++)^(*tdat64++);*/\
				/* p512_01=(*tp512++)^(*tdat64++);*/\
				/* p512_02=(*tp512++)^(*tdat64++);*/\
				/* p512_03=(*tp512++)^(*tdat64++);*/\
				/* p512_04=(*tp512++)^(*tdat64++);*/\
				/* p512_05=(*tp512++)^(*tdat64++);*/\
				/* p512_06=(*tp512++)^(*tdat64++);*/\
				/* p512_07=(*tp512++)^(*tdat64++);*/\
				/* p512_08=(*tp512++)^(*tdat64++);*/\
				/* p512_09=(*tp512++)^(*tdat64++);*/\
				/* p512_10=(*tp512++)^(*tdat64++);*/\
				/* p512_11=(*tp512++)^(*tdat64++);*/\
				/* p512_12=(*tp512++)^(*tdat64++);*/\
				/* p512_13=(*tp512++)^(*tdat64++);*/\
				/* p512_14=(*tp512++)^(*tdat64++);*/\
				/* p512_15=(*tp512++)^(*tdat64++);*/\
\
				\
				t512_17 = p512_15-p512_12;\
				\
				\
				p512_05=p512[ 5]^data64[ 5]; td64_05=rotl64(data64[ 5], 6);\
				t512_20 -= p512_05;		t512_21 -= p512_01;\
				\
\
				p512_16 = ( p512_05+t512_18+p512_10+p512_13        );\
				p512_16  = s64_0(p512_16) + p512[ 1];\
				p512_17 = ( p512_06-p512_08+p512_11+p512_14-p512_15);\
				p512_17  = s64_1(p512_17) + p512[ 2];\
					p512_00=p512[ 0]^data64[ 0]; td64_00=rotl64(data64[ 0], 1);\
				p512_18 = ( p512_00+p512_07+p512_09+t512_17        );\
				p512_18  = s64_2(p512_18) + p512[ 3];\
				p512_19 = ( p512_00+t512_21        -p512_10+p512_13);\
				p512_19  = s64_3(p512_19) + p512[ 4];\
					p512_02=p512[ 2]^data64[ 2]; td64_02=rotl64(data64[ 2], 3);\
				p512_20 = ( t512_16+p512_02+p512_09-p512_11        );\
				p512_20  = s64_4(p512_20) + p512[ 5];\
					p512_03=p512[ 3]^data64[ 3]; td64_03=rotl64(data64[ 3], 4);\
	 			p512_21 = ( p512_03-p512_02+p512_10+t512_17        );\
				p512_21  = s64_0(p512_21) + p512[ 6];\
					p512_04=p512[ 4]^data64[ 4]; td64_04=rotl64(data64[ 4], 5);\
				p512_22 = ( p512_04-p512_00-p512_03-p512_11+p512_13);\
				p512_22  = s64_1(p512_22) + p512[ 7];\
				p512_23 = ( t512_16-p512_04-p512_05-p512_12        );\
				p512_23  = s64_2(p512_23) + p512[ 8];\
				p512_24 = ( p512_02-p512_05+t512_19        -p512_15);\
				p512_24  = s64_3(p512_24) + p512[ 9];\
				p512_25 = ( p512_00-p512_03+p512_06+t512_18        );\
				p512_25  = s64_4(p512_25) + p512[10];\
				p512_26 = ( t512_21        -p512_04-p512_07+p512_15);\
				p512_26  = s64_0(p512_26) + p512[11];\
				p512_27 = ( t512_20-p512_00-p512_02        +p512_09);\
				p512_27  = s64_1(p512_27) + p512[12];\
				p512_28 = ( p512_01+p512_03-p512_06-p512_09+p512_10);\
				p512_28  = s64_2(p512_28) + p512[13];\
				p512_29 = ( p512_02+p512_04+p512_07+p512_10+p512_11);\
				p512_29  = s64_3(p512_29) + p512[14];\
				p512_30 = ( p512_03+t512_20        -p512_11-p512_12);\
				p512_14  = s64_4(p512_30) + p512[15];\
				TempEven64 = p512_14;\
				p512_31 = ( p512_12-p512_04+t512_19-p512_09        );\
				p512_15  = s64_0(p512_31) + p512[ 0];\
				TempOdd64  = p512_15;\
\
				p512_00  = p512_16;\
				p512_01  = p512_17;\
				p512_02  = p512_18;\
				TempEven64+=p512_02;\
				p512_03  = p512_19;\
				TempOdd64 += p512_03;\
				p512_04  = p512_20;\
				TempEven64+= p512_04;\
				p512_05  = p512_21;\
				TempOdd64+= p512_05;\
				p512_06  = p512_22;\
				TempEven64+= p512_06;\
				p512_07  = p512_23;\
				TempOdd64 += p512_07;\
				p512_08  = p512_24;\
				TempEven64+= p512_08;\
				p512_09  = p512_25;\
				TempOdd64 += p512_09;\
				p512_10  = p512_26;\
				TempEven64+= p512_10;\
				p512_11  = p512_27;\
				TempOdd64 += p512_11;\
				p512_12  = p512_28;\
				TempEven64+= p512_12;\
				p512_13  = p512_29;\
				TempOdd64 += p512_13;\
\
				/* This is the Message expansion. */\
				/* It has 16 rounds.              */\
				p512_16  = s64_1(p512_00)    + s64_2(p512_01) + s64_3(p512_02) + s64_0(p512_03);\
				p512_17  = s64_1(p512_01)    + s64_2(p512_02) + s64_3(p512_03) + s64_0(p512_04);\
                p512_16  += s64_1(p512_04)    + s64_2(p512_05) + s64_3(p512_06) + s64_0(p512_07);\
				p512_17  += s64_1(p512_05)    + s64_2(p512_06) + s64_3(p512_07) + s64_0(p512_08);\
				p512_16  += s64_1(p512_08)    + s64_2(p512_09) + s64_3(p512_10) + s64_0(p512_11);\
				p512_17  += s64_1(p512_09)    + s64_2(p512_10) + s64_3(p512_11) + s64_0(p512_12);\
				p512_16  += s64_1(p512_12)    + s64_2(p512_13) + s64_3(p512_14) + s64_0(p512_15);\
				p512_17  += s64_1(p512_13)    + s64_2(p512_14) + s64_3(p512_15) ;\
				p512_16  += ((td64_00      + td64_03      - td64_10 + 0x5555555555555550ull) ^ p512[ 7]);\
				XL64 =  p512_16;\
\
\
\
\
				p512_17  += s64_0(p512_16) + ((td64_01      + td64_04      - td64_11 + 0x5aaaaaaaaaaaaaa5ull) ^ p512[ 8]);\
				XL64 ^= p512_17;\
				/* TempEven64 = p512_14  + p512_12  + p512_10  + p512_08  + p512_06  + p512_04  + p512_02; */\
				/* TempOdd64  = p512_15  + p512_13  + p512_11  + p512_09  + p512_07  + p512_05  + p512_03; */\
\
				/* expand64_22(18); */\
				p512_18  = TempEven64 + r64_01(p512_03)  + r64_02(p512_05)\
					                  + r64_03(p512_07)  + r64_04(p512_09)\
									  + r64_05(p512_11)  + r64_06(p512_13)\
									  + r64_07(p512_15)  + s64_4( p512_16 ) + s64_5( p512_17)\
									  + ((td64_02 + td64_05 - td64_12 + 0x5ffffffffffffffaull) ^ p512[ 9]);\
				XL64 ^= p512_18;\
				/* expand64_21(19); */\
				p512_19 = TempOdd64   + r64_01(p512_04)  + r64_02(p512_06)\
                                      + r64_03(p512_08)  + r64_04(p512_10)\
							          + r64_05(p512_12)  + r64_06(p512_14)\
							          + r64_07(p512_16)  + s64_4( p512_17 ) + s64_5( p512_18)\
							          + ((td64_03 + td64_06 - td64_13 + 0x655555555555554full) ^ p512[10]);\
				XL64 ^= p512_19;\
				TempEven64 = TempEven64 + p512_16 - p512_02;\
				/* expand64_22(20); */\
				p512_20  = TempEven64 + r64_01(p512_05)  + r64_02(p512_07)\
					                  + r64_03(p512_09)  + r64_04(p512_11)\
									  + r64_05(p512_13)  + r64_06(p512_15)\
									  + r64_07(p512_17)  + s64_4( p512_18 ) + s64_5( p512_19)\
									  + ((td64_04 + td64_07 - td64_14 + 0x6aaaaaaaaaaaaaa4ull) ^ p512[11]);\
				XL64 ^= p512_20;\
				TempOdd64 = TempOdd64 + p512_17 - p512_03;\
				/* expand64_21(21); */\
				p512_21 = TempOdd64   + r64_01(p512_06)  + r64_02(p512_08)\
                                      + r64_03(p512_10)  + r64_04(p512_12)\
							          + r64_05(p512_14)  + r64_06(p512_16)\
							          + r64_07(p512_18)  + s64_4( p512_19 ) + s64_5( p512_20)\
							          + ((td64_05 + td64_08 - td64_15 + 0x6ffffffffffffff9ull) ^ p512[12]);\
				XL64 ^= p512_21;\
				TempEven64+=p512_18; TempEven64-=p512_04;\
				/* expand64_22(22); */\
				p512_22  = TempEven64 + r64_01(p512_07)  + r64_02(p512_09)\
					                  + r64_03(p512_11)  + r64_04(p512_13)\
									  + r64_05(p512_15)  + r64_06(p512_17)\
									  + r64_07(p512_19)  + s64_4( p512_20 ) + s64_5( p512_21)\
									  + ((td64_06 + td64_09 - td64_00 + 0x755555555555554eull) ^ p512[13]);\
				XL64 ^= p512_22;\
				TempOdd64 +=p512_19; TempOdd64 -=p512_05;\
				/* expand64_21(23); */\
				p512_23 = TempOdd64   + r64_01(p512_08)  + r64_02(p512_10)\
                                      + r64_03(p512_12)  + r64_04(p512_14)\
							          + r64_05(p512_16)  + r64_06(p512_18)\
							          + r64_07(p512_20)  + s64_4( p512_21 ) + s64_5( p512_22)\
							          + ((td64_07 + td64_10 - td64_01 + 0x7aaaaaaaaaaaaaa3ull) ^ p512[14]);\
				XL64 ^= p512_23;\
				TempEven64+=p512_20; TempEven64-=p512_06;\
				/* expand64_22(24); */\
				p512_24  = TempEven64 + r64_01(p512_09)  + r64_02(p512_11)\
					                  + r64_03(p512_13)  + r64_04(p512_15)\
									  + r64_05(p512_17)  + r64_06(p512_19)\
									  + r64_07(p512_21)  + s64_4( p512_22 ) + s64_5( p512_23)\
									  + ((td64_08 + td64_11 - td64_02 + 0x7ffffffffffffff8ull) ^ p512[15]);\
				XH64 =  XL64^p512_24;\
				TempOdd64 +=p512_21; TempOdd64 -=p512_07;\
				/* expand64_21(25); */\
				p512_25 = TempOdd64   + r64_01(p512_10)  + r64_02(p512_12)\
                                      + r64_03(p512_14)  + r64_04(p512_16)\
							          + r64_05(p512_18)  + r64_06(p512_20)\
							          + r64_07(p512_22)  + s64_4( p512_23 ) + s64_5( p512_24)\
							          + ((td64_09 + td64_12 - td64_03 + 0x855555555555554dull) ^ p512[ 0]);\
				XH64 ^= p512_25;\
				TempEven64+=p512_22; TempEven64-=p512_08;\
				/* expand64_22(26); */\
				p512_26  = TempEven64 + r64_01(p512_11)  + r64_02(p512_13)\
					                  + r64_03(p512_15)  + r64_04(p512_17)\
									  + r64_05(p512_19)  + r64_06(p512_21)\
									  + r64_07(p512_23)  + s64_4( p512_24 ) + s64_5( p512_25)\
									  + ((td64_10 + td64_13 - td64_04 + 0x8aaaaaaaaaaaaaa2ull) ^ p512[ 1]);\
				XH64 ^= p512_26;\
				TempOdd64 +=p512_23; TempOdd64 -=p512_09;\
				/* expand64_21(27); */\
				p512_27 = TempOdd64   + r64_01(p512_12)  + r64_02(p512_14)\
                                      + r64_03(p512_16)  + r64_04(p512_18)\
							          + r64_05(p512_20)  + r64_06(p512_22)\
							          + r64_07(p512_24)  + s64_4( p512_25 ) + s64_5( p512_26)\
							          + ((td64_11 + td64_14 - td64_05 + 0x8ffffffffffffff7ull) ^ p512[ 2]);\
				XH64 ^= p512_27;\
				TempEven64+=p512_24; TempEven64-=p512_10;\
				/* expand64_22(28); */\
				p512_28  = TempEven64 + r64_01(p512_13)  + r64_02(p512_15)\
					                  + r64_03(p512_17)  + r64_04(p512_19)\
									  + r64_05(p512_21)  + r64_06(p512_23)\
									  + r64_07(p512_25)  + s64_4( p512_26 ) + s64_5( p512_27)\
									  + ((td64_12 + td64_15 - td64_06 + 0x955555555555554cull) ^ p512[ 3]);\
				XH64 ^= p512_28;\
				TempOdd64 +=p512_25; TempOdd64 -=p512_11;\
				/* expand64_21(29); */\
				p512_29 = TempOdd64   + r64_01(p512_14)  + r64_02(p512_16)\
                                      + r64_03(p512_18)  + r64_04(p512_20)\
							          + r64_05(p512_22)  + r64_06(p512_24)\
							          + r64_07(p512_26)  + s64_4( p512_27 ) + s64_5( p512_28)\
							          + ((td64_13 + td64_00 - td64_07 + 0x9aaaaaaaaaaaaaa1ull) ^ p512[ 4]);\
				XH64 ^= p512_29;\
				TempEven64+=p512_26; TempEven64-=p512_12;\
				/* expand64_22(30); */\
				p512_30  = TempEven64 + r64_01(p512_15)  + r64_02(p512_17)\
					                  + r64_03(p512_19)  + r64_04(p512_21)\
									  + r64_05(p512_23)  + r64_06(p512_25)\
									  + r64_07(p512_27)  + s64_4( p512_28 ) + s64_5( p512_29)\
									  + ((td64_14 + td64_01 - td64_08 + 0x9ffffffffffffff6ull) ^ p512[ 5]);\
				XH64 ^= p512_30;\
				TempOdd64 +=p512_27; TempOdd64 -=p512_13;\
				/* expand64_21(31); */\
				p512_31 = TempOdd64   + r64_01(p512_16)  + r64_02(p512_18)\
                                      + r64_03(p512_20)  + r64_04(p512_22)\
							          + r64_05(p512_24)  + r64_06(p512_26)\
							          + r64_07(p512_28)  + s64_4( p512_29 ) + s64_5( p512_30)\
							          + ((td64_15 + td64_02 - td64_09 + 0xa55555555555554bull) ^ p512[ 6]);\
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

#define FinalCompression512()\
{\
				/* Mix the message block with the previous double pipe.   */\
                /*                                   This is the tweak    */\
t512_20=t512_21=p512_08=p512[ 8]^0xaaaaaaaaaaaaaaa8ull;	td64_08=rotl64(p512[ 8], 9);\
				p512_09=p512[ 9]^0xaaaaaaaaaaaaaaa9ull;	td64_09=rotl64(p512[ 9],10);\
				p512_10=p512[10]^0xaaaaaaaaaaaaaaaaull;	td64_10=rotl64(p512[10],11);\
				p512_11=p512[11]^0xaaaaaaaaaaaaaaabull;	td64_11=rotl64(p512[11],12);\
                p512_12=p512[12]^0xaaaaaaaaaaaaaaacull;	td64_12=rotl64(p512[12],13);\
					p512_06=p512[ 6]^0xaaaaaaaaaaaaaaa6ull;	td64_06=rotl64(p512[ 6], 7);\
		t512_19=p512_13=p512[13]^0xaaaaaaaaaaaaaaadull;	td64_13=rotl64(p512[13],14);  t512_19 -= p512_06;\
					p512_07=p512[ 7]^0xaaaaaaaaaaaaaaa7ull;	td64_07=rotl64(p512[ 7], 8);\
					p512_01=p512[ 1]^0xaaaaaaaaaaaaaaa1ull;    td64_01=rotl64(p512[ 1], 2);\
		t512_18=p512_14=p512[14]^0xaaaaaaaaaaaaaaaeull;	td64_14=rotl64(p512[14],15);  t512_16 = p512_01-p512_14;  t512_18 -= p512_07;\
				p512_15=p512[15]^0xaaaaaaaaaaaaaaafull;	td64_15=rotl64(p512[15],16);\
				/* tp512=p512;                              */\
				/* p512_00=(*tp512++)^0xaaaaaaaaaaaaaaa0ull;*/\
				/* p512_01=(*tp512++)^0xaaaaaaaaaaaaaaa1ull;*/\
				/* p512_02=(*tp512++)^0xaaaaaaaaaaaaaaa2ull;*/\
				/* p512_03=(*tp512++)^0xaaaaaaaaaaaaaaa3ull;*/\
				/* p512_04=(*tp512++)^0xaaaaaaaaaaaaaaa4ull;*/\
				/* p512_05=(*tp512++)^0xaaaaaaaaaaaaaaa5ull;*/\
				/* p512_06=(*tp512++)^0xaaaaaaaaaaaaaaa6ull;*/\
				/* p512_07=(*tp512++)^0xaaaaaaaaaaaaaaa7ull;*/\
				/* p512_08=(*tp512++)^0xaaaaaaaaaaaaaaa8ull;*/\
				/* p512_09=(*tp512++)^0xaaaaaaaaaaaaaaa9ull;*/\
				/* p512_10=(*tp512++)^0xaaaaaaaaaaaaaaaaull;*/\
				/* p512_11=(*tp512++)^0xaaaaaaaaaaaaaaabull;*/\
				/* p512_12=(*tp512++)^0xaaaaaaaaaaaaaaacull;*/\
				/* p512_13=(*tp512++)^0xaaaaaaaaaaaaaaadull;*/\
				/* p512_14=(*tp512++)^0xaaaaaaaaaaaaaaaeull;*/\
				/* p512_15=(*tp512++)^0xaaaaaaaaaaaaaaafull;*/\
\
				\
				t512_17 = p512_15-p512_12;\
				\
				p512_05=p512[ 5]^0xaaaaaaaaaaaaaaa5ull;	td64_05=rotl64(p512[ 5], 6);\
				t512_20 -= p512_05;  t512_21 -= p512_01;\
				\
				\
\
				p512_16 = ( p512_05+t512_18+p512_10+p512_13        );\
				p512_16  = s64_0(p512_16) + 0xaaaaaaaaaaaaaaa1ull;\
				p512_17 = ( p512_06-p512_08+p512_11+p512_14-p512_15);\
				p512_17  = s64_1(p512_17) + 0xaaaaaaaaaaaaaaa2ull;\
            	    p512_00=p512[ 0]^0xaaaaaaaaaaaaaaa0ull;	td64_00=rotl64(p512[ 0], 1);\
				p512_18 = ( p512_00+p512_07+p512_09+t512_17        );\
				p512_18  = s64_2(p512_18) + 0xaaaaaaaaaaaaaaa3ull;\
				p512_19 = ( p512_00+t512_21        -p512_10+p512_13);\
				p512_19  = s64_3(p512_19) + 0xaaaaaaaaaaaaaaa4ull;\
					p512_02=p512[ 2]^0xaaaaaaaaaaaaaaa2ull;	td64_02=rotl64(p512[ 2], 3);\
				p512_20 = ( t512_16+p512_02+p512_09-p512_11        );\
				p512_20  = s64_4(p512_20) + 0xaaaaaaaaaaaaaaa5ull;\
					p512_03=p512[ 3]^0xaaaaaaaaaaaaaaa3ull;	td64_03=rotl64(p512[ 3], 4);\
	 			p512_21 = ( p512_03-p512_02+p512_10+t512_17        );\
				p512_21  = s64_0(p512_21) + 0xaaaaaaaaaaaaaaa6ull;\
                	p512_04=p512[ 4]^0xaaaaaaaaaaaaaaa4ull;	td64_04=rotl64(p512[ 4], 5);\
				p512_22 = ( p512_04-p512_00-p512_03-p512_11+p512_13);\
				p512_22  = s64_1(p512_22) + 0xaaaaaaaaaaaaaaa7ull;\
				p512_23 = ( t512_16-p512_04-p512_05-p512_12        );\
				p512_23  = s64_2(p512_23) + 0xaaaaaaaaaaaaaaa8ull;\
				p512_24 = ( p512_02-p512_05+t512_19        -p512_15);\
				p512_24  = s64_3(p512_24) + 0xaaaaaaaaaaaaaaa9ull;\
				p512_25 = ( p512_00-p512_03+p512_06+t512_18        );\
				p512_25  = s64_4(p512_25) + 0xaaaaaaaaaaaaaaaaull;\
				p512_26 = ( t512_21        -p512_04-p512_07+p512_15);\
				p512_26  = s64_0(p512_26) + 0xaaaaaaaaaaaaaaabull;\
				p512_27 = ( t512_20-p512_00-p512_02        +p512_09);\
				p512_27  = s64_1(p512_27) + 0xaaaaaaaaaaaaaaacull;\
				p512_28 = ( p512_01+p512_03-p512_06-p512_09+p512_10);\
				p512_28  = s64_2(p512_28) + 0xaaaaaaaaaaaaaaadull;\
				p512_29 = ( p512_02+p512_04+p512_07+p512_10+p512_11);\
				p512_29  = s64_3(p512_29) + 0xaaaaaaaaaaaaaaaeull;\
				p512_30 = ( p512_03+t512_20        -p512_11-p512_12);\
				p512_14  = s64_4(p512_30) + 0xaaaaaaaaaaaaaaafull;\
				TempEven64 = p512_14;\
				p512_31 = ( p512_12-p512_04+t512_19-p512_09        );\
				p512_15  = s64_0(p512_31) + 0xaaaaaaaaaaaaaaa0ull;\
				TempOdd64  = p512_15;\
\
				p512_00  = p512_16;\
				p512_01  = p512_17;\
				p512_02  = p512_18;\
				TempEven64+=p512_02;\
				p512_03  = p512_19;\
				TempOdd64 += p512_03;\
				p512_04  = p512_20;\
				TempEven64+= p512_04;\
				p512_05  = p512_21;\
				TempOdd64+= p512_05;\
				p512_06  = p512_22;\
				TempEven64+= p512_06;\
				p512_07  = p512_23;\
				TempOdd64 += p512_07;\
				p512_08  = p512_24;\
				TempEven64+= p512_08;\
				p512_09  = p512_25;\
				TempOdd64 += p512_09;\
				p512_10  = p512_26;\
				TempEven64+= p512_10;\
				p512_11  = p512_27;\
				TempOdd64 += p512_11;\
				p512_12  = p512_28;\
				TempEven64+= p512_12;\
				p512_13  = p512_29;\
				TempOdd64 += p512_13;\
\
				/* This is the Message expansion. */\
				/* It has 16 rounds.              */\
				p512_16  = s64_1(p512_00)    + s64_2(p512_01) + s64_3(p512_02) + s64_0(p512_03)\
                         + s64_1(p512_04)    + s64_2(p512_05) + s64_3(p512_06) + s64_0(p512_07)\
						 + s64_1(p512_08)    + s64_2(p512_09) + s64_3(p512_10) + s64_0(p512_11)\
						 + s64_1(p512_12)    + s64_2(p512_13) + s64_3(p512_14) + s64_0(p512_15)\
						 + ((td64_00      + td64_03      - td64_10 + 0x5555555555555550ull) ^ 0xaaaaaaaaaaaaaaa7ull);\
				XL64 =  p512_16;\
				p512_17  = s64_1(p512_01)    + s64_2(p512_02) + s64_3(p512_03) + s64_0(p512_04)\
                         + s64_1(p512_05)    + s64_2(p512_06) + s64_3(p512_07) + s64_0(p512_08)\
						 + s64_1(p512_09)    + s64_2(p512_10) + s64_3(p512_11) + s64_0(p512_12)\
						 + s64_1(p512_13)    + s64_2(p512_14) + s64_3(p512_15) + s64_0(p512_16)\
						 + ((td64_01      + td64_04      - td64_11 + 0x5aaaaaaaaaaaaaa5ull) ^ 0xaaaaaaaaaaaaaaa8ull);\
				XL64 ^= p512_17;\
				/* TempEven64 = p512_14  + p512_12  + p512_10  + p512_08  + p512_06  + p512_04  + p512_02; */\
				/* TempOdd64  = p512_15  + p512_13  + p512_11  + p512_09  + p512_07  + p512_05  + p512_03; */\
\
				/* expand64_22(18); */\
				p512_18  = TempEven64 + r64_01(p512_03)  + r64_02(p512_05)\
					                  + r64_03(p512_07)  + r64_04(p512_09)\
									  + r64_05(p512_11)  + r64_06(p512_13)\
									  + r64_07(p512_15)  + s64_4( p512_16 ) + s64_5( p512_17)\
									  + ((td64_02 + td64_05 - td64_12 + 0x5ffffffffffffffaull) ^ 0xaaaaaaaaaaaaaaa9ull);\
				XL64 ^= p512_18;\
				/* expand64_21(19); */\
				p512_19 = TempOdd64   + r64_01(p512_04)  + r64_02(p512_06)\
                                      + r64_03(p512_08)  + r64_04(p512_10)\
							          + r64_05(p512_12)  + r64_06(p512_14)\
							          + r64_07(p512_16)  + s64_4( p512_17 ) + s64_5( p512_18)\
							          + ((td64_03 + td64_06 - td64_13 + 0x655555555555554full) ^ 0xaaaaaaaaaaaaaaaaull);\
				XL64 ^= p512_19;\
				TempEven64 = TempEven64 + p512_16 - p512_02;\
				/* expand64_22(20); */\
				p512_20  = TempEven64 + r64_01(p512_05)  + r64_02(p512_07)\
					                  + r64_03(p512_09)  + r64_04(p512_11)\
									  + r64_05(p512_13)  + r64_06(p512_15)\
									  + r64_07(p512_17)  + s64_4( p512_18 ) + s64_5( p512_19)\
									  + ((td64_04 + td64_07 - td64_14 + 0x6aaaaaaaaaaaaaa4ull) ^ 0xaaaaaaaaaaaaaaabull);\
				XL64 ^= p512_20;\
				TempOdd64 = TempOdd64 + p512_17 - p512_03;\
				/* expand64_21(21); */\
				p512_21 = TempOdd64   + r64_01(p512_06)  + r64_02(p512_08)\
                                      + r64_03(p512_10)  + r64_04(p512_12)\
							          + r64_05(p512_14)  + r64_06(p512_16)\
							          + r64_07(p512_18)  + s64_4( p512_19 ) + s64_5( p512_20)\
							          + ((td64_05 + td64_08 - td64_15 + 0x6ffffffffffffff9ull) ^ 0xaaaaaaaaaaaaaaacull);\
				XL64 ^= p512_21;\
				TempEven64+=p512_18; TempEven64-=p512_04;\
				/* expand64_22(22); */\
				p512_22  = TempEven64 + r64_01(p512_07)  + r64_02(p512_09)\
					                  + r64_03(p512_11)  + r64_04(p512_13)\
									  + r64_05(p512_15)  + r64_06(p512_17)\
									  + r64_07(p512_19)  + s64_4( p512_20 ) + s64_5( p512_21)\
									  + ((td64_06 + td64_09 - td64_00 + 0x755555555555554eull) ^ 0xaaaaaaaaaaaaaaadull);\
				XL64 ^= p512_22;\
				TempOdd64 +=p512_19; TempOdd64 -=p512_05;\
				/* expand64_21(23); */\
				p512_23 = TempOdd64   + r64_01(p512_08)  + r64_02(p512_10)\
                                      + r64_03(p512_12)  + r64_04(p512_14)\
							          + r64_05(p512_16)  + r64_06(p512_18)\
							          + r64_07(p512_20)  + s64_4( p512_21 ) + s64_5( p512_22)\
							          + ((td64_07 + td64_10 - td64_01 + 0x7aaaaaaaaaaaaaa3ull) ^ 0xaaaaaaaaaaaaaaaeull);\
				XL64 ^= p512_23;\
				TempEven64+=p512_20; TempEven64-=p512_06;\
				/* expand64_22(24); */\
				p512_24  = TempEven64 + r64_01(p512_09)  + r64_02(p512_11)\
					                  + r64_03(p512_13)  + r64_04(p512_15)\
									  + r64_05(p512_17)  + r64_06(p512_19)\
									  + r64_07(p512_21)  + s64_4( p512_22 ) + s64_5( p512_23)\
									  + ((td64_08 + td64_11 - td64_02 + 0x7ffffffffffffff8ull) ^ 0xaaaaaaaaaaaaaaafull);\
				XH64 =  XL64^p512_24;\
				TempOdd64 +=p512_21; TempOdd64 -=p512_07;\
				/* expand64_21(25); */\
				p512_25 = TempOdd64   + r64_01(p512_10)  + r64_02(p512_12)\
                                      + r64_03(p512_14)  + r64_04(p512_16)\
							          + r64_05(p512_18)  + r64_06(p512_20)\
							          + r64_07(p512_22)  + s64_4( p512_23 ) + s64_5( p512_24)\
							          + ((td64_09 + td64_12 - td64_03 + 0x855555555555554dull) ^ 0xaaaaaaaaaaaaaaa0ull);\
				XH64 ^= p512_25;\
				TempEven64+=p512_22; TempEven64-=p512_08;\
				/* expand64_22(26); */\
				p512_26  = TempEven64 + r64_01(p512_11)  + r64_02(p512_13)\
					                  + r64_03(p512_15)  + r64_04(p512_17)\
									  + r64_05(p512_19)  + r64_06(p512_21)\
									  + r64_07(p512_23)  + s64_4( p512_24 ) + s64_5( p512_25)\
									  + ((td64_10 + td64_13 - td64_04 + 0x8aaaaaaaaaaaaaa2ull) ^ 0xaaaaaaaaaaaaaaa1ull);\
				XH64 ^= p512_26;\
				TempOdd64 +=p512_23; TempOdd64 -=p512_09;\
				/* expand64_21(27); */\
				p512_27 = TempOdd64   + r64_01(p512_12)  + r64_02(p512_14)\
                                      + r64_03(p512_16)  + r64_04(p512_18)\
							          + r64_05(p512_20)  + r64_06(p512_22)\
							          + r64_07(p512_24)  + s64_4( p512_25 ) + s64_5( p512_26)\
							          + ((td64_11 + td64_14 - td64_05 + 0x8ffffffffffffff7ull) ^ 0xaaaaaaaaaaaaaaa2ull);\
				XH64 ^= p512_27;\
				TempEven64+=p512_24; TempEven64-=p512_10;\
				/* expand64_22(28); */\
				p512_28  = TempEven64 + r64_01(p512_13)  + r64_02(p512_15)\
					                  + r64_03(p512_17)  + r64_04(p512_19)\
									  + r64_05(p512_21)  + r64_06(p512_23)\
									  + r64_07(p512_25)  + s64_4( p512_26 ) + s64_5( p512_27)\
									  + ((td64_12 + td64_15 - td64_06 + 0x955555555555554cull) ^ 0xaaaaaaaaaaaaaaa3ull);\
				XH64 ^= p512_28;\
				TempOdd64 +=p512_25; TempOdd64 -=p512_11;\
				/* expand64_21(29); */\
				p512_29 = TempOdd64   + r64_01(p512_14)  + r64_02(p512_16)\
                                      + r64_03(p512_18)  + r64_04(p512_20)\
							          + r64_05(p512_22)  + r64_06(p512_24)\
							          + r64_07(p512_26)  + s64_4( p512_27 ) + s64_5( p512_28)\
							          + ((td64_13 + td64_00 - td64_07 + 0x9aaaaaaaaaaaaaa1ull) ^ 0xaaaaaaaaaaaaaaa4ull);\
				XH64 ^= p512_29;\
				TempEven64+=p512_26; TempEven64-=p512_12;\
				/* expand64_22(30); */\
				p512_30  = TempEven64 + r64_01(p512_15)  + r64_02(p512_17)\
					                  + r64_03(p512_19)  + r64_04(p512_21)\
									  + r64_05(p512_23)  + r64_06(p512_25)\
									  + r64_07(p512_27)  + s64_4( p512_28 ) + s64_5( p512_29)\
									  + ((td64_14 + td64_01 - td64_08 + 0x9ffffffffffffff6ull) ^ 0xaaaaaaaaaaaaaaa5ull);\
				XH64 ^= p512_30;\
				TempOdd64 +=p512_27; TempOdd64 -=p512_13;\
				/* expand64_21(31); */\
				p512_31 = TempOdd64   + r64_01(p512_16)  + r64_02(p512_18)\
                                      + r64_03(p512_20)  + r64_04(p512_22)\
							          + r64_05(p512_24)  + r64_06(p512_26)\
							          + r64_07(p512_28)  + s64_4( p512_29 ) + s64_5( p512_30)\
							          + ((td64_15 + td64_02 - td64_09 + 0xa55555555555554bull) ^ 0xaaaaaaaaaaaaaaa6ull);\
				XH64 ^= p512_31;\
\
				/*  Compute the double chaining pipe for the next message block. */\
				p512[0] =                       (shl(XH64, 5) ^ shr(p512_16,5) ^ p512[ 0]) + (    XL64    ^ p512_24 ^ p512_00);\
				p512[1] =                       (shr(XH64, 7) ^ shl(p512_17,8) ^ p512[ 1]) + (    XL64    ^ p512_25 ^ p512_01);\
				p512[2] =                       (shr(XH64, 5) ^ shl(p512_18,5) ^ p512[ 2]) + (    XL64    ^ p512_26 ^ p512_02);\
				p512[3] =                       (shr(XH64, 1) ^ shl(p512_19,5) ^ p512[ 3]) + (    XL64    ^ p512_27 ^ p512_03);\
				p512[4] =                       (shr(XH64, 3) ^     p512_20    ^ p512[ 4]) + (    XL64    ^ p512_28 ^ p512_04);\
				p512[5] =                       (shl(XH64, 6) ^ shr(p512_21,6) ^ p512[ 5]) + (    XL64    ^ p512_29 ^ p512_05);\
				p512[6] =                       (shr(XH64, 4) ^ shl(p512_22,6) ^ p512[ 6]) + (    XL64    ^ p512_30 ^ p512_06);\
				p512[7] =                       (shr(XH64,11) ^ shl(p512_23,2) ^ p512[ 7]) + (    XL64    ^ p512_31 ^ p512_07);\
\
				p512[ 8] = rotl64(p512[4], 9) + (    XH64     ^     p512_24    ^ p512[ 8]) + (shl(XL64,8) ^ p512_23 ^ p512_08);\
				p512[ 9] = rotl64(p512[5],10) + (    XH64     ^     p512_25    ^ p512[ 9]) + (shr(XL64,6) ^ p512_16 ^ p512_09);\
				p512[10] = rotl64(p512[6],11) + (    XH64     ^     p512_26    ^ p512[10]) + (shl(XL64,6) ^ p512_17 ^ p512_10);\
				p512[11] = rotl64(p512[7],12) + (    XH64     ^     p512_27    ^ p512[11]) + (shl(XL64,4) ^ p512_18 ^ p512_11);\
				p512[12] = rotl64(p512[0],13) + (    XH64     ^     p512_28    ^ p512[12]) + (shr(XL64,3) ^ p512_19 ^ p512_12);\
				p512[13] = rotl64(p512[1],14) + (    XH64     ^     p512_29    ^ p512[13]) + (shr(XL64,4) ^ p512_20 ^ p512_13);\
				p512[14] = rotl64(p512[2],15) + (    XH64     ^     p512_30    ^ p512[14]) + (shr(XL64,7) ^ p512_21 ^ p512_14);\
				p512[15] = rotl64(p512[3],16) + (    XH64     ^     p512_31    ^ p512[15]) + (shr(XL64,2) ^ p512_22 ^ p512_15);\
}


HashReturn Init(hashState *state, int hashbitlen)
{
	switch(hashbitlen)
	{
		case 512:
		state->hashbitlen = 512;
		// #1 Between comments #1 and #2 add algorithm specific initialization
		state->bits_processed = 0;
		state->unprocessed_bits = 0;
		memcpy(hashState512(state)->DoublePipe, i512p2,  16 * sizeof(u_int64_t));
		// #2 Between comments #1 and #2 add algorithm specific initialization
		return(SUCCESS);

        default:    return(BAD_HASHLEN);
    }
}


HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen)
{
	u_int64_t *data64, *p512;
	u_int64_t XL64, XH64, TempEven64, TempOdd64;
    u_int64_t p512_00, p512_01, p512_02, p512_03, p512_04, p512_05, p512_06, p512_07;
    u_int64_t p512_08, p512_09, p512_10, p512_11, p512_12, p512_13, p512_14, p512_15;
    u_int64_t p512_16, p512_17, p512_18, p512_19, p512_20, p512_21, p512_22, p512_23;
    u_int64_t p512_24, p512_25, p512_26, p512_27, p512_28, p512_29, p512_30, p512_31;
    u_int64_t t512_16, t512_17, t512_18, t512_19, t512_20, t512_21;
	u_int64_t td64_00, td64_01, td64_02, td64_03, td64_04, td64_05, td64_06, td64_07;
	u_int64_t td64_08, td64_09, td64_10, td64_11, td64_12, td64_13, td64_14, td64_15;

	int LastBytes;

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
}

HashReturn Final(hashState *state, BitSequence *hashval)
{
	u_int64_t *data64, *p512;
	u_int64_t XL64, XH64, TempEven64, TempOdd64;
    u_int64_t p512_00, p512_01, p512_02, p512_03, p512_04, p512_05, p512_06, p512_07;
    u_int64_t p512_08, p512_09, p512_10, p512_11, p512_12, p512_13, p512_14, p512_15;
    u_int64_t p512_16, p512_17, p512_18, p512_19, p512_20, p512_21, p512_22, p512_23;
    u_int64_t p512_24, p512_25, p512_26, p512_27, p512_28, p512_29, p512_30, p512_31;
    u_int64_t t512_16, t512_17, t512_18, t512_19, t512_20, t512_21;
	u_int64_t td64_00, td64_01, td64_02, td64_03, td64_04, td64_05, td64_06, td64_07;
	u_int64_t td64_08, td64_09, td64_10, td64_11, td64_12, td64_13, td64_14, td64_15;

	DataLength databitlen;

	int LastByte, PadOnePosition;

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
		Compression512();
		data64 += 16;
	}

	// This is the tweak for Blue Midnight Wish, to be submitted on 15 September 2009.
	// Below is a code for final invocation of the compression function after digesting the
	// whole padded message. Here, the role of the message has the obtained final double pipe, 
	// and the role of the initial double pipe is a constant.
	FinalCompression512();

	memcpy(hashval, p512 + 8,  BlueMidnightWish512_DIGEST_SIZE );
	return(SUCCESS);
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
