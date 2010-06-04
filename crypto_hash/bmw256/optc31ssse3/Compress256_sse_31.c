/* 
   Optimized C code for tweaked Blue Midnight Wish 256 - programmed by Rune E. Jensen, April 1010.
   This is an development version that is not finalized from an performance and code cleanness perspective.
*/

//#include <stdio.h>
//#include <string.h> 
#include "BlueMidnightWish.h"

// Needs SSSE3 support:
#if defined ( __SSSE3__ )
#include "tmmintrin.h"

#define rotl32(x,n)   (((x) << n) | ((x) >> (32 - n)))
#define rotr32(x,n)   (((x) >> n) | ((x) << (32 - n)))

#define shl(x,n)      ((x) << n)
#define shr(x,n)      ((x) >> n)


#define hashState256(x)  ((x)->pipe->p256)


#if defined ( _MSC_VER )
const u_int64_t __declspec(align(128)) consts256[16] = {
	0x55555550u, 0x5aaaaaa5u, 0x5ffffffau, 0x6555554fu,
	0x6aaaaaa4u, 0x6ffffff9u, 0x7555554eu, 0x7aaaaaa3u,
	0x7ffffff8u, 0x8555554du, 0x8aaaaaa2u, 0x8ffffff7u,
	0x9555554cu, 0x9aaaaaa1u, 0x9ffffff6u, 0xa555554bu
	};
const int __declspec(align(128))       negate256[28] = {
	-1, -1,  1, -1, // 0
	1,  -1,  1, -1, // 4
	1,   1, -1, -1, // 8
	1,  -1, -1, -1, // 12
	1,   1,  1, -1, // 16
	-1,  1, -1, -1, // 20
	-1,  1,  1, -1, // 24
	};
#else
const u_int32_t __attribute__ ((aligned (128))) consts256[16] = {
	0x55555550u, 0x5aaaaaa5u, 0x5ffffffau, 0x6555554fu,
	0x6aaaaaa4u, 0x6ffffff9u, 0x7555554eu, 0x7aaaaaa3u,
	0x7ffffff8u, 0x8555554du, 0x8aaaaaa2u, 0x8ffffff7u,
	0x9555554cu, 0x9aaaaaa1u, 0x9ffffff6u, 0xa555554bu
	};
const int __attribute__ ((aligned (128)))       negate256[28] = {
	-1, -1,  1, -1, // 0
	1,  -1,  1, -1, // 4
	1,   1, -1, -1, // 8
	1,  -1, -1, -1, // 12
	1,   1,  1, -1, // 16
	-1,  1, -1, -1, // 20
	-1,  1,  1, -1, // 24
	};
#endif		

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

static __inline u_int32_t s32_0(const u_int32_t x)
{
	u_int32_t ans = shl(x, 3);
	u_int32_t roll_temp = rotl32(x, 19);
	ans ^= roll_temp;
	ans ^= shr(x, 1);
	ans ^= rotr32(roll_temp, 15);
	return ans; //(shr((x), 1) ^ shl((x), 3) ^ rotl32((x),  4) ^ rotl32((x), 19));
}

// 11 ops + 1-2 copy, 2+1 registers used
static __inline __m128i s32_0sse( __m128i x128)
{
	__m128i sl = _mm_slli_epi32(x128, 3);  // 2
	__m128i sr = _mm_srli_epi32(x128, 1);  // 1
	__m128i ans = _mm_xor_si128(sl, sr);
	
	sl  = _mm_slli_epi32(sl, 4-3);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi32(sr, 32-(19+1)); // 32-(19+1) = 12  (1 before, 13 total)
	ans = _mm_xor_si128(ans, sr);
	
	sl  = _mm_slli_epi32(sl, 19-4);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi32(sr, 32-(4+1+12)); // 32-(4+1+12) = 15, (13 before, 28 total)
	ans = _mm_xor_si128(ans, sr);

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

static __inline __m128i s32_1sse( __m128i x128)
{
	__m128i sl = _mm_slli_epi32(x128, 2);
	__m128i sr = _mm_srli_epi32(x128, 1);
	__m128i ans = _mm_xor_si128(sl, sr);
	
	sl  = _mm_slli_epi32(sl, 8-2);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi32(sr, 32-(23+1)); // 32-(19+1) = 8  (1 before, 9 total)
	ans = _mm_xor_si128(ans, sr);
	
	sl  = _mm_slli_epi32(sl, 23-8);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi32(sr, 32-(8+1+8)); // 32-(8+1+8) = 15, (9 before, 24 total)
	ans = _mm_xor_si128(ans, sr);

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

static __inline __m128i s32_2sse( __m128i x128)
{
	__m128i sl = _mm_slli_epi32(x128, 1);
	__m128i sr = _mm_srli_epi32(x128, 2);
	__m128i ans = _mm_xor_si128(sl, sr);
	
	sl  = _mm_slli_epi32(sl, 12-1);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi32(sr, 32-(25+2)); // 32-(25+2) = 5  (2 before, 7 total)
	ans = _mm_xor_si128(ans, sr);
	
	sl  = _mm_slli_epi32(sl, 25-12);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi32(sr, 32-(5+2+12)); // 32-(5+2+12) = 13, (7 before, 20 total)
	ans = _mm_xor_si128(ans, sr);

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

static __inline __m128i s32_3sse( __m128i x128)
{
	__m128i sl = _mm_slli_epi32(x128, 2);
	__m128i sr = _mm_srli_epi32(x128, 2);
	__m128i ans = _mm_xor_si128(sl, sr);
	
	sl  = _mm_slli_epi32(sl, 15-2);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi32(sr, 32-(29+2)); // 32-(29+2) = 1  (2 before, 3 total)
	ans = _mm_xor_si128(ans, sr);
	
	sl  = _mm_slli_epi32(sl, 29-15);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi32(sr, 32-(1+2+15)); // 32-(1+2+15) = 14, (3 before, 17 total)
	ans = _mm_xor_si128(ans, sr);

	return ans; //(shr((x), 2) ^ shl((x), 2) ^ rotl32((x), 15) ^ rotl32((x), 29));
}

static __inline __m128i s32_4sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi32(x128, 1);
	return _mm_xor_si128(sr, x128); // (shr((x), 1) ^ (x))
}

static __inline __m128i s32_5sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi32(x128, 2);
	return _mm_xor_si128(sr, x128); // (shr((x), 2) ^ (x))
}

static __inline __m128i r32_01sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi32(x128, 32-3);
	__m128i sl = _mm_slli_epi32(x128, 3);
	return _mm_or_si128(sr, sl); //rotl32((x),  3)
}

static __inline __m128i r32_02sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi32(x128, 32-7);
	__m128i sl = _mm_slli_epi32(x128, 7);
	return _mm_or_si128(sr, sl); //rotl32((x),  7)
}

static __inline __m128i r32_03sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi32(x128, 32-13);
	__m128i sl = _mm_slli_epi32(x128, 13);
	return _mm_or_si128(sr, sl); //rotl32((x),  13)
}

// TODO: try an single _mm_shuffle_epi8() ?
/*
static __inline __m128i r32_04sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi32(x128, 32-16);
	__m128i sl = _mm_slli_epi32(x128, 16);
	return _mm_or_si128(sr, sl); //rotl32((x),  16)
}
*/

static __inline __m128i r32_04sse( __m128i x128)
{
	/*
	__m128i sr = _mm_srli_epi32(x128, 32-16);
	__m128i sl = _mm_slli_epi32(x128, 16);
	__m128i ans1 = _mm_or_si128(sr, sl); //rotl32((x),  16)
	*/
	const __m128i reorder_vector_16bit_rotate = _mm_set_epi8(13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2); 
	__m128i ans2 = _mm_shuffle_epi8(x128, reorder_vector_16bit_rotate); //rotl32((x),  16)
	
	/*
	u_int32_t __attribute__ ((aligned (16)))       tmpW[20];
	_mm_store_si128(&tmpW[00], ans1);
	printf("%x, %x, %x, %x\n", tmpW[00],tmpW[01],tmpW[02],tmpW[03]);
	_mm_store_si128(&tmpW[00], ans2);
	printf("%x, %x, %x, %x\n", tmpW[00],tmpW[01],tmpW[02],tmpW[03]);
	exit(0);
	*/
	return ans2;
}

static __inline __m128i r32_05sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi32(x128, 32-19);
	__m128i sl = _mm_slli_epi32(x128, 19);
	return _mm_or_si128(sr, sl); //rotl32((x),  19)
}


void Compress256(u_int32_t *data32, u_int32_t *data32_end, hashState *state)
{	
	#if defined ( _MSC_VER )
	//u_int32_t __declspec(align(16))       p_xor_d[20];
	u_int32_t __declspec(align(128))       p256[16];
	u_int32_t __declspec(align(128))       exp[32];
	u_int32_t __declspec(align(128))       XL32_shifted[8];
	u_int64_t __declspec(align(64))        XL32_XH32[2];
	u_int32_t __declspec(align(128))       td32[18];
	//u_int32_t __declspec(align(16))       W[18];
	u_int32_t __declspec(align(128))       evenOdd[2];
	/*
	const u_int64_t __declspec(align(16)) consts256[16] = {
		0x55555550u, 0x5aaaaaa5u, 0x5ffffffau, 0x6555554fu,
		0x6aaaaaa4u, 0x6ffffff9u, 0x7555554eu, 0x7aaaaaa3u,
		0x7ffffff8u, 0x8555554du, 0x8aaaaaa2u, 0x8ffffff7u,
		0x9555554cu, 0x9aaaaaa1u, 0x9ffffff6u, 0xa555554bu
		};
	const int __declspec(align(16))       negate256[28] = {
		-1, -1,  1, -1, // 0
		1,  -1,  1, -1, // 4
		1,   1, -1, -1, // 8
		1,  -1, -1, -1, // 12
		1,   1,  1, -1, // 16
		-1,  1, -1, -1, // 20
		-1,  1,  1, -1, // 24
		};
	*/
	#else
	//u_int32_t __attribute__ ((aligned (128)))       p_xor_d[20];
	u_int32_t __attribute__ ((aligned (128)))       p256[16];
	u_int32_t __attribute__ ((aligned (128)))       exp[32];
	u_int32_t __attribute__ ((aligned (128)))       XL32_shifted[8];
	u_int64_t __attribute__ ((aligned (64)))        XL32_XH32[2];
	u_int32_t __attribute__ ((aligned (128)))       td32[18];
	//u_int32_t volatile __attribute__ ((aligned (16)))       W[18];
	u_int32_t __attribute__ ((aligned (128)))       evenOdd[2];
	/*
	const u_int32_t __attribute__ ((aligned (16))) consts256[16] = {
		0x55555550u, 0x5aaaaaa5u, 0x5ffffffau, 0x6555554fu,
		0x6aaaaaa4u, 0x6ffffff9u, 0x7555554eu, 0x7aaaaaa3u,
		0x7ffffff8u, 0x8555554du, 0x8aaaaaa2u, 0x8ffffff7u,
		0x9555554cu, 0x9aaaaaa1u, 0x9ffffff6u, 0xa555554bu
		};
	const int __attribute__ ((aligned (16)))       negate256[28] = {
		-1, -1,  1, -1, // 0
		1,  -1,  1, -1, // 4
		1,   1, -1, -1, // 8
		1,  -1, -1, -1, // 12
		1,   1,  1, -1, // 16
		-1,  1, -1, -1, // 20
		-1,  1,  1, -1, // 24
		};
	*/
	#endif
	// This have an impact on performance, as the array is copied to stack first
	// while the 'const __m128i' variables are accessed dirrectly as a %rip offset
	// 
	//#define CONST256ARRAY
	const __m128i consts256_0003 = _mm_set_epi32(0x6555554fu, 0x5ffffffau, 0x5aaaaaa5u, 0x55555550u);
	const __m128i consts256_0407 = _mm_set_epi32(0x7aaaaaa3u, 0x7555554eu, 0x6ffffff9u, 0x6aaaaaa4u);
	const __m128i consts256_0811 = _mm_set_epi32(0x8ffffff7u, 0x8aaaaaa2u, 0x8555554du, 0x7ffffff8u);
	const __m128i consts256_1215 = _mm_set_epi32(0xa555554bu, 0x9ffffff6u, 0x9aaaaaa1u, 0x9555554cu);
	const __m128i negate256_0 = _mm_set_epi32(-1, 1, -1, -1);
	const __m128i negate256_4 = _mm_set_epi32(-1, 1, -1, 1);
	const __m128i negate256_8 = _mm_set_epi32(-1, -1, 1, 1);
	const __m128i negate256_12 = _mm_set_epi32(-1, -1, -1, 1);
	const __m128i negate256_16 = _mm_set_epi32(-1, 1, 1, 1);
	const __m128i negate256_20 = _mm_set_epi32(-1, -1, 1, -1);
	const __m128i negate256_24 = _mm_set_epi32(-1, 1, 1, -1);
	/*
	-1, -1,  1, -1, // 0
	1,  -1,  1, -1, // 4
	1,   1, -1, -1, // 8
	1,  -1, -1, -1, // 12
	1,   1,  1, -1, // 16
	-1,  1, -1, -1, // 20
	-1,  1,  1, -1, // 24
*/

	u_int32_t XL32, XH32, TempEven32, TempOdd32;

	u_int32_t p_xor_d_00, p_xor_d_01, p_xor_d_02, p_xor_d_03, p_xor_d_04, p_xor_d_05, p_xor_d_06, p_xor_d_07; 
	u_int32_t p_xor_d_08, p_xor_d_09, p_xor_d_10, p_xor_d_11, p_xor_d_12, p_xor_d_13, p_xor_d_14, p_xor_d_15;

	//u_int32_t p256_00, p256_01, p256_02, p256_03, p256_04, p256_05, p256_06, p256_07;
	//u_int32_t p256_08, p256_09, p256_10, p256_11, p256_12, p256_13, p256_14, p256_15;

	u_int32_t exp_00, exp_01, exp_02, exp_03, exp_04, exp_05, exp_06, exp_07;
	u_int32_t exp_08, exp_09, exp_10, exp_11, exp_12, exp_13, exp_14, exp_15;

	u_int32_t exp_16, exp_17, exp_18, exp_19, exp_20, exp_21, exp_22, exp_23;
	u_int32_t exp_24, exp_25, exp_26, exp_27, exp_28, exp_29, exp_30, exp_31;


	u_int32_t t256_31, t256_32, t256_33, t256_34, t256_35, t256_36, t256_37;

	//u_int32_t td32_00, td32_01, td32_02, td32_03, td32_04, td32_05, td32_06, td32_07;
	//u_int32_t td32_08, td32_09, td32_10, td32_11, td32_12, td32_13, td32_14, td32_15;
	
	u_int32_t XL32_Lshift, XL32_Rshift;
	
	//__m128i p256_0003 = _mm_load_si128(&hashState256(state)->DoublePipe[0]);
	__m128i copyTemp = _mm_load_si128((__m128i *) &hashState256(state)->DoublePipe[ 0]);
	_mm_store_si128(&p256[00], copyTemp);
	
	//__m128i p256_0407 = _mm_load_si128(&hashState256(state)->DoublePipe[4]);
	copyTemp = _mm_load_si128(&hashState256(state)->DoublePipe[ 4]);
	_mm_store_si128(&p256[04], copyTemp);
	copyTemp = _mm_load_si128(&hashState256(state)->DoublePipe[ 8]);
	_mm_store_si128(&p256[ 8], copyTemp);
	copyTemp = _mm_load_si128(&hashState256(state)->DoublePipe[12]);
	_mm_store_si128(&p256[12], copyTemp);
	
	do
	{
		/* Mix the message block with the previous double pipe.       */
		/* These variables are used for the tweak */
		
		// Assume 16 byte aligned
		
		__m128i pxord0003 = _mm_xor_si128(_mm_load_si128(&p256[00]), _mm_load_si128(&data32[00]));
		__m128i pxord0407 = _mm_xor_si128(_mm_load_si128(&p256[04]), _mm_load_si128(&data32[04]));
		__m128i pxord0811 = _mm_xor_si128(_mm_load_si128(&p256[ 8]), _mm_load_si128(&data32[ 8]));
		__m128i pxord1215 = _mm_xor_si128(_mm_load_si128(&p256[12]), _mm_load_si128(&data32[12]));

		__m128i pxord0104 = _mm_alignr_epi8(pxord0407, pxord0003, 4);
		__m128i pxord0508 = _mm_alignr_epi8(pxord0811, pxord0407, 4);
		__m128i pxord0912 = _mm_alignr_epi8(pxord1215, pxord0811, 4);
		__m128i pxord1300 = _mm_alignr_epi8(pxord0003, pxord1215, 4); // 13141500
		
		td32[00]=rotl32(data32[ 0], 1);
		td32[01]=rotl32(data32[ 1], 2);
		td32[02]=rotl32(data32[ 2], 3);
		td32[03]=rotl32(data32[ 3], 4);
		__m128i pxord0205 = _mm_alignr_epi8(pxord0407, pxord0003, 8);
		__m128i pxord0609 = _mm_alignr_epi8(pxord0811, pxord0407, 8);
		__m128i pxord1013 = _mm_alignr_epi8(pxord1215, pxord0811, 8);
		__m128i pxord1401 = _mm_alignr_epi8(pxord0003, pxord1215, 8); // 14150001
		
		__m128i pxord1013neg = _mm_sign_epi32(pxord1013, negate256_0);
		
		td32[04]=rotl32(data32[ 4], 5);
		td32[05]=rotl32(data32[ 5], 6);
		td32[06]=rotl32(data32[ 6], 7);
		td32[07]=rotl32(data32[ 7], 8);
		/*
		// Lower register pressure: 
		__m128i pxord0306 = _mm_alignr_epi8(pxord0407, pxord0003, 12);
		__m128i pxord0710 = _mm_alignr_epi8(pxord0811, pxord0407, 12);
		__m128i pxord1114 = _mm_alignr_epi8(pxord1215, pxord0811, 12);
		__m128i pxord1502 = _mm_alignr_epi8(pxord0003, pxord1215, 12); // 15000102
		*/
		/*
		__m128i pxord0306 = _mm_alignr_epi8(pxord0508, pxord0104, 8);
		__m128i pxord0710 = _mm_alignr_epi8(pxord0912, pxord0508, 8);
		__m128i pxord1114 = _mm_alignr_epi8(pxord1300, pxord0912, 8);
		__m128i pxord1502 = _mm_alignr_epi8(pxord0104, pxord1300, 8); // 15000102
		*/
		__m128i pxord0306 = _mm_alignr_epi8(pxord0508, pxord0104, 8);
		__m128i pxord0710 = _mm_alignr_epi8(pxord0912, pxord0508, 8);
		__m128i pxord1114 = _mm_alignr_epi8(pxord1300, pxord0912, 8);
		__m128i pxord1502 = _mm_alignr_epi8(pxord0104, pxord1300, 8); // 15000102
		
		// 12 xmm registers used for pxord
		// +2 xmm registers used for negate256
		__m128i W1215 = _mm_sign_epi32(pxord0306, negate256_8);
		__m128i W0003 = _mm_sign_epi32(pxord0710, negate256_0);
		__m128i W0407 = _mm_sign_epi32(pxord1114, negate256_0);
		__m128i W0811 = _mm_sign_epi32(pxord1502, negate256_20);
		
		W0003 = _mm_sub_epi32(W0003, pxord1013neg);
		W1215 = _mm_sub_epi32(W1215, pxord1013neg);
		
		
		
		/*
		p_xor_d_05=p256[05]^data32[ 5];
		p_xor_d_07=p256[07]^data32[ 7];
		p_xor_d_10=p256[10]^data32[ 10];	
		p_xor_d_13=p256[13]^data32[ 13];	
		p_xor_d_14=p256[14]^data32[ 14];	
		
		p_xor_d_00=p256[00]^data32[ 0];	
		p_xor_d_08=p256[ 8]^data32[ 8];	
		
		p_xor_d_01=p256[01]^data32[ 1];	
		p_xor_d_15=p256[15]^data32[ 15]; 
		
		p_xor_d_04=p256[04]^data32[ 4];	
		
		p_xor_d_02=p256[02]^data32[ 2];	
		p_xor_d_11=p256[11]^data32[ 11];	
		
		p_xor_d_09=p256[ 9]^data32[ 9];	
		p_xor_d_12=p256[12]^data32[ 12];	
		
		p_xor_d_03=p256[03]^data32[ 3];	
		
		p_xor_d_06=p256[06]^data32[ 6];	
		*/
		// non-SSE version:
		// 12x load, 12x rotate, 12x store
		// SSE version?:
		// 4x load, 2x rotete8, 2x 4x shuffle (?), 8x shift, 4x or, ++? = ~30?
		//td32[16]=td32[00]=rotl32(data32[ 0], 1);
		/*
		td32[00]=rotl32(data32[ 0], 1);
		td32[01]=rotl32(data32[ 1], 2);
		td32[02]=rotl32(data32[ 2], 3);
		td32[03]=rotl32(data32[ 3], 4);
		td32[04]=rotl32(data32[ 4], 5);
		td32[05]=rotl32(data32[ 5], 6);
		td32[06]=rotl32(data32[ 6], 7);
		td32[07]=rotl32(data32[ 7], 8);
		td32[ 8]=rotl32(data32[ 8], 9);
		td32[ 9]=rotl32(data32[ 9], 10);
		td32[10]=rotl32(data32[ 10], 11);
		td32[11]=rotl32(data32[ 11], 12);
		td32[12]=rotl32(data32[ 12], 13);
		td32[13]=rotl32(data32[ 13], 14);
		td32[14]=rotl32(data32[ 14], 15);
		td32[15]=rotl32(data32[ 15], 16);
		*/
		//            1              3              2              1              2
		//W[0]=exp_00 = (p_xor_d[05]  - p_xor_d[07]  + p_xor_d[10]  + p_xor_d[13]  + p_xor_d[14]);
		//W[1]=exp_01 = (p_xor_d[06]  - p_xor_d[ 8]  + p_xor_d[11]  + p_xor_d[14]  - p_xor_d[15]);
		//W[2]=exp_02 = (p_xor_d[07]  + p_xor_d[ 9]  - p_xor_d[12]  + p_xor_d[15]  + p_xor_d[00]);
		//W[3]=exp_03 = (p_xor_d[ 8]  - p_xor_d[10]  + p_xor_d[13]  + p_xor_d[00]  - p_xor_d[01]);
		td32[ 8]=rotl32(data32[ 8], 9);
		td32[ 9]=rotl32(data32[ 9], 10);
		td32[10]=rotl32(data32[ 10], 11);
		td32[11]=rotl32(data32[ 11], 12);
		//__m128i pxord0508 =  _mm_loadu_si128(&p_xor_d[05]);
		//__m128i pxord0710 =  _mm_loadu_si128(&p_xor_d[07]);
		//__m128i pxord1013 =  _mm_loadu_si128(&p_xor_d[10]);
		//__m128i pxord1300 =  _mm_loadu_si128(&p_xor_d[13]);
		//__m128i pxord1401 =  _mm_loadu_si128(&p_xor_d[14]);
		/*
		__m128i W0003 = _mm_add_epi32(pxord0508, pxord1300);
		W0003 = _mm_add_epi32(W0003, _mm_sign_epi32(pxord0710, negate256_0));
		W0003 = _mm_sub_epi32(W0003, _mm_sign_epi32(pxord1013, negate256_0));
		__m128i pxord1401neg = _mm_sign_epi32(pxord1401, negate256_4);
		W0003 = _mm_add_epi32(W0003, pxord1401neg);
		*/
		
		W0003 = _mm_add_epi32(pxord0508, W0003);
		W0003 = _mm_add_epi32(W0003, pxord1300);
		//W0003 = _mm_sub_epi32(W0003, _mm_sign_epi32(pxord1013, negate256_0));
		__m128i pxord1401neg = _mm_sign_epi32(pxord1401, negate256_4);
		W0003 = _mm_add_epi32(W0003, pxord1401neg);
		
		
		td32[12]=rotl32(data32[ 12], 13);
		td32[13]=rotl32(data32[ 13], 14);
		td32[14]=rotl32(data32[ 14], 15);
		td32[15]=rotl32(data32[ 15], 16);
		
		
		//W[4]=exp_04 = (p_xor_d[ 9]  - p_xor_d[11]  - p_xor_d[14]  + p_xor_d[01]  + p_xor_d[02]);
		//W[5]=exp_05 = (p_xor_d[10]  - p_xor_d[12]  + p_xor_d[15]  - p_xor_d[02]  + p_xor_d[03]);
		//W[6]=exp_06 = (-p_xor_d[11] + p_xor_d[13]  - p_xor_d[00]  - p_xor_d[03]  + p_xor_d[04]);
		//W[7]=exp_07 = (-p_xor_d[12] - p_xor_d[14]  + p_xor_d[01]  - p_xor_d[04]  - p_xor_d[05]);
		
		
		//__m128i pxord0912 =  _mm_loadu_si128(&p_xor_d[ 9]);
		//__m128i pxord1114 =  _mm_loadu_si128(&p_xor_d[11]);
		//__m128i pxord0104 =  _mm_loadu_si128(&p_xor_d[01]);
		//__m128i pxord0205 =  _mm_loadu_si128(&p_xor_d[02]);
		/*
		__m128i W0407 = _mm_add_epi32(_mm_sign_epi32(pxord0912, negate256_8), _mm_sign_epi32(pxord1114, negate256_0));
		W0407 = _mm_sub_epi32(W0407,pxord1401neg);
		W0407 = _mm_add_epi32(W0407, _mm_sign_epi32(pxord0104, negate256_12));
		W0407 = _mm_add_epi32(W0407, _mm_sign_epi32(pxord0205, negate256_16));
		//_mm_store_si128(&W[04],  W0407);
		*/
		W0407 = _mm_add_epi32(W0407, _mm_sign_epi32(pxord0912, negate256_8));
		W0407 = _mm_sub_epi32(W0407, pxord1401neg);
		W0407 = _mm_add_epi32(W0407, _mm_sign_epi32(pxord0104, negate256_12));
		W0407 = _mm_add_epi32(W0407, _mm_sign_epi32(pxord0205, negate256_16));
		
		
		//W[8]=exp_08 = (p_xor_d[13]  - p_xor_d[15]  + p_xor_d[02]  - p_xor_d[05]  - p_xor_d[06]);
		//W[9]=exp_09 = (p_xor_d[14]  + p_xor_d[00]  - p_xor_d[03]  + p_xor_d[06]  - p_xor_d[07]);
		//W[10]=exp_10 = (p_xor_d[15]  - p_xor_d[01]  - p_xor_d[04]  - p_xor_d[07]  + p_xor_d[ 8]);
		//W[11]=exp_11 = (-p_xor_d[00] - p_xor_d[02]  - p_xor_d[05]  + p_xor_d[ 8]  + p_xor_d[ 9]);
		
		//__m128i pxord1502 =  _mm_loadu_si128(&p_xor_d[15]);
		//__m128i pxord0609 =  _mm_loadu_si128(&p_xor_d[06]);
		/*
		__m128i W0811 = _mm_add_epi32(_mm_sign_epi32(pxord1300, negate256_16), _mm_sign_epi32(pxord1502, negate256_20));
		W0811 = _mm_add_epi32(W0811, _mm_sign_epi32(pxord0205, negate256_12));
		W0811 = _mm_sub_epi32(W0811, _mm_sign_epi32(pxord0508, negate256_4));
		W0811 = _mm_sub_epi32(W0811, _mm_sign_epi32(pxord0609, negate256_8));
		//_mm_store_si128(&W[ 8],  W0811);
		*/
		W0811 = _mm_add_epi32( W0811, _mm_sign_epi32(pxord1300, negate256_16));
		W0811 = _mm_add_epi32(W0811, _mm_sign_epi32(pxord0205, negate256_12));
		W0811 = _mm_sub_epi32(W0811, _mm_sign_epi32(pxord0508, negate256_4));
		W0811 = _mm_sub_epi32(W0811, _mm_sign_epi32(pxord0609, negate256_8));
		
		//W[12]=exp_12 = (p_xor_d[01]  + p_xor_d[03]  - p_xor_d[06]  - p_xor_d[ 9]  + p_xor_d[10]);
		//W[13]=exp_13 = (p_xor_d[02]  + p_xor_d[04]  + p_xor_d[07]  + p_xor_d[10]  + p_xor_d[11]);
		//W[14]=exp_14 = (p_xor_d[03]  - p_xor_d[05]  + p_xor_d[ 8]  - p_xor_d[11]  - p_xor_d[12]);
		//W[15]=exp_15 = (-p_xor_d[04] - p_xor_d[06]  - p_xor_d[ 9]  + p_xor_d[12]  + p_xor_d[13]);
		
		//__m128i pxord0306 =  _mm_loadu_si128(&p_xor_d[03]);
		/*
		__m128i W1215 = _mm_add_epi32(_mm_sign_epi32(pxord0104, negate256_16), _mm_sign_epi32(pxord0306, negate256_8));
		W1215 = _mm_add_epi32(W1215, _mm_sign_epi32(pxord0609, negate256_24));
		W1215 = _mm_sub_epi32(W1215, _mm_sign_epi32(pxord0912, negate256_4));
		W1215 = _mm_sub_epi32(W1215, _mm_sign_epi32(pxord1013, negate256_0));
		//_mm_store_si128(&W[12],  W1215);
		*/
		W1215 = _mm_add_epi32(W1215, _mm_sign_epi32(pxord0104, negate256_16));
		W1215 = _mm_add_epi32(W1215, _mm_sign_epi32(pxord0609, negate256_24));
		W1215 = _mm_sub_epi32(W1215, _mm_sign_epi32(pxord0912, negate256_4));
		//W1215 = _mm_sub_epi32(W1215, _mm_sign_epi32(pxord1013, negate256_0));
		
		
		//exp[00]=exp_00 = s32_0(W[00]) + p256[01];
		//exp[05]=exp_05 = s32_0(W[05]) + p256[06];
		//exp[10]=exp_10 = s32_0(W[10]) + p256[11];
		//exp[15]=exp_15 = s32_0(W[15]) + p256[00];
		//u_int32_t __attribute__ ((aligned (16)))       tmpW[20];
		// The simple (and slow) way:
		
		//__m128i W00051015 = _mm_set_epi32(W[15], W[10], W[05], W[00]);
		//__m128i W010611 =   _mm_set_epi32(W[12], W[11], W[06], W[01]);
		//__m128i W020712 =   _mm_set_epi32(W[13], W[12], W[07], W[02]);
		//__m128i W030813 =   _mm_set_epi32(W[14], W[13], W[ 8], W[03]);
		//__m128i W040914 =   _mm_set_epi32(W[15], W[14], W[ 9], W[04]);
		
		//W0003 = _mm_set_epi32(3, 2, 1, 00);
		//W0407 = _mm_set_epi32(7, 6, 5, 4);
		//W0811 = _mm_set_epi32(11, 10, 9, 8);
		//W1215 = _mm_set_epi32(15, 14,  13, 12);
		/*
		#if defined ( _MSC_VER )
		#define CAST(x) _mm_castsi128_ps(x)
		#define CASTI(x) _mm_castps_si128(x)
		#elif defined ( __INTEL_COMPILER )
		//#define CAST(x) x
		//#define CASTI(x) x
		#define CAST(x) _mm_castsi128_ps(x)
		#define CASTI(x) _mm_castps_si128(x)
		#else
		//#define CAST(x) (__m128) x
		//#define CASTI(x) (__m128i) x
		#define CAST(x) _mm_castsi128_ps(x)
		#define CASTI(x) _mm_castps_si128(x)
		#endif
		*/
		#define CAST(x) _mm_castsi128_ps(x)
		#define CASTI(x) _mm_castps_si128(x)
		
		// TODO: Reorder for register pressure 
		//        0 1 1 2                  0 1      1 2
		__m128i W08091314 = CASTI( _mm_shuffle_ps(CAST( W0811), CAST( W1215), _MM_SHUFFLE(2, 1, 1,0)));
		__m128i W10111215 = CASTI( _mm_shuffle_ps(CAST( W0811), CAST( W1215), _MM_SHUFFLE(3, 0, 3,2)));
		__m128i W00010506 = CASTI( _mm_shuffle_ps(CAST( W0003), CAST( W0407), _MM_SHUFFLE(2, 1, 1,0)));
		__m128i W02030407 = CASTI( _mm_shuffle_ps(CAST( W0003), CAST( W0407), _MM_SHUFFLE(3, 0, 3,2)));
		
		__m128i W00051015 = CASTI( _mm_shuffle_ps(CAST( W00010506), CAST( W10111215), _MM_SHUFFLE(3, 0, 2,0)));
		__m128i W01061111 = CASTI( _mm_shuffle_ps(CAST( W00010506), CAST( W0811), _MM_SHUFFLE(3, 3, 3,1)));
		__m128i W02071212 = CASTI( _mm_shuffle_ps(CAST( W02030407), CAST( W10111215), _MM_SHUFFLE(2, 2, 3,0)));
		__m128i W03030813 = CASTI( _mm_shuffle_ps(CAST( W0003), CAST( W08091314), _MM_SHUFFLE(2, 0, 3, 3)));
		__m128i W04040914 = CASTI( _mm_shuffle_ps(CAST( W0407), CAST( W08091314), _MM_SHUFFLE(3, 1, 0, 0)));
		
		//_mm_store_si128(&tmpW[00],  W040914_2);
		
		//printf("%d, %d, %d, %d\n", tmpW[00],tmpW[01],tmpW[02],tmpW[03]);
		//exit(0);
		
		
		W00051015 = s32_0sse(W00051015);
		//_mm_store_si128(&tmpW[00],  W00051015);
		
		//exp[01]=exp_01 = s32_1(W[01]) + p256[02];
		//exp[06]=exp_06 = s32_1(W[06]) + p256[07];
		//exp[11]=exp_11 = s32_1(W[11]) + p256[12];
		
		
		W01061111 = s32_1sse(W01061111);
		//_mm_store_si128(&tmpW[04],  W01061111);
		
		
		//exp[02]=exp_02 = s32_2(W[02]) + p256[03];
		//exp[07]=exp_07 = s32_2(W[07]) + p256[ 8];
		//exp[12]=exp_12 = s32_2(W[12]) + p256[13];
		
		
		W02071212 = s32_2sse(W02071212);
		//_mm_store_si128(&tmpW[ 8],  W02071212);
		
		
		//exp[03]=exp_03 = s32_3(W[03]) + p256[04];
		//exp[ 8]=exp_08 = s32_3(W[ 8]) + p256[ 9];
		//exp[13]=exp_13 = s32_3(W[13]) + p256[14];
		
		
		W03030813 = s32_3sse(W03030813);
		//_mm_store_si128(&tmpW[12],  W03030813);
		
		
		//exp[04]=exp_04 = s32_4(W[04]) + p256[05];
		//exp[ 9]=exp_09 = s32_4(W[ 9]) + p256[10];
		//exp[14]=exp_14 = s32_4(W[14]) + p256[15];
		
		
		W04040914 = s32_4sse(W04040914); // This might be slower than non-sse (many shuffles)
		//_mm_store_si128(&tmpW[16],  W04040914);
		
		// Undo the reordering:
		__m128i W00050106 = CASTI( _mm_shuffle_ps(CAST( W00051015), CAST( W01061111), _MM_SHUFFLE(1, 0, 1, 0)));
		__m128i W11111015 = CASTI( _mm_shuffle_ps(CAST( W01061111), CAST( W00051015), _MM_SHUFFLE(3, 2, 3, 3))); // unpackhi?
		
		__m128i W02120313 = CASTI( _mm_shuffle_ps(CAST( W02071212), CAST( W03030813), _MM_SHUFFLE(3, 0, 3, 0)));
		__m128i W07070414 = CASTI( _mm_shuffle_ps(CAST( W02071212), CAST( W04040914), _MM_SHUFFLE(3, 0, 1, 1)));
		__m128i W08130914 = CASTI( _mm_shuffle_ps(CAST( W03030813), CAST( W04040914), _MM_SHUFFLE(3, 2, 3, 2))); // unpackhi?
		__m128i W14141515 = CASTI( _mm_shuffle_ps(CAST( W04040914), CAST( W00051015), _MM_SHUFFLE(3, 3, 3, 3))); // unpackhi?
		
		
		__m128i W04070506 = CASTI(  _mm_shuffle_ps(CAST( W07070414), CAST( W00050106), _MM_SHUFFLE(3, 1, 0, 2)));
		W0003 = CASTI(  _mm_shuffle_ps(CAST( W00050106), CAST( W02120313), _MM_SHUFFLE(2, 0, 2, 0)));
		W0811 = CASTI(  _mm_shuffle_ps(CAST( W08130914), CAST( W11111015), _MM_SHUFFLE(0, 2, 2, 0)));
		W1215 = CASTI(  _mm_shuffle_ps(CAST( W02120313), CAST( W14141515), _MM_SHUFFLE(2, 0, 3, 1)));
		W0407 = CASTI(  _mm_shuffle_ps(CAST( W04070506), CAST( W04070506), _MM_SHUFFLE(1, 3, 2, 0)));
		
		

		
		/*
		exp[00]=exp_00 = tmpW[00] + p256[01];
		exp[05]=exp_05 = tmpW[01] + p256[06];
		exp[10]=exp_10 = tmpW[02] + p256[11];
		exp[15]=exp_15 = tmpW[03] + p256[00];

		exp[01]=exp_01 = tmpW[04] + p256[02];
		exp[06]=exp_06 = tmpW[05] + p256[07];
		exp[11]=exp_11 = tmpW[06] + p256[12];
		
		exp[02]=exp_02 = tmpW[ 8] + p256[03];
		exp[07]=exp_07 = tmpW[ 9] + p256[ 8];
		exp[12]=exp_12 = tmpW[10] + p256[13];
		
		exp[03]=exp_03 = tmpW[12] + p256[04];
		exp[ 8]=exp_08 = tmpW[14] + p256[ 9];
		exp[13]=exp_13 = tmpW[15] + p256[14];
		
		exp[04]=exp_04 = tmpW[16] + p256[05];
		exp[ 9]=exp_09 = tmpW[18] + p256[10];
		exp[14]=exp_14 = tmpW[19] + p256[15];
		*/
		
		// TODO: remove, but code is slower...
		/*
		_mm_store_si128(&tmpW[00],  W0003);
		_mm_store_si128(&tmpW[04],  W0407);
		_mm_store_si128(&tmpW[ 8],  W0811);
		_mm_store_si128(&tmpW[12],  W1215);
		*/
		
		/*
		exp[00]=exp_00 = tmpW[00] + p256[01];
		exp[01]=exp_01 = tmpW[01] + p256[02];
		exp[02]=exp_02 = tmpW[02] + p256[03];
		exp[03]=exp_03 = tmpW[03] + p256[04];
		
		exp[04]=exp_04 = tmpW[04] + p256[05];
		exp[05]=exp_05 = tmpW[05] + p256[06];
		exp[06]=exp_06 = tmpW[06] + p256[07];
		exp[07]=exp_07 = tmpW[07] + p256[ 8];
		
		exp[ 8]=exp_08 = tmpW[ 8] + p256[ 9];
		exp[ 9]=exp_09 = tmpW[ 9] + p256[10];
		exp[10]=exp_10 = tmpW[10] + p256[11];
		exp[11]=exp_11 = tmpW[11] + p256[12];
		
		exp[12]=exp_12 = tmpW[12] + p256[13];
		exp[13]=exp_13 = tmpW[13] + p256[14];
		exp[14]=exp_14 = tmpW[14] + p256[15];
		exp[15]=exp_15 = tmpW[15] + p256[00];
		*/
		__m128i p256_0003 = _mm_load_si128(&p256[00]);
		__m128i p256_0407 = _mm_load_si128(&p256[04]);
		__m128i p256_0811 = _mm_load_si128(&p256[ 8]);
		__m128i p256_1215 = _mm_load_si128(&p256[12]);
		
		__m128i p256_13141500 = _mm_alignr_epi8(p256_0003, p256_1215, 4); //  _mm_loadu_si128(&p256[01]) ++;
		__m128i p256_0912 = _mm_alignr_epi8(p256_1215, p256_0811, 4); //  _mm_loadu_si128(&p256[09]);
		__m128i p256_0508 = _mm_alignr_epi8(p256_0811, p256_0407, 4); //  _mm_loadu_si128(&p256[05]);
		__m128i p256_0104 = _mm_alignr_epi8(p256_0407, p256_0003, 4); //  _mm_loadu_si128(&p256[01]);
		
		
		__m128i exp_0003 = _mm_add_epi32(W0003, p256_0104);
		__m128i exp_0407 = _mm_add_epi32(W0407, p256_0508);
		__m128i exp_0811 = _mm_add_epi32(W0811, p256_0912);
		__m128i exp_1215 = _mm_add_epi32(W1215, p256_13141500);
		
		_mm_store_si128(&exp[00], exp_0003);
		//exp_02 = exp[02];
		//exp_03 = exp[03];
		
		_mm_store_si128(&exp[04], exp_0407);
		//exp_04 = exp[04];
		//exp_05 = exp[05];
		//exp_06 = exp[06];
		//exp_07 = exp[07];
		
		_mm_store_si128(&exp[ 8], exp_0811);
		//exp_08 = exp[ 8];
		//exp_09 = exp[ 9];
		//exp_10 = exp[10];
		//exp_11 = exp[11];
		
		_mm_store_si128(&exp[12], exp_1215);
		//exp_12 = exp[12];
		//exp_13 = exp[13];
		//exp_14 = exp[14];
		//exp_15 = exp[15];
		
		// 8 SSE instructions, 
		
		__m128i TempEvenOddEvenOdd =  _mm_unpackhi_epi64(_mm_setzero_si128(), exp_0003); // Remove exp_00 and exp_01
		TempEvenOddEvenOdd = _mm_add_epi32(TempEvenOddEvenOdd, exp_0407);
		TempEvenOddEvenOdd = _mm_add_epi32(TempEvenOddEvenOdd, exp_0811);
		TempEvenOddEvenOdd = _mm_add_epi32(TempEvenOddEvenOdd, exp_1215);
		__m128i TempEvenEvenOddOdd = _mm_shuffle_epi32(TempEvenOddEvenOdd, _MM_SHUFFLE(1, 3, 2,0));
		TempEvenEvenOddOdd = _mm_hadd_epi32(TempEvenEvenOddOdd, TempEvenEvenOddOdd);
		_mm_storel_epi64(&evenOdd[0], TempEvenEvenOddOdd);
		
		/*
		exp_00 = (p_xor_d_05  - p_xor_d_07  + p_xor_d_10  + p_xor_d_13  + p_xor_d_14);
		exp_05 = (p_xor_d_10  - p_xor_d_12  + p_xor_d_15  - p_xor_d_02  + p_xor_d_03);
		exp_10 = (p_xor_d_15  - p_xor_d_01  - p_xor_d_04  - p_xor_d_07  + p_xor_d_08);
		exp_15 = (-p_xor_d_04 - p_xor_d_06  - p_xor_d_09  + p_xor_d_12  + p_xor_d_13);	
		
		exp_01 = (p_xor_d_06  - p_xor_d_08  + p_xor_d_11  + p_xor_d_14  - p_xor_d_15);
		exp_06 = (-p_xor_d_11 + p_xor_d_13  - p_xor_d_00  - p_xor_d_03  + p_xor_d_04);
		exp_11 = (-p_xor_d_00 - p_xor_d_02  - p_xor_d_05  + p_xor_d_08  + p_xor_d_09);
		
		exp_02 = (p_xor_d_07  + p_xor_d_09  - p_xor_d_12  + p_xor_d_15  + p_xor_d_00);
		exp_07 = (-p_xor_d_12 - p_xor_d_14  + p_xor_d_01  - p_xor_d_04  - p_xor_d_05);
		exp_12 = (p_xor_d_01  + p_xor_d_03  - p_xor_d_06  - p_xor_d_09  + p_xor_d_10);
		
		exp_03 = (p_xor_d_08  - p_xor_d_10  + p_xor_d_13  + p_xor_d_00  - p_xor_d_01);
		exp_08 = (p_xor_d_13  - p_xor_d_15  + p_xor_d_02  - p_xor_d_05  - p_xor_d_06);
		exp_13 = (p_xor_d_02  + p_xor_d_04  + p_xor_d_07  + p_xor_d_10  + p_xor_d_11);
		
		exp_04 = (p_xor_d_09  - p_xor_d_11  - p_xor_d_14  + p_xor_d_01  + p_xor_d_02);
		exp_09 = (p_xor_d_14  + p_xor_d_00  - p_xor_d_03  + p_xor_d_06  - p_xor_d_07);
		exp_14 = (p_xor_d_03  - p_xor_d_05  + p_xor_d_08  - p_xor_d_11  - p_xor_d_12);
		*/
		
		
		
		


		// first parts of Message expansion
		// TODO: SSE version, using _mm_hadd_epi32 and grouping 2*2x s32_1 into one
		//       use two pairs of 32-bit values in one xmm register as acc. Use _mm_hadd_epi32 at the end make final values.
		//    8*4 = 24 r32 inst, 11+4? = ~13-15 inst
		//  + savings on addition and ...
		
		// s32_1: 00-01, 04-05, 08-09, 12-13
		// s32_2: 01-02, 05-06, 09-10, 13-14
		// s32_3: 02-03, 06-07, 10-11, 14-15
		// s32_0: 03-04, 07-08, 11-12, 15-16 (forwarding needed or non-SSE?)
		
		
		// s32_1 and s32_3
		//__m128i exp_0003 = _mm_load_si128(&exp[00]);
		//__m128i exp_0407 = _mm_load_si128(&exp[04]);
		__m128i exp_00010405 = _mm_unpacklo_epi64(exp_0003, exp_0407);
		__m128i exp_16171617 = s32_1sse(exp_00010405);
		__m128i exp_02030607 = _mm_unpackhi_epi64(exp_0003, exp_0407);
		exp_16171617 = _mm_add_epi32(exp_16171617, s32_3sse(exp_02030607));
		
		
		//__m128i exp_0811 = _mm_load_si128(&exp[ 8]);
		//__m128i exp_1215 = _mm_load_si128(&exp[12]);
		__m128i exp_08091213 = _mm_unpacklo_epi64(exp_0811, exp_1215);
		exp_16171617 = _mm_add_epi32(exp_16171617, s32_1sse(exp_08091213));
		__m128i exp_10111415 = _mm_unpackhi_epi64(exp_0811, exp_1215);
		exp_16171617 = _mm_add_epi32(exp_16171617, s32_3sse(exp_10111415));
		
		
		
		// s32_2 and s32_0
		__m128i exp_0104 = _mm_alignr_epi8(exp_0407, exp_0003, 4); //_mm_loadu_si128(&exp[01]);
		__m128i exp_0508 = _mm_alignr_epi8(exp_0811, exp_0407, 4); // _mm_loadu_si128(&exp[05]);
		__m128i exp_01020506 = _mm_unpacklo_epi64(exp_0104, exp_0508);
		exp_16171617 = _mm_add_epi32(exp_16171617, s32_2sse(exp_01020506));
		__m128i exp_03040708 = _mm_unpackhi_epi64(exp_0104, exp_0508);
		exp_16171617 = _mm_add_epi32(exp_16171617, s32_0sse(exp_03040708));
		
		
		// NOTE: 'exp_17 += s32_0(exp_16)' is not performed at here, and must be done with non-SSE code later
		__m128i exp_0912 = _mm_alignr_epi8(exp_1215, exp_0811, 4); //_mm_loadu_si128(&exp[09]);
		__m128i exp_1315 = _mm_alignr_epi8(_mm_setzero_si128(), exp_1215, 4); // _mm_loadu_si128(&exp[13]); // Note that exp 16 must be zero'ed
		__m128i exp_09101314 = _mm_unpacklo_epi64(exp_0912, exp_1315);
		exp_16171617 = _mm_add_epi32(exp_16171617, s32_2sse(exp_09101314));
		__m128i exp_111215 = _mm_unpackhi_epi64(exp_0912, exp_1315);
		exp_16171617 = _mm_add_epi32(exp_16171617, s32_0sse(exp_111215));
		
		
		
		
		// Move exp 16 and 17 into the lower part of the register, and clear upper part.
		__m128i exp_16161717 = _mm_shuffle_epi32(exp_16171617, _MM_SHUFFLE(1, 3, 2,0));
		__m128i exp_1617 =  _mm_hadd_epi32(exp_16161717, _mm_setzero_si128());
		
		/*
		_mm_store_si128(&tmpW[00], exp_1617);
		printf("%d, %d, %d, %d\n", tmpW[00],tmpW[01],tmpW[02],tmpW[03]);
		exit(0);
		*/
		
		
/*
		exp_16  = s32_1(exp_00);
		exp_17  = s32_1(exp_01);
*/
		
//		TempEven32 = exp_14;
//		exp_16  = s32_2(exp_01);
//		TempEven32 += exp_12;
//		exp_17 = s32_2(exp_14);
//		TempEven32 += exp_02; 
//		exp_16 += s32_3(exp_14);


//		TempOdd32  = exp_03; 		
		//u_int32_t rotate_t12 = r32_05(exp_12);
		//u_int32_t rotate_t14 = r32_06(exp_14);

		//exp_19  = rotate_t12 + rotate_t14 /*r32_06(exp_14)*/; // s32_0(exp_12) and r32_05(exp_12) share one rotate. -ok
//		exp_17 += s32_0(exp_12);

		
//		exp_16 += s32_3(exp_02);
//		exp_17 += s32_3(exp_03);

//		exp_16 += s32_1(exp_12);

//		exp_17 += s32_2(exp_02);
//		exp_16 += s32_0(exp_03);
		
		
		__m128i td32_0003 = _mm_load_si128(&td32[00]);
		__m128i td32_0407 = _mm_load_si128(&td32[04]);
		__m128i td32_0811 = _mm_load_si128(&td32[ 8]);
		__m128i td32_1215 = _mm_load_si128(&td32[12]);
		
		__m128i td32_1502 = _mm_alignr_epi8(td32_0003, td32_1215, 12);
		__m128i td32_0306 = _mm_alignr_epi8(td32_0407, td32_0003, 12);
		__m128i td32_0710 = _mm_alignr_epi8(td32_0811, td32_0407, 12);
		
		__m128i td32_0609 = _mm_alignr_epi8(td32_0811, td32_0407, 8);
		
		// The "((td32_12 + td32_15 - td32_06 + 0x9555554cu) ^ p256_03)" parts
		//__m128i exp_2831 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td32[15]), _mm_loadl_epi64(&td32[01]));
		__m128i exp_2831 = td32_1502;
		exp_2831 = _mm_add_epi32(exp_2831, td32_1215);
		#ifdef CONST256ARRAY
		exp_2831 = _mm_add_epi32(exp_2831, _mm_load_si128(&consts256[12]));
		#else
		exp_2831 = _mm_add_epi32(exp_2831, consts256_1215);
		#endif
		//exp_2831 = _mm_sub_epi32(exp_2831, _mm_loadu_si128(&td32[06]));
		//exp_2831 = _mm_sub_epi32(exp_2831, _mm_unpacklo_epi64(_mm_loadl_epi64(&td32[06]),_mm_loadl_epi64(&td32[ 8])));
		exp_2831 = _mm_sub_epi32(exp_2831, td32_0609);
		
		
		//__m128i tmp =  _mm_loadu_si128(&p256[03]); 
		__m128i p256_0306 =  _mm_alignr_epi8(p256_0407, p256_0003, 12); 
		exp_2831 = _mm_xor_si128(exp_2831, p256_0306);
		_mm_store_si128(&exp[28], exp_2831);
		
		__m128i td32_1114 = _mm_alignr_epi8(td32_1215, td32_0811, 12);
		__m128i td32_0205 = _mm_alignr_epi8(td32_0407, td32_0003, 8);
		
		// The "((td32_12 + td32_15 - td32_06 + 0x9555554cu) ^ p256_03)" parts
		//__m128i exp_2427 = _mm_loadu_si128(&td32[11]);
		__m128i exp_2427 = td32_1114;
		exp_2427 = _mm_add_epi32(exp_2427, td32_0811);
		
		#ifdef CONST256ARRAY
		exp_2427 = _mm_add_epi32(exp_2427, _mm_load_si128(&consts256[ 8]));
		#else
		exp_2427 = _mm_add_epi32(exp_2427, consts256_0811);
		#endif
		//exp_2427 = _mm_sub_epi32(exp_2427, _mm_loadu_si128(&td32[02]));
		//exp_2427 = _mm_sub_epi32(exp_2427, _mm_unpacklo_epi64(_mm_loadl_epi64(&td32[02]),_mm_loadl_epi64(&td32[04])));
		exp_2427 = _mm_sub_epi32(exp_2427, td32_0205);
		
		//__m128i p256_1502 =  _mm_alignr_epi8(_mm_load_si128(&p256[00]), _mm_load_si128(&p256[12]), 12);
		__m128i p256_1502 =  _mm_alignr_epi8(p256_0003, p256_1215, 12);
		exp_2427 = _mm_xor_si128(exp_2427, p256_1502);
		
		//exp_2427 = _mm_add_epi32(exp_2427, r32_01sse(_mm_loadu_si128(&exp[ 9])));
		exp_2427 = _mm_add_epi32(exp_2427, r32_01sse(exp_0912));
		__m128i exp_1114 = _mm_alignr_epi8(exp_1215, exp_0811, 12); 
		//exp_2427 = _mm_add_epi32(exp_2427, r32_02sse(_mm_loadu_si128(&exp[11])));
		exp_2427 = _mm_add_epi32(exp_2427, r32_02sse(exp_1114));
		_mm_store_si128(&exp[24], exp_2427);


		// The "((td32_12 + td32_15 - td32_06 + 0x9555554cu) ^ p256_03)" parts
		//__m128i exp_1619 = _mm_loadu_si128(&td32[03]);
		__m128i exp_1619 = td32_0306;
		//exp_1619 = _mm_add_epi32(exp_1619, _mm_load_si128(&td32[00]));
		exp_1619 = _mm_add_epi32(exp_1619, td32_0003);
		#ifdef CONST256ARRAY
		exp_1619 = _mm_add_epi32(exp_1619, _mm_load_si128(&consts256[00]));
		#else
		exp_1619 = _mm_add_epi32(exp_1619, consts256_0003);
		#endif
		
		//exp_1619 = _mm_sub_epi32(exp_1619, _mm_loadu_si128(&td32[10]));
		exp_1619 = _mm_sub_epi32(exp_1619, _mm_unpacklo_epi64(_mm_loadl_epi64(&td32[10]),_mm_loadl_epi64(&td32[12])));
		
		
		//tmp =  _mm_loadu_si128(&p256[07]);
		//exp_1619 = _mm_xor_si128(exp_1619, tmp);
		__m128i p256_0710 =  _mm_alignr_epi8(p256_0811, p256_0407, 12); 
		exp_1619 = _mm_xor_si128(exp_1619, p256_0710);
		
		
		exp_1619 = _mm_add_epi32(exp_1619, exp_1617); // Add in the SSE calculated part
		_mm_store_si128(&exp[16], exp_1619);



		//rotate_t12 = rotr32(rotate_t12,3);
		//rotate_t14 = rotr32(rotate_t14,4);
		//exp_21  = rotate_t12 /*r32_04(exp_12)*/ + rotate_t14 /*r32_05(exp_14)*/;
	//	exp_21 = r32_04(exp_12);
	
		
//		TempEven32 += exp_04;
//		TempOdd32  += exp_05; 
//		exp_16 += s32_1(exp_04);
//		exp_16 += s32_2(exp_05); // 6 xor, 4 rot, 2 shr, 2 shl (lea), 2 add, 2 copy (or load)

		
		// The "((td32_12 + td32_15 - td32_06 + 0x9555554cu) ^ p256_03)" parts
		//__m128i exp_2023 = _mm_loadu_si128(&td32[07]);
		__m128i exp_2023 = td32_0710;
		//exp_2023 = _mm_add_epi32(exp_2023, _mm_load_si128(&td32[04]));
		exp_2023 = _mm_add_epi32(exp_2023, td32_0407);
		
		#ifdef CONST256ARRAY
		exp_2023 = _mm_add_epi32(exp_2023, _mm_load_si128(&consts256[04]));
		#else
		exp_2023 = _mm_add_epi32(exp_2023, consts256_0407);
		#endif
		
		//exp_2023 = _mm_sub_epi32(exp_2023, _mm_set_epi32(td32_01, td32_00, td32_15, td32_14));
		exp_2023 = _mm_sub_epi32(exp_2023, _mm_unpacklo_epi64(_mm_loadl_epi64(&td32[14]),_mm_loadl_epi64(&td32[00])));
		
		//tmp =  _mm_loadu_si128(&p256[11]);
		//exp_2023 = _mm_xor_si128(exp_2023, tmp);
		__m128i p256_1114 =  _mm_alignr_epi8(p256_1215, p256_0811, 12); 
		exp_2023 = _mm_xor_si128(exp_2023, p256_1114);
		
		// r32_01 to r32_04
		//exp_2023 = _mm_add_epi32(exp_2023, r32_01sse(_mm_loadu_si128(&exp[05])));
		exp_2023 = _mm_add_epi32(exp_2023, r32_01sse(exp_0508));
		__m128i exp_0710 = _mm_alignr_epi8(exp_0811, exp_0407, 12); // _mm_loadu_si128(&exp[05]);
		//exp_2023 = _mm_add_epi32(exp_2023, r32_02sse(_mm_loadu_si128(&exp[07])));
		exp_2023 = _mm_add_epi32(exp_2023, r32_02sse(exp_0710));
		//exp_2023 = _mm_add_epi32(exp_2023, r32_03sse(_mm_loadu_si128(&exp[ 9])));
		exp_2023 = _mm_add_epi32(exp_2023, r32_03sse(exp_0912));
		//exp_2023 = _mm_add_epi32(exp_2023, r32_04sse(_mm_loadu_si128(&exp[11])));
		exp_2023 = _mm_add_epi32(exp_2023, r32_04sse(exp_1114));
		
		_mm_store_si128(&exp[20], exp_2023);

		
		

		//rotate_t12 = rotr32(rotate_t12,3);
		//rotate_t14 = rotr32(rotate_t14,3);
		//exp_23  = rotate_t12 /*r32_03(exp_12)*/ + rotate_t14 /*r32_04(exp_14)*/; 
		//exp_23 = r32_03(exp_12);
	//	exp_23 = r32_04(exp_14); // s32_0(exp_16) and r32_05(exp_16) share one rotate.
//		exp_17 += s32_0(exp_04);
//		exp_17 += s32_1(exp_05); // 6 xor, 4 rot, 2 shr, 2 shl, 2 add  ->  fix c: 8,  p0/5: 8+8=16, free: 16, tot: 32 (10 2/3)
		
		
		exp_19 = r32_05(exp[12]); // s32_0(exp_12) and r32_05(exp_12) share one rotate. -ok
		exp_19 += r32_06(exp[14]);
	
		exp_21 = r32_05(exp[14]);
		
		//rotate_t12 = rotr32(rotate_t12,6);
		//rotate_t14 = rotr32(rotate_t14,3);
		//exp_25  = rotate_t12 /*r32_02(exp_12)*/ + rotate_t14 /*r32_03(exp_14)*/;
	//	exp_25 = r32_02(exp_12);
		exp_25 = r32_03(exp[14]);
//		TempEven32 += exp_06; 
//		TempOdd32  += exp_07; 
//		exp_16 += s32_3(exp_06);
//		exp_16 += s32_0(exp_07);
		
		
		//rotate_t12 = rotr32(rotate_t12,4);
		//rotate_t14 = rotr32(rotate_t14,6);
		//exp_27  = rotate_t12 /*r32_01(exp_12)*/ + rotate_t14 /*r32_02(exp_14)*/;
	//	exp_27 = r32_01(exp_12);
	//	exp_27 = r32_02(exp_14);
//		exp_17 += s32_2(exp_06);
//		exp_17 += s32_3(exp_07);
		u_int32_t rotate_t13 = r32_03(exp[13]);
		u_int32_t rotate_t15 = r32_04(exp[15]);
		exp_24 = rotate_t13; // r32_03(exp_13)
		exp_24 += rotate_t15; // r32_04(exp_15)
//		TempEven32 += exp_08; 
//		TempOdd32  += exp_09; 
//		exp_16 += s32_1(exp_08) + s32_2(exp_09);
//		exp_16 = s32_2(exp_09);
		rotate_t13 = rotl32(rotate_t13,6);
		rotate_t15 = rotl32(rotate_t15,7);
		exp_20 = rotate_t13; // r32_05(exp_13) 
		exp_20 += rotate_t15; // r32_06(exp_15)
//		exp_17 += s32_0(exp_08);
//		exp_17 += s32_1(exp_09);
		rotate_t13 = rotr32(rotate_t13,12);
		rotate_t15 = rotr32(rotate_t15,10);
	//	exp_26 = rotate_t13; // r32_02(exp_13) 
		exp_26 = rotate_t15; // r32_03(exp_15)
//		TempEven32 += exp_10; 
//		TempOdd32  += exp_11; 
//		exp_16 += s32_3(exp_10);
//		exp_16 += s32_0(exp_11);
//		TempOdd32  += exp_13; 
//		TempOdd32  += exp_15;
		exp_18 = r32_06(exp[13]);
		exp_18 += r32_07(exp[15]);
		exp_18 += r32_05(exp[11]); // s32_1(exp_13) and r32_06(exp_13) share one rotate, s32_0(exp_11) and r32_05(exp_11) share one rotate.
//		exp_17 += s32_2(exp_10);
//		exp_17 += s32_3(exp_11);
	//	exp_22 = r32_04(exp_13);
		exp_22 = r32_05(exp[15]); // s32_0(exp_15) and r32_05(exp_15) share one rotate. - ok
//		exp_16 += s32_2(exp_13);
//		exp_16 += s32_0(exp_15);

//		exp_17 += s32_1(exp_13);
//		exp_17 += s32_3(exp_15);
//printf("%d, %d, %d, %d\n", TempEven32, TempOdd32, evenOdd[00],evenOdd[01]);
//exit(0);

		//exp_16 += ((td32_00 + td32_03 + 0x55555550u - td32_10) ^ p256_07);
		//exp_16 += (exp[00] ^ p256_07);
		exp_16 = exp[16];
		XL32 =  exp_16;
		exp_28 = r32_01(exp[13]);
		exp_28 += r32_02(exp[15]);
		exp_17 = s32_0(exp_16);
		//exp_17 += ((td32_01 + td32_04 - td32_11 + 0x5aaaaaa5u) ^ p256_08);
		//exp_17 += (exp[01] ^ p256_08);
		exp_17 += exp[17];
		XL32 ^= exp_17;
		exp[17] = exp_17;

		/* expand32_22(18); */
		TempEven32 = evenOdd[00];
		exp_18 += TempEven32;
		exp_18 += s32_4( exp_16);
		exp_18 += s32_5( exp_17);
		exp_18 += r32_01(exp[03]); // r32_01(exp_03) performs a shift left by 3 on exp_03 as well, as part of the rotate...
		exp_18 += r32_02(exp[05]);
		exp_18 += r32_03(exp[07]);
		exp_18 += r32_04(exp[ 9]);
							  				  
		//exp_18 += ((td32_02 + td32_05 - td32_12 + 0x5ffffffau) ^ p256_09);
		//exp_18 += (exp[02] ^ p256_09);
		exp_18 += exp[18];
		XL32 ^= exp_18;
		exp[18] = exp_18;

	//	exp_20 += r32_01(exp_05);
	//	exp_20 += r32_02(exp_07);
	//	exp_20 += r32_03(exp_09);
	//	exp_20 += r32_04(exp_11);
		exp_20 += r32_07(exp_17);
		exp_20 += s32_4( exp_18 );
		//exp_20 += ((td32_04 + td32_07 - td32_14 + 0x6aaaaaa4u) ^ p256_11);
		//exp_20 += (exp[04] ^ p256_11);
		exp_20 += exp[20];


	//	exp_22 += r32_01(exp_07);
	//	exp_22 += r32_02(exp_09);
	//	exp_22 += r32_03(exp_11);
		exp_22 += r32_06(exp_17);
		//exp_22 +=  ((td32_06 + td32_09 - td32_00 + 0x7555554eu) ^ p256_13);
		//exp_22 +=  (exp[06] ^ p256_13);
		exp_22 +=  exp[22];

		TempOdd32  = evenOdd[01];
		/* expand32_21(19); */
		//----
		exp_19 += TempOdd32;
		exp_19 += r32_01(exp[04]);
		exp_19 += r32_02(exp[06]);
		exp_19 += r32_03(exp[ 8]);
		exp_19 += r32_04(exp[10]);
		exp_19 += r32_07(exp_16);
		exp_19 += s32_4( exp_17);
		exp_19 += s32_5( exp_18);
		//exp_19 += ((td32_03 + td32_06 - td32_13 + 0x6555554fu) ^ p256_10);
		//exp_19 += (exp[03] ^ p256_10);
		exp_19 += exp[19];
//		exp[19] = exp_19;
		XL32 ^= exp_19;
		exp[19] = exp_19;
		TempEven32=TempEven32 + exp_16 - exp[2];
		
/*		
		// r32_01 for exp_28 - exp_31
		__m128i exp_1316 = _mm_alignr_epi8(exp_1619, exp_1215, 4);
		exp_2831 = _mm_add_epi32(exp_2831, r32_01sse(exp_1316));
		exp_1619 = _mm_load_si128(&exp[16]);
		__m128i exp_1518 = _mm_alignr_epi8(exp_1619, exp_1215, 12);
		exp_2831 = _mm_add_epi32(exp_2831, r32_02sse(exp_1518));
		_mm_store_si128(&exp[28], exp_2831);
*/
		
		//---- 
		/* expand32_22(20); */
		exp_20 += TempEven32;
		exp_20 += s32_5( exp_19);		
		XL32 ^= exp_20;
		exp[20] = exp_20;
		
		TempOdd32 = TempOdd32 + exp_17 - exp[3];
		/* expand32_21(21); */
		exp_21 += TempOdd32;
	//	exp_21 += r32_01(exp_06);
	//	exp_21 += r32_02(exp_08);
	//	exp_21 += r32_03(exp_10);
		exp_21 += r32_06(exp_16);
		exp_21 += r32_07(exp_18);
		exp_21 += s32_4( exp_19);
		exp_21 += s32_5( exp_20);
		//exp_21 += ((td32_05 + td32_08 - td32_15 + 0x6ffffff9u) ^ p256_12);
		//exp_21 += (exp[05] ^ p256_12);
		exp_21 += exp[21];
		
		XL32 ^= exp_21;
		exp[21] = exp_21;
		TempEven32 = TempEven32 + exp_18 - exp[04];
		/* expand32_22(22); */
		exp_22 += TempEven32;
		exp_22 += r32_07(exp_19);
		exp_22 += s32_4( exp_20);
		exp_22 += s32_5( exp_21);
		XL32 ^= exp_22;
		exp[22] = exp_22;
		TempOdd32 = TempOdd32 + exp_19 - exp[05];
		/* expand32_21(23); */
		exp_23 = TempOdd32;
	//	exp_23 += r32_01(exp_08);
	//	exp_23 += r32_02(exp_10);
		exp_23 += r32_05(exp_16);
		exp_23 += r32_06(exp_18);
		exp_23 += r32_07(exp_20);
		exp_23 += s32_4( exp_21);
		exp_23 += s32_5( exp_22);
		//exp_23 += ((td32_07 + td32_10 - td32_01 + 0x7aaaaaa3u) ^ p256_14);
		//exp_23 += (exp[07] ^ p256_14);
		exp_23 += exp[23];
		XL32 ^= exp_23;
		exp[23] = exp_23;
		TempEven32 = TempEven32 + exp_20 - exp[06];
		
		
		XL32_XH32[0] = (u_int64_t) XL32;
		__m128i XL32SSE = _mm_loadl_epi64(&XL32_XH32[0]);
		XL32SSE = _mm_shuffle_epi32(XL32SSE, _MM_SHUFFLE(0, 0, 0,0));
		
		// XL32 is completed now, build XL32_shifted for later SSE usage
		XL32_shifted[3] = XL32_Lshift = shl(XL32,4); // 3
		XL32_shifted[2] = XL32_Lshift = shl(XL32_Lshift,2); // 2
		XL32_shifted[0] = XL32_Lshift = shl(XL32_Lshift,2); // 0
		
		XL32_shifted[7] = XL32_Rshift = shr(XL32,2); // 7
		XL32_shifted[4] = XL32_Rshift = shr(XL32_Rshift,1); // 4
		XL32_shifted[5] = XL32_Rshift = shr(XL32_Rshift,1); // 5
		XL32_shifted[1] = XL32_Rshift = shr(XL32_Rshift,2); // 1
		XL32_shifted[6] = XL32_Rshift = shr(XL32_Rshift,1); // 6
/*
shl(XL32,8); // 0
shr(XL32,6); // 1
shl(XL32,6); // 2
shl(XL32,4); // 3
shr(XL32,3); // 4
shr(XL32,4); // 5
shr(XL32,7); // 6
shr(XL32,2); // 7
*/
		/* expand32_22(24); */
		exp_24 += TempEven32;
	//	exp_24 += r32_01(exp_09);
	//	exp_24 += r32_02(exp_11);
		exp_24 += r32_05(exp_17);
		exp_24 += r32_06(exp_19);
		exp_24 += r32_07(exp_21);
		exp_26 += r32_04(exp_17);
		exp_26 += r32_05(exp_19);
		exp_26 += r32_06(exp_21);
		exp_24 += s32_4( exp_22);
		exp_24 += s32_5( exp_23);
		//exp_24 += ((td32_08 + td32_11 - td32_02 + 0x7ffffff8u) ^ p256_15);
		//exp_24 += (exp[ 8] ^ p256_15);
		exp_24 += exp[24];
		XH32 =  XL32^exp_24;
		exp[24] = exp_24;
		TempOdd32 = TempOdd32 + exp_21 - exp[07];
		/* expand32_21(25); */
		exp_25 += TempOdd32;
	//	exp_25 += r32_01(exp_10);
		exp_25 += r32_04(exp_16);
		exp_25 += r32_05(exp_18);
		exp_25 += r32_06(exp_20);
		exp_25 += r32_07(exp_22);
		exp_25 += s32_4( exp_23);
		exp_25 += s32_5( exp_24);
		//exp_25 += ((td32_09 + td32_12 + 0x8555554du - td32_03) ^ p256_00);
		//exp_25 += (exp[ 9] ^ p256_00);
		exp_25 += exp[25];
		XH32 ^= exp_25;
		exp[25] = exp_25;
		TempEven32 = TempEven32 + exp_22 - exp[ 8];
		
		
		
		
		/* expand32_22(26); */
		exp_26 += TempEven32;
	//	exp_26 += r32_01(exp_11);
		
		exp_26 += r32_07(exp_23);
		exp_26 += s32_4( exp_24);
		exp_26 += s32_5( exp_25);
		//exp_26 += ((td32_10 + td32_13 - td32_04 + 0x8aaaaaa2u) ^ p256_01);
		//exp_26 += (exp[10] ^ p256_01);
		exp_26 += exp[26];
		XH32 ^= exp_26;
		exp[26] = exp_26;
		TempOdd32 = TempOdd32 + exp_23 - exp[ 9];
		/* expand32_21(27); */
		exp_27 = TempOdd32;
		exp_27 += r32_03(exp_16);
		exp_27 += r32_04(exp_18);
		exp_27 += r32_05(exp_20);
		exp_27 += r32_06(exp_22);
		exp_27 += r32_07(exp_24);
		exp_27 += s32_4( exp_25);
		exp_27 += s32_5( exp_26);
		//exp_27 += ((td32_11 + td32_14 - td32_05 + 0x8ffffff7u) ^ p256_02);
		//exp_27 += (exp[11] ^ p256_02);
		exp_27 += exp[27];
		XH32 ^= exp_27;
		exp[27] = exp_27;

		TempEven32 = TempEven32 + exp_24 - exp[10];
		/* expand32_22(28); */
		exp_28 += TempEven32;
		exp_28 += r32_03(exp_17);
		exp_28 += r32_04(exp_19);
		exp_28 += r32_05(exp_21);
		exp_28 += r32_06(exp_23);
		exp_28 += r32_07(exp_25);
		exp_28 += s32_4( exp_26);
		exp_28 += s32_5( exp_27);
		//exp_28 += ((td32_12 + td32_15 - td32_06 + 0x9555554cu) ^ p256_03);
		//exp_28 += (exp[12] ^ p256_03);
		exp_28 += exp[28];
		
		XH32 ^= exp_28;
		exp[28] = exp_28;
		
		TempOdd32 = TempOdd32 + exp_25 - exp[11];
		/* expand32_21(29); */
		exp_29 = TempOdd32;
		exp_29 += r32_01(exp[14]);
		exp_29 += r32_02(exp_16);
		exp_29 += r32_03(exp_18);
		exp_29 += r32_04(exp_20);
		exp_29 += r32_05(exp_22);
		exp_29 += r32_06(exp_24);
		exp_29 += r32_07(exp_26);
		exp_29 += s32_4( exp_27);
		exp_29 += s32_5( exp_28);
		//exp_29 += ((td32_13 + td32_00 - td32_07 + 0x9aaaaaa1u) ^ p256_04);
		//exp_29 += (exp[13] ^ p256_04);
		exp_29 += exp[29];
		XH32 ^= exp_29;
		exp[29] = exp_29;
		
		TempEven32 = TempEven32 + exp_26 - exp[12];
		/* expand32_22(30); */
		exp_30 = TempEven32;
		exp_30 += r32_01(exp[15]);
		exp_30 += r32_02(exp_17);
		exp_30 += r32_03(exp_19);
		exp_30 += r32_04(exp_21);
		exp_30 += r32_05(exp_23);
		exp_30 += r32_06(exp_25);
		exp_30 += r32_07(exp_27);
		exp_30 += s32_4( exp_28);
		exp_30 += s32_5( exp_29);
		//exp_30 += ((td32_14 + td32_01 - td32_08 + 0x9ffffff6u) ^ p256_05);
		//exp_30 += (exp[14] ^ p256_05);
		exp_30 += exp[30];
		XH32 ^= exp_30;
		exp[30] = exp_30;
		
		TempOdd32 = TempOdd32 + exp_27 - exp[13];
		/* expand32_21(31); */
		exp_31 = TempOdd32;
		exp_31 += r32_01(exp_16); // TODO: good for SSE   [18-19,28-31]: 2+4 (2x done) ok
		exp_31 += r32_02(exp_18); // TODO: good for SSE   [18-19,28-31]: 2+4 (2x done) 
		exp_31 += r32_03(exp_20); // TODO: good for SSE   [18-19,24-31]: 2+8 (1x done)
		exp_31 += r32_04(exp_22); // TODO: v.good for SSE [18-19,24-31]: 2+8 (1x done)
		exp_31 += r32_05(exp_24); // TODO: good? for SSE  [18-31]: 2+12
		exp_31 += r32_06(exp_26); // TODO: ok? for SSE    [18-31]: 2+12
		exp_31 += r32_07(exp_28); // TODO: v.bad for SSE (needs forwarding of 1 value)
		exp_31 += s32_4( exp_29); // TODO: v.bad for SSE (needs forwarding of 2+1 values)
		exp_31 += s32_5( exp_30); // TODO: v.bad for SSE (needs forwarding of 3+2+1 values)
		//exp_31 += ((td32_15 + td32_02 - td32_09 + 0xa555554bu) ^ p256_06);
		//exp_31 += (exp[15] ^ p256_06);
		exp_31 += exp[31];
		XH32 ^= exp_31;
		exp[31] = exp_31;

		XL32_XH32[0] = (u_int64_t) XH32;
		__m128i XH32SSE = _mm_loadl_epi64(&XL32_XH32[0]);
		XH32SSE = _mm_shuffle_epi32(XH32SSE, _MM_SHUFFLE(0, 0, 0,0));
		// TODO: First part (SSE too inefficient)
		//     8x shift (XH32), 1x move
		//     8x load (exp_xx), 7x shift | 7x load, 7x shift (perform 'shr(XH32, 3)' last and do a destructive xor (mem) to it)
		//     8x xor (exp shifted)
		//     8x xor (data32)
		//     8x add (mem)
		//     8x store
		// tot:
		//     8 + 1 + 7 + 7 + 8 + 8 + 8 + 8 = 55
		
		// TODO: Last part SSE:
		// make XL32 xmm register:
		//     1x insert + 1x _mm_shuffle_epi8  (uses an memload)
		// the rest:
		//     3x load
		//     4x xor
		//     2x store ?
		// tot:
		//     2 + 3 + 4 + 2 = 11x inst
		
		// ca 53 mem loads in old non-SSE icc code
		/*  Compute the double chaining pipe for the next message block. */ // 191 instr total in 32bit mode, 89 for the p256 0-7 part.
		
		/*
		p256[00] =                       (shl(XH32, 5) ^ shr(exp_16,5) ^ data32[ 0]) + (    XL32    ^ exp_24 ^ exp[00]); // TODO: only the last part is good for SSE
		p256[01] =                       (shr(XH32, 7) ^ shl(exp_17,8) ^ data32[ 1]) + (    XL32    ^ exp_25 ^ exp[01]);
		p256[02] =                       (shr(XH32, 5) ^ shl(exp_18,5) ^ data32[ 2]) + (    XL32    ^ exp_26 ^ exp[02]);
		p256[03] =                       (shr(XH32, 1) ^ shl(exp_19,5) ^ data32[ 3]) + (    XL32    ^ exp_27 ^ exp[03]);
		p256[04] =                       (shr(XH32, 3) ^     exp_20    ^ data32[ 4]) + (    XL32    ^ exp_28 ^ exp_04);
		p256[05] =                       (shl(XH32, 6) ^ shr(exp_21,6) ^ data32[ 5]) + (    XL32    ^ exp_29 ^ exp_05);
		p256[06] =                       (shr(XH32, 4) ^ shl(exp_22,6) ^ data32[ 6]) + (    XL32    ^ exp_30 ^ exp_06);
		p256[07] =                       (shr(XH32,11) ^ shl(exp_23,2) ^ data32[ 7]) + (    XL32    ^ exp_31 ^ exp_07);
		*/
		
		p256_0003 =  _mm_xor_si128(exp_0003, XL32SSE);
		p256_0407 =  _mm_xor_si128(exp_0407, XL32SSE);
		exp_2427 = _mm_load_si128(&exp[24]);
		exp_2831 = _mm_load_si128(&exp[28]);
		p256_0003 =  _mm_xor_si128(p256_0003, exp_2427);
		_mm_store_si128(&p256[ 0], p256_0003);
		//p256_0407 =  _mm_xor_si128(p256_0407, exp_2831);
		//_mm_store_si128(&p256[ 4], p256_0407);
		
		p256[00] +=                       (shl(XH32, 5) ^ shr(exp_16,5) ^ data32[ 0]); // TODO: only the last part is good for SSE
		p256[01] +=                       (shr(XH32, 7) ^ shl(exp_17,8) ^ data32[ 1]);
		p256[02] +=                       (shr(XH32, 5) ^ shl(exp_18,5) ^ data32[ 2]);
		p256[03] +=                       (shr(XH32, 1) ^ shl(exp_19,5) ^ data32[ 3]);
		p256[04] =                       (shr(XH32, 3) ^     exp_20    ^ data32[ 4]) + (    XL32    ^ exp_28 ^ exp[04]);
		p256[05] =                       (shl(XH32, 6) ^ shr(exp_21,6) ^ data32[ 5]) + (    XL32    ^ exp_29 ^ exp[05]);
		p256[06] =                       (shr(XH32, 4) ^ shl(exp_22,6) ^ data32[ 6]) + (    XL32    ^ exp_30 ^ exp[06]);
		p256[07] =                       (shr(XH32,11) ^ shl(exp_23,2) ^ data32[ 7]) + (    XL32    ^ exp_31 ^ exp[07]);
		
		
		// TODO: First part SSE: (too inefficient directly)
		//     8x load r32 (unlikely)
		//     8x rotate r32
		//     8x inserts (note the latency of 4, so 4x 64-bit inserts might be needed++)
		// tot:
		//     24x
		
		// TODO: Middle part SSE:
		// exp_24 - exp_31 are in 2 xmm registers from the block above (assumed), and acts as acc registers
		//     2x xor (mem): data32
		//     2x xor (reg): XH32
		// make XH32 xmm register:
		//     1x insert + 1x _mm_shuffle_epi8  (uses an memload)
		// add:
		//     2x add (reg)
		// tot: 
		//     8x inst
		
		// The last part in SSE4.1:
		//     2x r32, 2x xmm, 8x r32 shifts, 8 xmm inserts
		//     2x xor (reg), 2x load, 3x reorder
		//     2x xor (mem)
		// tot 25 inst, result is in xmm
		// or, 24x inst (result is in r32) + 8 store
		
		// Summing up the parts SSE:
		//     4x add (reg)
		//     2x store
		
		// All the parts SSE: (seems better than non-SSE, but check latency)
		//    24 + 8 + 25 + 6 = 63
		
		
		exp_1619 = _mm_load_si128(&exp[16]);
		exp_2023 = _mm_load_si128(&exp[20]);
		__m128i exp_23161718 = _mm_alignr_epi8(exp_1619, exp_2023, 12);
		__m128i exp_1922 = _mm_alignr_epi8(exp_2023, exp_1619, 12);
		
		p256_0811 = _mm_xor_si128(exp_0811, exp_23161718);
		p256_0811 = _mm_xor_si128(p256_0811, _mm_load_si128(&XL32_shifted[ 0]));
		p256_1215 = _mm_xor_si128(exp_1215, exp_1922);
		p256_1215 = _mm_xor_si128(p256_1215, _mm_load_si128(&XL32_shifted[ 4]));
		
		
		
		__m128i pTemp_2427 = _mm_xor_si128(exp_2427, _mm_load_si128(&data32[ 8]));
		pTemp_2427 = _mm_xor_si128(pTemp_2427, XH32SSE);
		p256_0811  = _mm_add_epi32(p256_0811, pTemp_2427);
		
		__m128i pTemp_1215 = _mm_xor_si128(exp_2831, _mm_load_si128(&data32[12]));
		pTemp_1215 = _mm_xor_si128(pTemp_1215, XH32SSE);
		p256_1215  = _mm_add_epi32(p256_1215, pTemp_1215);
		
		_mm_store_si128(&p256[12], p256_1215);
		_mm_store_si128(&p256[ 8], p256_0811);
		
		
		//__m128i temp_0811 = _mm_xor_si128(exp_0811, _mm_load_si128(&data32[16]));
		/*
		p256[ 8] = rotl32(p256[04], 9) + (    XH32     ^     exp_24    ^ data32[ 8]) + (shl(XL32,8) ^ exp_23 ^ exp_08);
		p256[ 9] = rotl32(p256[05],10) + (    XH32     ^     exp_25    ^ data32[ 9]) + (shr(XL32,6) ^ exp_16 ^ exp_09);
		p256[10] = rotl32(p256[06],11) + (    XH32     ^     exp_26    ^ data32[10]) + (shl(XL32,6) ^ exp_17 ^ exp_10); 
		p256[11] = rotl32(p256[07],12) + (    XH32     ^     exp_27    ^ data32[11]) + (shl(XL32,4) ^ exp_18 ^ exp_11); 
		p256[12] = rotl32(p256[00],13) + (    XH32     ^     exp_28    ^ data32[12]) + (shr(XL32,3) ^ exp_19 ^ exp_12); 
		p256[13] = rotl32(p256[01],14) + (    XH32     ^     exp_29    ^ data32[13]) + (shr(XL32,4) ^ exp_20 ^ exp_13); 
		p256[14] = rotl32(p256[02],15) + (    XH32     ^     exp_30    ^ data32[14]) + (shr(XL32,7) ^ exp_21 ^ exp_14); 
		p256[15] = rotl32(p256[03],16) + (    XH32     ^     exp_31    ^ data32[15]) + (shr(XL32,2) ^ exp_22 ^ exp_15);
		*/

/*
		p256[ 8] += rotl32(p256[04], 9) + (    XH32     ^     exp_24    ^ data32[ 8]);
		p256[ 9] += rotl32(p256[05],10) + (    XH32     ^     exp_25    ^ data32[ 9]);
		p256[10] += rotl32(p256[06],11) + (    XH32     ^     exp_26    ^ data32[10]); 
		p256[11] += rotl32(p256[07],12) + (    XH32     ^     exp_27    ^ data32[11]); 
		p256[12] += rotl32(p256[00],13) + (    XH32     ^     exp_28    ^ data32[12]); 
		p256[13] += rotl32(p256[01],14) + (    XH32     ^     exp_29    ^ data32[13]); 
		p256[14] += rotl32(p256[02],15) + (    XH32     ^     exp_30    ^ data32[14]); 
		p256[15] += rotl32(p256[03],16) + (    XH32     ^     exp_31    ^ data32[15]);
*/
		p256[ 8] += rotl32(p256[04], 9);
		p256[ 9] += rotl32(p256[05],10);
		p256[10] += rotl32(p256[06],11); 
		p256[11] += rotl32(p256[07],12); 
		p256[12] += rotl32(p256[00],13); 
		p256[13] += rotl32(p256[01],14); 
		p256[14] += rotl32(p256[02],15); 
		p256[15] += rotl32(p256[03],16);
		
		//p256_0003 = _mm_load_si128(&p256[00]);
		//p256_0407 = _mm_load_si128(&p256[04]);
		data32 += 16;
	}
	while (data32 < data32_end);

	copyTemp = _mm_load_si128(&p256[ 0]);
	_mm_store_si128(&hashState256(state)->DoublePipe[ 0], copyTemp);
	copyTemp = _mm_load_si128(&p256[ 4]);
	_mm_store_si128(&hashState256(state)->DoublePipe[ 4], copyTemp);
	copyTemp = _mm_load_si128(&p256[ 8]);
	_mm_store_si128(&hashState256(state)->DoublePipe[ 8], copyTemp);
	copyTemp = _mm_load_si128(&p256[12]);
	_mm_store_si128(&hashState256(state)->DoublePipe[12], copyTemp);
}

#else
#error "This version need SSSE3"
#endif

