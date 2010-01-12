/* 
   Optimized C code for tweaked Blue Midnight Wish - 256 programmed by Rune E. Jensen, December 2009.
*/

#include <stdio.h>
#include <string.h> 
#include "BlueMidnightWish.h"

#define rotl32(x,n)   (((x) << n) | ((x) >> (32 - n)))
#define rotr32(x,n)   (((x) >> n) | ((x) << (32 - n)))

#define shl(x,n)      ((x) << n)
#define shr(x,n)      ((x) >> n)

/* BlueMidnightWish256 initial double chaining pipe */
const u_int32_t i256p2[16] =
{   0x40414243ul, 0x44454647ul, 0x48494a4bul, 0x4c4d4e4ful,
    0x50515253ul, 0x54555657ul, 0x58595a5bul, 0x5c5d5e5ful,
    0x60616263ul, 0x64656667ul, 0x68696a6bul, 0x6c6d6e6ful,
    0x70717273ul, 0x74757677ul, 0x78797a7bul, 0x7c7d7e7ful,
};

#define hashState256(x)  ((x)->pipe->p256)
#define hashState256_(x)  ((x).pipe[0].p256[0])

/* Components used for 224 and 256 bit version */
//#define s32_0(x)  (shr((x), 1) ^ shl((x), 3) ^ rotl32((x),  4) ^ rotl32((x), 19))
//#define s32_1(x)  (shr((x), 1) ^ shl((x), 2) ^ rotl32((x),  8) ^ rotl32((x), 23))
//#define s32_2(x)  (shr((x), 2) ^ shl((x), 1) ^ rotl32((x), 12) ^ rotl32((x), 25))
//#define s32_3(x)  (shr((x), 2) ^ shl((x), 2) ^ rotl32((x), 15) ^ rotl32((x), 29))
#define s32_4(x)  (shr((x), 1) ^ (x))
#define s32_5(x)  (shr((x), 2) ^ (x))
#define r32_01(x) rotl32((x),  3)
#define r32_02(x) rotl32((x),  7)
#define r32_03(x) rotl32((x), 13)
#define r32_04(x) rotl32((x), 16)
#define r32_05(x) rotl32((x), 19)
#define r32_06(x) rotl32((x), 23)
#define r32_07(x) rotl32((x), 27)


//#define s32_0(x)  (shr((x), 1) ^ shl((x), 3) ^ rotr32((rotl32((x), 19)), 15) ^ rotl32((x), 19))
//#define s32_1(x)  (shr((x), 1) ^ shl((x), 2) ^ rotr32((rotl32((x), 23)), 15) ^ rotl32((x), 23))


static __inline u_int32_t s32_0(const u_int32_t x)
{
	u_int32_t ans = shl(x, 3);
	u_int32_t roll_temp = rotl32(x, 19);
	ans ^= roll_temp;
	ans ^= shr(x, 1);
	ans ^= rotr32(roll_temp, 15);
	return ans; //(shr((x), 1) ^ shl((x), 3) ^ rotl32((x),  4) ^ rotl32((x), 19));
}

static __inline u_int32_t s32_1( u_int32_t x)
{
	u_int32_t ans = shl(x, 2);
	u_int32_t roll_temp = rotl32(x, 23);
	ans ^= roll_temp;
	ans ^= shr(x, 1);
	ans ^= rotr32(roll_temp, 15);
	return ans; //(shr((x), 1) ^ shl((x), 2) ^ rotl32((x),  8) ^ rotl32((x), 23));
}

static __inline u_int32_t s32_2( u_int32_t x)
{
	u_int32_t ans = shl(x, 1);
	u_int32_t roll_temp = rotl32(x, 12);
	ans ^= roll_temp;
	ans ^= shr(x, 2);
	ans ^= rotl32(roll_temp, 13);
	return ans; //(shr((x), 2) ^ shl((x), 1) ^ rotl32((x), 12) ^ rotl32((x), 25));
}

static __inline u_int32_t s32_3( u_int32_t x)
{
	u_int32_t ans = shl(x, 2);
	u_int32_t roll_temp = rotl32(x, 15);
	ans ^= roll_temp;
	ans ^= shr(x, 2);
	ans ^= rotl32(roll_temp, 14);
	return ans; //(shr((x), 2) ^ shl((x), 2) ^ rotl32((x), 15) ^ rotl32((x), 29));
}

static DataLength Compress256(u_int32_t *data32, hashState *state, DataLength databitlen)
{	
	u_int32_t XL32, XH32, TempEven32, TempOdd32;

	u_int32_t p_xor_d_00, p_xor_d_01, p_xor_d_02, p_xor_d_03, p_xor_d_04, p_xor_d_05, p_xor_d_06, p_xor_d_07; 
	u_int32_t p_xor_d_08, p_xor_d_09, p_xor_d_10, p_xor_d_11, p_xor_d_12, p_xor_d_13, p_xor_d_14, p_xor_d_15;

	u_int32_t p256_00, p256_01, p256_02, p256_03, p256_04, p256_05, p256_06, p256_07;
	u_int32_t p256_08, p256_09, p256_10, p256_11, p256_12, p256_13, p256_14, p256_15;

	u_int32_t exp_00, exp_01, exp_02, exp_03, exp_04, exp_05, exp_06, exp_07;
	u_int32_t exp_08, exp_09, exp_10, exp_11, exp_12, exp_13, exp_14, exp_15;

	u_int32_t exp_16, exp_17, exp_18, exp_19, exp_20, exp_21, exp_22, exp_23;
	u_int32_t exp_24, exp_25, exp_26, exp_27, exp_28, exp_29, exp_30, exp_31;


	u_int32_t t256_31, t256_32, t256_33, t256_34, t256_35, t256_36, t256_37;

	u_int32_t td32_00, td32_01, td32_02, td32_03, td32_04, td32_05, td32_06, td32_07;
	u_int32_t td32_08, td32_09, td32_10, td32_11, td32_12, td32_13, td32_14, td32_15;

	
	p256_00 = hashState256(state)->DoublePipe[0];
	p256_01 = hashState256(state)->DoublePipe[1];
	p256_02 = hashState256(state)->DoublePipe[2];
	p256_03 = hashState256(state)->DoublePipe[3];
	p256_04 = hashState256(state)->DoublePipe[4];
	p256_09 = hashState256(state)->DoublePipe[9];
	p256_12 = hashState256(state)->DoublePipe[12];
	p256_15 = hashState256(state)->DoublePipe[15];
	
	p256_11 = hashState256(state)->DoublePipe[11];
	p256_06 = hashState256(state)->DoublePipe[6];
	p256_08 = hashState256(state)->DoublePipe[8];
	
	p256_05 = hashState256(state)->DoublePipe[5];
	p256_10 = hashState256(state)->DoublePipe[10];
	p256_07 = hashState256(state)->DoublePipe[7];
	p256_13 = hashState256(state)->DoublePipe[13];
	p256_14 = hashState256(state)->DoublePipe[14];
	
	
	u_int64_t iterations = databitlen / (BlueMidnightWish256_BLOCK_SIZE * 8);
	u_int32_t *data32_end = data32 + iterations*16;
	
	while (data32 < data32_end)
	{
		/* Mix the message block with the previous double pipe.       */
		/* These variables are used for the tweak */
		
		p_xor_d_05=p256_05^data32[ 5];	td32_05=rotl32(data32[ 5], 6);
		p_xor_d_07=p256_07^data32[ 7];	td32_07=rotl32(data32[ 7], 8);
		p_xor_d_10=p256_10^data32[ 10];	td32_10=rotl32(data32[ 10], 11);
		p_xor_d_13=p256_13^data32[ 13];	td32_13=rotl32(data32[ 13], 14);
		p_xor_d_14=p256_14^data32[ 14];	td32_14=rotl32(data32[ 14], 15);
		exp_00 = (p_xor_d_05  - p_xor_d_07  + p_xor_d_10  + p_xor_d_13  + p_xor_d_14 );
		exp_00 = s32_0(exp_00) + p256_01;
		p_xor_d_00=p256_00^data32[ 0];	td32_00=rotl32(data32[ 0], 1);
		p_xor_d_08=p256_08^data32[ 8];	td32_08=rotl32(data32[ 8], 9);
		p_xor_d_01=p256_01^data32[ 1];	td32_01=rotl32(data32[ 1], 2);
		t256_37 = (p_xor_d_08 - p_xor_d_01);
		t256_35 = (p_xor_d_01 - p_xor_d_14);
		exp_03 = (p_xor_d_00  + p_xor_d_13  + t256_37  - p_xor_d_10 );
		exp_03 = s32_3(exp_03) + p256_04;
		p_xor_d_15=p256_15^data32[ 15];	td32_15=rotl32(data32[ 15], 16);
		p_xor_d_04=p256_04^data32[ 4];	td32_04=rotl32(data32[ 4], 5);
		exp_10 = (p_xor_d_15  + t256_37  - p_xor_d_04  - p_xor_d_07 );
		exp_10 = s32_0(exp_10) + p256_11;
		p_xor_d_02=p256_02^data32[ 2];	td32_02=rotl32(data32[ 2], 3);
		p_xor_d_11=p256_11^data32[ 11];	td32_11=rotl32(data32[ 11], 12);
		exp_13 = (p_xor_d_02  + p_xor_d_04  + p_xor_d_07  + p_xor_d_10  + p_xor_d_11 );
		exp_13 = s32_3(exp_13) + p256_14;
		p_xor_d_09=p256_09^data32[ 9];	td32_09=rotl32(data32[ 9], 10);
		p_xor_d_12=p256_12^data32[ 12];	td32_12=rotl32(data32[ 12], 13);
		t256_32 = (p_xor_d_15 - p_xor_d_12);
		exp_02 = (p_xor_d_00  + p_xor_d_07  + p_xor_d_09  + t256_32 );
		exp_02 = s32_2(exp_02) + p256_03;
		//t256_35 = (p_xor_d_01 - p_xor_d_14);
		exp_04 = (p_xor_d_02  + p_xor_d_09  + t256_35  - p_xor_d_11 );
		exp_04 = s32_4(exp_04) + p256_05;
		t256_31 = (p_xor_d_08 - p_xor_d_05);
		exp_11 = (p_xor_d_09  + t256_31  - p_xor_d_00  - p_xor_d_02 );
		exp_11 = s32_1(exp_11) + p256_12;
		p_xor_d_03=p256_03^data32[ 3];	td32_03=rotl32(data32[ 3], 4);
		t256_33 = (p_xor_d_03 + p_xor_d_10);
		exp_05 = (t256_32  + t256_33  - p_xor_d_02 );
		exp_05 = s32_0(exp_05) + p256_06;
		p_xor_d_06=p256_06^data32[ 6];	td32_06=rotl32(data32[ 6], 7);
		exp_12 = (p_xor_d_01  + t256_33  - p_xor_d_06  - p_xor_d_09 );
		exp_12 = s32_2(exp_12) + p256_13;
		t256_34 = (p_xor_d_13 - p_xor_d_06);
		exp_08 = (p_xor_d_02  + t256_34  - p_xor_d_05  - p_xor_d_15 );
		exp_08 = s32_3(exp_08) + p256_09;
		exp_15 = (p_xor_d_12  + t256_34  - p_xor_d_04  - p_xor_d_09 );
		exp_15 = s32_0(exp_15) + p256_00;
		exp_07 = (t256_35  - p_xor_d_04  - p_xor_d_05  - p_xor_d_12 );
		exp_07 = s32_2(exp_07) + p256_08;
		exp_14 = (p_xor_d_03  + t256_31  - p_xor_d_11  - p_xor_d_12 );
		exp_14 = s32_4(exp_14) + p256_15;
		exp_06 = (p_xor_d_13  - p_xor_d_03  + p_xor_d_04  - p_xor_d_11  - p_xor_d_00 );
		exp_06 = s32_1(exp_06) + p256_07;
		t256_36 = (p_xor_d_06 + p_xor_d_14);
		exp_01 = (p_xor_d_11  + t256_36  - p_xor_d_08  - p_xor_d_15 );
		exp_01 = s32_1(exp_01) + p256_02;
		exp_09 = (p_xor_d_00  + t256_36  - p_xor_d_03  - p_xor_d_07 );
		exp_09 = s32_4(exp_09) + p256_10;


		// first parts of Message expansion
		exp_16  = s32_1(exp_00);

		exp_17  = s32_1(exp_01);
		TempEven32 = exp_14;
		exp_16  += s32_2(exp_01);
		TempEven32 += exp_12;
		exp_17 += s32_2(exp_14);
		TempEven32 += exp_02; 
		exp_16 += s32_3(exp_14);


		TempOdd32  = exp_03; 		
		//u_int32_t rotate_t12 = r32_05(exp_12);
		//u_int32_t rotate_t14 = r32_06(exp_14);

		//exp_19  = rotate_t12 + rotate_t14 /*r32_06(exp_14)*/; // s32_0(exp_12) and r32_05(exp_12) share one rotate. -ok
		exp_17 += s32_0(exp_12);
		exp_19 = r32_05(exp_12); // s32_0(exp_12) and r32_05(exp_12) share one rotate. -ok
		exp_19 += r32_06(exp_14);
		
		exp_16 += s32_3(exp_02);
		exp_17 += s32_3(exp_03);

		exp_16 += s32_1(exp_12);

		exp_17 += s32_2(exp_02);
		exp_16 += s32_0(exp_03);




		//rotate_t12 = rotr32(rotate_t12,3);
		//rotate_t14 = rotr32(rotate_t14,4);
		//exp_21  = rotate_t12 /*r32_04(exp_12)*/ + rotate_t14 /*r32_05(exp_14)*/;
		exp_21 = r32_04(exp_12);
		exp_21 += r32_05(exp_14);
		TempEven32 += exp_04;
		TempOdd32  += exp_05; 
		exp_16 += s32_1(exp_04);
		exp_16 += s32_2(exp_05); // 6 xor, 4 rot, 2 shr, 2 shl (lea), 2 add, 2 copy (or load)
		//rotate_t12 = rotr32(rotate_t12,3);
		//rotate_t14 = rotr32(rotate_t14,3);
		//exp_23  = rotate_t12 /*r32_03(exp_12)*/ + rotate_t14 /*r32_04(exp_14)*/; 
		exp_23 = r32_03(exp_12);
		exp_23 += r32_04(exp_14); // s32_0(exp_16) and r32_05(exp_16) share one rotate.
		exp_17 += s32_0(exp_04);
		exp_17 += s32_1(exp_05); // 6 xor, 4 rot, 2 shr, 2 shl, 2 add  ->  fix c: 8,  p0/5: 8+8=16, free: 16, tot: 32 (10 2/3)
		//rotate_t12 = rotr32(rotate_t12,6);
		//rotate_t14 = rotr32(rotate_t14,3);
		//exp_25  = rotate_t12 /*r32_02(exp_12)*/ + rotate_t14 /*r32_03(exp_14)*/;
		exp_25 = r32_02(exp_12);
		exp_25 += r32_03(exp_14);
		TempEven32 += exp_06; 
		TempOdd32  += exp_07; 
		exp_16 += s32_3(exp_06);
		exp_16 += s32_0(exp_07);
		//rotate_t12 = rotr32(rotate_t12,4);
		//rotate_t14 = rotr32(rotate_t14,6);
		//exp_27  = rotate_t12 /*r32_01(exp_12)*/ + rotate_t14 /*r32_02(exp_14)*/;
		exp_27 = r32_01(exp_12);
		exp_27 += r32_02(exp_14);
		exp_17 += s32_2(exp_06);
		exp_17 += s32_3(exp_07);
		u_int32_t rotate_t13 = r32_03(exp_13);
		u_int32_t rotate_t15 = r32_04(exp_15);
		exp_24 = rotate_t13; // r32_03(exp_13)
		exp_24 += rotate_t15; // r32_04(exp_15)
		TempEven32 += exp_08; 
		TempOdd32  += exp_09; 
		exp_16 += s32_1(exp_08) + s32_2(exp_09);
		rotate_t13 = rotl32(rotate_t13,6);
		rotate_t15 = rotl32(rotate_t15,7);
		exp_20 = rotate_t13; // r32_05(exp_13) 
		exp_20 += rotate_t15; // r32_06(exp_15)
		exp_17 += s32_0(exp_08);
		exp_17 += s32_1(exp_09);
		rotate_t13 = rotr32(rotate_t13,12);
		rotate_t15 = rotr32(rotate_t15,10);
		exp_26 = rotate_t13; // r32_02(exp_13) 
		exp_26 += rotate_t15; // r32_03(exp_15)
		TempEven32 += exp_10; 
		TempOdd32  += exp_11; 
		exp_16 += s32_3(exp_10);
		exp_16 += s32_0(exp_11);
		TempOdd32  += exp_13; 
		TempOdd32  += exp_15;
		exp_18 = r32_06(exp_13);
		exp_18 += r32_07(exp_15);
		exp_18 += r32_05(exp_11); // s32_1(exp_13) and r32_06(exp_13) share one rotate, s32_0(exp_11) and r32_05(exp_11) share one rotate.
		exp_17 += s32_2(exp_10);
		exp_17 += s32_3(exp_11);
		exp_22 = r32_04(exp_13);
		exp_22 += r32_05(exp_15); // s32_0(exp_15) and r32_05(exp_15) share one rotate. - ok
		exp_16 += s32_2(exp_13);
		exp_16 += s32_0(exp_15);

		exp_17 += s32_1(exp_13);
		exp_17 += s32_3(exp_15);

		
		exp_16 += ((td32_00 + td32_03 + 0x55555550u - td32_10) ^ p256_07);
		XL32 =  exp_16;
		exp_28 = r32_01(exp_13);
		exp_28 += r32_02(exp_15);
		exp_17 += s32_0(exp_16);
		exp_17 += ((td32_01 + td32_04 - td32_11 + 0x5aaaaaa5u) ^ p256_08);
		XL32 ^= exp_17;

		/* expand32_22(18); */
		exp_18 += TempEven32;
		exp_18 += s32_4( exp_16);
		exp_18 += s32_5( exp_17);
		exp_18 += r32_01(exp_03); // r32_01(exp_03) performs a shift left by 3 on exp_03 as well, as part of the rotate...
		exp_18 += r32_02(exp_05);
		exp_18 += r32_03(exp_07);
		exp_18 += r32_04(exp_09);
							  				  
		exp_18 += ((td32_02 + td32_05 - td32_12 + 0x5ffffffau) ^ p256_09);
		XL32 ^= exp_18;


		exp_20 += r32_01(exp_05);
		exp_20 += r32_02(exp_07);
		exp_20 += r32_03(exp_09);
		exp_20 += r32_04(exp_11);
		exp_20 += r32_07(exp_17);
		exp_20 += s32_4( exp_18 );
		exp_20 += ((td32_04 + td32_07 - td32_14 + 0x6aaaaaa4u) ^ p256_11);


		exp_22 += r32_01(exp_07);
		exp_22 += r32_02(exp_09);
		exp_22 += r32_03(exp_11);
		exp_22 += r32_06(exp_17);
		exp_22 +=  ((td32_06 + td32_09 - td32_00 + 0x7555554eu) ^ p256_13);

		/* expand32_21(19); */
		//----
		exp_19 += TempOdd32;
		exp_19 += r32_01(exp_04);
		exp_19 += r32_02(exp_06);
		exp_19 += r32_03(exp_08);
		exp_19 += r32_04(exp_10);
		exp_19 += r32_07(exp_16);
		exp_19 += s32_4( exp_17);
		exp_19 += s32_5( exp_18);
		exp_19 += ((td32_03 + td32_06 - td32_13 + 0x6555554fu) ^ p256_10);
		XL32 ^= exp_19;
		TempEven32=TempEven32 + exp_16 - exp_02;
		
		//---- 
		/* expand32_22(20); */
		exp_20 += TempEven32;
		exp_20 += s32_5( exp_19);		
		XL32 ^= exp_20;
		TempOdd32 = TempOdd32 + exp_17 - exp_03;
		/* expand32_21(21); */
		exp_21 += TempOdd32;
		exp_21 += r32_01(exp_06);
		exp_21 += r32_02(exp_08);
		exp_21 += r32_03(exp_10);
		exp_21 += r32_06(exp_16);
		exp_21 += r32_07(exp_18);
		exp_21 += s32_4( exp_19);
		exp_21 += s32_5( exp_20);
		exp_21 += ((td32_05 + td32_08 - td32_15 + 0x6ffffff9u) ^ p256_12);
		XL32 ^= exp_21;
		TempEven32 = TempEven32 + exp_18 - exp_04;
		/* expand32_22(22); */
		exp_22 += TempEven32;
		exp_22 += r32_07(exp_19);
		exp_22 += s32_4( exp_20);
		exp_22 += s32_5( exp_21);
		XL32 ^= exp_22;
		TempOdd32 = TempOdd32 + exp_19 - exp_05;
		/* expand32_21(23); */
		exp_23 += TempOdd32;
		exp_23 += r32_01(exp_08);
		exp_23 += r32_02(exp_10);
		exp_23 += r32_05(exp_16);
		exp_23 += r32_06(exp_18);
		exp_23 += r32_07(exp_20);
		exp_23 += s32_4( exp_21);
		exp_23 += s32_5( exp_22);
		exp_23 += ((td32_07 + td32_10 - td32_01 + 0x7aaaaaa3u) ^ p256_14);
		XL32 ^= exp_23;
		TempEven32 = TempEven32 + exp_20 - exp_06;
		/* expand32_22(24); */
		exp_24 += TempEven32;
		exp_24 += r32_01(exp_09);
		exp_24 += r32_02(exp_11);
		exp_24 += r32_05(exp_17);
		exp_24 += r32_06(exp_19);
		exp_24 += r32_07(exp_21);
		exp_24 += s32_4( exp_22);
		exp_24 += s32_5( exp_23);
		exp_24 += ((td32_08 + td32_11 - td32_02 + 0x7ffffff8u) ^ p256_15);
		XH32 =  XL32^exp_24;
		TempOdd32 = TempOdd32 + exp_21 - exp_07;
		/* expand32_21(25); */
		exp_25 += TempOdd32;
		exp_25 += r32_01(exp_10);
		exp_25 += r32_04(exp_16);
		exp_25 += r32_05(exp_18);
		exp_25 += r32_06(exp_20);
		exp_25 += r32_07(exp_22);
		exp_25 += s32_4( exp_23);
		exp_25 += s32_5( exp_24);
		exp_25 += ((td32_09 + td32_12 + 0x8555554du - td32_03) ^ p256_00);
		XH32 ^= exp_25;
		TempEven32 = TempEven32 + exp_22 - exp_08;
		/* expand32_22(26); */
		exp_26 += TempEven32;
		exp_26 += r32_01(exp_11);
		exp_26 += r32_04(exp_17);
		exp_26 += r32_05(exp_19);
		exp_26 += r32_06(exp_21);
		exp_26 += r32_07(exp_23);
		exp_26 += s32_4( exp_24);
		exp_26 += s32_5( exp_25);
		exp_26 += ((td32_10 + td32_13 - td32_04 + 0x8aaaaaa2u) ^ p256_01);
		XH32 ^= exp_26;
		TempOdd32 = TempOdd32 + exp_23 - exp_09;
		/* expand32_21(27); */
		exp_27 += TempOdd32;
		exp_27 += r32_03(exp_16);
		exp_27 += r32_04(exp_18);
		exp_27 += r32_05(exp_20);
		exp_27 += r32_06(exp_22);
		exp_27 += r32_07(exp_24);
		exp_27 += s32_4( exp_25);
		exp_27 += s32_5( exp_26);
		exp_27 += ((td32_11 + td32_14 - td32_05 + 0x8ffffff7u) ^ p256_02);
		XH32 ^= exp_27;

		TempEven32 = TempEven32 + exp_24 - exp_10;
		/* expand32_22(28); */
		exp_28 += TempEven32;
		exp_28 += r32_03(exp_17);
		exp_28 += r32_04(exp_19);
		exp_28 += r32_05(exp_21);
		exp_28 += r32_06(exp_23);
		exp_28 += r32_07(exp_25);
		exp_28 += s32_4( exp_26);
		exp_28 += s32_5( exp_27);
		exp_28 += ((td32_12 + td32_15 - td32_06 + 0x9555554cu) ^ p256_03);
		XH32 ^= exp_28;
		TempOdd32 = TempOdd32 + exp_25 - exp_11;
		/* expand32_21(29); */
		exp_29 = TempOdd32;
		exp_29 += r32_01(exp_14);
		exp_29 += r32_02(exp_16);
		exp_29 += r32_03(exp_18);
		exp_29 += r32_04(exp_20);
		exp_29 += r32_05(exp_22);
		exp_29 += r32_06(exp_24);
		exp_29 += r32_07(exp_26);
		exp_29 += s32_4( exp_27);
		exp_29 += s32_5( exp_28);
		exp_29 += ((td32_13 + td32_00 - td32_07 + 0x9aaaaaa1u) ^ p256_04);
		XH32 ^= exp_29;
		TempEven32 = TempEven32 + exp_26 - exp_12;
		/* expand32_22(30); */
		exp_30 = TempEven32;
		exp_30 += r32_01(exp_15);
		exp_30 += r32_02(exp_17);
		exp_30 += r32_03(exp_19);
		exp_30 += r32_04(exp_21);
		exp_30 += r32_05(exp_23);
		exp_30 += r32_06(exp_25);
		exp_30 += r32_07(exp_27);
		exp_30 += s32_4( exp_28);
		exp_30 += s32_5( exp_29);
		exp_30 += ((td32_14 + td32_01 - td32_08 + 0x9ffffff6u) ^ p256_05);
		XH32 ^= exp_30;
		TempOdd32 = TempOdd32 + exp_27 - exp_13;
		/* expand32_21(31); */
		exp_31 = TempOdd32;
		exp_31 += r32_01(exp_16);
		exp_31 += r32_02(exp_18);
		exp_31 += r32_03(exp_20);
		exp_31 += r32_04(exp_22);
		exp_31 += r32_05(exp_24);
		exp_31 += r32_06(exp_26);
		exp_31 += r32_07(exp_28);
		exp_31 += s32_4( exp_29);
		exp_31 += s32_5( exp_30);
		exp_31 += ((td32_15 + td32_02 - td32_09 + 0xa555554bu) ^ p256_06);
		XH32 ^= exp_31;

		/*  Compute the double chaining pipe for the next message block. */
		p256_00 =                       (shl(XH32, 5) ^ shr(exp_16,5) ^ data32[ 0]) + (    XL32    ^ exp_24 ^ exp_00); 
		p256_01 =                       (shr(XH32, 7) ^ shl(exp_17,8) ^ data32[ 1]) + (    XL32    ^ exp_25 ^ exp_01);
		p256_02 =                       (shr(XH32, 5) ^ shl(exp_18,5) ^ data32[ 2]) + (    XL32    ^ exp_26 ^ exp_02);
		p256_03 =                       (shr(XH32, 1) ^ shl(exp_19,5) ^ data32[ 3]) + (    XL32    ^ exp_27 ^ exp_03);
		p256_04 =                       (shr(XH32, 3) ^     exp_20    ^ data32[ 4]) + (    XL32    ^ exp_28 ^ exp_04);
		p256_05 =                       (shl(XH32, 6) ^ shr(exp_21,6) ^ data32[ 5]) + (    XL32    ^ exp_29 ^ exp_05);
		p256_06 =                       (shr(XH32, 4) ^ shl(exp_22,6) ^ data32[ 6]) + (    XL32    ^ exp_30 ^ exp_06);
		p256_07 =                       (shr(XH32,11) ^ shl(exp_23,2) ^ data32[ 7]) + (    XL32    ^ exp_31 ^ exp_07);

		p256_08 = rotl32(p256_04, 9) + (    XH32     ^     exp_24    ^ data32[ 8]) + (shl(XL32,8) ^ exp_23 ^ exp_08);
		p256_09 = rotl32(p256_05,10) + (    XH32     ^     exp_25    ^ data32[ 9]) + (shr(XL32,6) ^ exp_16 ^ exp_09);
		p256_15 = rotl32(p256_03,16) + (    XH32     ^     exp_31    ^ data32[15]) + (shr(XL32,2) ^ exp_22 ^ exp_15);
		p256_10 = rotl32(p256_06,11) + (    XH32     ^     exp_26    ^ data32[10]) + (shl(XL32,6) ^ exp_17 ^ exp_10);
		p256_11 = rotl32(p256_07,12) + (    XH32     ^     exp_27    ^ data32[11]) + (shl(XL32,4) ^ exp_18 ^ exp_11);
		p256_12 = rotl32(p256_00,13) + (    XH32     ^     exp_28    ^ data32[12]) + (shr(XL32,3) ^ exp_19 ^ exp_12);
		p256_13 = rotl32(p256_01,14) + (    XH32     ^     exp_29    ^ data32[13]) + (shr(XL32,4) ^ exp_20 ^ exp_13);
		p256_14 = rotl32(p256_02,15) + (    XH32     ^     exp_30    ^ data32[14]) + (shr(XL32,7) ^ exp_21 ^ exp_14);
		

		data32 += 16;
	}
	
	databitlen -= (BlueMidnightWish256_BLOCK_SIZE * 8) * iterations;
	state->bits_processed += (BlueMidnightWish256_BLOCK_SIZE * 8) *  iterations;
	
	state->unprocessed_bits = (int)databitlen;
	
	hashState256(state)->DoublePipe[5] = p256_05;
	hashState256(state)->DoublePipe[10] = p256_10;
	hashState256(state)->DoublePipe[7] = p256_07;
	hashState256(state)->DoublePipe[13] = p256_13;
	hashState256(state)->DoublePipe[15] = p256_15;
	
	hashState256(state)->DoublePipe[11] = p256_11;
	hashState256(state)->DoublePipe[6] = p256_06;
	hashState256(state)->DoublePipe[8] = p256_08;
	
	hashState256(state)->DoublePipe[0] = p256_00;
	hashState256(state)->DoublePipe[1] = p256_01;
	hashState256(state)->DoublePipe[2] = p256_02;
	hashState256(state)->DoublePipe[3] = p256_03;
	hashState256(state)->DoublePipe[4] = p256_04;
	hashState256(state)->DoublePipe[9] = p256_09;
	hashState256(state)->DoublePipe[12] = p256_12;
	hashState256(state)->DoublePipe[14] = p256_14;
	
	
	return databitlen;
}

__inline static void FinalCompress256(hashState *state)
{	
	u_int32_t XL32, XH32, TempEven32, TempOdd32;

	u_int32_t p_xor_d_00, p_xor_d_01, p_xor_d_02, p_xor_d_03, p_xor_d_04, p_xor_d_05, p_xor_d_06, p_xor_d_07; 
	u_int32_t p_xor_d_08, p_xor_d_09, p_xor_d_10, p_xor_d_11, p_xor_d_12, p_xor_d_13, p_xor_d_14, p_xor_d_15;

	u_int32_t p256_00, p256_01, p256_02, p256_03, p256_04, p256_05, p256_06, p256_07;
	u_int32_t p256_08, p256_09, p256_10, p256_11, p256_12, p256_13, p256_14, p256_15;

	u_int32_t exp_00, exp_01, exp_02, exp_03, exp_04, exp_05, exp_06, exp_07;
	u_int32_t exp_08, exp_09, exp_10, exp_11, exp_12, exp_13, exp_14, exp_15;

	u_int32_t exp_16, exp_17, exp_18, exp_19, exp_20, exp_21, exp_22, exp_23;
	u_int32_t exp_24, exp_25, exp_26, exp_27, exp_28, exp_29, exp_30, exp_31;


	u_int32_t t256_31, t256_32, t256_33, t256_34, t256_35, t256_36, t256_37;

	u_int32_t td32_00, td32_01, td32_02, td32_03, td32_04, td32_05, td32_06, td32_07;
	u_int32_t td32_08, td32_09, td32_10, td32_11, td32_12, td32_13, td32_14, td32_15;

	u_int32_t rotate_t1;
	
	p256_00 = hashState256(state)->DoublePipe[0];
	p256_01 = hashState256(state)->DoublePipe[1];
	p256_02 = hashState256(state)->DoublePipe[2];
	p256_03 = hashState256(state)->DoublePipe[3];
	p256_04 = hashState256(state)->DoublePipe[4];
	p256_09 = hashState256(state)->DoublePipe[9];
	p256_12 = hashState256(state)->DoublePipe[12];
	p256_15 = hashState256(state)->DoublePipe[15];
	
	p256_11 = hashState256(state)->DoublePipe[11];
	p256_06 = hashState256(state)->DoublePipe[6];
	p256_08 = hashState256(state)->DoublePipe[8];
	
	p256_05 = hashState256(state)->DoublePipe[5];
	p256_10 = hashState256(state)->DoublePipe[10];
	p256_07 = hashState256(state)->DoublePipe[7];
	p256_13 = hashState256(state)->DoublePipe[13];
	p256_14 = hashState256(state)->DoublePipe[14];

	{
		/* Mix the message block with the previous double pipe.       */
		/* These variables are used for the tweak */
		
		p_xor_d_05=p256_05^0xaaaaaaa5u;	td32_05=rotl32(p256_05, 6);
		p_xor_d_07=p256_07^0xaaaaaaa7u;	td32_07=rotl32(p256_07, 8);
		p_xor_d_10=p256_10^0xaaaaaaaau;	td32_10=rotl32(p256_10, 11);
		p_xor_d_13=p256_13^0xaaaaaaadu;	td32_13=rotl32(p256_13, 14);
		p_xor_d_14=p256_14^0xaaaaaaaeu;	td32_14=rotl32(p256_14, 15);
		exp_00 = (p_xor_d_05  - p_xor_d_07  + p_xor_d_10  + p_xor_d_13  + p_xor_d_14 );
		exp_00 = s32_0(exp_00) + 0xaaaaaaa1u;
		p_xor_d_00=p256_00^0xaaaaaaa0u;	td32_00=rotl32(p256_00, 1);
		p_xor_d_08=p256_08^0xaaaaaaa8u;	td32_08=rotl32(p256_08, 9);
		p_xor_d_01=p256_01^0xaaaaaaa1u;	td32_01=rotl32(p256_01, 2);
		t256_37 = (p_xor_d_08 - p_xor_d_01);
		exp_03 = (p_xor_d_00  + p_xor_d_13  + t256_37  - p_xor_d_10 );
		exp_03 = s32_3(exp_03) + 0xaaaaaaa4u;
		p_xor_d_15=p256_15^0xaaaaaaafu;	td32_15=rotl32(p256_15, 16);
		p_xor_d_04=p256_04^0xaaaaaaa4u;	td32_04=rotl32(p256_04, 5);
		exp_10 = (p_xor_d_15  + t256_37  - p_xor_d_04  - p_xor_d_07 );
		exp_10 = s32_0(exp_10) + 0xaaaaaaabu;
		p_xor_d_02=p256_02^0xaaaaaaa2u;	td32_02=rotl32(p256_02, 3);
		p_xor_d_11=p256_11^0xaaaaaaabu;	td32_11=rotl32(p256_11, 12);
		exp_13 = (p_xor_d_02  + p_xor_d_04  + p_xor_d_07  + p_xor_d_10  + p_xor_d_11 );
		exp_13 = s32_3(exp_13) + 0xaaaaaaaeu;
		p_xor_d_09=p256_09^0xaaaaaaa9u;	td32_09=rotl32(p256_09, 10);
		p_xor_d_12=p256_12^0xaaaaaaacu;	td32_12=rotl32(p256_12, 13);
		t256_32 = (p_xor_d_15 - p_xor_d_12);
		exp_02 = (p_xor_d_00  + p_xor_d_07  + p_xor_d_09  + t256_32 );
		exp_02 = s32_2(exp_02) + 0xaaaaaaa3u;
		t256_35 = (p_xor_d_01 - p_xor_d_14);
		exp_04 = (p_xor_d_02  + p_xor_d_09  + t256_35  - p_xor_d_11 );
		exp_04 = s32_4(exp_04) + 0xaaaaaaa5u;
		t256_31 = (p_xor_d_08 - p_xor_d_05);
		exp_11 = (p_xor_d_09  + t256_31  - p_xor_d_00  - p_xor_d_02 );
		exp_11 = s32_1(exp_11) + 0xaaaaaaacu;
		p_xor_d_03=p256_03^0xaaaaaaa3u;	td32_03=rotl32(p256_03, 4);
		t256_33 = (p_xor_d_03 + p_xor_d_10);
		exp_05 = (t256_32  + t256_33  - p_xor_d_02 );
		exp_05 = s32_0(exp_05) + 0xaaaaaaa6u;
		p_xor_d_06=p256_06^0xaaaaaaa6u;	td32_06=rotl32(p256_06, 7);
		exp_12 = (p_xor_d_01  + t256_33  - p_xor_d_06  - p_xor_d_09 );
		exp_12 = s32_2(exp_12) + 0xaaaaaaadu;
		t256_34 = (p_xor_d_13 - p_xor_d_06);
		exp_08 = (p_xor_d_02  + t256_34  - p_xor_d_05  - p_xor_d_15 );
		exp_08 = s32_3(exp_08) + 0xaaaaaaa9u;
		exp_15 = (p_xor_d_12  + t256_34  - p_xor_d_04  - p_xor_d_09 );
		exp_15 = s32_0(exp_15) + 0xaaaaaaa0u;
		exp_07 = (t256_35  - p_xor_d_04  - p_xor_d_05  - p_xor_d_12 );
		exp_07 = s32_2(exp_07) + 0xaaaaaaa8u;
		exp_14 = (p_xor_d_03  + t256_31  - p_xor_d_11  - p_xor_d_12 );
		exp_14 = s32_4(exp_14) + 0xaaaaaaafu;
		exp_06 = (p_xor_d_13  - p_xor_d_03  + p_xor_d_04  - p_xor_d_11  - p_xor_d_00 );
		exp_06 = s32_1(exp_06) + 0xaaaaaaa7u;
		t256_36 = (p_xor_d_06 + p_xor_d_14);
		exp_01 = (p_xor_d_11  + t256_36  - p_xor_d_08  - p_xor_d_15 );
		exp_01 = s32_1(exp_01) + 0xaaaaaaa2u;
		exp_09 = (p_xor_d_00  + t256_36  - p_xor_d_03  - p_xor_d_07 );
		exp_09 = s32_4(exp_09) + 0xaaaaaaaau;


		// first parts of Message expansion
		exp_16  = s32_1(exp_00);
		exp_16  += s32_2(exp_01);
		exp_17  = s32_1(exp_01);
		exp_16 += s32_3(exp_14);
		exp_17 += s32_2(exp_14);
		TempEven32 = exp_14; 

		/* This is the Message expansion. */
		/* It has 16 rounds.              */


		exp_16 += s32_3(exp_02) + s32_0(exp_03);
		exp_17 += s32_2(exp_02) + s32_3(exp_03); 
		TempEven32 += exp_02; 
		TempOdd32  = exp_03; 

		exp_16 += s32_1(exp_04) + s32_2(exp_05); 
		exp_17 += s32_0(exp_04) + s32_1(exp_05);
		TempEven32 += exp_04; 
		TempOdd32  += exp_05; 
		exp_16 += s32_3(exp_06) + s32_0(exp_07);
		exp_17 += s32_2(exp_06) + s32_3(exp_07);
		TempEven32 += exp_06; 
		TempOdd32  += exp_07; 
		exp_16 += s32_1(exp_08) + s32_2(exp_09);
		exp_17 += s32_0(exp_08) + s32_1(exp_09);
		TempEven32 += exp_08; 
		TempOdd32  += exp_09; 
		exp_16 += s32_3(exp_10) + s32_0(exp_11);
		exp_17 += s32_2(exp_10) + s32_3(exp_11);
		TempEven32 += exp_10; 
		TempOdd32  += exp_11; 
		exp_16 += s32_1(exp_12) + s32_2(exp_13) + s32_0(exp_15);
		exp_17 += s32_0(exp_12) + s32_1(exp_13) + s32_3(exp_15);
		TempEven32 += exp_12; 
		TempOdd32  += exp_13; 
		TempOdd32  += exp_15;
		
		exp_16 += ((td32_00      + td32_03       + 0x55555550u - td32_10) ^ 0xaaaaaaa7u);
		XL32 =  exp_16;
		exp_17 += s32_0(exp_16);
		exp_17 +=  ((td32_01      + td32_04      - td32_11 + 0x5aaaaaa5u) ^ 0xaaaaaaa8u);
		XL32 ^= exp_17;


		/* expand32_22(18); */
		exp_18  = TempEven32 + r32_07(exp_15)  + s32_4( exp_16 ) + s32_5( exp_17);
		exp_18 += r32_01(exp_03)  + r32_02(exp_05); 
		exp_18 += r32_05(exp_11)  + r32_06(exp_13);
		exp_18 += r32_03(exp_07)  + r32_04(exp_09);
							  
							  
		exp_18 += ((td32_02 + td32_05 - td32_12 + 0x5ffffffau) ^ 0xaaaaaaa9u);
		XL32 ^= exp_18;
		/* expand32_21(19); */
		//----
		exp_19 = TempOdd32   + r32_01(exp_04)  + r32_02(exp_06) 
		                      + r32_03(exp_08)  + r32_04(exp_10)
						      + r32_05(exp_12)  + r32_06(exp_14)
						      + r32_07(exp_16)  + s32_4( exp_17 ) + s32_5( exp_18)   
						      + ((td32_03 + td32_06 - td32_13 + 0x6555554fu) ^0xaaaaaaaau);
		XL32 ^= exp_19;
		TempEven32=TempEven32 + exp_16 - exp_02; 
		
		//---- 
		/* expand32_22(20); */
		exp_20  = TempEven32 + r32_01(exp_05)  + r32_02(exp_07)
				              + r32_03(exp_09)  + r32_04(exp_11)
							  + r32_05(exp_13)  + r32_06(exp_15)
							  + r32_07(exp_17)  + s32_4( exp_18 ) + s32_5( exp_19)
							  + ((td32_04 + td32_07 - td32_14 + 0x6aaaaaa4u) ^ 0xaaaaaaabu);
		XL32 ^= exp_20;
		TempOdd32 = TempOdd32 + exp_17 - exp_03;
		/* expand32_21(21); */
		exp_21 = TempOdd32   + r32_01(exp_06)  + r32_02(exp_08)
		                      + r32_03(exp_10)  + r32_04(exp_12)
						      + r32_05(exp_14)  + r32_06(exp_16)
						      + r32_07(exp_18)  + s32_4( exp_19 ) + s32_5( exp_20)
						      + ((td32_05 + td32_08 - td32_15 + 0x6ffffff9u) ^ 0xaaaaaaacu);
		XL32 ^= exp_21;
		TempEven32 = TempEven32 + exp_18 - exp_04;
		/* expand32_22(22); */
		exp_22  = TempEven32 + r32_01(exp_07)  + r32_02(exp_09)
				              + r32_03(exp_11)  + r32_04(exp_13)
							  + r32_05(exp_15)  + r32_06(exp_17)
							  + r32_07(exp_19)  + s32_4( exp_20 ) + s32_5( exp_21)
							  + ((td32_06 + td32_09 - td32_00 + 0x7555554eu) ^ 0xaaaaaaadu);
		XL32 ^= exp_22;
		TempOdd32 = TempOdd32 + exp_19 - exp_05;
		/* expand32_21(23); */
		exp_23 = TempOdd32   + r32_01(exp_08)  + r32_02(exp_10)
		                      + r32_03(exp_12)  + r32_04(exp_14)
						      + r32_05(exp_16)  + r32_06(exp_18)
						      + r32_07(exp_20)  + s32_4( exp_21 ) + s32_5( exp_22)
						      + ((td32_07 + td32_10 - td32_01 + 0x7aaaaaa3u) ^ 0xaaaaaaaeu);
		XL32 ^= exp_23;
		TempEven32 = TempEven32 + exp_20 - exp_06;
		/* expand32_22(24); */
		exp_24  = TempEven32 + r32_01(exp_09)  + r32_02(exp_11)
				              + r32_03(exp_13)  + r32_04(exp_15)
							  + r32_05(exp_17)  + r32_06(exp_19)
							  + r32_07(exp_21)  + s32_4( exp_22 ) + s32_5( exp_23)
							  + ((td32_08 + td32_11 - td32_02 + 0x7ffffff8u) ^ 0xaaaaaaafu);
		XH32 =  XL32^exp_24;
		TempOdd32 = TempOdd32 + exp_21 - exp_07;
		/* expand32_21(25); */
		exp_25 = TempOdd32   + r32_01(exp_10)  + r32_02(exp_12)
		                      + r32_03(exp_14)  + r32_04(exp_16)
						      + r32_05(exp_18)  + r32_06(exp_20)
						      + r32_07(exp_22)  + s32_4( exp_23 ) + s32_5( exp_24)
						      + ((td32_09 + td32_12 - td32_03 + 0x8555554du) ^ 0xaaaaaaa0u);
		XH32 ^= exp_25;
		TempEven32 = TempEven32 + exp_22 - exp_08;
		/* expand32_22(26); */
		exp_26  = TempEven32 + r32_01(exp_11)  + r32_02(exp_13)
				              + r32_03(exp_15)  + r32_04(exp_17)
							  + r32_05(exp_19)  + r32_06(exp_21)
							  + r32_07(exp_23)  + s32_4( exp_24 ) + s32_5( exp_25)
							  + ((td32_10 + td32_13 - td32_04 + 0x8aaaaaa2u) ^ 0xaaaaaaa1u);
		XH32 ^= exp_26;
		TempOdd32 = TempOdd32 + exp_23 - exp_09;
		/* expand32_21(27); */
		exp_27 = TempOdd32   + r32_01(exp_12)  + r32_02(exp_14)
		                      + r32_03(exp_16)  + r32_04(exp_18)
						      + r32_05(exp_20)  + r32_06(exp_22)
						      + r32_07(exp_24)  + s32_4( exp_25 ) + s32_5( exp_26)
						      + ((td32_11 + td32_14 - td32_05 + 0x8ffffff7u) ^ 0xaaaaaaa2u);
		XH32 ^= exp_27;
		TempEven32 = TempEven32 + exp_24 - exp_10;
		/* expand32_22(28); */
		exp_28  = TempEven32 + r32_01(exp_13)  + r32_02(exp_15)
				              + r32_03(exp_17)  + r32_04(exp_19)
							  + r32_05(exp_21)  + r32_06(exp_23)
							  + r32_07(exp_25)  + s32_4( exp_26 ) + s32_5( exp_27)
							  + ((td32_12 + td32_15 - td32_06 + 0x9555554cu) ^ 0xaaaaaaa3u);
		XH32 ^= exp_28;
		TempOdd32 = TempOdd32 + exp_25 - exp_11;
		/* expand32_21(29); */
		exp_29 = TempOdd32   + r32_01(exp_14)  + r32_02(exp_16)
		                      + r32_03(exp_18)  + r32_04(exp_20)
						      + r32_05(exp_22)  + r32_06(exp_24)
						      + r32_07(exp_26)  + s32_4( exp_27 ) + s32_5( exp_28)
						      + ((td32_13 + td32_00 - td32_07 + 0x9aaaaaa1u) ^ 0xaaaaaaa4u);
		XH32 ^= exp_29;
		TempEven32 = TempEven32 + exp_26 - exp_12;
		/* expand32_22(30); */
		exp_30  = TempEven32 + r32_01(exp_15)  + r32_02(exp_17)
				              + r32_03(exp_19)  + r32_04(exp_21)
							  + r32_05(exp_23)  + r32_06(exp_25)
							  + r32_07(exp_27)  + s32_4( exp_28 ) + s32_5( exp_29)
							  + ((td32_14 + td32_01 - td32_08 + 0x9ffffff6u) ^ 0xaaaaaaa5u);
		XH32 ^= exp_30;
		TempOdd32 = TempOdd32 + exp_27 - exp_13;
		/* expand32_21(31); */
		exp_31 = TempOdd32   + r32_01(exp_16)  + r32_02(exp_18)
		                      + r32_03(exp_20)  + r32_04(exp_22)
						      + r32_05(exp_24)  + r32_06(exp_26)
						      + r32_07(exp_28)  + s32_4( exp_29 ) + s32_5( exp_30)
						      + ((td32_15 + td32_02 - td32_09 + 0xa555554bu) ^ 0xaaaaaaa6u);
		XH32 ^= exp_31;

		/*  Compute the double chaining pipe for the next message block. */
		p256_00 =                       (shl(XH32, 5) ^ shr(exp_16,5) ^ hashState256(state)->DoublePipe[ 0]) + (    XL32    ^ exp_24 ^ exp_00); 
		p256_01 =                       (shr(XH32, 7) ^ shl(exp_17,8) ^ hashState256(state)->DoublePipe[ 1]) + (    XL32    ^ exp_25 ^ exp_01);
		p256_02 =                       (shr(XH32, 5) ^ shl(exp_18,5) ^ hashState256(state)->DoublePipe[ 2]) + (    XL32    ^ exp_26 ^ exp_02);
		p256_03 =                       (shr(XH32, 1) ^ shl(exp_19,5) ^ hashState256(state)->DoublePipe[ 3]) + (    XL32    ^ exp_27 ^ exp_03);
		p256_04 =                       (shr(XH32, 3) ^     exp_20    ^ hashState256(state)->DoublePipe[ 4]) + (    XL32    ^ exp_28 ^ exp_04);
		p256_05 =                       (shl(XH32, 6) ^ shr(exp_21,6) ^ hashState256(state)->DoublePipe[ 5]) + (    XL32    ^ exp_29 ^ exp_05);
		p256_06 =                       (shr(XH32, 4) ^ shl(exp_22,6) ^ hashState256(state)->DoublePipe[ 6]) + (    XL32    ^ exp_30 ^ exp_06);
		p256_07 =                       (shr(XH32,11) ^ shl(exp_23,2) ^ hashState256(state)->DoublePipe[ 7]) + (    XL32    ^ exp_31 ^ exp_07);

		p256_08 = rotl32(p256_04, 9) + (    XH32     ^     exp_24    ^ hashState256(state)->DoublePipe[ 8]) + (shl(XL32,8) ^ exp_23 ^ exp_08);
		p256_09 = rotl32(p256_05,10) + (    XH32     ^     exp_25    ^ hashState256(state)->DoublePipe[ 9]) + (shr(XL32,6) ^ exp_16 ^ exp_09);
		p256_10 = rotl32(p256_06,11) + (    XH32     ^     exp_26    ^ hashState256(state)->DoublePipe[10]) + (shl(XL32,6) ^ exp_17 ^ exp_10);
		p256_11 = rotl32(p256_07,12) + (    XH32     ^     exp_27    ^ hashState256(state)->DoublePipe[11]) + (shl(XL32,4) ^ exp_18 ^ exp_11);
		p256_12 = rotl32(p256_00,13) + (    XH32     ^     exp_28    ^ hashState256(state)->DoublePipe[12]) + (shr(XL32,3) ^ exp_19 ^ exp_12);
		p256_13 = rotl32(p256_01,14) + (    XH32     ^     exp_29    ^ hashState256(state)->DoublePipe[13]) + (shr(XL32,4) ^ exp_20 ^ exp_13);
		p256_14 = rotl32(p256_02,15) + (    XH32     ^     exp_30    ^ hashState256(state)->DoublePipe[14]) + (shr(XL32,7) ^ exp_21 ^ exp_14);
		p256_15 = rotl32(p256_03,16) + (    XH32     ^     exp_31    ^ hashState256(state)->DoublePipe[15]) + (shr(XL32,2) ^ exp_22 ^ exp_15);

	}
	
	hashState256(state)->DoublePipe[10] = p256_10;
	hashState256(state)->DoublePipe[13] = p256_13;
	hashState256(state)->DoublePipe[15] = p256_15;
	
	hashState256(state)->DoublePipe[11] = p256_11;
	hashState256(state)->DoublePipe[8] = p256_08;
	
	hashState256(state)->DoublePipe[9] = p256_09;
	hashState256(state)->DoublePipe[12] = p256_12;
	hashState256(state)->DoublePipe[14] = p256_14;
}

HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval)
{
	hashState state;
	u_int32_t *data32, *data32_end, iterations;
	u_int64_t *data64;

	int LastByte, LastBytes, PadOnePosition;

	state.hashbitlen = 256;
	state.bits_processed = 0;
	state.unprocessed_bits = 0;
	memcpy(hashState256_(state).DoublePipe, i256p2,  16 * sizeof(u_int32_t));
	data32 = (u_int32_t *)data;
	

	iterations = databitlen / (BlueMidnightWish256_BLOCK_SIZE * 8);
	data32_end = data32 + iterations*16;
	if(iterations > 0)
		databitlen = Compress256(data32, &state, databitlen);
	state.unprocessed_bits = (int)databitlen;

	if (databitlen > 0)
	{
		LastBytes = ((~(((- (int)databitlen)>>3) & 0x01ff)) + 1) & 0x01ff;  // LastBytes = Ceil(databitlen / 8)
		memcpy(hashState256_(state).LastPart, data32_end, LastBytes );
	}

	LastByte = (int)state.unprocessed_bits >> 3;
	PadOnePosition = 7 - (state.unprocessed_bits & 0x07);
	hashState256_(state).LastPart[LastByte] = hashState256_(state).LastPart[LastByte] & (0xff << (PadOnePosition + 1) )\
		                                    ^ (0x01 << PadOnePosition);
	data64 = (u_int64_t *)hashState256_(state).LastPart;

	if (state.unprocessed_bits < 448)
	{
		memset( (hashState256_(state).LastPart) + LastByte + 1, 0x00, BlueMidnightWish256_BLOCK_SIZE - LastByte - 9 );
		databitlen = BlueMidnightWish256_BLOCK_SIZE * 8;
		data64[7] = state.bits_processed + state.unprocessed_bits;
	}
	else
	{
		memset( (hashState256_(state).LastPart) + LastByte + 1, 0x00, BlueMidnightWish256_BLOCK_SIZE * 2 - LastByte - 9 );
		databitlen = BlueMidnightWish256_BLOCK_SIZE * 16;
		data64[15] = state.bits_processed + state.unprocessed_bits;
	}

	data32   = (u_int32_t *)hashState256_(state).LastPart;

	// Note that this function also updates state
	Compress256(data32, &state, databitlen);

	FinalCompress256(&state);
	memcpy(hashval, hashState256_(state).DoublePipe + 8,  BlueMidnightWish256_DIGEST_SIZE );
	return(SUCCESS);




}
