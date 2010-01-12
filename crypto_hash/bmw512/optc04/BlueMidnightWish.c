/* 
   Optimized C code for tweaked Blue Midnight Wish - 512 programmed by Rune E. Jensen, December 2009.
*/

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
#define hashState512_(x)  ((x).pipe[0].p512[0])

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

__inline static DataLength Compress512(u_int64_t *data64, hashState *state, DataLength databitlen)
{	
	u_int64_t XL64, XH64, TempEven64, TempOdd64;

	u_int64_t p_xor_d_00, p_xor_d_01, p_xor_d_02, p_xor_d_03, p_xor_d_04, p_xor_d_05, p_xor_d_06, p_xor_d_07; 
	u_int64_t p_xor_d_08, p_xor_d_09, p_xor_d_10, p_xor_d_11, p_xor_d_12, p_xor_d_13, p_xor_d_14, p_xor_d_15;

	u_int64_t p512_00, p512_01, p512_02, p512_03, p512_04, p512_05, p512_06, p512_07;
	u_int64_t p512_08, p512_09, p512_10, p512_11, p512_12, p512_13, p512_14, p512_15;

	u_int64_t exp_00, exp_01, exp_02, exp_03, exp_04, exp_05, exp_06, exp_07;
	u_int64_t exp_08, exp_09, exp_10, exp_11, exp_12, exp_13, exp_14, exp_15;

	u_int64_t exp_16, exp_17, exp_18, exp_19, exp_20, exp_21, exp_22, exp_23;
	u_int64_t exp_24, exp_25, exp_26, exp_27, exp_28, exp_29, exp_30, exp_31;

	u_int64_t t512_31, t512_32, t512_33, t512_34, t512_35, t512_36, t512_37;

	u_int64_t td64_00, td64_01, td64_02, td64_03, td64_04, td64_05, td64_06, td64_07;
	u_int64_t td64_08, td64_09, td64_10, td64_11, td64_12, td64_13, td64_14, td64_15;

	u_int64_t rotate_t13, rotate_t15;

	p512_00 = hashState512(state)->DoublePipe[0];
	p512_01 = hashState512(state)->DoublePipe[1];
	p512_02 = hashState512(state)->DoublePipe[2];
	p512_03 = hashState512(state)->DoublePipe[3];
	p512_04 = hashState512(state)->DoublePipe[4];
	p512_09 = hashState512(state)->DoublePipe[9];
	p512_12 = hashState512(state)->DoublePipe[12];
	p512_15 = hashState512(state)->DoublePipe[15];

	p512_11 = hashState512(state)->DoublePipe[11];
	p512_06 = hashState512(state)->DoublePipe[6];
	p512_08 = hashState512(state)->DoublePipe[8];

	p512_05 = hashState512(state)->DoublePipe[5];
	p512_10 = hashState512(state)->DoublePipe[10];
	p512_07 = hashState512(state)->DoublePipe[7];
	p512_13 = hashState512(state)->DoublePipe[13];
	p512_14 = hashState512(state)->DoublePipe[14];


	u_int64_t iterations = databitlen / (BlueMidnightWish512_BLOCK_SIZE * 8);
	u_int64_t *data64_end = data64 + iterations*16;
	
	while (data64 < data64_end)
	{
		p_xor_d_05=p512_05^data64[ 5];	td64_05=rotl64(data64[ 5], 6);
		p_xor_d_07=p512_07^data64[ 7];	td64_07=rotl64(data64[ 7], 8);
		p_xor_d_10=p512_10^data64[ 10];	td64_10=rotl64(data64[ 10], 11);
		p_xor_d_13=p512_13^data64[ 13];	td64_13=rotl64(data64[ 13], 14);
		p_xor_d_14=p512_14^data64[ 14];	td64_14=rotl64(data64[ 14], 15);
		exp_00 = (p_xor_d_05  - p_xor_d_07  + p_xor_d_10  + p_xor_d_13  + p_xor_d_14 );
		exp_00 = s64_0(exp_00) + p512_01;
		p_xor_d_00=p512_00^data64[ 0];	td64_00=rotl64(data64[ 0], 1);
		p_xor_d_08=p512_08^data64[ 8];	td64_08=rotl64(data64[ 8], 9);
		p_xor_d_01=p512_01^data64[ 1];	td64_01=rotl64(data64[ 1], 2);
		t512_37 = (p_xor_d_08 - p_xor_d_01);
		t512_35 = (p_xor_d_01 - p_xor_d_14);
		exp_03 = (p_xor_d_00  + p_xor_d_13  + t512_37  - p_xor_d_10 );
		exp_03 = s64_3(exp_03) + p512_04;
		p_xor_d_15=p512_15^data64[ 15];	td64_15=rotl64(data64[ 15], 16);
		p_xor_d_04=p512_04^data64[ 4];	td64_04=rotl64(data64[ 4], 5);
		exp_10 = (p_xor_d_15  + t512_37  - p_xor_d_04  - p_xor_d_07 );
		exp_10 = s64_0(exp_10) + p512_11;
		p_xor_d_02=p512_02^data64[ 2];	td64_02=rotl64(data64[ 2], 3);
		p_xor_d_11=p512_11^data64[ 11];	td64_11=rotl64(data64[ 11], 12);
		exp_13 = (p_xor_d_02  + p_xor_d_04  + p_xor_d_07  + p_xor_d_10  + p_xor_d_11 );
		exp_13 = s64_3(exp_13) + p512_14;
		p_xor_d_09=p512_09^data64[ 9];	td64_09=rotl64(data64[ 9], 10);
		p_xor_d_12=p512_12^data64[ 12];	td64_12=rotl64(data64[ 12], 13);
		t512_32 = (p_xor_d_15 - p_xor_d_12);
		exp_02 = (p_xor_d_00  + p_xor_d_07  + p_xor_d_09  + t512_32 );
		exp_02 = s64_2(exp_02) + p512_03;

		exp_04 = (p_xor_d_02  + p_xor_d_09  + t512_35  - p_xor_d_11 );
		exp_04 = s64_4(exp_04) + p512_05;
		t512_31 = (p_xor_d_08 - p_xor_d_05);
		exp_11 = (p_xor_d_09  + t512_31  - p_xor_d_00  - p_xor_d_02 );
		exp_11 = s64_1(exp_11) + p512_12;
		p_xor_d_03=p512_03^data64[ 3];	td64_03=rotl64(data64[ 3], 4);
		t512_33 = (p_xor_d_03 + p_xor_d_10);
		exp_05 = (t512_32  + t512_33  - p_xor_d_02 );
		exp_05 = s64_0(exp_05) + p512_06;
		p_xor_d_06=p512_06^data64[ 6];	td64_06=rotl64(data64[ 6], 7);
		exp_12 = (p_xor_d_01  + t512_33  - p_xor_d_06  - p_xor_d_09 );
		exp_12 = s64_2(exp_12) + p512_13;
		t512_34 = (p_xor_d_13 - p_xor_d_06);
		exp_08 = (p_xor_d_02  + t512_34  - p_xor_d_05  - p_xor_d_15 );
		exp_08 = s64_3(exp_08) + p512_09;
		exp_15 = (p_xor_d_12  + t512_34  - p_xor_d_04  - p_xor_d_09 );
		exp_15 = s64_0(exp_15) + p512_00;
		exp_07 = (t512_35  - p_xor_d_04  - p_xor_d_05  - p_xor_d_12 );
		exp_07 = s64_2(exp_07) + p512_08;
		exp_14 = (p_xor_d_03  + t512_31  - p_xor_d_11  - p_xor_d_12 );
		exp_14 = s64_4(exp_14) + p512_15;
		exp_06 = (p_xor_d_13  - p_xor_d_03  + p_xor_d_04  - p_xor_d_11  - p_xor_d_00 );
		exp_06 = s64_1(exp_06) + p512_07;
		t512_36 = (p_xor_d_06 + p_xor_d_14);
		exp_01 = (p_xor_d_11  + t512_36  - p_xor_d_08  - p_xor_d_15 );
		exp_01 = s64_1(exp_01) + p512_02;
		exp_09 = (p_xor_d_00  + t512_36  - p_xor_d_03  - p_xor_d_07 );
		exp_09 = s64_4(exp_09) + p512_10;


		// first parts of Message expansion
		exp_16  = s64_1(exp_00);

		exp_17  = s64_1(exp_01);
		TempEven64 = exp_14;
		exp_16  += s64_2(exp_01);
		TempEven64 += exp_12;
		exp_17 += s64_2(exp_14);
		TempEven64 += exp_02; 
		exp_16 += s64_3(exp_14);


		TempOdd64  = exp_03; 		
		//u_int32_t rotate_t12 = r64_05(exp_12);
		//u_int32_t rotate_t14 = r64_06(exp_14);

		//exp_19  = rotate_t12 + rotate_t14 /*r64_06(exp_14)*/; // s64_0(exp_12) and r64_05(exp_12) share one rotate. -ok
		exp_17 += s64_0(exp_12);
		exp_19 = r64_05(exp_12); // s64_0(exp_12) and r64_05(exp_12) share one rotate. -ok
		exp_19 += r64_06(exp_14);
		
		exp_16 += s64_3(exp_02);
		exp_17 += s64_3(exp_03);

		exp_16 += s64_1(exp_12);

		exp_17 += s64_2(exp_02);
		exp_16 += s64_0(exp_03);




		//rotate_t12 = rotr64(rotate_t12,3);
		//rotate_t14 = rotr64(rotate_t14,4);
		//exp_21  = rotate_t12 /*r64_04(exp_12)*/ + rotate_t14 /*r64_05(exp_14)*/;
		exp_21 = r64_04(exp_12);
		exp_21 += r64_05(exp_14);
		TempEven64 += exp_04;
		TempOdd64  += exp_05; 
		exp_16 += s64_1(exp_04);
		exp_16 += s64_2(exp_05); 
		//rotate_t12 = rotr64(rotate_t12,3);
		//rotate_t14 = rotr64(rotate_t14,3);
		//exp_23  = rotate_t12 /*r64_03(exp_12)*/ + rotate_t14 /*r64_04(exp_14)*/; 
		exp_23 = r64_03(exp_12);
		exp_23 += r64_04(exp_14); // s64_0(exp_16) and r64_05(exp_16) share one rotate.
		exp_17 += s64_0(exp_04);
		exp_17 += s64_1(exp_05);
		//rotate_t12 = rotr64(rotate_t12,6);
		//rotate_t14 = rotr64(rotate_t14,3);
		//exp_25  = rotate_t12 /*r64_02(exp_12)*/ + rotate_t14 /*r64_03(exp_14)*/;
		exp_25 = r64_02(exp_12);
		exp_25 += r64_03(exp_14);
		TempEven64 += exp_06; 
		TempOdd64  += exp_07; 
		exp_16 += s64_3(exp_06);
		exp_16 += s64_0(exp_07);
		//rotate_t12 = rotr64(rotate_t12,4);
		//rotate_t14 = rotr64(rotate_t14,6);
		//exp_27  = rotate_t12 /*r64_01(exp_12)*/ + rotate_t14 /*r64_02(exp_14)*/;
		exp_27 = r64_01(exp_12);
		exp_27 += r64_02(exp_14);
		exp_17 += s64_2(exp_06);
		exp_17 += s64_3(exp_07);
		rotate_t13 = r64_03(exp_13);
		rotate_t15 = r64_04(exp_15);
		exp_24 = rotate_t13; // r64_03(exp_13)
		exp_24 += rotate_t15; // r64_04(exp_15)
		TempEven64 += exp_08; 
		TempOdd64  += exp_09; 
		exp_16 += s64_1(exp_08) + s64_2(exp_09);
		rotate_t13 = rotl64(rotate_t13,10);
		rotate_t15 = rotl64(rotate_t15,11);
		exp_20 = rotate_t13; // r64_05(exp_13) 
		exp_20 += rotate_t15; // r64_06(exp_15)
		exp_17 += s64_0(exp_08);
		exp_17 += s64_1(exp_09);
		rotate_t13 = rotr64(rotate_t13,26);
		rotate_t15 = rotr64(rotate_t15,16);
		exp_26 = rotate_t13; // r64_02(exp_13) 
		exp_26 += rotate_t15; // r64_03(exp_15)
		TempEven64 += exp_10; 
		TempOdd64  += exp_11; 
		exp_16 += s64_3(exp_10);
		exp_16 += s64_0(exp_11);
		TempOdd64  += exp_13; 
		TempOdd64  += exp_15;
		exp_18 = r64_06(exp_13);
		exp_18 += r64_07(exp_15);
		exp_18 += r64_05(exp_11);
		exp_17 += s64_2(exp_10);
		exp_17 += s64_3(exp_11);
		exp_22 = r64_04(exp_13);
		exp_22 += r64_05(exp_15);
		exp_16 += s64_2(exp_13);
		exp_16 += s64_0(exp_15);

		exp_17 += s64_1(exp_13);
		exp_17 += s64_3(exp_15);

		
		exp_16 += ((td64_00 + td64_03 + 0x5555555555555550ull - td64_10) ^ p512_07);
		XL64 =  exp_16;
		exp_28 = r64_01(exp_13);
		exp_28 += r64_02(exp_15);
		exp_17 += s64_0(exp_16);
		exp_17 += ((td64_01 + td64_04 - td64_11 + 0x5aaaaaaaaaaaaaa5ull) ^ p512_08);
		XL64 ^= exp_17;

		/* expand32_22(18); */
		exp_18 += TempEven64;
		exp_18 += s64_4( exp_16);
		exp_18 += s64_5( exp_17);
		exp_18 += r64_01(exp_03);
		exp_18 += r64_02(exp_05);
		exp_18 += r64_03(exp_07);
		exp_18 += r64_04(exp_09);
							  				  
		exp_18 += ((td64_02 + td64_05 - td64_12 + 0x5ffffffffffffffaull) ^ p512_09);
		XL64 ^= exp_18;


		exp_20 += r64_01(exp_05);
		exp_20 += r64_02(exp_07);
		exp_20 += r64_03(exp_09);
		exp_20 += r64_04(exp_11);
		exp_20 += r64_07(exp_17);
		exp_20 += s64_4( exp_18 );
		exp_20 += ((td64_04 + td64_07 - td64_14 + 0x6aaaaaaaaaaaaaa4ull) ^ p512_11);


		exp_22 += r64_01(exp_07);
		exp_22 += r64_02(exp_09);
		exp_22 += r64_03(exp_11);
		exp_22 += r64_06(exp_17);
		exp_22 +=  ((td64_06 + td64_09 - td64_00 + 0x755555555555554eull) ^ p512_13);

		/* expand32_21(19); */
		//----
		exp_19 += TempOdd64;
		exp_19 += r64_01(exp_04);
		exp_19 += r64_02(exp_06);
		exp_19 += r64_03(exp_08);
		exp_19 += r64_04(exp_10);
		exp_19 += r64_07(exp_16);
		exp_19 += s64_4( exp_17);
		exp_19 += s64_5( exp_18);
		exp_19 += ((td64_03 + td64_06 - td64_13 + 0x655555555555554full) ^ p512_10); 
		XL64 ^= exp_19;
		TempEven64=TempEven64 + exp_16 - exp_02;
		
		//---- 
		/* expand32_22(20); */
		exp_20 += TempEven64;
		exp_20 += s64_5( exp_19);		
		XL64 ^= exp_20;
		TempOdd64 = TempOdd64 + exp_17 - exp_03;
		/* expand32_21(21); */
		exp_21 += TempOdd64;
		exp_21 += r64_01(exp_06);
		exp_21 += r64_02(exp_08);
		exp_21 += r64_03(exp_10);
		exp_21 += r64_06(exp_16);
		exp_21 += r64_07(exp_18);
		exp_21 += s64_4( exp_19);
		exp_21 += s64_5( exp_20);
		exp_21 += ((td64_05 + td64_08 - td64_15 + 0x6ffffffffffffff9ull) ^ p512_12);
		XL64 ^= exp_21;
		TempEven64 = TempEven64 + exp_18 - exp_04;
		/* expand32_22(22); */
		exp_22 += TempEven64;
		exp_22 += r64_07(exp_19);
		exp_22 += s64_4( exp_20);
		exp_22 += s64_5( exp_21);
		XL64 ^= exp_22;
		TempOdd64 = TempOdd64 + exp_19 - exp_05;
		/* expand32_21(23); */
		exp_23 += TempOdd64;
		exp_23 += r64_01(exp_08);
		exp_23 += r64_02(exp_10);
		exp_23 += r64_05(exp_16);
		exp_23 += r64_06(exp_18);
		exp_23 += r64_07(exp_20);
		exp_23 += s64_4( exp_21);
		exp_23 += s64_5( exp_22);
		exp_23 += ((td64_07 + td64_10 - td64_01 + 0x7aaaaaaaaaaaaaa3ull) ^ p512_14);
		XL64 ^= exp_23;
		TempEven64 = TempEven64 + exp_20 - exp_06;
		/* expand32_22(24); */
		exp_24 += TempEven64;
		exp_24 += r64_01(exp_09);
		exp_24 += r64_02(exp_11);
		exp_24 += r64_05(exp_17);
		exp_24 += r64_06(exp_19);
		exp_24 += r64_07(exp_21);
		exp_24 += s64_4( exp_22);
		exp_24 += s64_5( exp_23);
		exp_24 += ((td64_08 + td64_11 - td64_02 + 0x7ffffffffffffff8ull) ^ p512_15);
		XH64 =  XL64^exp_24;
		TempOdd64 = TempOdd64 + exp_21 - exp_07;
		/* expand32_21(25); */
		exp_25 += TempOdd64;
		exp_25 += r64_01(exp_10);
		exp_25 += r64_04(exp_16);
		exp_25 += r64_05(exp_18);
		exp_25 += r64_06(exp_20);
		exp_25 += r64_07(exp_22);
		exp_25 += s64_4( exp_23);
		exp_25 += s64_5( exp_24);
		exp_25 += ((td64_09 + td64_12 + 0x855555555555554dull - td64_03) ^ p512_00);
		XH64 ^= exp_25;
		TempEven64 = TempEven64 + exp_22 - exp_08;
		/* expand32_22(26); */
		exp_26 += TempEven64;
		exp_26 += r64_01(exp_11);
		exp_26 += r64_04(exp_17);
		exp_26 += r64_05(exp_19);
		exp_26 += r64_06(exp_21);
		exp_26 += r64_07(exp_23);
		exp_26 += s64_4( exp_24);
		exp_26 += s64_5( exp_25);
		exp_26 += ((td64_10 + td64_13 - td64_04 + 0x8aaaaaaaaaaaaaa2ull) ^ p512_01);
		XH64 ^= exp_26;
		TempOdd64 = TempOdd64 + exp_23 - exp_09;
		/* expand32_21(27); */
		exp_27 += TempOdd64;
		exp_27 += r64_03(exp_16);
		exp_27 += r64_04(exp_18);
		exp_27 += r64_05(exp_20);
		exp_27 += r64_06(exp_22);
		exp_27 += r64_07(exp_24);
		exp_27 += s64_4( exp_25);
		exp_27 += s64_5( exp_26);
		exp_27 += ((td64_11 + td64_14 - td64_05 + 0x8ffffffffffffff7ull) ^ p512_02);
		XH64 ^= exp_27;

		TempEven64 = TempEven64 + exp_24 - exp_10;
		/* expand32_22(28); */
		exp_28 += TempEven64;
		exp_28 += r64_03(exp_17);
		exp_28 += r64_04(exp_19);
		exp_28 += r64_05(exp_21);
		exp_28 += r64_06(exp_23);
		exp_28 += r64_07(exp_25);
		exp_28 += s64_4( exp_26);
		exp_28 += s64_5( exp_27);
		exp_28 += ((td64_12 + td64_15 - td64_06 + 0x955555555555554cull) ^ p512_03);
		XH64 ^= exp_28;
		TempOdd64 = TempOdd64 + exp_25 - exp_11;
		/* expand32_21(29); */
		exp_29 = TempOdd64;
		exp_29 += r64_01(exp_14);
		exp_29 += r64_02(exp_16);
		exp_29 += r64_03(exp_18);
		exp_29 += r64_04(exp_20);
		exp_29 += r64_05(exp_22);
		exp_29 += r64_06(exp_24);
		exp_29 += r64_07(exp_26);
		exp_29 += s64_4( exp_27);
		exp_29 += s64_5( exp_28);
		exp_29 += ((td64_13 + td64_00 - td64_07 +  0x9aaaaaaaaaaaaaa1ull) ^ p512_04);
		XH64 ^= exp_29;
		TempEven64 = TempEven64 + exp_26 - exp_12;
		/* expand32_22(30); */
		exp_30 = TempEven64;
		exp_30 += r64_01(exp_15);
		exp_30 += r64_02(exp_17);
		exp_30 += r64_03(exp_19);
		exp_30 += r64_04(exp_21);
		exp_30 += r64_05(exp_23);
		exp_30 += r64_06(exp_25);
		exp_30 += r64_07(exp_27);
		exp_30 += s64_4( exp_28);
		exp_30 += s64_5( exp_29);
		exp_30 += ((td64_14 + td64_01 - td64_08 + 0x9ffffffffffffff6ull) ^ p512_05);
		XH64 ^= exp_30;
		TempOdd64 = TempOdd64 + exp_27 - exp_13;
		/* expand32_21(31); */
		exp_31 = TempOdd64;
		exp_31 += r64_01(exp_16);
		exp_31 += r64_02(exp_18);
		exp_31 += r64_03(exp_20);
		exp_31 += r64_04(exp_22);
		exp_31 += r64_05(exp_24);
		exp_31 += r64_06(exp_26);
		exp_31 += r64_07(exp_28);
		exp_31 += s64_4( exp_29);
		exp_31 += s64_5( exp_30);
		exp_31 += ((td64_15 + td64_02 - td64_09 + 0xa55555555555554bull) ^ p512_06);
		XH64 ^= exp_31;

		/*  Compute the double chaining pipe for the next message block. */
		p512_00 =                       (shl(XH64, 5) ^ shr(exp_16,5) ^ data64[ 0]) + (    XL64    ^ exp_24 ^ exp_00); 
		p512_01 =                       (shr(XH64, 7) ^ shl(exp_17,8) ^ data64[ 1]) + (    XL64    ^ exp_25 ^ exp_01);
		p512_02 =                       (shr(XH64, 5) ^ shl(exp_18,5) ^ data64[ 2]) + (    XL64    ^ exp_26 ^ exp_02);
		p512_03 =                       (shr(XH64, 1) ^ shl(exp_19,5) ^ data64[ 3]) + (    XL64    ^ exp_27 ^ exp_03);
		p512_04 =                       (shr(XH64, 3) ^     exp_20    ^ data64[ 4]) + (    XL64    ^ exp_28 ^ exp_04);
		p512_05 =                       (shl(XH64, 6) ^ shr(exp_21,6) ^ data64[ 5]) + (    XL64    ^ exp_29 ^ exp_05);
		p512_06 =                       (shr(XH64, 4) ^ shl(exp_22,6) ^ data64[ 6]) + (    XL64    ^ exp_30 ^ exp_06);
		p512_07 =                       (shr(XH64,11) ^ shl(exp_23,2) ^ data64[ 7]) + (    XL64    ^ exp_31 ^ exp_07);

		p512_08 = rotl64(p512_04, 9) + (    XH64     ^     exp_24    ^ data64[ 8]) + (shl(XL64,8) ^ exp_23 ^ exp_08);
		p512_09 = rotl64(p512_05,10) + (    XH64     ^     exp_25    ^ data64[ 9]) + (shr(XL64,6) ^ exp_16 ^ exp_09);
		p512_15 = rotl64(p512_03,16) + (    XH64     ^     exp_31    ^ data64[15]) + (shr(XL64,2) ^ exp_22 ^ exp_15);
		p512_10 = rotl64(p512_06,11) + (    XH64     ^     exp_26    ^ data64[10]) + (shl(XL64,6) ^ exp_17 ^ exp_10);
		p512_11 = rotl64(p512_07,12) + (    XH64     ^     exp_27    ^ data64[11]) + (shl(XL64,4) ^ exp_18 ^ exp_11);
		p512_12 = rotl64(p512_00,13) + (    XH64     ^     exp_28    ^ data64[12]) + (shr(XL64,3) ^ exp_19 ^ exp_12);
		p512_13 = rotl64(p512_01,14) + (    XH64     ^     exp_29    ^ data64[13]) + (shr(XL64,4) ^ exp_20 ^ exp_13);
		p512_14 = rotl64(p512_02,15) + (    XH64     ^     exp_30    ^ data64[14]) + (shr(XL64,7) ^ exp_21 ^ exp_14);

		data64 += 16;
	}
	
	databitlen -= (BlueMidnightWish512_BLOCK_SIZE * 8) * iterations;
	state->bits_processed += (BlueMidnightWish512_BLOCK_SIZE * 8) *  iterations;
	
	state->unprocessed_bits = (int)databitlen;
	
	hashState512(state)->DoublePipe[5] = p512_05;
	hashState512(state)->DoublePipe[10] = p512_10;
	hashState512(state)->DoublePipe[7] = p512_07;
	hashState512(state)->DoublePipe[13] = p512_13;
	hashState512(state)->DoublePipe[15] = p512_15;
	
	hashState512(state)->DoublePipe[11] = p512_11;
	hashState512(state)->DoublePipe[6] = p512_06;
	hashState512(state)->DoublePipe[8] = p512_08;
	
	hashState512(state)->DoublePipe[0] = p512_00;
	hashState512(state)->DoublePipe[1] = p512_01;
	hashState512(state)->DoublePipe[2] = p512_02;
	hashState512(state)->DoublePipe[3] = p512_03;
	hashState512(state)->DoublePipe[4] = p512_04;
	hashState512(state)->DoublePipe[9] = p512_09;
	hashState512(state)->DoublePipe[12] = p512_12;
	hashState512(state)->DoublePipe[14] = p512_14;
	
	return databitlen;
}


__inline static void FinalCompress512(hashState *state)
{	
	u_int64_t XL64, XH64, TempEven64, TempOdd64;

	u_int64_t p_xor_d_00, p_xor_d_01, p_xor_d_02, p_xor_d_03, p_xor_d_04, p_xor_d_05, p_xor_d_06, p_xor_d_07; 
	u_int64_t p_xor_d_08, p_xor_d_09, p_xor_d_10, p_xor_d_11, p_xor_d_12, p_xor_d_13, p_xor_d_14, p_xor_d_15;

	u_int64_t p512_00, p512_01, p512_02, p512_03, p512_04, p512_05, p512_06, p512_07;
	u_int64_t p512_08, p512_09, p512_10, p512_11, p512_12, p512_13, p512_14, p512_15;

	u_int64_t exp_00, exp_01, exp_02, exp_03, exp_04, exp_05, exp_06, exp_07;
	u_int64_t exp_08, exp_09, exp_10, exp_11, exp_12, exp_13, exp_14, exp_15;

	u_int64_t exp_16, exp_17, exp_18, exp_19, exp_20, exp_21, exp_22, exp_23;
	u_int64_t exp_24, exp_25, exp_26, exp_27, exp_28, exp_29, exp_30, exp_31;

	u_int64_t t512_31, t512_32, t512_33, t512_34, t512_35, t512_36, t512_37;

	u_int64_t td64_00, td64_01, td64_02, td64_03, td64_04, td64_05, td64_06, td64_07;
	u_int64_t td64_08, td64_09, td64_10, td64_11, td64_12, td64_13, td64_14, td64_15;

	u_int64_t rotate_t13, rotate_t15;

	p512_00 = hashState512(state)->DoublePipe[0];
	p512_01 = hashState512(state)->DoublePipe[1];
	p512_02 = hashState512(state)->DoublePipe[2];
	p512_03 = hashState512(state)->DoublePipe[3];
	p512_04 = hashState512(state)->DoublePipe[4];
	p512_09 = hashState512(state)->DoublePipe[9];
	p512_12 = hashState512(state)->DoublePipe[12];
	p512_15 = hashState512(state)->DoublePipe[15];

	p512_11 = hashState512(state)->DoublePipe[11];
	p512_06 = hashState512(state)->DoublePipe[6];
	p512_08 = hashState512(state)->DoublePipe[8];

	p512_05 = hashState512(state)->DoublePipe[5];
	p512_10 = hashState512(state)->DoublePipe[10];
	p512_07 = hashState512(state)->DoublePipe[7];
	p512_13 = hashState512(state)->DoublePipe[13];
	p512_14 = hashState512(state)->DoublePipe[14];
	
	

	{
		p_xor_d_05=p512_05^0xaaaaaaaaaaaaaaa5ull;	td64_05=rotl64(p512_05, 6);
		p_xor_d_07=p512_07^0xaaaaaaaaaaaaaaa7ull;	td64_07=rotl64(p512_07, 8);
		p_xor_d_10=p512_10^0xaaaaaaaaaaaaaaaaull;	td64_10=rotl64(p512_10, 11);
		p_xor_d_13=p512_13^0xaaaaaaaaaaaaaaadull;	td64_13=rotl64(p512_13, 14);
		p_xor_d_14=p512_14^0xaaaaaaaaaaaaaaaeull;	td64_14=rotl64(p512_14, 15);
		exp_00 = (p_xor_d_05  - p_xor_d_07  + p_xor_d_10  + p_xor_d_13  + p_xor_d_14 );
		exp_00 = s64_0(exp_00) + 0xaaaaaaaaaaaaaaa1ull;
		p_xor_d_00=p512_00^0xaaaaaaaaaaaaaaa0ull;	td64_00=rotl64(p512_00, 1);
		p_xor_d_08=p512_08^0xaaaaaaaaaaaaaaa8ull;	td64_08=rotl64(p512_08, 9);
		p_xor_d_01=p512_01^0xaaaaaaaaaaaaaaa1ull;	td64_01=rotl64(p512_01, 2);
		t512_37 = (p_xor_d_08 - p_xor_d_01);
		t512_35 = (p_xor_d_01 - p_xor_d_14);
		exp_03 = (p_xor_d_00  + p_xor_d_13  + t512_37  - p_xor_d_10 );
		exp_03 = s64_3(exp_03) + 0xaaaaaaaaaaaaaaa4ull;
		p_xor_d_15=p512_15^0xaaaaaaaaaaaaaaafull;	td64_15=rotl64(p512_15, 16);
		p_xor_d_04=p512_04^0xaaaaaaaaaaaaaaa4ull;	td64_04=rotl64(p512_04, 5);
		exp_10 = (p_xor_d_15  + t512_37  - p_xor_d_04  - p_xor_d_07 );
		exp_10 = s64_0(exp_10) + 0xaaaaaaaaaaaaaaabull;
		p_xor_d_02=p512_02^0xaaaaaaaaaaaaaaa2ull;	td64_02=rotl64(p512_02, 3);
		p_xor_d_11=p512_11^0xaaaaaaaaaaaaaaabull;	td64_11=rotl64(p512_11, 12);
		exp_13 = (p_xor_d_02  + p_xor_d_04  + p_xor_d_07  + p_xor_d_10  + p_xor_d_11 );
		exp_13 = s64_3(exp_13) + 0xaaaaaaaaaaaaaaaeull;
		p_xor_d_09=p512_09^0xaaaaaaaaaaaaaaa9ull;	td64_09=rotl64(p512_09, 10);
		p_xor_d_12=p512_12^0xaaaaaaaaaaaaaaacull;	td64_12=rotl64(p512_12, 13);
		t512_32 = (p_xor_d_15 - p_xor_d_12);
		exp_02 = (p_xor_d_00  + p_xor_d_07  + p_xor_d_09  + t512_32 );
		exp_02 = s64_2(exp_02) + 0xaaaaaaaaaaaaaaa3ull;

		exp_04 = (p_xor_d_02  + p_xor_d_09  + t512_35  - p_xor_d_11 );
		exp_04 = s64_4(exp_04) + 0xaaaaaaaaaaaaaaa5ull;
		t512_31 = (p_xor_d_08 - p_xor_d_05);
		exp_11 = (p_xor_d_09  + t512_31  - p_xor_d_00  - p_xor_d_02 );
		exp_11 = s64_1(exp_11) + 0xaaaaaaaaaaaaaaacull;
		p_xor_d_03=p512_03^0xaaaaaaaaaaaaaaa3ull;	td64_03=rotl64(p512_03, 4);
		t512_33 = (p_xor_d_03 + p_xor_d_10);
		exp_05 = (t512_32  + t512_33  - p_xor_d_02 );
		exp_05 = s64_0(exp_05) + 0xaaaaaaaaaaaaaaa6ull;
		p_xor_d_06=p512_06^0xaaaaaaaaaaaaaaa6ull;	td64_06=rotl64(p512_06, 7);
		exp_12 = (p_xor_d_01  + t512_33  - p_xor_d_06  - p_xor_d_09 );
		exp_12 = s64_2(exp_12) + 0xaaaaaaaaaaaaaaadull;
		t512_34 = (p_xor_d_13 - p_xor_d_06);
		exp_08 = (p_xor_d_02  + t512_34  - p_xor_d_05  - p_xor_d_15 );
		exp_08 = s64_3(exp_08) + 0xaaaaaaaaaaaaaaa9ull;
		exp_15 = (p_xor_d_12  + t512_34  - p_xor_d_04  - p_xor_d_09 );
		exp_15 = s64_0(exp_15) + 0xaaaaaaaaaaaaaaa0ull;
		exp_07 = (t512_35  - p_xor_d_04  - p_xor_d_05  - p_xor_d_12 );
		exp_07 = s64_2(exp_07) + 0xaaaaaaaaaaaaaaa8ull;
		exp_14 = (p_xor_d_03  + t512_31  - p_xor_d_11  - p_xor_d_12 );
		exp_14 = s64_4(exp_14) + 0xaaaaaaaaaaaaaaafull;
		exp_06 = (p_xor_d_13  - p_xor_d_03  + p_xor_d_04  - p_xor_d_11  - p_xor_d_00 );
		exp_06 = s64_1(exp_06) + 0xaaaaaaaaaaaaaaa7ull;
		t512_36 = (p_xor_d_06 + p_xor_d_14);
		exp_01 = (p_xor_d_11  + t512_36  - p_xor_d_08  - p_xor_d_15 );
		exp_01 = s64_1(exp_01) + 0xaaaaaaaaaaaaaaa2ull;
		exp_09 = (p_xor_d_00  + t512_36  - p_xor_d_03  - p_xor_d_07 );
		exp_09 = s64_4(exp_09) + 0xaaaaaaaaaaaaaaaaull;


		// first parts of Message expansion
		exp_16  = s64_1(exp_00);

		exp_17  = s64_1(exp_01);
		TempEven64 = exp_14;
		exp_16  += s64_2(exp_01);
		TempEven64 += exp_12;
		exp_17 += s64_2(exp_14);
		TempEven64 += exp_02; 
		exp_16 += s64_3(exp_14);


		TempOdd64  = exp_03; 		
		//u_int32_t rotate_t12 = r64_05(exp_12);
		//u_int32_t rotate_t14 = r64_06(exp_14);

		//exp_19  = rotate_t12 + rotate_t14 /*r64_06(exp_14)*/; 
		exp_17 += s64_0(exp_12);
		exp_19 = r64_05(exp_12);
		exp_19 += r64_06(exp_14);
		
		exp_16 += s64_3(exp_02);
		exp_17 += s64_3(exp_03);

		exp_16 += s64_1(exp_12);

		exp_17 += s64_2(exp_02);
		exp_16 += s64_0(exp_03);




		//rotate_t12 = rotr64(rotate_t12,3);
		//rotate_t14 = rotr64(rotate_t14,4);
		//exp_21  = rotate_t12 /*r64_04(exp_12)*/ + rotate_t14 /*r64_05(exp_14)*/;
		exp_21 = r64_04(exp_12);
		exp_21 += r64_05(exp_14);
		TempEven64 += exp_04;
		TempOdd64  += exp_05; 
		exp_16 += s64_1(exp_04);
		exp_16 += s64_2(exp_05);
		//rotate_t12 = rotr64(rotate_t12,3);
		//rotate_t14 = rotr64(rotate_t14,3);
		//exp_23  = rotate_t12 /*r64_03(exp_12)*/ + rotate_t14 /*r64_04(exp_14)*/; 
		exp_23 = r64_03(exp_12);
		exp_23 += r64_04(exp_14); // s64_0(exp_16) and r64_05(exp_16) share one rotate.
		exp_17 += s64_0(exp_04);
		exp_17 += s64_1(exp_05);
		//rotate_t12 = rotr64(rotate_t12,6);
		//rotate_t14 = rotr64(rotate_t14,3);
		//exp_25  = rotate_t12 /*r64_02(exp_12)*/ + rotate_t14 /*r64_03(exp_14)*/;
		exp_25 = r64_02(exp_12);
		exp_25 += r64_03(exp_14);
		TempEven64 += exp_06; 
		TempOdd64  += exp_07; 
		exp_16 += s64_3(exp_06);
		exp_16 += s64_0(exp_07);
		//rotate_t12 = rotr64(rotate_t12,4);
		//rotate_t14 = rotr64(rotate_t14,6);
		//exp_27  = rotate_t12 /*r64_01(exp_12)*/ + rotate_t14 /*r64_02(exp_14)*/;
		exp_27 = r64_01(exp_12);
		exp_27 += r64_02(exp_14);
		exp_17 += s64_2(exp_06);
		exp_17 += s64_3(exp_07);
		rotate_t13 = r64_03(exp_13);
		rotate_t15 = r64_04(exp_15);
		exp_24 = rotate_t13; // r64_03(exp_13)
		exp_24 += rotate_t15; // r64_04(exp_15)
		TempEven64 += exp_08; 
		TempOdd64  += exp_09; 
		exp_16 += s64_1(exp_08) + s64_2(exp_09);
		rotate_t13 = rotl64(rotate_t13,10);
		rotate_t15 = rotl64(rotate_t15,11);
		exp_20 = rotate_t13; // r64_05(exp_13) 
		exp_20 += rotate_t15; // r64_06(exp_15)
		exp_17 += s64_0(exp_08);
		exp_17 += s64_1(exp_09);
		rotate_t13 = rotr64(rotate_t13,26);
		rotate_t15 = rotr64(rotate_t15,16);
		exp_26 = rotate_t13; // r64_02(exp_13) 
		exp_26 += rotate_t15; // r64_03(exp_15)
		TempEven64 += exp_10; 
		TempOdd64  += exp_11; 
		exp_16 += s64_3(exp_10);
		exp_16 += s64_0(exp_11);
		TempOdd64  += exp_13; 
		TempOdd64  += exp_15;
		exp_18 = r64_06(exp_13);
		exp_18 += r64_07(exp_15);
		exp_18 += r64_05(exp_11);
		exp_17 += s64_2(exp_10);
		exp_17 += s64_3(exp_11);
		exp_22 = r64_04(exp_13);
		exp_22 += r64_05(exp_15);
		exp_16 += s64_2(exp_13);
		exp_16 += s64_0(exp_15);

		exp_17 += s64_1(exp_13);
		exp_17 += s64_3(exp_15);

		
		exp_16 += ((td64_00 + td64_03 + 0x5555555555555550ull - td64_10) ^ 0xaaaaaaaaaaaaaaa7ull);
		XL64 =  exp_16;
		exp_28 = r64_01(exp_13);
		exp_28 += r64_02(exp_15);
		exp_17 += s64_0(exp_16);
		exp_17 += ((td64_01 + td64_04 - td64_11 + 0x5aaaaaaaaaaaaaa5ull) ^ 0xaaaaaaaaaaaaaaa8ull);
		XL64 ^= exp_17;

		/* expand32_22(18); */
		exp_18 += TempEven64;
		exp_18 += s64_4( exp_16);
		exp_18 += s64_5( exp_17);
		exp_18 += r64_01(exp_03);
		exp_18 += r64_02(exp_05);
		exp_18 += r64_03(exp_07);
		exp_18 += r64_04(exp_09);
							  				  
		exp_18 += ((td64_02 + td64_05 - td64_12 + 0x5ffffffffffffffaull) ^ 0xaaaaaaaaaaaaaaa9ull);
		XL64 ^= exp_18;


		exp_20 += r64_01(exp_05);
		exp_20 += r64_02(exp_07);
		exp_20 += r64_03(exp_09);
		exp_20 += r64_04(exp_11);
		exp_20 += r64_07(exp_17);
		exp_20 += s64_4( exp_18 );
		exp_20 += ((td64_04 + td64_07 - td64_14 + 0x6aaaaaaaaaaaaaa4ull) ^ 0xaaaaaaaaaaaaaaabull);


		exp_22 += r64_01(exp_07);
		exp_22 += r64_02(exp_09);
		exp_22 += r64_03(exp_11);
		exp_22 += r64_06(exp_17);
		exp_22 +=  ((td64_06 + td64_09 - td64_00 + 0x755555555555554eull) ^ 0xaaaaaaaaaaaaaaadull);

		/* expand32_21(19); */
		//----
		exp_19 += TempOdd64;
		exp_19 += r64_01(exp_04);
		exp_19 += r64_02(exp_06);
		exp_19 += r64_03(exp_08);
		exp_19 += r64_04(exp_10);
		exp_19 += r64_07(exp_16);
		exp_19 += s64_4( exp_17);
		exp_19 += s64_5( exp_18);
		exp_19 += ((td64_03 + td64_06 - td64_13 + 0x655555555555554full) ^ 0xaaaaaaaaaaaaaaaaull);
		XL64 ^= exp_19;
		TempEven64=TempEven64 + exp_16 - exp_02;
		
		/* expand32_22(20); */
		exp_20 += TempEven64;
		exp_20 += s64_5( exp_19);		
		XL64 ^= exp_20;
		TempOdd64 = TempOdd64 + exp_17 - exp_03;
		/* expand32_21(21); */
		exp_21 += TempOdd64;
		exp_21 += r64_01(exp_06);
		exp_21 += r64_02(exp_08);
		exp_21 += r64_03(exp_10);
		exp_21 += r64_06(exp_16);
		exp_21 += r64_07(exp_18);
		exp_21 += s64_4( exp_19);
		exp_21 += s64_5( exp_20);
		exp_21 += ((td64_05 + td64_08 - td64_15 + 0x6ffffffffffffff9ull) ^ 0xaaaaaaaaaaaaaaacull);
		XL64 ^= exp_21;
		TempEven64 = TempEven64 + exp_18 - exp_04;
		/* expand32_22(22); */
		exp_22 += TempEven64;
		exp_22 += r64_07(exp_19);
		exp_22 += s64_4( exp_20);
		exp_22 += s64_5( exp_21);
		XL64 ^= exp_22;
		TempOdd64 = TempOdd64 + exp_19 - exp_05;
		/* expand32_21(23); */
		exp_23 += TempOdd64;
		exp_23 += r64_01(exp_08);
		exp_23 += r64_02(exp_10);
		exp_23 += r64_05(exp_16);
		exp_23 += r64_06(exp_18);
		exp_23 += r64_07(exp_20);
		exp_23 += s64_4( exp_21);
		exp_23 += s64_5( exp_22);
		exp_23 += ((td64_07 + td64_10 - td64_01 + 0x7aaaaaaaaaaaaaa3ull) ^ 0xaaaaaaaaaaaaaaaeull);
		XL64 ^= exp_23;
		TempEven64 = TempEven64 + exp_20 - exp_06;
		/* expand32_22(24); */
		exp_24 += TempEven64;
		exp_24 += r64_01(exp_09);
		exp_24 += r64_02(exp_11);
		exp_24 += r64_05(exp_17);
		exp_24 += r64_06(exp_19);
		exp_24 += r64_07(exp_21);
		exp_24 += s64_4( exp_22);
		exp_24 += s64_5( exp_23);
		exp_24 += ((td64_08 + td64_11 - td64_02 + 0x7ffffffffffffff8ull) ^ 0xaaaaaaaaaaaaaaafull);
		XH64 =  XL64^exp_24;
		TempOdd64 = TempOdd64 + exp_21 - exp_07;
		/* expand32_21(25); */
		exp_25 += TempOdd64;
		exp_25 += r64_01(exp_10);
		exp_25 += r64_04(exp_16);
		exp_25 += r64_05(exp_18);
		exp_25 += r64_06(exp_20);
		exp_25 += r64_07(exp_22);
		exp_25 += s64_4( exp_23);
		exp_25 += s64_5( exp_24);
		exp_25 += ((td64_09 + td64_12 + 0x855555555555554dull - td64_03) ^ 0xaaaaaaaaaaaaaaa0ull);
		XH64 ^= exp_25;
		TempEven64 = TempEven64 + exp_22 - exp_08;
		/* expand32_22(26); */
		exp_26 += TempEven64;
		exp_26 += r64_01(exp_11);
		exp_26 += r64_04(exp_17);
		exp_26 += r64_05(exp_19);
		exp_26 += r64_06(exp_21);
		exp_26 += r64_07(exp_23);
		exp_26 += s64_4( exp_24);
		exp_26 += s64_5( exp_25);
		exp_26 += ((td64_10 + td64_13 - td64_04 + 0x8aaaaaaaaaaaaaa2ull) ^ 0xaaaaaaaaaaaaaaa1ull);
		XH64 ^= exp_26;
		TempOdd64 = TempOdd64 + exp_23 - exp_09;
		/* expand32_21(27); */
		exp_27 += TempOdd64;
		exp_27 += r64_03(exp_16);
		exp_27 += r64_04(exp_18);
		exp_27 += r64_05(exp_20);
		exp_27 += r64_06(exp_22);
		exp_27 += r64_07(exp_24);
		exp_27 += s64_4( exp_25);
		exp_27 += s64_5( exp_26);
		exp_27 += ((td64_11 + td64_14 - td64_05 + 0x8ffffffffffffff7ull) ^ 0xaaaaaaaaaaaaaaa2ull);
		XH64 ^= exp_27;

		TempEven64 = TempEven64 + exp_24 - exp_10;
		/* expand32_22(28); */
		exp_28 += TempEven64;
		exp_28 += r64_03(exp_17);
		exp_28 += r64_04(exp_19);
		exp_28 += r64_05(exp_21);
		exp_28 += r64_06(exp_23);
		exp_28 += r64_07(exp_25);
		exp_28 += s64_4( exp_26);
		exp_28 += s64_5( exp_27);
		exp_28 += ((td64_12 + td64_15 - td64_06 + 0x955555555555554cull) ^ 0xaaaaaaaaaaaaaaa3ull);
		XH64 ^= exp_28;
		TempOdd64 = TempOdd64 + exp_25 - exp_11;
		/* expand32_21(29); */
		exp_29 = TempOdd64;
		exp_29 += r64_01(exp_14);
		exp_29 += r64_02(exp_16);
		exp_29 += r64_03(exp_18);
		exp_29 += r64_04(exp_20);
		exp_29 += r64_05(exp_22);
		exp_29 += r64_06(exp_24);
		exp_29 += r64_07(exp_26);
		exp_29 += s64_4( exp_27);
		exp_29 += s64_5( exp_28);
		exp_29 += ((td64_13 + td64_00 - td64_07 +  0x9aaaaaaaaaaaaaa1ull) ^ 0xaaaaaaaaaaaaaaa4ull);
		XH64 ^= exp_29;
		TempEven64 = TempEven64 + exp_26 - exp_12;
		/* expand32_22(30); */
		exp_30 = TempEven64;
		exp_30 += r64_01(exp_15);
		exp_30 += r64_02(exp_17);
		exp_30 += r64_03(exp_19);
		exp_30 += r64_04(exp_21);
		exp_30 += r64_05(exp_23);
		exp_30 += r64_06(exp_25);
		exp_30 += r64_07(exp_27);
		exp_30 += s64_4( exp_28);
		exp_30 += s64_5( exp_29);
		exp_30 += ((td64_14 + td64_01 - td64_08 + 0x9ffffffffffffff6ull) ^ 0xaaaaaaaaaaaaaaa5ull);
		XH64 ^= exp_30;
		TempOdd64 = TempOdd64 + exp_27 - exp_13;
		/* expand32_21(31); */
		exp_31 = TempOdd64;
		exp_31 += r64_01(exp_16);
		exp_31 += r64_02(exp_18);
		exp_31 += r64_03(exp_20);
		exp_31 += r64_04(exp_22);
		exp_31 += r64_05(exp_24);
		exp_31 += r64_06(exp_26);
		exp_31 += r64_07(exp_28);
		exp_31 += s64_4( exp_29);
		exp_31 += s64_5( exp_30);
		exp_31 += ((td64_15 + td64_02 - td64_09 + 0xa55555555555554bull) ^ 0xaaaaaaaaaaaaaaa6ull);
		XH64 ^= exp_31;

		/*  Compute the double chaining pipe for the next message block. */
		p512_00 =                       (shl(XH64, 5) ^ shr(exp_16,5) ^ hashState512(state)->DoublePipe[ 0]) + (    XL64    ^ exp_24 ^ exp_00); 
		p512_01 =                       (shr(XH64, 7) ^ shl(exp_17,8) ^ hashState512(state)->DoublePipe[ 1]) + (    XL64    ^ exp_25 ^ exp_01);
		p512_02 =                       (shr(XH64, 5) ^ shl(exp_18,5) ^ hashState512(state)->DoublePipe[ 2]) + (    XL64    ^ exp_26 ^ exp_02);
		p512_03 =                       (shr(XH64, 1) ^ shl(exp_19,5) ^ hashState512(state)->DoublePipe[ 3]) + (    XL64    ^ exp_27 ^ exp_03);
		p512_04 =                       (shr(XH64, 3) ^     exp_20    ^ hashState512(state)->DoublePipe[ 4]) + (    XL64    ^ exp_28 ^ exp_04);
		p512_05 =                       (shl(XH64, 6) ^ shr(exp_21,6) ^ hashState512(state)->DoublePipe[ 5]) + (    XL64    ^ exp_29 ^ exp_05);
		p512_06 =                       (shr(XH64, 4) ^ shl(exp_22,6) ^ hashState512(state)->DoublePipe[ 6]) + (    XL64    ^ exp_30 ^ exp_06);
		p512_07 =                       (shr(XH64,11) ^ shl(exp_23,2) ^ hashState512(state)->DoublePipe[ 7]) + (    XL64    ^ exp_31 ^ exp_07);

		p512_08 = rotl64(p512_04, 9) + (    XH64     ^     exp_24    ^ hashState512(state)->DoublePipe[ 8]) + (shl(XL64,8) ^ exp_23 ^ exp_08);
		p512_09 = rotl64(p512_05,10) + (    XH64     ^     exp_25    ^ hashState512(state)->DoublePipe[ 9]) + (shr(XL64,6) ^ exp_16 ^ exp_09);
		p512_15 = rotl64(p512_03,16) + (    XH64     ^     exp_31    ^ hashState512(state)->DoublePipe[15]) + (shr(XL64,2) ^ exp_22 ^ exp_15);
		p512_10 = rotl64(p512_06,11) + (    XH64     ^     exp_26    ^ hashState512(state)->DoublePipe[10]) + (shl(XL64,6) ^ exp_17 ^ exp_10);
		p512_11 = rotl64(p512_07,12) + (    XH64     ^     exp_27    ^ hashState512(state)->DoublePipe[11]) + (shl(XL64,4) ^ exp_18 ^ exp_11);
		p512_12 = rotl64(p512_00,13) + (    XH64     ^     exp_28    ^ hashState512(state)->DoublePipe[12]) + (shr(XL64,3) ^ exp_19 ^ exp_12);
		p512_13 = rotl64(p512_01,14) + (    XH64     ^     exp_29    ^ hashState512(state)->DoublePipe[13]) + (shr(XL64,4) ^ exp_20 ^ exp_13);
		p512_14 = rotl64(p512_02,15) + (    XH64     ^     exp_30    ^ hashState512(state)->DoublePipe[14]) + (shr(XL64,7) ^ exp_21 ^ exp_14);
		
	}

	hashState512(state)->DoublePipe[10] = p512_10;
	hashState512(state)->DoublePipe[13] = p512_13;
	hashState512(state)->DoublePipe[15] = p512_15;
	hashState512(state)->DoublePipe[11] = p512_11;
	hashState512(state)->DoublePipe[8] = p512_08;
	hashState512(state)->DoublePipe[9] = p512_09;
	hashState512(state)->DoublePipe[12] = p512_12;
	hashState512(state)->DoublePipe[14] = p512_14;
}

HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval)
{
	hashState state;
	u_int64_t *data64, *data64_end, iterations;

	int LastByte, LastBytes, PadOnePosition;

	//if(hashbitlen != 512)
	//	return(BAD_HASHLEN);	
	
	state.hashbitlen = 512;
	state.bits_processed = 0;
	state.unprocessed_bits = 0;
	memcpy(&hashState512_(state).DoublePipe, i512p2,  16 * sizeof(u_int64_t));

	data64 = (u_int64_t *)data;
	
	iterations = databitlen / (BlueMidnightWish512_BLOCK_SIZE * 8);
	data64_end = data64 + iterations*16;
	if(iterations > 0)
		databitlen = Compress512(data64, &state, databitlen);
	state.unprocessed_bits = (int)databitlen;

	if (databitlen > 0)
	{
		LastBytes = ((~(((- (int)databitlen)>>3) & 0x03ff)) + 1) & 0x03ff; // LastBytes = Ceil(databitlen / 8)
		memcpy(hashState512_(state).LastPart, data64_end, LastBytes );
	}


	LastByte = (int)state.unprocessed_bits >> 3;
	PadOnePosition = 7 - (state.unprocessed_bits & 0x07);
	hashState512_(state).LastPart[LastByte] = hashState512_(state).LastPart[LastByte] & (0xff << (PadOnePosition + 1) )\
		                                    ^ (0x01 << PadOnePosition);
	data64 = (u_int64_t *)hashState512_(state).LastPart;

	if (state.unprocessed_bits < 960)
	{
		memset( (hashState512_(state).LastPart) + LastByte + 1, 0x00, BlueMidnightWish512_BLOCK_SIZE - LastByte - 9 );
		databitlen = BlueMidnightWish512_BLOCK_SIZE * 8;
		data64[15] = state.bits_processed + state.unprocessed_bits;
	}
	else
	{
		memset( (hashState512_(state).LastPart) + LastByte + 1, 0x00, BlueMidnightWish512_BLOCK_SIZE * 2 - LastByte - 9 );
		databitlen = BlueMidnightWish512_BLOCK_SIZE * 16;
		data64[31] = state.bits_processed + state.unprocessed_bits;
	}

	
	// Note that this function also updates state
	Compress512(data64, &state, databitlen);

	FinalCompress512(&state);
	memcpy(hashval, hashState512_(state).DoublePipe + 8,  BlueMidnightWish512_DIGEST_SIZE );

	return(SUCCESS);
}
