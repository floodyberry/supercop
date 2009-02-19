#include <string.h> 
#include "BlueMidnightWish.h"
#include "byteorder.h"


/* BlueMidnightWish224 initial double chaining pipe */
const u_int32_t i224p2[16] = {
	0x00010203ul, 0x04050607ul, 0x08090a0bul, 0x0c0d0e0ful,
    0x10111213ul, 0x14151617ul, 0x18191a1bul, 0x1c1d1e1ful,
    0x20212223ul, 0x24252627ul, 0x28292a2bul, 0x2c2d2e2ful,
    0x30313233ul, 0x24353637ul, 0x38393a3bul, 0x3c3d3e3ful,
};

/* BlueMidnightWish256 initial double chaining pipe */
const u_int32_t i256p2[16] = {
	0x40414243ul, 0x44454647ul, 0x48494a4bul, 0x4c4d4e4ful,
    0x50515253ul, 0x54555657ul, 0x58595a5bul, 0x5c5d5e5ful,
    0x60616263ul, 0x64656667ul, 0x68696a6bul, 0x6c6d6e6ful,
    0x70717273ul, 0x74757677ul, 0x78797a7bul, 0x7c7d7e7ful,
};

/* BlueMidnightWish384 initial double chaining pipe */
const u_int64_t i384p2[16] = {
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
const u_int64_t i512p2[16] = {
    0x8081828384858687ull, 0x88898a8b8c8d8e8full,
    0x9091929394959697ull, 0x98999a9b9c9d9e9full,
    0xa0a1a2a3a4a5a6a7ull, 0xa8a9aaabacadaeafull,
    0xb0b1b2b3b4b5b6b7ull, 0xb8b9babbbcbdbebfull,
    0xc0c1c2c3c4c5c6c7ull, 0xc8c9cacbcccdcecfull,
    0xd0d1d2d3d4d5d6d7ull, 0xd8d9dadbdcdddedfull,
    0xe0e1e2e3e4e5e6e7ull, 0xe8e9eaebecedeeefull,
    0xf0f1f2f3f4f5f6f7ull, 0xf8f9fafbfcfdfeffull
};


/* Components used for 224 and 256 bit version */
#define s32_00(x) (shr((x), 1) ^ shl((x), 3) ^ rotl32((x),  4) ^ rotl32((x), 19))
#define s32_01(x) (shr((x), 1) ^ shl((x), 2) ^ rotl32((x),  8) ^ rotl32((x), 23))
#define s32_02(x) (shr((x), 2) ^ shl((x), 1) ^ rotl32((x), 12) ^ rotl32((x), 25))
#define s32_03(x) (shr((x), 2) ^ shl((x), 2) ^ rotl32((x), 15) ^ rotl32((x), 29))
#define s32_04(x) (shr((x), 1) ^ (x))
#define s32_05(x) (shr((x), 2) ^ (x))
#define r32_01(x) rotl32((x),  3)
#define r32_02(x) rotl32((x),  7)
#define r32_03(x) rotl32((x), 13)
#define r32_04(x) rotl32((x), 16)
#define r32_05(x) rotl32((x), 19)
#define r32_06(x) rotl32((x), 23)
#define r32_07(x) rotl32((x), 27)


static DataLength
Compression256(DataLength bitlen, u_int32_t* restrict doublepipe,
			   const u_int32_t *data)
{
	DataLength bl;

	for (bl = bitlen; bl >= BlueMidnightWish256_BLOCK_BITSIZE;
		 bl -= BlueMidnightWish256_BLOCK_BITSIZE, data += 16) {
		u_int32_t p00, p01, p02, p03, p04, p05, p06, p07, p08, p09, p10, p11,
			p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24,
			p25, p26, p27, p28, p29, p30, p31;
		u_int32_t to, te, xl, xh;
#if defined(MACHINE_IS_BIG_ENDIAN)
		u_int32_t swp0, swp1, swp2, swp3, swp4, swp5, swp6, swp7, swp8,
			swp9, swp10, swp11, swp12, swp13, swp14, swp15;

		/*  Mix the message block with the previous double pipe. */
		swp0  = swap32((u_int32_t *)data+ 0), p00 = doublepipe[ 0] ^ swp0;
		swp1  = swap32((u_int32_t *)data+ 1), p01 = doublepipe[ 1] ^ swp1;
		swp2  = swap32((u_int32_t *)data+ 2), p02 = doublepipe[ 2] ^ swp2;
		swp3  = swap32((u_int32_t *)data+ 3), p03 = doublepipe[ 3] ^ swp3;
		swp4  = swap32((u_int32_t *)data+ 4), p04 = doublepipe[ 4] ^ swp4;
		swp5  = swap32((u_int32_t *)data+ 5), p05 = doublepipe[ 5] ^ swp5;
		swp6  = swap32((u_int32_t *)data+ 6), p06 = doublepipe[ 6] ^ swp6;
		swp7  = swap32((u_int32_t *)data+ 7), p07 = doublepipe[ 7] ^ swp7;
		swp8  = swap32((u_int32_t *)data+ 8), p08 = doublepipe[ 8] ^ swp8;
		swp9  = swap32((u_int32_t *)data+ 9), p09 = doublepipe[ 9] ^ swp9;
		swp10 = swap32((u_int32_t *)data+10), p10 = doublepipe[10] ^ swp10;
		swp11 = swap32((u_int32_t *)data+11), p11 = doublepipe[11] ^ swp11;
		swp12 = swap32((u_int32_t *)data+12), p12 = doublepipe[12] ^ swp12;
		swp13 = swap32((u_int32_t *)data+13), p13 = doublepipe[13] ^ swp13;
		swp14 = swap32((u_int32_t *)data+14), p14 = doublepipe[14] ^ swp14;
		swp15 = swap32((u_int32_t *)data+15), p15 = doublepipe[15] ^ swp15;
#else
		/*  Mix the message block with the previous double pipe. */
		p00 = doublepipe[ 0] ^ data[ 0];
		p01 = doublepipe[ 1] ^ data[ 1];
		p02 = doublepipe[ 2] ^ data[ 2];
		p03 = doublepipe[ 3] ^ data[ 3];
		p04 = doublepipe[ 4] ^ data[ 4];
		p05 = doublepipe[ 5] ^ data[ 5];
		p06 = doublepipe[ 6] ^ data[ 6];
		p07 = doublepipe[ 7] ^ data[ 7];
		p08 = doublepipe[ 8] ^ data[ 8];
		p09 = doublepipe[ 9] ^ data[ 9];
		p10 = doublepipe[10] ^ data[10];
		p11 = doublepipe[11] ^ data[11];
		p12 = doublepipe[12] ^ data[12];
		p13 = doublepipe[13] ^ data[13];
		p14 = doublepipe[14] ^ data[14];
		p15 = doublepipe[15] ^ data[15];

#endif

		p16 = p05 - p07 + p10 + p13 + p14;
		p17 = p06 - p08 + p11 + p14 - p15;
		p18 = p00 + p07 + p09 - p12 + p15;
		p19 = p00 - p01 + p08 - p10 + p13;
		p20 = p01 + p02 + p09 - p11 - p14;
		p21 = p03 - p02 + p10 - p12 + p15;
		p22 = p04 - p00 - p03 - p11 + p13;
		p23 = p01 - p04 - p05 - p12 - p14;
		p24 = p02 - p05 - p06 + p13 - p15;
		p25 = p00 - p03 + p06 - p07 + p14;
		p26 = p08 - p01 - p04 - p07 + p15;
		p27 = p08 - p00 - p02 - p05 + p09;
		p28 = p01 + p03 - p06 - p09 + p10;
		p29 = p02 + p04 + p07 + p10 + p11;
		p30 = p03 - p05 + p08 - p11 - p12;
		p31 = p12 - p04 - p06 - p09 + p13;

		p00 = s32_00(p16);
		p01 = s32_01(p17);
		p02 = s32_02(p18);
		p03 = s32_03(p19);
		p04 = s32_04(p20);
		p05 = s32_00(p21);
		p06 = s32_01(p22);
		p07 = s32_02(p23);
		p08 = s32_03(p24);
		p09 = s32_04(p25);
		p10 = s32_00(p26);
		p11 = s32_01(p27);
		p12 = s32_02(p28);
		p13 = s32_03(p29);
		p14 = s32_04(p30);
		p15 = s32_00(p31);

#if defined(MACHINE_IS_BIG_ENDIAN)
#define d32(n) swp##n
#else
#define d32(n) data[n]
#endif

		/* This is the Message expansion.  It has 16 rounds. */
		p16  = s32_01(p00) + s32_02(p01) + s32_03(p02) + s32_00(p03)
			+ s32_01(p04) + s32_02(p05) + s32_03(p06) + s32_00(p07)
			+ s32_01(p08) + s32_02(p09) + s32_03(p10) + s32_00(p11)
			+ s32_01(p12) + s32_02(p13) + s32_03(p14) + s32_00(p15)
			+ 0x55555550ul + d32(0)      + d32(3)      - d32(10);
		xl =  p16;
		p17  = s32_01(p01) + s32_02(p02) + s32_03(p03) + s32_00(p04)
			+ s32_01(p05) + s32_02(p06) + s32_03(p07) + s32_00(p08)
			+ s32_01(p09) + s32_02(p10) + s32_03(p11) + s32_00(p12)
			+ s32_01(p13) + s32_02(p14) + s32_03(p15) + s32_00(p16)
			+ 0x5aaaaaa5ul + d32(1) + d32(4) - d32(11);
		xl ^= p17;
		te = p14 + p12 + p10 + p08 + p06 + p04 + p02;
		to = p15 + p13 + p11 + p09 + p07 + p05 + p03;

		/* expand32_22(18); */
		p18  = te	+ r32_01(p03) + r32_02(p05) + r32_03(p07)
			+ r32_04(p09)	+ r32_05(p11) + r32_06(p13)	+ r32_07(p15)
			+ s32_05(p16) + s32_04(p17) + 0x5ffffffaul
			+ d32(2) + d32(5) - d32(12);
		xl ^= p18;
		/* expand32_21(19); */
		p19 = to + r32_01(p04) + r32_02(p06) + r32_03(p08)
			+ r32_04(p10) + r32_05(p12) + r32_06(p14) + r32_07(p16)
			+ s32_05(p17) + s32_04(p18) + 0x6555554ful
			+ d32(3) + d32(6) - d32(13);
		xl ^= p19;
		te += p16 - p02;
		/* expand32_22(20); */
		p20  = te + r32_01(p05)  + r32_02(p07) + r32_03(p09)
			+ r32_04(p11) + r32_05(p13) + r32_06(p15) + r32_07(p17)
			+ s32_05(p18) + s32_04(p19) + 0x6aaaaaa4ul
			+ d32(4) + d32(7) - d32(14);
		xl ^= p20;
		to += p17 - p03;
		/* expand32_21(21); */
		p21 = to + r32_01(p06) + r32_02(p08) + r32_03(p10)
			+ r32_04(p12) + r32_05(p14) + r32_06(p16) + r32_07(p18)
			+ s32_05(p19) + s32_04(p20) + 0x6ffffff9ul
			+ d32(5) + d32(8) - d32(15);
		xl ^= p21;
		te += p18 - p04;
		/* expand32_22(22); */
		p22  = te + r32_01(p07) + r32_02(p09) + r32_03(p11)
			+ r32_04(p13) + r32_05(p15) + r32_06(p17) + r32_07(p19)
			+ s32_05(p20) + s32_04(p21) + 0x7555554eul
			+ d32(6) + d32(9) - d32(0);
		xl ^= p22;
		to += p19 - p05;
		/* expand32_21(23); */
		p23 = to + r32_01(p08) + r32_02(p10) + r32_03(p12)
			+ r32_04(p14) + r32_05(p16) + r32_06(p18) + r32_07(p20)
			+ s32_05(p21) + s32_04( p22) + 0x7aaaaaa3ul
			+ d32(7) + d32(10) - d32(1);
		xl ^= p23;
		te += p20 - p06;
		/* expand32_22(24); */
		p24  = te + r32_01(p09)  + r32_02(p11) + r32_03(p13)
			+ r32_04(p15) + r32_05(p17) + r32_06(p19) + r32_07(p21)
			+ s32_05(p22) + s32_04(p23) + 0x7ffffff8ul
			+ d32(8) + d32(11) - d32(2);
		xh = xl^p24;
		to += p21 - p07;
		/* expand32_21(25); */
		p25 = to + r32_01(p10) + r32_02(p12) + r32_03(p14)
			+ r32_04(p16) + r32_05(p18) + r32_06(p20)
			+ r32_07(p22) + s32_05(p23 ) + s32_04( p24)
			+ 0x8555554dul + d32(9) + d32(12) - d32(3);
		xh ^= p25;
		te += p22 - p08;
		/* expand32_22(26); */
		p26 = te + r32_01(p11) + r32_02(p13) + r32_03(p15) 
			+ r32_04(p17)	+ r32_05(p19) + r32_06(p21)
			+ r32_07(p23) + s32_05(p24) + s32_04(p25)
			+ 0x8aaaaaa2ul + d32(10) + d32(13) - d32(4);
		xh ^= p26;
		to += p23 - p09;
		/* expand32_21(27); */
		p27 = to + r32_01(p12) + r32_02(p14) + r32_03(p16)
			+ r32_04(p18) + r32_05(p20) + r32_06(p22) + r32_07(p24)
			+ s32_05(p25) + s32_04(p26) + 0x8ffffff7ul
			+ d32(11) + d32(14) - d32(5);
		xh ^= p27;
		te += p24 - p10;
		/* expand32_22(28); */
		p28 = te + r32_01(p13) + r32_02(p15) + r32_03(p17)
			+ r32_04(p19) + r32_05(p21) + r32_06(p23) + r32_07(p25)
			+ s32_05(p26) + s32_04(p27) + 0x9555554cul
			+ d32(12) + d32(15) - d32(6);
		xh ^= p28;
		to += p25 - p11;
		/* expand32_21(29); */
		p29 = to + r32_01(p14) + r32_02(p16) + r32_03(p18)
			+ r32_04(p20) + r32_05(p22) + r32_06(p24) + r32_07(p26)
			+ s32_05(p27) + s32_04(p28) + 0x9aaaaaa1ul
			+ d32(13) + d32(0) - d32(7);
		xh ^= p29;
		te += p26 - p12;
		/* expand32_22(30); */
		p30 = te + r32_01(p15) + r32_02(p17) + r32_03(p19)
			+ r32_04(p21) + r32_05(p23) + r32_06(p25) + r32_07(p27)
			+ s32_05(p28) + s32_04(p29) + 0x9ffffff6ul
			+ d32(14) + d32(1) - d32(8);
		xh ^= p30;
		to += p27 - p13;
		/* expand32_21(31); */
		p31 = to + r32_01(p16) + r32_02(p18) + r32_03(p20)
			+ r32_04(p22) + r32_05(p24) + r32_06(p26) + r32_07(p28)
			+ s32_05(p29) + s32_04(p30) + 0xa555554bul
			+ d32(15) + d32(2) - d32(9);
		xh ^= p31;

		/*  Compute the double chaining pipe for the next message block. */
		doublepipe[ 0] = (shl(xh, 5) ^ shr(p16,5) ^ d32( 0)) + (xl ^ p24 ^ p00);
		doublepipe[ 1] = (shr(xh, 7) ^ shl(p17,8) ^ d32( 1)) + (xl ^ p25 ^ p01);
		doublepipe[ 2] = (shr(xh, 5) ^ shl(p18,5) ^ d32( 2)) + (xl ^ p26 ^ p02);
		doublepipe[ 3] = (shr(xh, 1) ^ shl(p19,5) ^ d32( 3)) + (xl ^ p27 ^ p03);
		doublepipe[ 4] = (shr(xh, 3) ^     p20    ^ d32( 4)) + (xl ^ p28 ^ p04);
		doublepipe[ 5] = (shl(xh, 6) ^ shr(p21,6) ^ d32( 5)) + (xl ^ p29 ^ p05);
		doublepipe[ 6] = (shr(xh, 4) ^ shl(p22,6) ^ d32( 6)) + (xl ^ p30 ^ p06);
		doublepipe[ 7] = (shr(xh,11) ^ shl(p23,2) ^ d32( 7)) + (xl ^ p31 ^ p07);

		doublepipe[ 8] = rotl32(doublepipe[4], 9) + (xh ^ p24 ^ d32( 8)) + (shl(xl,8) ^ p23 ^ p08);
		doublepipe[ 9] = rotl32(doublepipe[5],10) + (xh ^ p25 ^ d32( 9)) + (shr(xl,6) ^ p16 ^ p09);
		doublepipe[10] = rotl32(doublepipe[6],11) + (xh ^ p26 ^ d32(10)) + (shl(xl,6) ^ p17 ^ p10);
		doublepipe[11] = rotl32(doublepipe[7],12) + (xh ^ p27 ^ d32(11)) + (shl(xl,4) ^ p18 ^ p11);
		doublepipe[12] = rotl32(doublepipe[0],13) + (xh ^ p28 ^ d32(12)) + (shr(xl,3) ^ p19 ^ p12);
		doublepipe[13] = rotl32(doublepipe[1],14) + (xh ^ p29 ^ d32(13)) + (shr(xl,4) ^ p20 ^ p13);
		doublepipe[14] = rotl32(doublepipe[2],15) + (xh ^ p30 ^ d32(14)) + (shr(xl,7) ^ p21 ^ p14);
		doublepipe[15] = rotl32(doublepipe[3],16) + (xh ^ p31 ^ d32(15)) + (shr(xl,2) ^ p22 ^ p15);
	}
#undef d32

	return bitlen - bl;
}


/* Components used for 384 and 512 bit version */
#define s64_00(x) (shr((x), 1) ^ shl((x), 3) ^ rotl64((x),  4) ^ rotl64((x), 37))
#define s64_01(x) (shr((x), 1) ^ shl((x), 2) ^ rotl64((x), 13) ^ rotl64((x), 43))
#define s64_02(x) (shr((x), 2) ^ shl((x), 1) ^ rotl64((x), 19) ^ rotl64((x), 53))
#define s64_03(x) (shr((x), 2) ^ shl((x), 2) ^ rotl64((x), 28) ^ rotl64((x), 59))
#define s64_04(x) (shr((x), 1) ^ (x))
#define s64_05(x) (shr((x), 2) ^ (x))
#define r64_01(x) rotl64((x),  5)
#define r64_02(x) rotl64((x), 11)
#define r64_03(x) rotl64((x), 27)
#define r64_04(x) rotl64((x), 32)
#define r64_05(x) rotl64((x), 37)
#define r64_06(x) rotl64((x), 43)
#define r64_07(x) rotl64((x), 53)


static DataLength
Compression512(DataLength bitlen, u_int64_t* restrict doublepipe,
			   const u_int64_t *data)
{
	DataLength bl;

	for (bl = bitlen; bl >= BlueMidnightWish512_BLOCK_BITSIZE;
		 bl -= BlueMidnightWish512_BLOCK_BITSIZE, data += 16) {
		u_int64_t p00, p01, p02, p03, p04, p05, p06, p07, p08, p09, p10, p11,
			p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24,
			p25, p26, p27, p28, p29, p30, p31;
		u_int64_t to, te, xl, xh;
#if defined(MACHINE_IS_BIG_ENDIAN)
		u_int64_t swp0, swp1, swp2, swp3, swp4, swp5, swp6, swp7, swp8,
			swp9, swp10, swp11, swp12, swp13, swp14, swp15;

		/*  Mix the message block with the previous double pipe. */
			swp0  = swap64((u_int64_t *)data+ 0), p00 = doublepipe[ 0] ^ swp0;
			swp1  = swap64((u_int64_t *)data+ 1), p01 = doublepipe[ 1] ^ swp1;
			swp2  = swap64((u_int64_t *)data+ 2), p02 = doublepipe[ 2] ^ swp2;
			swp3  = swap64((u_int64_t *)data+ 3), p03 = doublepipe[ 3] ^ swp3;
			swp4  = swap64((u_int64_t *)data+ 4), p04 = doublepipe[ 4] ^ swp4;
			swp5  = swap64((u_int64_t *)data+ 5), p05 = doublepipe[ 5] ^ swp5;
			swp6  = swap64((u_int64_t *)data+ 6), p06 = doublepipe[ 6] ^ swp6;
			swp7  = swap64((u_int64_t *)data+ 7), p07 = doublepipe[ 7] ^ swp7;
			swp8  = swap64((u_int64_t *)data+ 8), p08 = doublepipe[ 8] ^ swp8;
			swp9  = swap64((u_int64_t *)data+ 9), p09 = doublepipe[ 9] ^ swp9;
			swp10 = swap64((u_int64_t *)data+10), p10 = doublepipe[10] ^ swp10;
			swp11 = swap64((u_int64_t *)data+11), p11 = doublepipe[11] ^ swp11;
			swp12 = swap64((u_int64_t *)data+12), p12 = doublepipe[12] ^ swp12;
			swp13 = swap64((u_int64_t *)data+13), p13 = doublepipe[13] ^ swp13;
			swp14 = swap64((u_int64_t *)data+14), p14 = doublepipe[14] ^ swp14;
			swp15 = swap64((u_int64_t *)data+15), p15 = doublepipe[15] ^ swp15;
#else
		/*  Mix the message block with the previous double pipe. */
			p00 = doublepipe[ 0] ^ data[ 0];
			p01 = doublepipe[ 1] ^ data[ 1];
			p02 = doublepipe[ 2] ^ data[ 2];
			p03 = doublepipe[ 3] ^ data[ 3];
			p04 = doublepipe[ 4] ^ data[ 4];
			p05 = doublepipe[ 5] ^ data[ 5];
			p06 = doublepipe[ 6] ^ data[ 6];
			p07 = doublepipe[ 7] ^ data[ 7];
			p08 = doublepipe[ 8] ^ data[ 8];
			p09 = doublepipe[ 9] ^ data[ 9];
			p10 = doublepipe[10] ^ data[10];
			p11 = doublepipe[11] ^ data[11];
			p12 = doublepipe[12] ^ data[12];
			p13 = doublepipe[13] ^ data[13];
			p14 = doublepipe[14] ^ data[14];
			p15 = doublepipe[15] ^ data[15];
#endif

		p16 = p05 - p07 + p10 + p13 + p14;
		p17 = p06 - p08 + p11 + p14 - p15;
		p18 = p00 + p07 + p09 - p12 + p15;
		p19 = p00 - p01 + p08 - p10 + p13;
		p20 = p01 + p02 + p09 - p11 - p14;
		p21 = p03 - p02 + p10 - p12 + p15;
		p22 = p04 - p00 - p03 - p11 + p13;
		p23 = p01 - p04 - p05 - p12 - p14;
		p24 = p02 - p05 - p06 + p13 - p15;
		p25 = p00 - p03 + p06 - p07 + p14;
		p26 = p08 - p01 - p04 - p07 + p15;
		p27 = p08 - p00 - p02 - p05 + p09;
		p28 = p01 + p03 - p06 - p09 + p10;
		p29 = p02 + p04 + p07 + p10 + p11;
		p30 = p03 - p05 + p08 - p11 - p12;
		p31 = p12 - p04 - p06 - p09 + p13;

		p00  = s64_00(p16);
		p01  = s64_01(p17);
		p02  = s64_02(p18);
		p03  = s64_03(p19);
		p04  = s64_04(p20);
		p05  = s64_00(p21);
		p06  = s64_01(p22);
		p07  = s64_02(p23);
		p08  = s64_03(p24);
		p09  = s64_04(p25);
		p10  = s64_00(p26);
		p11  = s64_01(p27);
		p12  = s64_02(p28);
		p13  = s64_03(p29);
		p14  = s64_04(p30);
		p15  = s64_00(p31);

#if defined(MACHINE_IS_BIG_ENDIAN)
#define d64(n) swp##n
#else
#define d64(n) data[n]
#endif

		/* This is the Message expansion.  It has 16 rounds. */
		p16  = s64_01(p00) + s64_02(p01) + s64_03(p02) + s64_00(p03)
			+ s64_01(p04) + s64_02(p05) + s64_03(p06) + s64_00(p07)
			+ s64_01(p08) + s64_02(p09) + s64_03(p10) + s64_00(p11)
			+ s64_01(p12) + s64_02(p13) + s64_03(p14) + s64_00(p15)
			+ 0x5555555555555550ull + d64(0) + d64(3) - d64(10);
		xl =  p16;
		p17  = s64_01(p01) + s64_02(p02) + s64_03(p03) + s64_00(p04)
			+ s64_01(p05) + s64_02(p06) + s64_03(p07) + s64_00(p08)
			+ s64_01(p09) + s64_02(p10) + s64_03(p11) + s64_00(p12)
			+ s64_01(p13) + s64_02(p14) + s64_03(p15) + s64_00(p16)
			+ 0x5aaaaaaaaaaaaaa5ull + d64(1) + d64(4) - d64(11);
		xl ^= p17;
		te = p14 + p12 + p10 + p08 + p06 + p04 + p02;
		to = p15 + p13 + p11 + p09 + p07 + p05 + p03;

		/* expand64_22(18); */
		p18  = te + r64_01(p03) + r64_02(p05) + r64_03(p07)
			+ r64_04(p09)	+ r64_05(p11) + r64_06(p13)
			+ r64_07(p15) + s64_05(p16) + s64_04(p17)
			+ 0x5ffffffffffffffaull + d64(2) + d64(5) - d64(12);
		xl ^= p18;
		/* expand64_21(19); */
		p19 = to + r64_01(p04) + r64_02(p06)+ r64_03(p08)
			+ r64_04(p10)	+ r64_05(p12) + r64_06(p14)
			+ r64_07(p16) + s64_05(p17) + s64_04( p18)
			+ 0x655555555555554full + d64(3) + d64(6) - d64(13);
		xl ^= p19;
		te += p16 - p02;
		/* expand64_22(20); */
		p20  = te + r64_01(p05) + r64_02(p07)	+ r64_03(p09)
			+ r64_04(p11)	+ r64_05(p13) + r64_06(p15)
			+ r64_07(p17) + s64_05(p18) + s64_04(p19)
			+ 0x6aaaaaaaaaaaaaa4ull + d64(4) + d64(7) - d64(14);
		xl ^= p20;
		to += p17 - p03;
		/* expand64_21(21); */
		p21 = to + r64_01(p06) + r64_02(p08) + r64_03(p10)
			+ r64_04(p12)	+ r64_05(p14) + r64_06(p16)
			+ r64_07(p18) + s64_05(p19) + s64_04(p20)
			+ 0x6ffffffffffffff9ull + d64(5) + d64(8) - d64(15);
		xl ^= p21;
		te += p18 - p04;
		/* expand64_22(22); */
		p22  = te + r64_01(p07) + r64_02(p09)	+ r64_03(p11)
			+ r64_04(p13)	+ r64_05(p15) + r64_06(p17)
			+ r64_07(p19) + s64_05(p20) + s64_04(p21)
			+ 0x755555555555554eull + d64(6) + d64(9) - d64(0);
		xl ^= p22;
		to += p19 - p05;
		/* expand64_21(23); */
		p23 = to + r64_01(p08) + r64_02(p10) + r64_03(p12)
			+ r64_04(p14)	+ r64_05(p16) + r64_06(p18)
			+ r64_07(p20) + s64_05(p21) + s64_04(p22)
			+ 0x7aaaaaaaaaaaaaa3ull + d64(7) + d64(10) - d64(1);
		xl ^= p23;
		te += p20 - p06;
		/* expand64_22(24); */
		p24  = te + r64_01(p09) + r64_02(p11)	+ r64_03(p13)
			+ r64_04(p15)	+ r64_05(p17) + r64_06(p19)
			+ r64_07(p21) + s64_05(p22) + s64_04(p23)
			+ 0x7ffffffffffffff8ull + d64(8) + d64(11) - d64(2);
		xh =  xl^p24;
		to += p21 - p07;
		/* expand64_21(25); */
		p25 = to + r64_01(p10) + r64_02(p12) + r64_03(p14)
			+ r64_04(p16)	+ r64_05(p18) + r64_06(p20)
			+ r64_07(p22) + s64_05(p23) + s64_04(p24)
			+ 0x855555555555554dull + d64(9) + d64(12) - d64(3);
		xh ^= p25;
		te += p22 - p08;
		/* expand64_22(26); */
		p26  = te + r64_01(p11) + r64_02(p13)	+ r64_03(p15)
			+ r64_04(p17)	+ r64_05(p19) + r64_06(p21)
			+ r64_07(p23) + s64_05(p24) + s64_04(p25)
			+ 0x8aaaaaaaaaaaaaa2ull + d64(10) + d64(13) - d64(4);
		xh ^= p26;
		to += p23 - p09;
		/* expand64_21(27); */
		p27 = to + r64_01(p12) + r64_02(p14)+ r64_03(p16)
			+ r64_04(p18)	+ r64_05(p20) + r64_06(p22)
			+ r64_07(p24) + s64_05(p25) + s64_04(p26)
			+ 0x8ffffffffffffff7ull + d64(11) + d64(14) - d64(5);
		xh ^= p27;
		te += p24 - p10;
		/* expand64_22(28); */
		p28  = te + r64_01(p13) + r64_02(p15)	+ r64_03(p17)
			+ r64_04(p19)	+ r64_05(p21) + r64_06(p23)
			+ r64_07(p25) + s64_05(p26) + s64_04(p27)
			+ 0x955555555555554cull + d64(12) + d64(15) - d64(6);
		xh ^= p28;
		to += p25 - p11;
		/* expand64_21(29); */
		p29 = to + r64_01(p14) + r64_02(p16) + r64_03(p18)
			+ r64_04(p20)	+ r64_05(p22) + r64_06(p24)
			+ r64_07(p26) + s64_05(p27) + s64_04(p28)
			+ 0x9aaaaaaaaaaaaaa1ull + d64(13) + d64(0) - d64(7);
		xh ^= p29;
		te += p26 - p12;
		/* expand64_22(30); */
		p30  = te + r64_01(p15) + r64_02(p17)	+ r64_03(p19)
			+ r64_04(p21)	+ r64_05(p23) + r64_06(p25)
			+ r64_07(p27) + s64_05(p28) + s64_04(p29)
			+ 0x9ffffffffffffff6ull + d64(14) + d64(1) - d64(8);
		xh ^= p30;
		to += p27 - p13;
		/* expand64_21(31); */
		p31 = to + r64_01(p16) + r64_02(p18) + r64_03(p20)
			+ r64_04(p22)	+ r64_05(p24) + r64_06(p26)
			+ r64_07(p28) + s64_05(p29) + s64_04(p30)
			+ 0xa55555555555554bull + d64(15) + d64(2) - d64(9);
		xh ^= p31;

		/*  Compute the double chaining pipe for the next message block. */
		doublepipe[ 0] = (shl(xh, 5) ^ shr(p16,5) ^ d64(0)) + (xl ^ p24 ^ p00);
		doublepipe[ 1] = (shr(xh, 7) ^ shl(p17,8) ^ d64(1)) + (xl ^ p25 ^ p01);
		doublepipe[ 2] = (shr(xh, 5) ^ shl(p18,5) ^ d64(2)) + (xl ^ p26 ^ p02);
		doublepipe[ 3] = (shr(xh, 1) ^ shl(p19,5) ^ d64(3)) + (xl ^ p27 ^ p03);
		doublepipe[ 4] = (shr(xh, 3) ^     p20    ^ d64(4)) + (xl ^ p28 ^ p04);
		doublepipe[ 5] = (shl(xh, 6) ^ shr(p21,6) ^ d64(5)) + (xl ^ p29 ^ p05);
		doublepipe[ 6] = (shr(xh, 4) ^ shl(p22,6) ^ d64(6)) + (xl ^ p30 ^ p06);
		doublepipe[ 7] = (shr(xh,11) ^ shl(p23,2) ^ d64(7)) + (xl ^ p31 ^ p07);

		doublepipe[ 8] = rotl64(doublepipe[4], 9) + (xh ^ p24 ^ d64(8)) + (shl(xl,8) ^ p23 ^ p08);
		doublepipe[ 9] = rotl64(doublepipe[5],10) + (xh ^ p25 ^ d64(9)) + (shr(xl,6) ^ p16 ^ p09);
		doublepipe[10] = rotl64(doublepipe[6],11) + (xh ^ p26 ^ d64(10)) + (shl(xl,6) ^ p17 ^ p10);
		doublepipe[11] = rotl64(doublepipe[7],12) + (xh ^ p27 ^ d64(11)) + (shl(xl,4) ^ p18 ^ p11);
		doublepipe[12] = rotl64(doublepipe[0],13) + (xh ^ p28 ^ d64(12)) + (shr(xl,3) ^ p19 ^ p12);
		doublepipe[13] = rotl64(doublepipe[1],14) + (xh ^ p29 ^ d64(13)) + (shr(xl,4) ^ p20 ^ p13);
		doublepipe[14] = rotl64(doublepipe[2],15) + (xh ^ p30 ^ d64(14)) + (shr(xl,7) ^ p21 ^ p14);
		doublepipe[15] = rotl64(doublepipe[3],16) + (xh ^ p31 ^ d64(15)) + (shr(xl,2) ^ p22 ^ p15);
	}

#undef d64
	return bitlen - bl;
}


HashReturn
Init(hashState *state, int hashbitlen)
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


HashReturn
Update(hashState *state, const BitSequence *data, DataLength databitlen)
{
	u_int64_t *data64;
	u_int32_t *data32;

	DataLength bits_processed;


	switch(state->hashbitlen) {
	case 224:
	case 256:
		if (state->unprocessed_bits > 0) {
			if (state->unprocessed_bits + databitlen > BlueMidnightWish256_BLOCK_SIZE * 8)	{
					return BAD_CONSECUTIVE_CALL_TO_UPDATE;
			} else {
				int LastBytes = (int)databitlen >> 3; // LastBytes = databitlen / 8

				memcpy(hashState256(state)->LastPart + (state->unprocessed_bits >> 3), data, LastBytes );
				state->unprocessed_bits += (int)databitlen;
				databitlen = state->unprocessed_bits;
				data32 = (u_int32_t *)hashState256(state)->LastPart;
			}
		} else {
			data32 = (u_int32_t *)data;
		}

		bits_processed = Compression256(databitlen,
										hashState256(state)->DoublePipe, data32);
		state->bits_processed += bits_processed;
		databitlen -= bits_processed;
		state->unprocessed_bits = (int)databitlen;
		if (databitlen > 0)	{
			int LastBytes = ((~(((- (int)databitlen)>>3) & 0x01ff)) + 1) & 0x01ff;  // LastBytes = Ceil(databitlen / 8)

			data32 += bits_processed >> 5; // byte size update
			memcpy(hashState256(state)->LastPart, data32, LastBytes );
		}
		return(SUCCESS);

	case 384:
	case 512:
		if (state->unprocessed_bits > 0) {
			if ( state->unprocessed_bits + databitlen > BlueMidnightWish512_BLOCK_SIZE * 8)	{
				return BAD_CONSECUTIVE_CALL_TO_UPDATE;
			} else {
				int LastBytes = (int)databitlen >> 3; // LastBytes = databitlen / 8

				memcpy(hashState512(state)->LastPart + (state->unprocessed_bits >> 3), data, LastBytes );
				state->unprocessed_bits += (int)databitlen;
				databitlen = state->unprocessed_bits;
				data64 = (u_int64_t *)hashState512(state)->LastPart;
			}
		}
		else {
			data64 = (u_int64_t *)data;
		}

		bits_processed = Compression512(databitlen,
										hashState512(state)->DoublePipe, data64);
		state->bits_processed += bits_processed;
		databitlen -= bits_processed;
		state->unprocessed_bits = (int)databitlen;
		if (databitlen > 0)	{
			int LastBytes = ((~(((- (int)databitlen)>>3) & 0x03ff)) + 1) & 0x03ff; // LastBytes = Ceil(databitlen / 8)

			data64 += bits_processed >> 6; // byte size update
			memcpy(hashState512(state)->LastPart, data64, LastBytes );
		}
		return(SUCCESS);
		
	default:
		return(BAD_HASHLEN); //This should never happen
	}
}


HashReturn Final(hashState *state, BitSequence *hashval)
{
	u_int64_t *data64, num_bits;
	u_int32_t *data32;

	DataLength databitlen;
	int LastByte, PadOnePosition;


	num_bits = state->bits_processed + state->unprocessed_bits;

	switch(state->hashbitlen)
	{
		case 224:
		case 256:
			LastByte = (int)state->unprocessed_bits >> 3;
			PadOnePosition = 7 - (state->unprocessed_bits & 0x07);
			hashState256(state)->LastPart[LastByte] =
			    (hashState256(state)->LastPart[LastByte] & (0xff << (PadOnePosition + 1)))
			    ^ (0x01 << PadOnePosition);
			data64 = (u_int64_t *)hashState256(state)->LastPart;
			data32 = (u_int32_t *)hashState256(state)->LastPart;

			if (state->unprocessed_bits < 448)
			{
				memset( (hashState256(state)->LastPart) + LastByte + 1, 0x00, BlueMidnightWish256_BLOCK_SIZE - LastByte - 9 );
				databitlen = BlueMidnightWish256_BLOCK_SIZE * 8;
#if defined(MACHINE_IS_BIG_ENDIAN)
				data64[7] = swap64(&num_bits);
#else
				data64[7] = num_bits;
#endif
			}
			else
			{
				memset( (hashState256(state)->LastPart) + LastByte + 1, 0x00, BlueMidnightWish256_BLOCK_SIZE * 2 - LastByte - 9 );
				databitlen = BlueMidnightWish256_BLOCK_SIZE * 16;
#if defined(MACHINE_IS_BIG_ENDIAN)
				data64[15] = swap64(&num_bits);
#else
				data64[15] = num_bits;
#endif
			}

			Compression256(databitlen, hashState256(state)->DoublePipe, data32);
			break;


		case 384:
		case 512:
			LastByte = (int)state->unprocessed_bits >> 3;
			PadOnePosition = 7 - (state->unprocessed_bits & 0x07);
			hashState512(state)->LastPart[LastByte] =
			    (hashState512(state)->LastPart[LastByte] & (0xff << (PadOnePosition + 1)))
			    ^ (0x01 << PadOnePosition);
			data64 = (u_int64_t *)hashState512(state)->LastPart;
			data32 = (u_int32_t *)hashState512(state)->LastPart;

			if (state->unprocessed_bits < 960)
			{
				memset(hashState512(state)->LastPart + LastByte + 1, 0x00, BlueMidnightWish512_BLOCK_SIZE - LastByte - 9 );
				databitlen = BlueMidnightWish512_BLOCK_SIZE * 8;
#if defined(MACHINE_IS_BIG_ENDIAN)
				data64[15] = swap64(&num_bits);
#else
				data64[15] = num_bits;
#endif
			}
			else
			{
				memset(hashState512(state)->LastPart + LastByte + 1, 0x00, BlueMidnightWish512_BLOCK_SIZE * 2 - LastByte - 9 );
				databitlen = BlueMidnightWish512_BLOCK_SIZE * 16;
#if defined(MACHINE_IS_BIG_ENDIAN)
				data64[31] = swap64(&num_bits);
#else
				data64[31] = num_bits;
#endif
			}

			Compression512(databitlen, hashState512(state)->DoublePipe, data64);
			break;
		
		default:    return(BAD_HASHLEN); //This should never happen
	}


	switch(state->hashbitlen)
	{
		case 224:
#if defined(MACHINE_IS_BIG_ENDIAN)
		{
			u_int32_t *d32 = (u_int32_t *)hashval;
			u_int32_t *s32 = hashState224(state)->DoublePipe+9;
			int j;

			for (j = 0; j < BlueMidnightWish224_DIGEST_SIZE>>2; j++)
				d32[j] = swap32(s32+j);
		}
#else
			memcpy(hashval, hashState256(state)->DoublePipe+9,
				   BlueMidnightWish224_DIGEST_SIZE);
#endif
			return(SUCCESS);
		case 256:
#if defined(MACHINE_IS_BIG_ENDIAN)
		{
			u_int32_t *d32 = (u_int32_t *)hashval;
			u_int32_t *s32 = hashState224(state)->DoublePipe+8;
			int j;

			for (j = 0; j < BlueMidnightWish256_DIGEST_SIZE>>2; j++)
				d32[j] = swap32(s32+j);
		}
#else
			memcpy(hashval, hashState256(state)->DoublePipe+8,
				   BlueMidnightWish256_DIGEST_SIZE);
#endif
			return(SUCCESS);
		case 384:
#if defined(MACHINE_IS_BIG_ENDIAN)
		{
			u_int64_t *d64 = (u_int64_t *)hashval;
			u_int64_t *s64 = hashState384(state)->DoublePipe+10;
			int j;

			for (j = 0; j < BlueMidnightWish384_DIGEST_SIZE>>3; j++)
			    d64[j] = swap64(s64+j);
		}
#else
			memcpy(hashval, hashState384(state)->DoublePipe+10,
				   BlueMidnightWish384_DIGEST_SIZE);
#endif
			return(SUCCESS);
		case 512:
#if defined(MACHINE_IS_BIG_ENDIAN)
		{
			u_int64_t *d64 = (u_int64_t *)hashval;
			u_int64_t *s64 = hashState512(state)->DoublePipe+8;
			int j;

			for (j = 0; j < BlueMidnightWish512_DIGEST_SIZE>>3; j++)
			    d64[j] = swap64(s64+j);
		}
#else
			memcpy(hashval, hashState512(state)->DoublePipe+8,
				   BlueMidnightWish512_DIGEST_SIZE);
#endif
			return(SUCCESS);

		default:
			return(BAD_HASHLEN); //This should never happen
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
