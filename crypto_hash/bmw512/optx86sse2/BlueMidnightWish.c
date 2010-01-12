/* Blue Midnight Wish - 512 bit SSE2 version optimized for x86 platforms */

/* 
   This SSE2 version is programmed by Rune E. Jensen, December 2009.
*/

#include <stdio.h>
#include <string.h> 
#include "BlueMidnightWish.h"

// Needs SSE2 support:
#include "emmintrin.h"

#define rotl64(x,n)   (((x) << n) | ((x) >> (64 - n)))
#define rotr64(x,n)   (((x) >> n) | ((x) << (64 - n)))

#define shl(x,n)      ((x) << n)
#define shr(x,n)      ((x) >> n)

/* BlueMidnightWish512 initial double chaining pipe */
#if defined ( _MSC_VER )
const u_int64_t __declspec(align(16)) i512p2[16] =
#else
const u_int64_t __attribute__ ((aligned (16))) i512p2[16] =
#endif
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

#if defined ( _MSC_VER )
const u_int64_t __declspec(align(16)) consts[16] = 
#else
const u_int64_t __attribute__ ((aligned (16))) consts[16] =
#endif
{
	0x5555555555555550ull,0x5aaaaaaaaaaaaaa5ull,
	0x5ffffffffffffffaull,0x655555555555554full,
	0x6aaaaaaaaaaaaaa4ull,0x6ffffffffffffff9ull,
	0x755555555555554eull,0x7aaaaaaaaaaaaaa3ull,
	0x7ffffffffffffff8ull,0x855555555555554dull,
	0x8aaaaaaaaaaaaaa2ull,0x8ffffffffffffff7ull,
	0x955555555555554cull,0x9aaaaaaaaaaaaaa1ull,
	0x9ffffffffffffff6ull,0xa55555555555554bull
};
#if defined ( _MSC_VER )
const u_int64_t __declspec(align(16)) constsFinal[16] = 
#else
const u_int64_t __attribute__ ((aligned (16))) constsFinal[16] =
#endif
{
	0xaaaaaaaaaaaaaaa0ull,0xaaaaaaaaaaaaaaa1ull,
	0xaaaaaaaaaaaaaaa2ull,0xaaaaaaaaaaaaaaa3ull,
	0xaaaaaaaaaaaaaaa4ull,0xaaaaaaaaaaaaaaa5ull,
	0xaaaaaaaaaaaaaaa6ull,0xaaaaaaaaaaaaaaa7ull,
	0xaaaaaaaaaaaaaaa8ull,0xaaaaaaaaaaaaaaa9ull,
	0xaaaaaaaaaaaaaaaaull,0xaaaaaaaaaaaaaaabull,
	0xaaaaaaaaaaaaaaacull,0xaaaaaaaaaaaaaaadull,
	0xaaaaaaaaaaaaaaaeull,0xaaaaaaaaaaaaaaafull
};

#define hashState512(x)  ((x)->pipe->p512)
#define hashState512_(x)  ((x).pipe[0].p512[0])

/* Components used for 384 and 512 bit version */
#define s64_0(x)  (shr((x), 1) ^ shl((x), 3) ^ rotl64((x),  4) ^ rotl64((x), 37))
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

static __inline __m128i s64_0sse( __m128i x128)
{
	__m128i sl = _mm_slli_epi64(x128, 3);
	__m128i sr = _mm_srli_epi64(x128, 1);
	__m128i ans = _mm_xor_si128(sl, sr);
	
	sl  = _mm_slli_epi64(sl, 4-3);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi64(sr, 64-(37+1)); // 64-(37+1) = 26
	ans = _mm_xor_si128(ans, sr);
	
	sl  = _mm_slli_epi64(sl, 37-4);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi64(sr, 64-(4+1+26)); // 26
	ans = _mm_xor_si128(ans, sr);

	return ans; //(shr((x), 1) ^ shl((x), 3) ^ rotl64((x),  4) ^ rotl64((x), 37));
}

static __inline __m128i s64_1sse(__m128i x128)
{
	__m128i sl = _mm_slli_epi64(x128, 2);
	__m128i sr = _mm_srli_epi64(x128, 1);
	__m128i ans = _mm_xor_si128(sl, sr);
	
	sl  = _mm_slli_epi64(sl, 13-2);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi64(sr, 64-(43+1)); // 64-(43+1) = 20
	ans = _mm_xor_si128(ans, sr);
	
	sl  = _mm_slli_epi64(sl, 43-13);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi64(sr, 64-(13+1+20)); // 30
	ans = _mm_xor_si128(ans, sr);
	

	return ans; //(shr((x), 1) ^ shl((x), 2) ^ rotl64((x), 13) ^ rotl64((x), 43));
}

static __inline __m128i s64_2sse(__m128i x128)
{
	__m128i sl = _mm_slli_epi64(x128, 1);
	__m128i sr = _mm_srli_epi64(x128, 2);
	__m128i ans = _mm_xor_si128(sl, sr);
	
	sl  = _mm_slli_epi64(sl, 19-1);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi64(sr, 64-(53+2)); // 64-(53+2) = 9
	ans = _mm_xor_si128(ans, sr);
	
	sl  = _mm_slli_epi64(sl, 53-19);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi64(sr, 64-(19+2+9)); // 34
	ans = _mm_xor_si128(ans, sr);

	return ans; //(shr((x), 2) ^ shl((x), 1) ^ rotl64((x), 19) ^ rotl64((x), 53));
}

static __inline __m128i s64_3sse(__m128i x128)
{
	__m128i sl = _mm_slli_epi64(x128, 2);
	__m128i sr = _mm_srli_epi64(x128, 2);
	__m128i ans = _mm_xor_si128(sl, sr);
	
	sl  = _mm_slli_epi64(sl, 28-2);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi64(sr, 64-(59+2)); // 64-(59+2) = 3
	ans = _mm_xor_si128(ans, sr);
	
	sl  = _mm_slli_epi64(sl, 59-28);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi64(sr, 64-(28+2+3)); // 34
	ans = _mm_xor_si128(ans, sr);
	
	return ans; //(shr((x), 2) ^ shl((x), 2) ^ rotl64((x), 28) ^ rotl64((x), 59));
}

static __inline __m128i s64_4sse(__m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 1);
	return _mm_xor_si128(x128, sr); // (shr((x), 1) ^ (x))
}

// This version must handle forwarding of data:
//	exp_18 += s64_5( exp_17);
//	exp_19 += s64_5( exp_18);
//  exp1819 = s64_5sse_acc(_mm_loadl_epi64(&exp[17]), exp1819);
static __inline __m128i s64_5sse_acc(__m128i x128, __m128i accumulator)
{
	__m128i sr = _mm_srli_epi64(x128, 2);
	sr = _mm_xor_si128(x128, sr);
	sr = _mm_add_epi64(accumulator, sr);
	// The lower part is now ok, insert it to the upper part of x128
	x128 = _mm_unpacklo_epi64(x128, sr);
	// Forwarding completed, x128 is now = {exp_17, exp18 + s64_5( exp_17) }
	sr = _mm_srli_epi64(x128, 2);
	x128 = _mm_xor_si128(x128, sr); 
	// The lower part of x128 must be cleard before the add
	return _mm_add_epi64(accumulator, x128); // (shr((x), 2) ^ (x))
}

// This version must handle forwarding of data:
//	exp_16 += s64_0( exp_15);
//	exp_17 += s64_0( exp_16);
//  exp1617 = s64_0sse_acc(_mm_loadl_epi64(&exp[15]), exp1617);
static __inline __m128i s64_0sse_acc( __m128i x128,  __m128i accumulator)
{
	__m128i sl = _mm_slli_epi64(x128, 3);
	__m128i sr = _mm_srli_epi64(x128, 1);
	__m128i ans = _mm_xor_si128(sl, sr);
	
	sl  = _mm_slli_epi64(sl, 4-3);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi64(sr, 64-(37+1)); // 64-(43+1) = 26
	ans = _mm_xor_si128(ans, sr);
	
	sl  = _mm_slli_epi64(sl, 37-4);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi64(sr, 64-(4+1+26)); // 26
	ans = _mm_xor_si128(ans, sr);
	// ans have s64_0( exp_15) now.
	ans = _mm_add_epi64(accumulator, ans);
	// The lower part is now ok, insert it to the upper part of x128
	x128 = _mm_unpacklo_epi64(x128, ans);
	// Forwarding completed, x128 is now = {exp_15, exp16 + s64_0( exp_15) }
	
	sl = _mm_slli_epi64(x128, 3);
	sr = _mm_srli_epi64(x128, 1);
	ans = _mm_xor_si128(sl, sr);
	
	sl  = _mm_slli_epi64(sl, 4-3);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi64(sr, 64-(37+1)); // 64-(43+1) = 26
	ans = _mm_xor_si128(ans, sr);
	
	sl  = _mm_slli_epi64(sl, 37-4);
	ans = _mm_xor_si128(ans, sl);
	
	sr  = _mm_srli_epi64(sr, 64-(4+1+26)); // 26
	ans = _mm_xor_si128(ans, sr);

	return _mm_add_epi64(ans, accumulator); //(shr((x), 1) ^ shl((x), 3) ^ rotl64((x),  4) ^ rotl64((x), 37));
}


//#define r64_01(x) rotl64((x),  5)
//#define r64_02(x) rotl64((x), 11)
//#define r64_03(x) rotl64((x), 27)
//#define r64_04(x) rotl64((x), 32)
//#define r64_05(x) rotl64((x), 37)
//#define r64_06(x) rotl64((x), 43)
//#define r64_07(x) rotl64((x), 53)
static __inline __m128i r64_01sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-5);
	__m128i sl = _mm_slli_epi64(x128, 5);
	return _mm_or_si128(sr, sl); //rotl64((x),  5)
}

static __inline __m128i r64_02sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-11);
	__m128i sl = _mm_slli_epi64(x128, 11);
	return _mm_or_si128(sr, sl); //rotl64((x),  5)
}

static __inline __m128i r64_03sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-27);
	__m128i sl = _mm_slli_epi64(x128, 27);
	return _mm_or_si128(sr, sl); //rotl64((x),  5)
}

static __inline __m128i r64_04sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-32);
	__m128i sl = _mm_slli_epi64(x128, 32);
	return _mm_or_si128(sr, sl); //rotl64((x),  5)
}

static __inline __m128i r64_05sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-37);
	__m128i sl = _mm_slli_epi64(x128, 37);
	return _mm_or_si128(sr, sl); //rotl64((x),  5)
}

static __inline __m128i r64_06sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-43);
	__m128i sl = _mm_slli_epi64(x128, 43);
	return _mm_or_si128(sr, sl); //rotl64((x),  5)
}

static __inline __m128i r64_07sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-53);
	__m128i sl = _mm_slli_epi64(x128, 53);
	return _mm_or_si128(sr, sl); //rotl64((x),  5)
}

// Roll 1 
static __inline __m128i roll64_1sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-1);
	__m128i sl = _mm_slli_epi64(x128, 1);
	return _mm_or_si128(sr, sl); //rotl64((x),  1)
}

// Roll 3 
static __inline __m128i roll64_3sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-3);
	__m128i sl = _mm_slli_epi64(x128, 3);
	return _mm_or_si128(sr, sl); //rotl64((x),  3)
}

// Roll 5 
static __inline __m128i roll64_5sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-5);
	__m128i sl = _mm_slli_epi64(x128, 5);
	return _mm_or_si128(sr, sl); //rotl64((x),  5)
}

// Roll 7 
static __inline __m128i roll64_7sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-7);
	__m128i sl = _mm_slli_epi64(x128, 7);
	return _mm_or_si128(sr, sl); //rotl64((x),  7)
}

// Roll 9 
static __inline __m128i roll64_9sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-9);
	__m128i sl = _mm_slli_epi64(x128, 9);
	return _mm_or_si128(sr, sl); //rotl64((x),  9)
}

// Roll 11 
static __inline __m128i roll64_11sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-11);
	__m128i sl = _mm_slli_epi64(x128, 11);
	return _mm_or_si128(sr, sl); //rotl64((x),  11)
}

// Roll 13 
static __inline __m128i roll64_13sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-13);
	__m128i sl = _mm_slli_epi64(x128, 13);
	return _mm_or_si128(sr, sl); //rotl64((x),  13)
}

// Roll 15 
static __inline __m128i roll64_15sse( __m128i x128)
{
	__m128i sr = _mm_srli_epi64(x128, 64-15);
	__m128i sl = _mm_slli_epi64(x128, 15);
	return _mm_or_si128(sr, sl); //rotl64((x),  15)
}


static DataLength Compress512(u_int64_t *data64, hashState *state, DataLength databitlen)
{	
	#if defined ( _MSC_VER )
	u_int64_t __declspec(align(16))       p_xor_d[16];
	u_int64_t __declspec(align(16))       p512[16];
	u_int64_t __declspec(align(16))       exp[32];
	u_int64_t __declspec(align(16))       td64[16]; 
	//const u_int64_t __declspec(align(16)) consts[16] = {
	//	0x5555555555555550ull,0x5aaaaaaaaaaaaaa5ull,0x5ffffffffffffffaull,0x655555555555554full,
	//	0x6aaaaaaaaaaaaaa4ull,0x6ffffffffffffff9ull,0x755555555555554eull,0x7aaaaaaaaaaaaaa3ull,
	//	0x7ffffffffffffff8ull,0x855555555555554dull,0x8aaaaaaaaaaaaaa2ull,0x8ffffffffffffff7ull,
	//	0x955555555555554cull,0x9aaaaaaaaaaaaaa1ull,0x9ffffffffffffff6ull,0xa55555555555554bull
	//	};
	#else
	u_int64_t __attribute__ ((aligned (16)))       p_xor_d[16];
	u_int64_t __attribute__ ((aligned (16)))       p512[16];
	u_int64_t __attribute__ ((aligned (16)))       exp[32];
	u_int64_t __attribute__ ((aligned (16)))       td64[16]; 
	//const u_int64_t __attribute__ ((aligned (16))) consts[16] = {
	//	0x5555555555555550ull,0x5aaaaaaaaaaaaaa5ull,0x5ffffffffffffffaull,0x655555555555554full,
	//	0x6aaaaaaaaaaaaaa4ull,0x6ffffffffffffff9ull,0x755555555555554eull,0x7aaaaaaaaaaaaaa3ull,
	//	0x7ffffffffffffff8ull,0x855555555555554dull,0x8aaaaaaaaaaaaaa2ull,0x8ffffffffffffff7ull,
	//	0x955555555555554cull,0x9aaaaaaaaaaaaaa1ull,0x9ffffffffffffff6ull,0xa55555555555554bull
	//	};
	#endif
	
	//__m128i p512_0001, p512_0203, p512_0405, p512_0607, p512_0809, p512_1011, p512_1213, p512_1415;
	_mm_store_si128(&p512[00], _mm_load_si128(&hashState512(state)->DoublePipe[0]));
	_mm_store_si128(&p512[02], _mm_load_si128(&hashState512(state)->DoublePipe[2]));
	_mm_store_si128(&p512[04], _mm_load_si128(&hashState512(state)->DoublePipe[4]));
	_mm_store_si128(&p512[06], _mm_load_si128(&hashState512(state)->DoublePipe[6]));
	_mm_store_si128(&p512[ 8], _mm_load_si128(&hashState512(state)->DoublePipe[8]));
	_mm_store_si128(&p512[10], _mm_load_si128(&hashState512(state)->DoublePipe[10]));
	_mm_store_si128(&p512[12], _mm_load_si128(&hashState512(state)->DoublePipe[12]));
	_mm_store_si128(&p512[14], _mm_load_si128(&hashState512(state)->DoublePipe[14]));
	
	
	u_int64_t iterations = databitlen / (BlueMidnightWish512_BLOCK_SIZE * 8);
	u_int64_t *data64_end = data64 + iterations*16;
	
	while (data64 < data64_end)
	{
		__m128i p512_0001 = _mm_load_si128(&p512[00]);
		__m128i data64_0001 = _mm_load_si128(&data64[00]); // Assume 16 byte aligned
		_mm_store_si128(&p_xor_d[ 0], _mm_xor_si128(p512_0001, data64_0001));
		
		__m128i roll1 = roll64_1sse(data64_0001);
		_mm_storel_epi64(&td64[ 0], roll1);
		
		
		__m128i p512_0203 = _mm_load_si128(&p512[02]);
		__m128i data64_0203 = _mm_load_si128(&data64[02]);
		_mm_store_si128(&p_xor_d[ 2], _mm_xor_si128(p512_0203, data64_0203));
		
		__m128i roll3 = roll64_3sse(data64_0203);
		_mm_storel_epi64(&td64[ 2], roll3);
		
		__m128i roll24 = roll64_1sse(_mm_unpackhi_epi64(roll1, roll3));
		_mm_storel_epi64(&td64[ 1], roll24);
		_mm_storel_epi64(&td64[ 3], _mm_unpackhi_epi64(roll24, roll24));
		
		
		__m128i p512_0405 = _mm_load_si128(&p512[04]);
		__m128i data64_0405 = _mm_load_si128(&data64[04]);
		_mm_store_si128(&p_xor_d[ 4], _mm_xor_si128(p512_0405, data64_0405));
		
		__m128i roll5 = roll64_5sse(data64_0405);
		_mm_storel_epi64(&td64[ 4], roll5);
		
		__m128i p512_0607 = _mm_load_si128(&p512[06]);
		__m128i data64_0607 = _mm_load_si128(&data64[06]);
		_mm_store_si128(&p_xor_d[ 6], _mm_xor_si128(p512_0607, data64_0607));
		
		__m128i roll7 = roll64_7sse(data64_0607);
		_mm_storel_epi64(&td64[ 6], roll7);
		
		__m128i roll68 = roll64_1sse(_mm_unpackhi_epi64(roll5, roll7));
		_mm_storel_epi64(&td64[ 5], roll68);
		_mm_storel_epi64(&td64[ 7], _mm_unpackhi_epi64(roll68, roll68));
		
		
		__m128i p512_0809 = _mm_load_si128(&p512[8]);
		__m128i data64_0809 = _mm_load_si128(&data64[8]);
		_mm_store_si128(&p_xor_d[ 8], _mm_xor_si128(p512_0809, data64_0809));
		
		__m128i roll9 = roll64_9sse(data64_0809);
		_mm_storel_epi64(&td64[ 8], roll9);
		
		__m128i p512_1011 = _mm_load_si128(&p512[10]);
		__m128i data64_1011 = _mm_load_si128(&data64[10]);
		_mm_store_si128(&p_xor_d[10], _mm_xor_si128(p512_1011, data64_1011));
		
		__m128i roll11 = roll64_11sse(data64_1011);
		_mm_storel_epi64(&td64[ 10], roll11);
		
		__m128i roll1012 = roll64_1sse(_mm_unpackhi_epi64(roll9, roll11));
		_mm_storel_epi64(&td64[ 9], roll1012);
		_mm_storel_epi64(&td64[ 11], _mm_unpackhi_epi64(roll1012, roll1012));
		
		
		__m128i p512_1213 = _mm_load_si128(&p512[12]);
		__m128i data64_1213 = _mm_load_si128(&data64[12]);
		_mm_store_si128(&p_xor_d[12], _mm_xor_si128(p512_1213, data64_1213));
		
		__m128i roll13 = roll64_13sse(data64_1213);
		_mm_storel_epi64(&td64[ 12], roll13);
		
		__m128i p512_1415 = _mm_load_si128(&p512[14]);
		__m128i data64_1415 = _mm_load_si128(&data64[14]);
		_mm_store_si128(&p_xor_d[14], _mm_xor_si128(p512_1415, data64_1415));
		
		__m128i roll15 = roll64_15sse(data64_1415);
		_mm_storel_epi64(&td64[ 14], roll15);
		
		__m128i roll1416 = roll64_1sse(_mm_unpackhi_epi64(roll13, roll15));
		_mm_storel_epi64(&td64[ 13], roll1416);
		_mm_storel_epi64(&td64[ 15], _mm_unpackhi_epi64(roll1416, roll1416));
		
		

		//p_xor_d_05=p512[05]^data64[ 5];	td64[05]=rotl64(data64[ 5], 6);
		//p_xor_d_07=p512[07]^data64[ 7];	td64[07]=rotl64(data64[ 7], 8);
		//p_xor_d_10=p512[10]^data64[ 10];	td64[10]=rotl64(data64[ 10], 11);
		//p_xor_d_13=p512[13]^data64[ 13];	td64[13]=rotl64(data64[ 13], 14);
		//p_xor_d_14=p512[14]^data64[ 14];	td64[14]=rotl64(data64[ 14], 15);
		//exp_00 = (p_xor_d[5]  - p_xor_d[7]  + p_xor_d[10]  + p_xor_d[13]  + p_xor_d[14] );
		__m128i exp00 = _mm_loadl_epi64(&p_xor_d[5]);
		exp00 = _mm_sub_epi64(exp00, _mm_loadl_epi64(&p_xor_d[07]));
		exp00 = _mm_add_epi64(exp00, _mm_loadl_epi64(&p_xor_d[10]));
		exp00 = _mm_add_epi64(exp00, _mm_loadl_epi64(&p_xor_d[13]));
		exp00 = _mm_add_epi64(exp00, _mm_loadl_epi64(&p_xor_d[14]));
		
		
		//exp[00] = s64_0(exp_00) + p512_01;
		//p_xor_d_00=p512[00]^data64[ 0];	td64[00]=rotl64(data64[ 0], 1);
		//p_xor_d_08=p512[8]^data64[ 8];	td64[8]=rotl64(data64[ 8], 9);
		//p_xor_d_01=p512[01]^data64[ 1];	td64[01]=rotl64(data64[ 1], 2);
		//t512_37 = (p_xor_d[8] - p_xor_d[01]);
		__m128i t512__37 = _mm_loadl_epi64(&p_xor_d[8]);
		t512__37 = _mm_sub_epi64(t512__37, _mm_loadl_epi64(&p_xor_d[01]));
		//_mm_storel_epi64(&t512_37, t512__37);
		
		//t512_35 = (p_xor_d[01] - p_xor_d[14]);
		__m128i t512__35 = _mm_loadl_epi64(&p_xor_d[1]);
		t512__35 = _mm_sub_epi64(t512__35, _mm_loadl_epi64(&p_xor_d[14]));
		//_mm_storel_epi64(&t512_35, t512__35);
		
		//exp_03 = (p_xor_d[00]  + p_xor_d[13]  + t512_37  - p_xor_d[10] );
		__m128i exp03 = _mm_loadl_epi64(&p_xor_d[0]);
		exp03 = _mm_add_epi64(exp03, _mm_loadl_epi64(&p_xor_d[13]));
		exp03 = _mm_add_epi64(exp03, t512__37);
		exp03 = _mm_sub_epi64(exp03, _mm_loadl_epi64(&p_xor_d[10]));
		//_mm_storel_epi64(&exp_03, exp03);
		
		
		
		//exp[03] = s64_3(exp_03) + p512[04];
		// Perform on only a single part.
		//__m128i exp03 = _mm_loadl_epi64(&exp_03);
		exp03 = _mm_add_epi64(s64_3sse(exp03), _mm_loadl_epi64(&p512[04]));
		_mm_storel_epi64(&exp[03], exp03);
		
		//p_xor_d_15=p512[15]^data64[ 15];	td64[15]=rotl64(data64[ 15], 16);
		//p_xor_d_04=p512[04]^data64[ 4];	td64[04]=rotl64(data64[ 4], 5);
		//exp_10 = (p_xor_d[15]  + t512_37  - p_xor_d[04]  - p_xor_d[07] );
		__m128i exp10 = _mm_loadl_epi64(&p_xor_d[15]);
		exp10 = _mm_add_epi64(exp10, t512__37);
		exp10 = _mm_sub_epi64(exp10, _mm_loadl_epi64(&p_xor_d[04]));
		exp10 = _mm_sub_epi64(exp10, _mm_loadl_epi64(&p_xor_d[07]));
		//_mm_storel_epi64(&exp_10, exp10);
		
		
		//exp[00] = s64_0(exp_00) + p512[01];
		//exp[10] = s64_0(exp_10) + p512[11];
		__m128i exp0010 = _mm_unpacklo_epi64(exp00, exp10);
		exp0010 = _mm_add_epi64(s64_0sse(exp0010), _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[01]),_mm_loadl_epi64(&p512[11])));
		_mm_storel_epi64(&exp[00], exp0010);
		_mm_storel_epi64(&exp[10], _mm_unpackhi_epi64(exp0010, exp0010));
		//_mm_storeh_pd(&exp[10], (__m128d) exp0010);
		
		//p_xor_d_02=p512[02]^data64[ 2];	td64[02]=rotl64(data64[ 2], 3);
		//p_xor_d_11=p512[11]^data64[ 11];	td64[11]=rotl64(data64[ 11], 12);
		//exp_13 = (p_xor_d[02]  + p_xor_d[04]  + p_xor_d[07]  + p_xor_d[10]  + p_xor_d[11] );
		__m128i exp13 = _mm_loadl_epi64(&p_xor_d[2]);
		exp13 = _mm_add_epi64(exp13, _mm_loadl_epi64(&p_xor_d[04]));
		exp13 = _mm_add_epi64(exp13, _mm_loadl_epi64(&p_xor_d[07]));
		exp13 = _mm_add_epi64(exp13, _mm_loadl_epi64(&p_xor_d[10]));
		exp13 = _mm_add_epi64(exp13, _mm_loadl_epi64(&p_xor_d[11]));
		//_mm_storel_epi64(&exp_13, exp13);
		
		
	   	 //exp[13] = s64_3(exp_13) + p512[14];
		//p_xor_d_09=p512[9]^data64[ 9];	td64[9]=rotl64(data64[ 9], 10);
		//p_xor_d_12=p512[12]^data64[ 12];	td64[12]=rotl64(data64[ 12], 13);
		//t512_32 = (p_xor_d[15] - p_xor_d[12]);
		__m128i t512__32 = _mm_loadl_epi64(&p_xor_d[15]);
		t512__32 = _mm_sub_epi64(t512__32, _mm_loadl_epi64(&p_xor_d[12]));
		//_mm_storel_epi64(&t512_32, t512__32);
		
		//exp_02 = (p_xor_d[00]  + p_xor_d[07]  + p_xor_d[9]  + t512_32 );
		__m128i exp02 = _mm_loadl_epi64(&p_xor_d[00]);
		exp02 = _mm_add_epi64(exp02, _mm_loadl_epi64(&p_xor_d[07]));
		exp02 = _mm_add_epi64(exp02, _mm_loadl_epi64(&p_xor_d[9]));
		exp02 = _mm_add_epi64(exp02, t512__32);
		//_mm_storel_epi64(&exp_02, exp02);
		
		
		//exp[02] = s64_2(exp_02) + p512[03];
		// Perform on only a single part.
		//exp02 = _mm_loadl_epi64(&exp_02);
		exp02 = _mm_add_epi64(s64_2sse(exp02), _mm_loadl_epi64(&p512[03]));
		_mm_storel_epi64(&exp[02], exp02);
		
		
		
		//t512_35 = (p_xor_d_01 - p_xor_d_14);
		//exp_04 = (p_xor_d[2]  + p_xor_d[9]  + t512_35  - p_xor_d[11] );
		__m128i exp04 = _mm_loadl_epi64(&p_xor_d[02]);
		exp04 = _mm_add_epi64(exp04, _mm_loadl_epi64(&p_xor_d[9]));
		exp04 = _mm_sub_epi64(exp04, _mm_loadl_epi64(&p_xor_d[11]));
		exp04 = _mm_add_epi64(exp04, t512__35);
		//_mm_storel_epi64(&exp_02, exp02);
		
		//exp[04] = s64_4(exp_04) + p512[05];
		// Perform on only a single part.
		//__m128i exp04 = _mm_loadl_epi64(&exp_04);
		exp04 = _mm_add_epi64(s64_4sse(exp04), _mm_loadl_epi64(&p512[05]));
		_mm_storel_epi64(&exp[04], exp04);
		
		
		//t512_31 = (p_xor_d[8] - p_xor_d[05]);
		__m128i t512__31 = _mm_loadl_epi64(&p_xor_d[8]);
		t512__31 = _mm_sub_epi64(t512__31, _mm_loadl_epi64(&p_xor_d[05]));
		//_mm_storel_epi64(&t512_31, t512__31);
		
		
		
		//exp_11 = (p_xor_d[9]  + t512_31  - p_xor_d[00]  - p_xor_d[02] );
		__m128i exp11 = _mm_loadl_epi64(&p_xor_d[9]);
		exp11 = _mm_sub_epi64(exp11, _mm_loadl_epi64(&p_xor_d[00]));
		exp11 = _mm_sub_epi64(exp11, _mm_loadl_epi64(&p_xor_d[02]));
		exp11 = _mm_add_epi64(exp11, t512__31);
		//_mm_storel_epi64(&exp_11, exp11);
		
		//exp[11] = s64_1(exp_11) + p512[12];
		// Perform on only a single part.
		//__m128i exp11 = _mm_loadl_epi64(&exp_11);
		exp11 = _mm_add_epi64(s64_1sse(exp11), _mm_loadl_epi64(&p512[12]));
		_mm_storel_epi64(&exp[11], exp11);
		
		
		//p_xor_d_03=p512[03]^data64[ 3];	td64[03]=rotl64(data64[ 3], 4);
		//t512_33 = (p_xor_d[03] + p_xor_d[10]);
		__m128i t512__33 = _mm_loadl_epi64(&p_xor_d[03]);
		t512__33 = _mm_add_epi64(t512__33, _mm_loadl_epi64(&p_xor_d[10]));
		//_mm_storel_epi64(&t512_33, t512__33);
		
		
		
		//exp_05 = (t512_32  + t512_33  - p_xor_d[02] );
		__m128i exp05 = _mm_loadl_epi64(&p_xor_d[02]);
		exp05 = _mm_sub_epi64(t512__32, exp05);
		exp05 = _mm_add_epi64(exp05, t512__33);
		//_mm_storel_epi64(&exp_05, exp05);
		
		
	  	  //exp[05] = s64_0(exp_05) + p512[06];
		//p_xor_d_06=p512[06]^data64[ 6];	td64[06]=rotl64(data64[ 6], 7);
		//exp_12 = (p_xor_d[01]  + t512_33  - p_xor_d[06]  - p_xor_d[9] );
		__m128i exp12 = _mm_loadl_epi64(&p_xor_d[01]);
		exp12 = _mm_sub_epi64(exp12, _mm_loadl_epi64(&p_xor_d[06]));
		exp12 = _mm_sub_epi64(exp12, _mm_loadl_epi64(&p_xor_d[9]));
		exp12 = _mm_add_epi64(exp12, t512__33);
		//_mm_storel_epi64(&exp_12, exp12);
		
		
		    //exp[12] = s64_2(exp_12) + p512[13];
		//t512_34 = (p_xor_d[13] - p_xor_d[06]);
		__m128i t512__34 = _mm_loadl_epi64(&p_xor_d[13]);
		t512__34 = _mm_sub_epi64(t512__34, _mm_loadl_epi64(&p_xor_d[06]));
		//_mm_storel_epi64(&t512_34, t512__34);
		
		//exp_08 = (p_xor_d[02]  + t512_34  - p_xor_d[05]  - p_xor_d[15] );
		__m128i exp08 = _mm_loadl_epi64(&p_xor_d[02]);
		exp08 = _mm_sub_epi64(exp08, _mm_loadl_epi64(&p_xor_d[05]));
		exp08 = _mm_sub_epi64(exp08, _mm_loadl_epi64(&p_xor_d[15]));
		exp08 = _mm_add_epi64(exp08, t512__34);
		//_mm_storel_epi64(&exp_08, exp08);
		
		
		//exp[8] = s64_3(exp_08) + p512[9];
		//exp[13] = s64_3(exp_13) + p512[14];
		__m128i exp0813 = _mm_unpacklo_epi64(exp08, exp13);
		exp0813 = _mm_add_epi64(s64_3sse(exp0813), _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[9]),_mm_loadl_epi64(&p512[14])));
		_mm_storel_epi64(&exp[8], exp0813);
		_mm_storel_epi64(&exp[13], _mm_unpackhi_epi64(exp0813, exp0813));
		//_mm_storeh_pd(&exp[13], (__m128d) exp0813);
		
		//exp_15 = (p_xor_d[12]  + t512_34  - p_xor_d[04]  - p_xor_d[9] );
		__m128i exp15 = _mm_loadl_epi64(&p_xor_d[12]);
		exp15 = _mm_sub_epi64(exp15, _mm_loadl_epi64(&p_xor_d[04]));
		exp15 = _mm_sub_epi64(exp15, _mm_loadl_epi64(&p_xor_d[9]));
		exp15 = _mm_add_epi64(exp15, t512__34);
		//_mm_storel_epi64(&exp_15, exp15);
		
		
		//exp[05] = s64_0(exp_05) + p512[06];
		//exp[15]= s64_0(exp_15) + p512[00];
		__m128i exp0515 = _mm_unpacklo_epi64(exp05, exp15);
		exp0515 = _mm_add_epi64(s64_0sse(exp0515), _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[06]),_mm_loadl_epi64(&p512[00])));
		_mm_storel_epi64(&exp[05], exp0515);
		_mm_storel_epi64(&exp[15], _mm_unpackhi_epi64(exp0515, exp0515));
		//_mm_storeh_pd(&exp[15], (__m128d) exp0515);
		
		//exp_07 = (t512_35  - p_xor_d[04]  - p_xor_d[05]  - p_xor_d[12] );
		__m128i exp07 = t512__35;
		exp07 = _mm_sub_epi64(exp07, _mm_loadl_epi64(&p_xor_d[04]));
		exp07 = _mm_sub_epi64(exp07, _mm_loadl_epi64(&p_xor_d[05]));
		exp07 = _mm_sub_epi64(exp07, _mm_loadl_epi64(&p_xor_d[12]));
		//_mm_storel_epi64(&exp_07, exp07);
		
		
		//exp[07] = s64_2(exp_07) + p512[8];
		//exp[12] = s64_2(exp_12) + p512[13];
		__m128i exp0712 = _mm_unpacklo_epi64(exp07, exp12);
		exp0712 = _mm_add_epi64(s64_2sse(exp0712), _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[8]),_mm_loadl_epi64(&p512[13])));
		_mm_storel_epi64(&exp[07], exp0712);
		_mm_storel_epi64(&exp[12], _mm_unpackhi_epi64(exp0712, exp0712));
		
		//exp_14 = (p_xor_d[03]  + t512_31  - p_xor_d[11]  - p_xor_d[12] );
		__m128i exp14 = _mm_loadl_epi64(&p_xor_d[03]);
		exp14 = _mm_sub_epi64(exp14, _mm_loadl_epi64(&p_xor_d[11]));
		exp14 = _mm_sub_epi64(exp14, _mm_loadl_epi64(&p_xor_d[12]));
		exp14 = _mm_add_epi64(exp14, t512__31);
		//_mm_storel_epi64(&exp_14, exp14);
		
		
		    //exp[14] = s64_4(exp_14) + p512[15];
		//exp_06 = (p_xor_d[13]  - p_xor_d[03]  + p_xor_d[04]  - p_xor_d[11]  - p_xor_d[00] );
		__m128i exp06 = _mm_loadl_epi64(&p_xor_d[13]);
		exp06 = _mm_sub_epi64(exp06, _mm_loadl_epi64(&p_xor_d[03]));
		exp06 = _mm_add_epi64(exp06, _mm_loadl_epi64(&p_xor_d[04]));
		exp06 = _mm_sub_epi64(exp06, _mm_loadl_epi64(&p_xor_d[11]));
		exp06 = _mm_sub_epi64(exp06, _mm_loadl_epi64(&p_xor_d[00]));
		//_mm_storel_epi64(&exp_06, exp06);
		
	  	  //exp[06] = s64_1(exp_06) + p512[07];
		//t512_36 = (p_xor_d[06] + p_xor_d[14]);
		__m128i t512__36 = _mm_loadl_epi64(&p_xor_d[14]);
		t512__36 = _mm_add_epi64(t512__36, _mm_loadl_epi64(&p_xor_d[06]));
		//_mm_storel_epi64(&t512_36, t512__36);
		
		
		//exp_01 = (p_xor_d[11]  + t512_36  - p_xor_d[8]  - p_xor_d[15] );
		__m128i exp01 = _mm_loadl_epi64(&p_xor_d[11]);
		exp01 = _mm_sub_epi64(exp01, _mm_loadl_epi64(&p_xor_d[8]));
		exp01 = _mm_sub_epi64(exp01, _mm_loadl_epi64(&p_xor_d[15]));
		exp01 = _mm_add_epi64(exp01, t512__36);
		//_mm_storel_epi64(&exp_01, exp01);
		
		//exp[01] = s64_1(exp_01) + p512[02];
		//exp[06] = s64_1(exp_06) + p512[07];
		__m128i exp0106 = _mm_unpacklo_epi64(exp01, exp06);
		exp0106 = _mm_add_epi64(s64_1sse(exp0106), _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[02]),_mm_loadl_epi64(&p512[07])));
		_mm_storel_epi64(&exp[01], exp0106);
		_mm_storel_epi64(&exp[06], _mm_unpackhi_epi64(exp0106, exp0106));
		//_mm_storeh_pd(&exp[06], (__m128d) exp0106);
		
		//exp_09 = (p_xor_d[00]  + t512_36  - p_xor_d[03]  - p_xor_d[07] );
		__m128i exp09 = _mm_loadl_epi64(&p_xor_d[00]);
		exp09 = _mm_sub_epi64(exp09, _mm_loadl_epi64(&p_xor_d[03]));
		exp09 = _mm_sub_epi64(exp09, _mm_loadl_epi64(&p_xor_d[07]));
		exp09 = _mm_add_epi64(exp09, t512__36);
		//_mm_storel_epi64(&exp_09, exp09);
		
		//exp[9] = s64_4(exp_09) + p512[10];
		//exp[14] = s64_4(exp_14) + p512[15];
		__m128i exp0914 = _mm_unpacklo_epi64(exp09, exp14);
		exp0914 = _mm_add_epi64(s64_4sse(exp0914), _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[10]),_mm_loadl_epi64(&p512[15])));
		_mm_storel_epi64(&exp[9], exp0914);
		_mm_storel_epi64(&exp[14], _mm_unpackhi_epi64(exp0914, exp0914));
		//_mm_storeh_pd(&exp[14], (__m128d) exp0914);


		// first parts of Message expansion
		__m128i exp_0001 = _mm_load_si128(&exp[00]);//_mm_set_epi64((__m64) exp_01, (__m64) exp_00);
		__m128i exp1617 = s64_1sse(exp_0001);
		//exp_16  = s64_1(exp_00);

		//exp_17  = s64_1(exp_01);
		
		__m128i exp_0203 = _mm_load_si128(&exp[02]);//_mm_set_epi64((__m64) exp_03, (__m64) exp_02);
		exp1617 = _mm_add_epi64( s64_3sse(exp_0203) ,exp1617);
		//exp_16 += s64_3(exp_02);
		//exp_17 += s64_3(exp_03);
		
		__m128i exp_0102 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_0001, exp_0001), exp_0203);//_mm_set_epi64((__m64) exp_02, (__m64) exp_01); // change to reg-reg move ???
		//exp_16 += s64_2(exp_01);
		//exp_17 += s64_2(exp_02);
		exp1617 = _mm_add_epi64( s64_2sse(exp_0102) ,exp1617);
		
		__m128i exp_0405 = _mm_load_si128(&exp[04]);//_mm_set_epi64((__m64) exp_05, (__m64) exp_04);
		__m128i evenodd = _mm_add_epi64(exp_0203, exp_0405);
		//exp_16 += s64_1(exp_04);
		//exp_17 += s64_1(exp_05);
		exp1617 = _mm_add_epi64( s64_1sse(exp_0405) ,exp1617);
		
		__m128i exp0304 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_0203, exp_0203), exp_0405);//_mm_set_epi64((__m64) exp_04, (__m64) exp_03);
		//exp_16 += s64_0(exp_03);
		//exp_17 += s64_0(exp_04);
		exp1617 = _mm_add_epi64( s64_0sse(exp0304) ,exp1617);
		
		__m128i exp_0607 = _mm_load_si128(&exp[06]);//_mm_set_epi64((__m64) exp_07, (__m64) exp_06);
		evenodd = _mm_add_epi64(evenodd, exp_0607);
		//exp_16 += s64_3(exp_06);
		//exp_17 += s64_3(exp_07);
		exp1617 = _mm_add_epi64( s64_3sse(exp_0607) ,exp1617);
		
		__m128i exp_0506 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_0405, exp_0405), exp_0607);//_mm_set_epi64((__m64) exp_06, (__m64) exp_05);
		//exp_16 += s64_2(exp_05)
		//exp_17 += s64_2(exp_06);
		exp1617 = _mm_add_epi64( s64_2sse(exp_0506) ,exp1617);
		
		__m128i exp_0809 = _mm_load_si128(&exp[8]);//_mm_set_epi64((__m64) exp_09, (__m64) exp_08);
		evenodd = _mm_add_epi64(evenodd, exp_0809);
		//exp_16 += s64_1(exp_08);
		//exp_17 += s64_1(exp_09);
		exp1617 = _mm_add_epi64( s64_1sse(exp_0809) ,exp1617);
		
		__m128i exp_0708 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_0607, exp_0607), exp_0809);//_mm_set_epi64((__m64) exp_08, (__m64) exp_07);
		//exp_16 += s64_0(exp_07);
		//exp_17 += s64_0(exp_08);
		exp1617 = _mm_add_epi64( s64_0sse(exp_0708) ,exp1617);
		
		__m128i exp_1011 = _mm_load_si128(&exp[10]);//_mm_set_epi64((__m64) exp_11, (__m64) exp_10);
		evenodd = _mm_add_epi64(evenodd, exp_1011);
		//exp_16 += s64_3(exp_10);
		//exp_17 += s64_3(exp_11);
		exp1617 = _mm_add_epi64( s64_3sse(exp_1011) ,exp1617);
		
		__m128i exp_0910 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_0809, exp_0809), exp_1011);//_mm_set_epi64((__m64) exp_10, (__m64) exp_09);
		//exp_16 += s64_2(exp_09);
		//exp_17 += s64_2(exp_10);
		exp1617 = _mm_add_epi64( s64_2sse(exp_0910) ,exp1617);

		__m128i exp_1213 = _mm_load_si128(&exp[12]);//_mm_set_epi64((__m64) exp_13, (__m64) exp_12);
		evenodd = _mm_add_epi64(evenodd, exp_1213);
		//exp_16 += s64_1(exp_12);
		//exp_17 += s64_1(exp_13);
		exp1617 = _mm_add_epi64( s64_1sse(exp_1213) ,exp1617);
		
		__m128i exp_1112 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_1011, exp_1011), exp_1213);//_mm_set_epi64((__m64) exp_12, (__m64) exp_11);
		//exp_16 += s64_0(exp_11);
		//exp_17 += s64_0(exp_12);
		exp1617 = _mm_add_epi64( s64_0sse(exp_1112) ,exp1617);
		
		__m128i exp_1415 = _mm_load_si128(&exp[14]);//_mm_set_epi64((__m64) exp_15, (__m64) exp_14);
		evenodd = _mm_add_epi64(evenodd, exp_1415);
		//exp_16 += s64_3(exp_14);
		//exp_17 += s64_3(exp_15);
		exp1617 = _mm_add_epi64( s64_3sse(exp_1415) ,exp1617);
		
		__m128i exp_1314 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_1213, exp_1213), exp_1415);//_mm_set_epi64((__m64) exp_14, (__m64) exp_13);
		//exp_16 += s64_2(exp_13);
		//exp_17 += s64_2(exp_14);
		exp1617 = _mm_add_epi64( s64_2sse(exp_1314) ,exp1617);
		

		__m128i td64_0001 = _mm_load_si128(&td64[0]);
		__m128i td64_1011 = _mm_load_si128(&td64[10]);
		__m128i tdtemp = _mm_sub_epi64(td64_0001, td64_1011);
		// unaligned is slow (ofc)
		__m128i td64_0304 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[03]),_mm_loadl_epi64(&td64[04]));
		tdtemp = _mm_add_epi64(tdtemp, td64_0304);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[0]));

		// _mm_shuffle_epi32
		__m128i p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[07]),_mm_loadl_epi64(&p512[8]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp1617 = _mm_add_epi64(tdtemp, exp1617);
		
		//exp_16 += ((td64_00 + td64_03 - td64_10 + 0x5555555555555550ull) ^ p512_07);
		//exp_17 += ((td64_01 + td64_04 - td64_11 + 0x5aaaaaaaaaaaaaa5ull) ^ p512_08);

		
		
		
		//exp_28 = r64_01(exp_13);
		//exp_28 += r64_02(exp_15);
		
		//exp_16 += s64_0(exp_15);
		//exp_17 += s64_0(exp_16);
		exp1617 = s64_0sse_acc(_mm_loadl_epi64(&exp[15]), exp1617);
		
		//struct pair temp;
		_mm_store_si128(&exp[16], exp1617);
		
		//----
		
		//         _mm_store_si128(&temp.x, exp1617);
		
		//temp.x[0] = exp_16;
		//temp.x[1] = exp_17;
		
		__m128i exp_1617 = exp1617;//_mm_load_si128(&exp[16]);
		
		__m128i exp1819 = evenodd;
		
		//exp_18 += s64_4( exp_16);
		//exp_19 += s64_4( exp_17);
		exp1819 = _mm_add_epi64(exp1819, s64_4sse(exp_1617));
		
		//exp_18 += r64_01(exp_03); // r64_01(exp_03) performs a shift left by 3 on exp_03 as well, as part of the rotate...
		//exp_19 += r64_01(exp_04);
		exp1819 = _mm_add_epi64(exp1819, r64_01sse(exp0304));
		
		//exp_18 += r64_02(exp_05);
		//exp_19 += r64_02(exp_06);
		exp1819 = _mm_add_epi64(exp1819, r64_02sse(exp_0506));
		
		//exp_18 += r64_03(exp_07);
		//exp_19 += r64_03(exp_08);
		exp1819 = _mm_add_epi64(exp1819, r64_03sse(exp_0708));
		
		//exp_18 += r64_04(exp_09);
		//exp_19 += r64_04(exp_10);
		exp1819 = _mm_add_epi64(exp1819, r64_04sse(exp_0910));
		
		//exp_18 += r64_05(exp_11); // s64_1(exp_13) and r64_06(exp_13) share one rotate, s64_0(exp_11) and r64_05(exp_11) share one rotate.
		//exp_19 += r64_05(exp_12); // s64_0(exp_12) and r64_05(exp_12) share one rotate. -ok
		exp1819 = _mm_add_epi64(exp1819, r64_05sse(exp_1112));
		
		//exp_18 += r64_06(exp_13);
		//exp_19 += r64_06(exp_14);
		exp1819 = _mm_add_epi64(exp1819, r64_06sse(exp_1314));
		
		//exp_18 += ((td64_02 + td64_05 - td64_12 + 0x5ffffffffffffffaull) ^ p512_09);
		//exp_19 += ((td64_03 + td64_06 - td64_13 + 0x655555555555554full) ^ p512_10);
		__m128i td64_0203 = _mm_load_si128(&td64[2]);
		__m128i td64_1213 = _mm_load_si128(&td64[12]);
		tdtemp = _mm_sub_epi64(td64_0203, td64_1213);
		__m128i td64_0506 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[05]),_mm_loadl_epi64(&td64[06]));
		tdtemp = _mm_add_epi64(tdtemp, td64_0506);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[2]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[9]),_mm_loadl_epi64(&p512[10]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp1819 = _mm_add_epi64(tdtemp, exp1819);
		
		__m128i exp_1516 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[15]),_mm_loadl_epi64(&exp[16]));
		//exp_18 += r64_07(exp_15);
		//exp_19 += r64_07(exp_16);
		exp1819 = _mm_add_epi64(exp1819, r64_07sse(exp_1516));
		
		//exp_18 += s64_5( exp_17);
		//exp_19 += s64_5( exp_18);
		exp1819 = s64_5sse_acc(_mm_loadl_epi64(&exp[17]), exp1819);
		
		//struct pair temp;
		_mm_store_si128(&exp[18], exp1819);
		__m128i exp_1819 = exp1819;
		//exp_18 = temp.x[0];
		//exp_19 = temp.x[1];

		//exp[18] = exp_18;
		//exp[19] = exp_19;
		
		//XL64 = exp_16 =  exp[16];
		//XL64 ^= exp_17 = exp[17];
		//XL64 ^= exp_18 = exp[18];
		//XL64 ^= exp_19 = exp[19];
		__m128i XL64sse = _mm_xor_si128(exp_1617, exp_1819);

		/* expand32_22(20); */
		/* expand32_21(21); */
		//__m128i exp_0506 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[05]),_mm_loadl_epi64(&exp[06]));
		
		//exp_20 = r64_01(exp_05);
		//exp_21 = r64_01(exp_06);
		__m128i exp2021 = r64_01sse(exp_0506);
		
		
		//__m128i exp_0708 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[07]),_mm_loadl_epi64(&exp[8]));
		//exp_20 += r64_02(exp_07);
		//exp_21 += r64_02(exp_08);
		exp2021 = _mm_add_epi64(exp2021, r64_02sse(exp_0708));
		
		//__m128i exp_0910 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[9]),_mm_loadl_epi64(&exp[10]));
		//exp_20 += r64_03(exp_09);
		//exp_21 += r64_03(exp_10);
		exp2021 = _mm_add_epi64(exp2021, r64_03sse(exp_0910));
		
		//__m128i exp_1112 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[11]),_mm_loadl_epi64(&exp[12]));
		//exp_20 += r64_04(exp_11);
		//exp_21 += r64_04(exp_12);
		exp2021 = _mm_add_epi64(exp2021, r64_04sse(exp_1112));
		
		//__m128i exp_1314 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[13]),_mm_loadl_epi64(&exp[14]));
		//exp_21 += r64_05(exp_14);
		//exp_20 += r64_05(exp_13);
		exp2021 = _mm_add_epi64(exp2021, r64_05sse(exp_1314));
		
		//exp_1516 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[15]),_mm_loadl_epi64(&exp[16]));
		//exp_20 += r64_06(exp_15);
		//exp_21 += r64_06(exp_16);
		exp2021 = _mm_add_epi64(exp2021, r64_06sse(exp_1516));
		
		__m128i exp_1718 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[17]),_mm_loadl_epi64(&exp[18]));
		//exp_20 += r64_07(exp_17);
		//exp_21 += r64_07(exp_18);
		exp2021 = _mm_add_epi64(exp2021, r64_07sse(exp_1718));
		

		//__m128i exp_1819 = _mm_load_si128(&exp[18]);
		//exp_20 += s64_4( exp_18);
		//exp_21 += s64_4( exp_19);
		exp2021 = _mm_add_epi64(exp2021, s64_4sse(exp_1819));
		
		
		//exp_20 += ((td64_04 + td64_07 - td64_14 + 0x6aaaaaaaaaaaaaa4ull) ^ p512_11);
		//exp_21 += ((td64_05 + td64_08 - td64_15 + 0x6ffffffffffffff9ull) ^ p512_12);
		__m128i td64_0405 = _mm_load_si128(&td64[4]);
		__m128i td64_1415 = _mm_load_si128(&td64[14]);
		tdtemp = _mm_sub_epi64(td64_0405, td64_1415);
		__m128i td64_0708 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[07]),_mm_loadl_epi64(&td64[8]));
		tdtemp = _mm_add_epi64(tdtemp, td64_0708);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[4]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[11]),_mm_loadl_epi64(&p512[12]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp2021 = _mm_add_epi64(tdtemp, exp2021);
		
		//TempEven64 = TempEven64 + exp_16 - exp_02; 
		//TempOdd64  = TempOdd64 + exp_17 - exp_03;
		evenodd = _mm_sub_epi64(evenodd, exp_0203);
		evenodd = _mm_add_epi64(evenodd, exp_1617);
		
		
		exp2021 = _mm_add_epi64(evenodd, exp2021);
		
		//---- 
		/* expand32_22(20); */
		//exp_20 += TempEven64;
		//exp_21 += TempOdd64;
		
		//exp_20 += s64_5( exp_19);
		//exp_21 += s64_5( exp_20);
		exp2021 = s64_5sse_acc(_mm_loadl_epi64(&exp[19]), exp2021);
		
		
		_mm_store_si128(&exp[20], exp2021);
		__m128i exp_2021 = exp2021;
		//exp_20 = temp.x[0];
		//exp_21 = temp.x[1];
		
		//XL64 ^= exp_20 = exp[20];
		//XL64 ^= exp_21 = exp[21];
		XL64sse = _mm_xor_si128(XL64sse, exp_2021);
		
		//exp[20] = exp_20;
		//exp[21] = exp_21;
		
		/* expand32_22(22); */
		/* expand32_21(23); */

		//exp_22 = r64_01(exp_07);
		//exp_23 = r64_01(exp_08);
		__m128i exp2223 = r64_01sse(exp_0708);
		
		//exp_22 += r64_02(exp_09);
		//exp_23 += r64_02(exp_10);
		exp2223 = _mm_add_epi64(exp2223, r64_02sse(exp_0910));
		
		//exp_22 += r64_03(exp_11);
		//exp_23 += r64_03(exp_12);
		exp2223 = _mm_add_epi64(exp2223, r64_03sse(exp_1112));
		
		//exp_22 += r64_04(exp_13);
		//exp_23 += r64_04(exp_14); // s64_0(exp_16) and r64_05(exp_16) share one rotate.
		exp2223 = _mm_add_epi64(exp2223, r64_04sse(exp_1314));
		
		//exp_22 += r64_05(exp_15); // s64_0(exp_15) and r64_05(exp_15) share one rotate. - ok
		//exp_23 += r64_05(exp_16);
		exp2223 = _mm_add_epi64(exp2223, r64_05sse(exp_1516));
		
		//exp_22 += r64_06(exp_17);
		//exp_23 += r64_06(exp_18);
		exp2223 = _mm_add_epi64(exp2223, r64_06sse(exp_1718));
		
		//exp_22 += ((td64_06 + td64_09 - td64_00 + 0x755555555555554eull) ^ p512_13);
		//exp_23 += ((td64_07 + td64_10 - td64_01 + 0x7aaaaaaaaaaaaaa3ull) ^ p512_14);
		__m128i td64_0607 = _mm_load_si128(&td64[6]);
		td64_0001 = _mm_load_si128(&td64[0]);
		tdtemp = _mm_sub_epi64(td64_0607, td64_0001);
		__m128i td64_0910 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[9]),_mm_loadl_epi64(&td64[10]));
		tdtemp = _mm_add_epi64(tdtemp, td64_0910);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[6]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[13]),_mm_loadl_epi64(&p512[14]));
		
		
		//TempEven64 = TempEven64 + exp_18 - exp_04;
		//TempOdd64  = TempOdd64 + exp_19 - exp_05;
		//__m128i exp_1819 = _mm_load_si128(&exp[18]);
		evenodd = _mm_sub_epi64(evenodd, exp_0405);
		evenodd = _mm_add_epi64(evenodd, exp_1819);
		
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp2223 = _mm_add_epi64(tdtemp, exp2223);
		
		//exp_22 += TempEven64;
		//exp_23 += TempOdd64;
		exp2223 = _mm_add_epi64(evenodd, exp2223);
		
		__m128i exp_1920 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[19]),_mm_loadl_epi64(&exp[20]));
		//exp_22 += r64_07(exp_19);
		//exp_23 += r64_07(exp_20);
		exp2223 = _mm_add_epi64(exp2223, r64_07sse(exp_1920));
		
		//__m128i exp_2021 = _mm_load_si128(&exp[20]);
		//exp_22 += s64_4( exp_20);
		//exp_23 += s64_4( exp_21);
		exp2223 = _mm_add_epi64(exp2223, s64_4sse(exp_2021));
		
		//exp_22 += s64_5( exp_21);
		//exp_23 += s64_5( exp_22);
		exp2223 = s64_5sse_acc(_mm_loadl_epi64(&exp[21]), exp2223);
		
		_mm_store_si128(&exp[22], exp2223);
		__m128i exp_2223 = exp2223;
		//exp_22 = temp.x[0];
		//exp_23 = temp.x[1];
		
		
		//XL64 ^= exp_22 = exp[22];
		//XL64 ^= exp_23 = exp[23];
		XL64sse = _mm_xor_si128(XL64sse, exp_2223);
		
		//exp[22] = exp_22;
		//exp[23] = exp_23;
		
		/* expand32_22(24); */
		/* expand32_21(25); */
		
		//TempEven64 = TempEven64 + exp_20 - exp_06;
		//TempOdd64 = TempOdd64 + exp_21 - exp_07;
		evenodd = _mm_sub_epi64(evenodd, exp_0607);
		evenodd = _mm_add_epi64(evenodd, exp_2021);

		
		//exp_24 = r64_01(exp_09);
		//exp_25 = r64_01(exp_10);
		__m128i exp2425 = r64_01sse(exp_0910); 
		
		//exp_24 += TempEven64;
		//exp_25 += TempOdd64;
		exp2425 = _mm_add_epi64(evenodd, exp2425);
		
		
		//exp_24 += r64_02(exp_11);
		//exp_25 += r64_02(exp_12);
		exp2425 = _mm_add_epi64(exp2425, r64_02sse(exp_1112));
		
		//exp_24 += r64_03(exp_13);
		//exp_25 += r64_03(exp_14);
		exp2425 = _mm_add_epi64(exp2425, r64_03sse(exp_1314));
		
		//exp_24 += r64_04(exp_15);
		//exp_25 += r64_04(exp_16);
		exp2425 = _mm_add_epi64(exp2425, r64_04sse(exp_1516));
		
		//exp_24 += r64_05(exp_17);
		//exp_25 += r64_05(exp_18);
		exp2425 = _mm_add_epi64(exp2425, r64_05sse(exp_1718));
		
		//exp_24 += r64_06(exp_19);
		//exp_25 += r64_06(exp_20);
		exp2425 = _mm_add_epi64(exp2425, r64_06sse(exp_1920));
		
		__m128i exp_2122 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[21]),_mm_loadl_epi64(&exp[22]));
		//exp_24 += r64_07(exp_21);
		//exp_25 += r64_07(exp_22);
		exp2425 = _mm_add_epi64(exp2425, r64_07sse(exp_2122));
		
		//__m128i exp_2223 = _mm_load_si128(&exp[22]);
		//exp_24 += s64_4( exp_22);
		//exp_25 += s64_4( exp_23);
		exp2425 = _mm_add_epi64(exp2425, s64_4sse(exp_2223));
		
		//exp_24 += ((td64_08 + td64_11 - td64_02 + 0x7ffffffffffffff8ull) ^ p512_15);
		//exp_25 += ((td64_09 + td64_12 + 0x855555555555554dull - td64_03) ^ p512_00);
		__m128i td64_0809 = _mm_load_si128(&td64[8]);
		//td64_0001 = _mm_load_si128(&td64[0]);
		tdtemp = _mm_sub_epi64(td64_0809, td64_0203);
		__m128i td64_1112 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[11]),_mm_loadl_epi64(&td64[12]));
		tdtemp = _mm_add_epi64(tdtemp, td64_1112);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[8]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[15]),_mm_loadl_epi64(&p512[0]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp2425 = _mm_add_epi64(tdtemp, exp2425);
		
		//exp_24 += s64_5( exp_23);
		//exp_25 += s64_5( exp_24);
		exp2425 = s64_5sse_acc(_mm_loadl_epi64(&exp[23]), exp2425);
		
		_mm_store_si128(&exp[24], exp2425);
		__m128i exp_2425 = exp2425;
		//exp_24 = temp.x[0];
		//exp_25 = temp.x[1];
		
		XL64sse = _mm_xor_si128(XL64sse, _mm_unpackhi_epi64(XL64sse, XL64sse));
		XL64sse = _mm_move_epi64(XL64sse);
		
		//_mm_storel_epi64(&XL64, XL64sse);
		
		//XL64 = 
		
		//exp_24 = exp[24];
		//XH64  =  XL64^exp_24;
		//XH64 ^= exp_25 = exp[25];
		__m128i XH64sse = _mm_xor_si128(XL64sse, exp_2425);
		
		
		//exp[24] = exp_24;
		//exp[25] = exp_25;
		
		
		/* expand32_22(26); */
		/* expand32_21(27); */
		//TempEven64 = TempEven64 + exp_22 - exp_08;
		//TempOdd64 = TempOdd64 + exp_23 - exp_09;
		evenodd = _mm_sub_epi64(evenodd, exp_0809);
		evenodd = _mm_add_epi64(evenodd, exp_2223);
		
		//exp_26 = r64_01(exp_11);
		//exp_27 = r64_01(exp_12);
		__m128i exp2627 = r64_01sse(exp_1112); 
		
		//exp_26 += TempEven64;
		//exp_27 += TempOdd64;
		exp2627 = _mm_add_epi64(evenodd, exp2627);
		
		//exp_26 += r64_02(exp_13);
		//exp_27 += r64_02(exp_14);
		exp2627 = _mm_add_epi64(exp2627, r64_02sse(exp_1314));
		
		//exp_26 += r64_03(exp_15);
		//exp_27 += r64_03(exp_16);
		exp2627 = _mm_add_epi64(exp2627, r64_03sse(exp_1516));
		
		//exp_26 += r64_04(exp_17);
		//exp_27 += r64_04(exp_18);
		exp2627 = _mm_add_epi64(exp2627, r64_04sse(exp_1718));
		
		//exp_26 += r64_05(exp_19);
		//exp_27 += r64_05(exp_20);
		exp2627 = _mm_add_epi64(exp2627, r64_05sse(exp_1920));
		
		//exp_26 += r64_06(exp_21);
		//exp_27 += r64_06(exp_22);
		exp2627 = _mm_add_epi64(exp2627, r64_06sse(exp_2122));
		
		__m128i exp_2324 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[23]),_mm_loadl_epi64(&exp[24]));
		//exp_26 += r64_07(exp_23);
		//exp_27 += r64_07(exp_24);
		exp2627 = _mm_add_epi64(exp2627, r64_07sse(exp_2324));
		
		//__m128i exp_2425 = _mm_load_si128(&exp[24]);
		//exp_26 += s64_4( exp_24);
		//exp_27 += s64_4( exp_25);
		exp2627 = _mm_add_epi64(exp2627, s64_4sse(exp_2425));
		
		//exp_26 += ((td64_10 + td64_13 - td64_04 + 0x8aaaaaaaaaaaaaa2ull) ^ p512_01);
		//exp_27 += ((td64_11 + td64_14 - td64_05 + 0x8ffffffffffffff7ull) ^ p512_02);
		//td64_1011 = _mm_load_si128(&td64[10]);
		//td64_0405 = _mm_load_si128(&td64[4]);
		tdtemp = _mm_sub_epi64(td64_1011, td64_0405);
		__m128i td64_1314 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[13]),_mm_loadl_epi64(&td64[14]));
		tdtemp = _mm_add_epi64(tdtemp, td64_1314);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[10]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[1]),_mm_loadl_epi64(&p512[2]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp2627 = _mm_add_epi64(tdtemp, exp2627);

		//exp_26 += s64_5( exp_25);
		//exp_27 += s64_5( exp_26);
		exp2627 = s64_5sse_acc(_mm_loadl_epi64(&exp[25]), exp2627);
		
		_mm_store_si128(&exp[26], exp2627);
		__m128i exp_2627 = exp2627;
		//exp_26 = temp.x[0];
		//exp_27 = temp.x[1];
		
		//XH64 ^= exp_26 = exp[26];
		//XH64 ^= exp_27 = exp[27];
		XH64sse = _mm_xor_si128(XH64sse, exp_2627);

		//exp[26] = exp_26;
		//exp[27] = exp_27;
		
		/* expand32_22(28); */
		/* expand32_21(29); */
		
		//TempEven64 = TempEven64 + exp_24 - exp_10;
		//TempOdd64 = TempOdd64 + exp_25 - exp_11;
		evenodd = _mm_sub_epi64(evenodd, exp_1011);
		evenodd = _mm_add_epi64(evenodd, exp_2425);
		
		//exp_28 = r64_01(exp_13);
		//exp_29 = r64_01(exp_14);
		__m128i exp2829 = r64_01sse(exp_1314);
		
		//exp_28 += TempEven64;
		//exp_29 += TempOdd64;
		exp2829 = _mm_add_epi64(evenodd, exp2829);
		
		//exp_28 += r64_02(exp_15);
		//exp_29 += r64_02(exp_16);
		exp2829 = _mm_add_epi64(exp2829, r64_02sse(exp_1516));
		
		//exp_28 += r64_03(exp_17);
		//exp_29 += r64_03(exp_18);
		exp2829 = _mm_add_epi64(exp2829, r64_03sse(exp_1718));
		
		//exp_28 += r64_04(exp_19);
		//exp_29 += r64_04(exp_20);
		exp2829 = _mm_add_epi64(exp2829, r64_04sse(exp_1920));
		
		//exp_28 += r64_05(exp_21);
		//exp_29 += r64_05(exp_22);
		exp2829 = _mm_add_epi64(exp2829, r64_05sse(exp_2122));
		
		//exp_28 += r64_06(exp_23);
		//exp_29 += r64_06(exp_24);
		exp2829 = _mm_add_epi64(exp2829, r64_06sse(exp_2324));
		
		__m128i exp_2526 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[25]),_mm_loadl_epi64(&exp[26]));
		//exp_28 += r64_07(exp_25);
		//exp_29 += r64_07(exp_26);
		exp2829 = _mm_add_epi64(exp2829, r64_07sse(exp_2526));
		
		//__m128i exp_2627 = _mm_load_si128(&exp[26]);
		//exp_28 += s64_4( exp_26);
		//exp_29 += s64_4( exp_27);
		exp2829 = _mm_add_epi64(exp2829, s64_4sse(exp_2627));
		
		
		//exp_28 += ((td64_12 + td64_15 - td64_06 + 0x955555555555554cull) ^ p512_03);
		//exp_29 += ((td64_13 + td64_00 - td64_07 +  0x9aaaaaaaaaaaaaa1ull) ^ p512_04);
		tdtemp = _mm_sub_epi64(td64_1213, td64_0607);
		__m128i td64_1500 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[15]),_mm_loadl_epi64(&td64[00]));
		tdtemp = _mm_add_epi64(tdtemp, td64_1500);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[12]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[3]),_mm_loadl_epi64(&p512[4]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp2829 = _mm_add_epi64(tdtemp, exp2829);
		
		//exp_28 += s64_5( exp_27);
		//exp_29 += s64_5( exp_28);
		exp2829 = s64_5sse_acc(_mm_loadl_epi64(&exp[27]), exp2829);
		
		_mm_store_si128(&exp[28], exp2829);
		__m128i exp_2829 = exp2829;
		//exp_28 = temp.x[0];
		//exp_29 = temp.x[1];
		
		//XH64 ^= exp_28 = exp[28];
		//XH64 ^= exp_29 = exp[29];
		XH64sse = _mm_xor_si128(XH64sse, exp_2829);
		
		//exp[28] = exp_28;
		//exp[29] = exp_29;
		
		
		/* expand32_22(30); */
		/* expand32_21(31); */
		//TempEven64 = TempEven64 + exp_26 - exp_12;
		//TempOdd64 = TempOdd64 + exp_27 - exp_13;
		evenodd = _mm_sub_epi64(evenodd, exp_1213);
		evenodd = _mm_add_epi64(evenodd, exp_2627);
		
		//_mm_store_si128(&temp.x, evenodd);
		//TempEven64 = temp.x[0];
		//TempOdd64  = temp.x[1];
		
		//exp_30 = r64_01(exp_15);
		//exp_31 = r64_01(exp_16);
		__m128i exp3031 = r64_01sse(exp_1516);
		
		//exp_30 += TempEven64;
		//exp_31 += TempOdd64;
		exp3031 = _mm_add_epi64(evenodd, exp3031);
		
		//exp_30 += r64_02(exp_17);
		//exp_31 += r64_02(exp_18);
		exp3031 = _mm_add_epi64(exp3031, r64_02sse(exp_1718));
		
		//exp_30 += r64_03(exp_19);
		//exp_31 += r64_03(exp_20);
		exp3031 = _mm_add_epi64(exp3031, r64_03sse(exp_1920));
		
		//exp_30 += r64_04(exp_21);
		//exp_31 += r64_04(exp_22);
		exp3031 = _mm_add_epi64(exp3031, r64_04sse(exp_2122));
		
		//exp_30 += r64_05(exp_23);
		//exp_31 += r64_05(exp_24);
		exp3031 = _mm_add_epi64(exp3031, r64_05sse(exp_2324));
		
		//exp_30 += r64_06(exp_25);
		//exp_31 += r64_06(exp_26);
		exp3031 = _mm_add_epi64(exp3031, r64_06sse(exp_2526));
		
		__m128i exp_2728 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[27]),_mm_loadl_epi64(&exp[28]));
		//exp_30 += r64_07(exp_27);
		//exp_31 += r64_07(exp_28);
		exp3031 = _mm_add_epi64(exp3031, r64_07sse(exp_2728));
		
		//__m128i exp_2829 = _mm_load_si128(&exp[28]);
		//exp_30 += s64_4( exp_28);
		//exp_31 += s64_4( exp_29);
		exp3031 = _mm_add_epi64(exp3031, s64_4sse(exp_2829));
		
		//exp_30 += ((td64_14 + td64_01 - td64_08 + 0x9ffffffffffffff6ull) ^ p512_05);
		//exp_31 += ((td64_15 + td64_02 - td64_09 + 0xa55555555555554bull) ^ p512_06);
		tdtemp = _mm_sub_epi64(td64_1415, td64_0809);
		__m128i td64_0102 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[1]),_mm_loadl_epi64(&td64[2]));
		tdtemp = _mm_add_epi64(tdtemp, td64_0102);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[14]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&p512[5]),_mm_loadl_epi64(&p512[6]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp3031 = _mm_add_epi64(tdtemp, exp3031);
		
		//exp_30 += s64_5( exp_29);
		//exp_31 += s64_5( exp_30);
		exp3031 = s64_5sse_acc(_mm_loadl_epi64(&exp[29]), exp3031);
		
		_mm_store_si128(&exp[30], exp3031);
		__m128i exp_3031 = exp3031;
		
		//XH64 ^= exp_30 = exp[30];
		//XH64 ^= exp_31 = exp[31];
		XH64sse = _mm_xor_si128(XH64sse, exp_3031);
		
		XH64sse = _mm_xor_si128(XH64sse, _mm_unpackhi_epi64(XH64sse, XH64sse));
		//XH64sse = _mm_move_epi64(XH64sse);
		
		//_mm_storel_epi64(&XH64, XH64sse);
		
		__m128i XH64_2 = _mm_unpacklo_epi64(XH64sse, XH64sse);
		
		__m128i XL64_2 = XL64sse;
		XL64_2 = _mm_unpacklo_epi64(XL64_2, XL64_2);

		/*  Compute the double chaining pipe for the next message block. */
		//p512[00] = (    XL64    ^ exp[24] ^ exp[00]); 
		//p512[01] = (    XL64    ^ exp[25] ^ exp[01]);
		p512_0001 = _mm_xor_si128(XL64_2, exp_0001); // Change to manual load?
		p512_0001 = _mm_xor_si128(p512_0001, exp_2425);
		//_mm_store_si128(&p512[00], p512_0001);
		
		
		//p512[02] = (    XL64    ^ exp[26] ^ exp[02]);
		//p512[03] = (    XL64    ^ exp[27] ^ exp[03]);
		p512_0203 = _mm_xor_si128(XL64_2, exp_0203); // Change to manual load?
		p512_0203 = _mm_xor_si128(p512_0203, exp_2627);
		//_mm_store_si128(&p512[02], p512_0203);
		
		
		//p512[04] = (    XL64    ^ exp[28] ^ exp[04]);
		//p512[05] = (    XL64    ^ exp[29] ^ exp[05]);
		p512_0405 = _mm_xor_si128(XL64_2, exp_0405); // Change to manual load?
		p512_0405 = _mm_xor_si128(p512_0405, exp_2829);
		//_mm_store_si128(&p512[04], p512_0405);
		
		
		//p512[06] = (    XL64    ^ exp[30] ^ exp[06]);
		//p512[07] = (    XL64    ^ exp[31] ^ exp[07]);
		p512_0607 = _mm_xor_si128(XL64_2, exp_0607); // Change to manual load?
		p512_0607 = _mm_xor_si128(p512_0607, exp_3031);
		//_mm_store_si128(&p512[06], p512_0607);
		
		
		//p512[00] +=                       (shl(XH64, 5) ^ shr(exp[16],5) ^ data64[ 0]);
		//p512[01] +=                       (shr(XH64, 7) ^ shl(exp[17],8) ^ data64[ 1]);
		__m128i XH64_tmp1 = _mm_slli_epi64(XH64_2, 5);
		__m128i XH64_tmp2 = _mm_srli_epi64(XH64_2, 7);
		XH64_tmp1 = _mm_unpacklo_epi64(XH64_tmp1, XH64_tmp2);
		__m128i exp_tmp1 = _mm_srli_epi64(_mm_loadl_epi64(&exp[16]), 5); // Change to 1 load+unpack?
		__m128i exp_tmp2 = _mm_slli_epi64(_mm_loadl_epi64(&exp[17]), 8);
		exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, data64_0001); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[00]),_mm_loadl_epi64(&data64[01])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XH64_tmp1);
		
		p512_0001 = _mm_add_epi64(p512_0001, exp_tmp1);
		_mm_store_si128(&p512[00], p512_0001);
		
		
		//p512[02] +=                       (shr(XH64, 5) ^ shl(exp[18],5) ^ data64[ 2]);
		//p512[03] +=                       (shr(XH64, 1) ^ shl(exp[19],5) ^ data64[ 3]);
		XH64_tmp1 = _mm_srli_epi64(XH64_2, 5);
		XH64_tmp2 = _mm_srli_epi64(XH64_2, 1);
		XH64_tmp1 = _mm_unpacklo_epi64(XH64_tmp1, XH64_tmp2);
		exp_tmp1 = _mm_slli_epi64(_mm_load_si128(&exp[18]), 5);
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, data64_0203); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[00]),_mm_loadl_epi64(&data64[01])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XH64_tmp1);
		
		p512_0203 = _mm_add_epi64(p512_0203, exp_tmp1);
		_mm_store_si128(&p512[02], p512_0203);
		
		
		
		//p512[04] +=                       (shr(XH64, 3) ^     exp[20]    ^ data64[ 4]);
		//p512[05] +=                       (shl(XH64, 6) ^ shr(exp[21],6) ^ data64[ 5]);
		XH64_tmp1 = _mm_srli_epi64(XH64_2, 3);
		XH64_tmp2 = _mm_slli_epi64(XH64_2, 6);
		XH64_tmp1 = _mm_unpacklo_epi64(XH64_tmp1, XH64_tmp2);
		exp_tmp1 = _mm_loadl_epi64(&exp[20]); // Change to 1 load+unpack?
		exp_tmp2 = _mm_srli_epi64(_mm_loadl_epi64(&exp[21]), 6);
		exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, data64_0405); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[00]),_mm_loadl_epi64(&data64[01])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XH64_tmp1);
		
		p512_0405 = _mm_add_epi64(p512_0405, exp_tmp1);
		_mm_store_si128(&p512[04], p512_0405);
		
		
		//p512[06] +=                       (shr(XH64, 4) ^ shl(exp[22],6) ^ data64[ 6]);
		//p512[07] +=                       (shr(XH64,11) ^ shl(exp[23],2) ^ data64[ 7]);
		XH64_tmp1 = _mm_srli_epi64(XH64_2, 4);
		XH64_tmp2 = _mm_srli_epi64(XH64_2, 11);
		XH64_tmp1 = _mm_unpacklo_epi64(XH64_tmp1, XH64_tmp2);
		exp_tmp1 = _mm_slli_epi64(_mm_loadl_epi64(&exp[22]), 6); // Change to 1 load+unpack?
		exp_tmp2 = _mm_slli_epi64(_mm_loadl_epi64(&exp[23]), 2);
		exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, data64_0607); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[00]),_mm_loadl_epi64(&data64[01])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XH64_tmp1);
		
		p512_0607 = _mm_add_epi64(p512_0607, exp_tmp1);
		_mm_store_si128(&p512[06], p512_0607);
		
		
		//p512[ 8] = (shl(XL64,8) ^ exp[23] ^ exp[8]);
		//p512[ 9] = (shr(XL64,6) ^ exp[16] ^ exp[9]);
		__m128i XL64_tmp1 = _mm_slli_epi64(XL64_2, 8);
		__m128i XL64_tmp2 = _mm_srli_epi64(XL64_2, 6);
		XL64_tmp1 = _mm_unpacklo_epi64(XL64_tmp1, XL64_tmp2);
		exp_tmp1 = _mm_loadl_epi64(&exp[23]);
		exp_tmp2 = _mm_loadl_epi64(&exp[16]);
		exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&exp[8]));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XL64_tmp1);
		p512_0809 = exp_tmp1;
		//_mm_store_si128(&p512[8], exp_tmp1);
		
		
		
		//p512[10] = (shl(XL64,6) ^ exp[17] ^ exp[10]);
		//p512[11] = (shl(XL64,4) ^ exp[18] ^ exp[11]);
		XL64_tmp1 = _mm_slli_epi64(XL64_2, 6);
		XL64_tmp2 = _mm_slli_epi64(XL64_2, 4);
		XL64_tmp1 = _mm_unpacklo_epi64(XL64_tmp1, XL64_tmp2);
		//exp_tmp1 = _mm_loadl_epi64(&exp[17]); // TODO: test performance:
		//exp_tmp2 = _mm_loadl_epi64(&exp[18]);
		//exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		exp_tmp1 = exp_1718;
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&exp[10]));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XL64_tmp1);
		p512_1011 = exp_tmp1;
		//_mm_store_si128(&p512[10], exp_tmp1);
		
		
		//p512[12] = (shr(XL64,3) ^ exp[19] ^ exp[12]);
		//p512[13] = (shr(XL64,4) ^ exp[20] ^ exp[13]);
		XL64_tmp1 = _mm_srli_epi64(XL64_2, 3);
		XL64_tmp2 = _mm_srli_epi64(XL64_2, 4);
		XL64_tmp1 = _mm_unpacklo_epi64(XL64_tmp1, XL64_tmp2);
		//exp_tmp1 = _mm_loadl_epi64(&exp[19]); // TODO: test performance:
		//exp_tmp2 = _mm_loadl_epi64(&exp[20]);
		//exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		exp_tmp1 = exp_1920;
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&exp[12]));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XL64_tmp1);
		//_mm_store_si128(&p512[12], exp_tmp1);
		p512_1213 = exp_tmp1;
		
		//p512[14] = (shr(XL64,7) ^ exp[21] ^ exp[14]);
		//p512[15] = (shr(XL64,2) ^ exp[22] ^ exp[15]);
		XL64_tmp1 = _mm_srli_epi64(XL64_2, 7);
		XL64_tmp2 = _mm_srli_epi64(XL64_2, 2);
		XL64_tmp1 = _mm_unpacklo_epi64(XL64_tmp1, XL64_tmp2);
		//exp_tmp1 = _mm_loadl_epi64(&exp[21]); // TODO: test performance:
		//exp_tmp2 = _mm_loadl_epi64(&exp[22]);
		//exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		exp_tmp1 = exp_2122;
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&exp[14]));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XL64_tmp1);
		//_mm_store_si128(&p512[14], exp_tmp1);
		p512_1415 = exp_tmp1;
		
		
		//p512[ 8] += (    XH64     ^     exp[24]    ^ data64[ 8]);
		//p512[ 9] += (    XH64     ^     exp[25]    ^ data64[ 9]);
		exp_tmp1 = _mm_xor_si128(XH64_2, _mm_load_si128(&exp[24])); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[08]),_mm_loadl_epi64(&data64[09])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, data64_0809);
		p512_0809 = _mm_add_epi64(p512_0809, exp_tmp1);
		//_mm_store_si128(&p512[8], p512_0809);
		
		
		//p512[10] += (    XH64     ^     exp[26]    ^ data64[10]);
		//p512[11] += (    XH64     ^     exp[27]    ^ data64[11]);
		exp_tmp1 = _mm_xor_si128(XH64_2, _mm_load_si128(&exp[26])); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[08]),_mm_loadl_epi64(&data64[09])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, data64_1011);
		p512_1011 = _mm_add_epi64(p512_1011, exp_tmp1);
		//_mm_store_si128(&p512[10], p512_1011);
		
		
		//p512[12] += (    XH64     ^     exp[28]    ^ data64[12]);
		//p512[13] += (    XH64     ^     exp[29]    ^ data64[13]);
		exp_tmp1 = _mm_xor_si128(XH64_2, _mm_load_si128(&exp[28])); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[08]),_mm_loadl_epi64(&data64[09])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, data64_1213);
		p512_1213 = _mm_add_epi64(p512_1213, exp_tmp1);
		//_mm_store_si128(&p512[12], p512_1213);
		
		
		//p512[14] += (    XH64     ^     exp[30]    ^ data64[14]);
		//p512[15] += (    XH64     ^     exp[31]    ^ data64[15]);
		exp_tmp1 = _mm_xor_si128(XH64_2, _mm_load_si128(&exp[30])); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[08]),_mm_loadl_epi64(&data64[09])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, data64_1415);
		p512_1415 = _mm_add_epi64(p512_1415, exp_tmp1);
		//_mm_store_si128(&p512[14], p512_1415);
		
		
		
		//p512[ 8] += rotl64(p512[04], 9);
		roll9 = roll64_9sse(p512_0405);
		
		//p512[10] += rotl64(p512[06],11);
		roll11 = roll64_11sse(p512_0607);

		//p512[ 9] += rotl64(p512[05],10);
		//p512[11] += rotl64(p512[07],12);
		roll1012 = roll64_1sse(_mm_unpackhi_epi64(roll9, roll11));
		
		_mm_store_si128(&p512[8], _mm_add_epi64(p512_0809, _mm_unpacklo_epi64(roll9, roll1012)));
		// TODO: fix hack for gcc 4.4 compiler
		//_mm_store_si128(&p512[10], _mm_add_epi64(p512_1011, _mm_unpackhi_epi64(roll11, roll1012)));
		_mm_store_si128(&p512[10], _mm_add_epi64(p512_1011, roll1012));
		//_mm_storeh_pd(&p512[11], (__m128d) _mm_add_epi64(p512_1011, roll1012));
		_mm_storel_epi64(&p512[10], _mm_add_epi64(p512_1011, roll11));
	
		
		
		//p512[12] += rotl64(p512[00],13);
		roll13 = roll64_13sse(p512_0001);
		
		//p512[14] += rotl64(p512[02],15);
		roll15 = roll64_15sse(p512_0203);
		
		//p512[13] += rotl64(p512[01],14);
		//p512[15] += rotl64(p512[03],16);
		roll1416 = roll64_1sse(_mm_unpackhi_epi64(roll13, roll15));
		
		_mm_store_si128(&p512[12], _mm_add_epi64(p512_1213, _mm_unpacklo_epi64(roll13, roll1416)));
		// TODO: fix hack for gcc 4.4 compiler
		_mm_store_si128(&p512[14], _mm_add_epi64(p512_1415, roll1416));
		//_mm_storeh_pd(&p512[15], (__m128d) _mm_add_epi64(p512_1415, roll1416));
		_mm_storel_epi64(&p512[14], _mm_add_epi64(p512_1415, roll15));
		
		data64 += 16;
	}
	
	databitlen -= (BlueMidnightWish512_BLOCK_SIZE * 8) * iterations;
	state->bits_processed += (BlueMidnightWish512_BLOCK_SIZE * 8) *  iterations;
	
	state->unprocessed_bits = (int)databitlen;
	
	_mm_store_si128(&hashState512(state)->DoublePipe[0], _mm_load_si128(&p512[0]));
	_mm_store_si128(&hashState512(state)->DoublePipe[2], _mm_load_si128(&p512[2]));
	_mm_store_si128(&hashState512(state)->DoublePipe[4], _mm_load_si128(&p512[4]));
	_mm_store_si128(&hashState512(state)->DoublePipe[6], _mm_load_si128(&p512[6]));
	_mm_store_si128(&hashState512(state)->DoublePipe[8], _mm_load_si128(&p512[8]));
	_mm_store_si128(&hashState512(state)->DoublePipe[10], _mm_load_si128(&p512[10]));
	_mm_store_si128(&hashState512(state)->DoublePipe[12], _mm_load_si128(&p512[12]));
	_mm_store_si128(&hashState512(state)->DoublePipe[14], _mm_load_si128(&p512[14]));
	
	return databitlen;
}





__inline static void FinalCompress512(hashState *state)
{
	//p512   = hashState512(state)->DoublePipe;
	//FinalCompression512();
	
	#if defined ( _MSC_VER )
	u_int64_t __declspec(align(16))       p_xor_d[16];
	u_int64_t __declspec(align(16))       p512[16];
	u_int64_t __declspec(align(16))       exp[32];
	u_int64_t __declspec(align(16))       td64[16]; 
	//const u_int64_t __declspec(align(16)) consts[16] = {
	//	0x5555555555555550ull,0x5aaaaaaaaaaaaaa5ull,0x5ffffffffffffffaull,0x655555555555554full,
	//	0x6aaaaaaaaaaaaaa4ull,0x6ffffffffffffff9ull,0x755555555555554eull,0x7aaaaaaaaaaaaaa3ull,
	//	0x7ffffffffffffff8ull,0x855555555555554dull,0x8aaaaaaaaaaaaaa2ull,0x8ffffffffffffff7ull,
	//	0x955555555555554cull,0x9aaaaaaaaaaaaaa1ull,0x9ffffffffffffff6ull,0xa55555555555554bull
	//	};
	//const u_int64_t __declspec(align(16)) constsFinal[16] = {
	//	0xaaaaaaaaaaaaaaa0ull,0xaaaaaaaaaaaaaaa1ull,0xaaaaaaaaaaaaaaa2ull,0xaaaaaaaaaaaaaaa3ull,
	//	0xaaaaaaaaaaaaaaa4ull,0xaaaaaaaaaaaaaaa5ull,0xaaaaaaaaaaaaaaa6ull,0xaaaaaaaaaaaaaaa7ull,
	//	0xaaaaaaaaaaaaaaa8ull,0xaaaaaaaaaaaaaaa9ull,0xaaaaaaaaaaaaaaaaull,0xaaaaaaaaaaaaaaabull,
	//	0xaaaaaaaaaaaaaaacull,0xaaaaaaaaaaaaaaadull,0xaaaaaaaaaaaaaaaeull,0xaaaaaaaaaaaaaaafull
	//	};
	#else
	u_int64_t __attribute__ ((aligned (16)))       p_xor_d[16];
	u_int64_t __attribute__ ((aligned (16)))       p512[16];
	u_int64_t __attribute__ ((aligned (16)))       exp[32];
	u_int64_t __attribute__ ((aligned (16)))       td64[16]; 
	//const u_int64_t __attribute__ ((aligned (16))) consts[16] = {
	//	0x5555555555555550ull,0x5aaaaaaaaaaaaaa5ull,0x5ffffffffffffffaull,0x655555555555554full,
	//	0x6aaaaaaaaaaaaaa4ull,0x6ffffffffffffff9ull,0x755555555555554eull,0x7aaaaaaaaaaaaaa3ull,
	//	0x7ffffffffffffff8ull,0x855555555555554dull,0x8aaaaaaaaaaaaaa2ull,0x8ffffffffffffff7ull,
	//	0x955555555555554cull,0x9aaaaaaaaaaaaaa1ull,0x9ffffffffffffff6ull,0xa55555555555554bull
	//	};
	//const u_int64_t __attribute__ ((aligned (16))) constsFinal[16] = {
	//	0xaaaaaaaaaaaaaaa0ull,0xaaaaaaaaaaaaaaa1ull,0xaaaaaaaaaaaaaaa2ull,0xaaaaaaaaaaaaaaa3ull,
	//	0xaaaaaaaaaaaaaaa4ull,0xaaaaaaaaaaaaaaa5ull,0xaaaaaaaaaaaaaaa6ull,0xaaaaaaaaaaaaaaa7ull,
	//	0xaaaaaaaaaaaaaaa8ull,0xaaaaaaaaaaaaaaa9ull,0xaaaaaaaaaaaaaaaaull,0xaaaaaaaaaaaaaaabull,
	//	0xaaaaaaaaaaaaaaacull,0xaaaaaaaaaaaaaaadull,0xaaaaaaaaaaaaaaaeull,0xaaaaaaaaaaaaaaafull
	//	};
	#endif
	
	//__m128i p512_0001, p512_0203, p512_0405, p512_0607, p512_0809, p512_1011, p512_1213, p512_1415;
	_mm_store_si128(&p512[00], _mm_load_si128(&hashState512(state)->DoublePipe[0]));
	_mm_store_si128(&p512[02], _mm_load_si128(&hashState512(state)->DoublePipe[2]));
	_mm_store_si128(&p512[04], _mm_load_si128(&hashState512(state)->DoublePipe[4]));
	_mm_store_si128(&p512[06], _mm_load_si128(&hashState512(state)->DoublePipe[6]));
	_mm_store_si128(&p512[ 8], _mm_load_si128(&hashState512(state)->DoublePipe[8]));
	_mm_store_si128(&p512[10], _mm_load_si128(&hashState512(state)->DoublePipe[10]));
	_mm_store_si128(&p512[12], _mm_load_si128(&hashState512(state)->DoublePipe[12]));
	_mm_store_si128(&p512[14], _mm_load_si128(&hashState512(state)->DoublePipe[14]));
	
	{
		__m128i p512_0001 = _mm_load_si128(&p512[00]);
		//__m128i data64_0001 = _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[00]),_mm_loadl_epi64(&data64[01]));
		_mm_store_si128(&p_xor_d[ 0], _mm_xor_si128(p512_0001, _mm_load_si128(&constsFinal[00])));
		
		__m128i roll1 = roll64_1sse(p512_0001);
		_mm_storel_epi64(&td64[ 0], roll1);
		
		
		__m128i p512_0203 = _mm_load_si128(&p512[02]);
		//__m128i data64_0203 = _mm_loadu_si128(&data64[02]);
		//__m128i data64_0203 = _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[02]),_mm_loadl_epi64(&data64[03]));
		_mm_store_si128(&p_xor_d[ 2], _mm_xor_si128(p512_0203, _mm_load_si128(&constsFinal[02])));
		
		__m128i roll3 = roll64_3sse(p512_0203);
		_mm_storel_epi64(&td64[ 2], roll3);
		
		__m128i roll24 = roll64_1sse(_mm_unpackhi_epi64(roll1, roll3));
		_mm_storel_epi64(&td64[ 1], roll24);
		_mm_storel_epi64(&td64[ 3], _mm_unpackhi_epi64(roll24, roll24));
		//_mm_storeh_pd(&td64[ 3], (__m128d) roll24);
		
		
		__m128i p512_0405 = _mm_load_si128(&p512[04]);
		//__m128i data64_0405 = _mm_loadu_si128(&data64[04]);
		//__m128i data64_0405 = _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[04]),_mm_loadl_epi64(&data64[05]));
		_mm_store_si128(&p_xor_d[ 4], _mm_xor_si128(p512_0405, _mm_load_si128(&constsFinal[04])));
		
		__m128i roll5 = roll64_5sse(p512_0405);
		_mm_storel_epi64(&td64[ 4], roll5);
		
		__m128i p512_0607 = _mm_load_si128(&p512[06]);
		//__m128i data64_0607 = _mm_loadu_si128(&data64[06]);
		//__m128i data64_0607 = _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[06]),_mm_loadl_epi64(&data64[07]));
		_mm_store_si128(&p_xor_d[ 6], _mm_xor_si128(p512_0607, _mm_load_si128(&constsFinal[06])));
		
		__m128i roll7 = roll64_7sse(p512_0607);
		_mm_storel_epi64(&td64[ 6], roll7);
		
		__m128i roll68 = roll64_1sse(_mm_unpackhi_epi64(roll5, roll7));
		_mm_storel_epi64(&td64[ 5], roll68);
		_mm_storel_epi64(&td64[ 7], _mm_unpackhi_epi64(roll68, roll68));
		//_mm_storeh_pd(&td64[ 7], (__m128d) roll68);
		
		
		__m128i p512_0809 = _mm_load_si128(&p512[8]);
		//__m128i data64_0809 = _mm_loadu_si128(&data64[8]);
		//__m128i data64_0809 = _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[ 8]),_mm_loadl_epi64(&data64[ 9]));
		_mm_store_si128(&p_xor_d[ 8], _mm_xor_si128(p512_0809, _mm_load_si128(&constsFinal[8])));
		
		__m128i roll9 = roll64_9sse(p512_0809);
		_mm_storel_epi64(&td64[ 8], roll9);
		
		__m128i p512_1011 = _mm_load_si128(&p512[10]);
		//__m128i data64_1011 = _mm_loadu_si128(&data64[10]);
		//__m128i data64_1011 = _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[10]),_mm_loadl_epi64(&data64[11]));
		_mm_store_si128(&p_xor_d[10], _mm_xor_si128(p512_1011, _mm_load_si128(&constsFinal[10])));
		
		__m128i roll11 = roll64_11sse(p512_1011);
		_mm_storel_epi64(&td64[ 10], roll11);
		
		__m128i roll1012 = roll64_1sse(_mm_unpackhi_epi64(roll9, roll11));
		_mm_storel_epi64(&td64[ 9], roll1012);
		_mm_storel_epi64(&td64[ 11], _mm_unpackhi_epi64(roll1012, roll1012));
		//_mm_storeh_pd(&td64[11], (__m128d) roll1012);
		
		
		__m128i p512_1213 = _mm_load_si128(&p512[12]);
		//__m128i data64_1213 = _mm_loadu_si128(&data64[12]);
		//__m128i data64_1213 = _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[12]),_mm_loadl_epi64(&data64[13]));
		_mm_store_si128(&p_xor_d[12], _mm_xor_si128(p512_1213,_mm_load_si128(&constsFinal[12])));
		
		__m128i roll13 = roll64_13sse(p512_1213);
		_mm_storel_epi64(&td64[ 12], roll13);
		
		__m128i p512_1415 = _mm_load_si128(&p512[14]);
		//__m128i data64_1415 = _mm_loadu_si128(&data64[14]);
		//__m128i data64_1415 = _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[14]),_mm_loadl_epi64(&data64[15]));
		_mm_store_si128(&p_xor_d[14], _mm_xor_si128(p512_1415, _mm_load_si128(&constsFinal[14])));
		
		__m128i roll15 = roll64_15sse(p512_1415);
		_mm_storel_epi64(&td64[ 14], roll15);
		
		__m128i roll1416 = roll64_1sse(_mm_unpackhi_epi64(roll13, roll15));
		_mm_storel_epi64(&td64[ 13], roll1416);
		_mm_storel_epi64(&td64[ 15], _mm_unpackhi_epi64(roll1416, roll1416));
		//_mm_storeh_pd(&td64[15], (__m128d) roll1416);
		
		
		
		
		//this is done but with sse
		//p_xor_d_05=p512[05]^data64[ 5];	td64[05]=rotl64(data64[ 5], 6);
		//p_xor_d_07=p512[07]^data64[ 7];	td64[07]=rotl64(data64[ 7], 8);
		//p_xor_d_10=p512[10]^data64[ 10];	td64[10]=rotl64(data64[ 10], 11);
		//p_xor_d_13=p512[13]^data64[ 13];	td64[13]=rotl64(data64[ 13], 14);
		//p_xor_d_14=p512[14]^data64[ 14];	td64[14]=rotl64(data64[ 14], 15);
		//exp_00 = (p_xor_d[5]  - p_xor_d[7]  + p_xor_d[10]  + p_xor_d[13]  + p_xor_d[14] );
		__m128i exp00 = _mm_loadl_epi64(&p_xor_d[5]);
		exp00 = _mm_sub_epi64(exp00, _mm_loadl_epi64(&p_xor_d[07]));
		exp00 = _mm_add_epi64(exp00, _mm_loadl_epi64(&p_xor_d[10]));
		exp00 = _mm_add_epi64(exp00, _mm_loadl_epi64(&p_xor_d[13]));
		exp00 = _mm_add_epi64(exp00, _mm_loadl_epi64(&p_xor_d[14]));
		//_mm_storel_epi64(&exp_00, exp00);
		
		
		//this is done but with sse
		//exp[00] = s64_0(exp_00) + p512_01;
		//p_xor_d_00=p512[00]^data64[ 0];	td64[00]=rotl64(data64[ 0], 1);
		//p_xor_d_08=p512[8]^data64[ 8];	td64[8]=rotl64(data64[ 8], 9);
		//p_xor_d_01=p512[01]^data64[ 1];	td64[01]=rotl64(data64[ 1], 2);
		//t512_37 = (p_xor_d[8] - p_xor_d[01]);
		__m128i t512__37 = _mm_loadl_epi64(&p_xor_d[8]);
		t512__37 = _mm_sub_epi64(t512__37, _mm_loadl_epi64(&p_xor_d[01]));
		//_mm_storel_epi64(&t512_37, t512__37);
		
		//t512_35 = (p_xor_d[01] - p_xor_d[14]);
		__m128i t512__35 = _mm_loadl_epi64(&p_xor_d[1]);
		t512__35 = _mm_sub_epi64(t512__35, _mm_loadl_epi64(&p_xor_d[14]));
		//_mm_storel_epi64(&t512_35, t512__35);
		
		//exp_03 = (p_xor_d[00]  + p_xor_d[13]  + t512_37  - p_xor_d[10] );
		__m128i exp03 = _mm_loadl_epi64(&p_xor_d[0]);
		exp03 = _mm_add_epi64(exp03, _mm_loadl_epi64(&p_xor_d[13]));
		exp03 = _mm_add_epi64(exp03, t512__37);
		exp03 = _mm_sub_epi64(exp03, _mm_loadl_epi64(&p_xor_d[10]));
		//_mm_storel_epi64(&exp_03, exp03);
		
		
		
		//exp[03] = s64_3(exp_03) + p512[04];
		// Perform on only a single part.
		//__m128i exp03 = _mm_loadl_epi64(&exp_03);
		exp03 = _mm_add_epi64(s64_3sse(exp03), _mm_loadl_epi64(&constsFinal[04]));
		_mm_storel_epi64(&exp[03], exp03);
		
		//p_xor_d_15=p512[15]^data64[ 15];	td64[15]=rotl64(data64[ 15], 16);
		//p_xor_d_04=p512[04]^data64[ 4];	td64[04]=rotl64(data64[ 4], 5);
		//exp_10 = (p_xor_d[15]  + t512_37  - p_xor_d[04]  - p_xor_d[07] );
		__m128i exp10 = _mm_loadl_epi64(&p_xor_d[15]);
		exp10 = _mm_add_epi64(exp10, t512__37);
		exp10 = _mm_sub_epi64(exp10, _mm_loadl_epi64(&p_xor_d[04]));
		exp10 = _mm_sub_epi64(exp10, _mm_loadl_epi64(&p_xor_d[07]));
		//_mm_storel_epi64(&exp_10, exp10);
		
		
		//exp[00] = s64_0(exp_00) + p512[01];
		//exp[10] = s64_0(exp_10) + p512[11];
		__m128i exp0010 = _mm_unpacklo_epi64(exp00, exp10);
		exp0010 = _mm_add_epi64(s64_0sse(exp0010), _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[01]),_mm_loadl_epi64(&constsFinal[11])));
		_mm_storel_epi64(&exp[00], exp0010);
		_mm_storel_epi64(&exp[10], _mm_unpackhi_epi64(exp0010, exp0010));
		//_mm_storeh_pd(&exp[10], (__m128d) exp0010);
		
		//p_xor_d_02=p512[02]^data64[ 2];	td64[02]=rotl64(data64[ 2], 3);
		//p_xor_d_11=p512[11]^data64[ 11];	td64[11]=rotl64(data64[ 11], 12);
		//exp_13 = (p_xor_d[02]  + p_xor_d[04]  + p_xor_d[07]  + p_xor_d[10]  + p_xor_d[11] );
		__m128i exp13 = _mm_loadl_epi64(&p_xor_d[2]);
		exp13 = _mm_add_epi64(exp13, _mm_loadl_epi64(&p_xor_d[04]));
		exp13 = _mm_add_epi64(exp13, _mm_loadl_epi64(&p_xor_d[07]));
		exp13 = _mm_add_epi64(exp13, _mm_loadl_epi64(&p_xor_d[10]));
		exp13 = _mm_add_epi64(exp13, _mm_loadl_epi64(&p_xor_d[11]));
		//_mm_storel_epi64(&exp_13, exp13);
		
		
		    //exp[13] = s64_3(exp_13) + p512[14];
		//p_xor_d_09=p512[9]^data64[ 9];	td64[9]=rotl64(data64[ 9], 10);
		//p_xor_d_12=p512[12]^data64[ 12];	td64[12]=rotl64(data64[ 12], 13);
		//t512_32 = (p_xor_d[15] - p_xor_d[12]);
		__m128i t512__32 = _mm_loadl_epi64(&p_xor_d[15]);
		t512__32 = _mm_sub_epi64(t512__32, _mm_loadl_epi64(&p_xor_d[12]));
		//_mm_storel_epi64(&t512_32, t512__32);
		
		//exp_02 = (p_xor_d[00]  + p_xor_d[07]  + p_xor_d[9]  + t512_32 );
		__m128i exp02 = _mm_loadl_epi64(&p_xor_d[00]);
		exp02 = _mm_add_epi64(exp02, _mm_loadl_epi64(&p_xor_d[07]));
		exp02 = _mm_add_epi64(exp02, _mm_loadl_epi64(&p_xor_d[9]));
		exp02 = _mm_add_epi64(exp02, t512__32);
		//_mm_storel_epi64(&exp_02, exp02);
		
		
		//exp[02] = s64_2(exp_02) + p512[03];
		// Perform on only a single part.
		//exp02 = _mm_loadl_epi64(&exp_02);
		exp02 = _mm_add_epi64(s64_2sse(exp02), _mm_loadl_epi64(&constsFinal[03]));
		_mm_storel_epi64(&exp[02], exp02);
		
		
		
		//t512_35 = (p_xor_d_01 - p_xor_d_14);
		//exp_04 = (p_xor_d[2]  + p_xor_d[9]  + t512_35  - p_xor_d[11] );
		__m128i exp04 = _mm_loadl_epi64(&p_xor_d[02]);
		exp04 = _mm_add_epi64(exp04, _mm_loadl_epi64(&p_xor_d[9]));
		exp04 = _mm_sub_epi64(exp04, _mm_loadl_epi64(&p_xor_d[11]));
		exp04 = _mm_add_epi64(exp04, t512__35);
		//_mm_storel_epi64(&exp_02, exp02);
		
		//exp[04] = s64_4(exp_04) + p512[05];
		// Perform on only a single part.
		//__m128i exp04 = _mm_loadl_epi64(&exp_04);
		exp04 = _mm_add_epi64(s64_4sse(exp04), _mm_loadl_epi64(&constsFinal[05]));
		_mm_storel_epi64(&exp[04], exp04);
		
		
		//t512_31 = (p_xor_d[8] - p_xor_d[05]);
		__m128i t512__31 = _mm_loadl_epi64(&p_xor_d[8]);
		t512__31 = _mm_sub_epi64(t512__31, _mm_loadl_epi64(&p_xor_d[05]));
		//_mm_storel_epi64(&t512_31, t512__31);
		
		
		
		//exp_11 = (p_xor_d[9]  + t512_31  - p_xor_d[00]  - p_xor_d[02] );
		__m128i exp11 = _mm_loadl_epi64(&p_xor_d[9]);
		exp11 = _mm_sub_epi64(exp11, _mm_loadl_epi64(&p_xor_d[00]));
		exp11 = _mm_sub_epi64(exp11, _mm_loadl_epi64(&p_xor_d[02]));
		exp11 = _mm_add_epi64(exp11, t512__31);
		//_mm_storel_epi64(&exp_11, exp11);
		
		//exp[11] = s64_1(exp_11) + p512[12];
		// Perform on only a single part.
		//__m128i exp11 = _mm_loadl_epi64(&exp_11);
		exp11 = _mm_add_epi64(s64_1sse(exp11), _mm_loadl_epi64(&constsFinal[12]));
		_mm_storel_epi64(&exp[11], exp11);
		
		
		//p_xor_d_03=p512[03]^data64[ 3];	td64[03]=rotl64(data64[ 3], 4);
		//t512_33 = (p_xor_d[03] + p_xor_d[10]);
		__m128i t512__33 = _mm_loadl_epi64(&p_xor_d[03]);
		t512__33 = _mm_add_epi64(t512__33, _mm_loadl_epi64(&p_xor_d[10]));
		//_mm_storel_epi64(&t512_33, t512__33);
		
		
		
		//exp_05 = (t512_32  + t512_33  - p_xor_d[02] );
		__m128i exp05 = _mm_loadl_epi64(&p_xor_d[02]);
		exp05 = _mm_sub_epi64(t512__32, exp05);
		exp05 = _mm_add_epi64(exp05, t512__33);
		//_mm_storel_epi64(&exp_05, exp05);
		
		
	 	   //exp[05] = s64_0(exp_05) + p512[06];
		//p_xor_d_06=p512[06]^data64[ 6];	td64[06]=rotl64(data64[ 6], 7);
		//exp_12 = (p_xor_d[01]  + t512_33  - p_xor_d[06]  - p_xor_d[9] );
		__m128i exp12 = _mm_loadl_epi64(&p_xor_d[01]);
		exp12 = _mm_sub_epi64(exp12, _mm_loadl_epi64(&p_xor_d[06]));
		exp12 = _mm_sub_epi64(exp12, _mm_loadl_epi64(&p_xor_d[9]));
		exp12 = _mm_add_epi64(exp12, t512__33);
		//_mm_storel_epi64(&exp_12, exp12);
		
		
	 	   //exp[12] = s64_2(exp_12) + p512[13];
		//t512_34 = (p_xor_d[13] - p_xor_d[06]);
		__m128i t512__34 = _mm_loadl_epi64(&p_xor_d[13]);
		t512__34 = _mm_sub_epi64(t512__34, _mm_loadl_epi64(&p_xor_d[06]));
		//_mm_storel_epi64(&t512_34, t512__34);
		
		//exp_08 = (p_xor_d[02]  + t512_34  - p_xor_d[05]  - p_xor_d[15] );
		__m128i exp08 = _mm_loadl_epi64(&p_xor_d[02]);
		exp08 = _mm_sub_epi64(exp08, _mm_loadl_epi64(&p_xor_d[05]));
		exp08 = _mm_sub_epi64(exp08, _mm_loadl_epi64(&p_xor_d[15]));
		exp08 = _mm_add_epi64(exp08, t512__34);
		//_mm_storel_epi64(&exp_08, exp08);
		
		
		//exp[8] = s64_3(exp_08) + p512[9];
		//exp[13] = s64_3(exp_13) + p512[14];
		__m128i exp0813 = _mm_unpacklo_epi64(exp08, exp13);
		exp0813 = _mm_add_epi64(s64_3sse(exp0813), _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[9]),_mm_loadl_epi64(&constsFinal[14])));
		_mm_storel_epi64(&exp[8], exp0813);
		_mm_storel_epi64(&exp[13], _mm_unpackhi_epi64(exp0813, exp0813));
		//_mm_storeh_pd(&exp[13], (__m128d) exp0813);
		
		//exp_15 = (p_xor_d[12]  + t512_34  - p_xor_d[04]  - p_xor_d[9] );
		__m128i exp15 = _mm_loadl_epi64(&p_xor_d[12]);
		exp15 = _mm_sub_epi64(exp15, _mm_loadl_epi64(&p_xor_d[04]));
		exp15 = _mm_sub_epi64(exp15, _mm_loadl_epi64(&p_xor_d[9]));
		exp15 = _mm_add_epi64(exp15, t512__34);
		//_mm_storel_epi64(&exp_15, exp15);
		
		
		//exp[05] = s64_0(exp_05) + p512[06];
		//exp[15]= s64_0(exp_15) + p512[00];
		__m128i exp0515 = _mm_unpacklo_epi64(exp05, exp15);
		exp0515 = _mm_add_epi64(s64_0sse(exp0515), _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[06]),_mm_loadl_epi64(&constsFinal[00])));
		_mm_storel_epi64(&exp[05], exp0515);
		_mm_storel_epi64(&exp[15], _mm_unpackhi_epi64(exp0515, exp0515));
		//_mm_storeh_pd(&exp[15], (__m128d) exp0515);
		
		//exp_07 = (t512_35  - p_xor_d[04]  - p_xor_d[05]  - p_xor_d[12] );
		__m128i exp07 = t512__35;
		exp07 = _mm_sub_epi64(exp07, _mm_loadl_epi64(&p_xor_d[04]));
		exp07 = _mm_sub_epi64(exp07, _mm_loadl_epi64(&p_xor_d[05]));
		exp07 = _mm_sub_epi64(exp07, _mm_loadl_epi64(&p_xor_d[12]));
		//_mm_storel_epi64(&exp_07, exp07);
		
		
		//exp[07] = s64_2(exp_07) + p512[8];
		//exp[12] = s64_2(exp_12) + p512[13];
		__m128i exp0712 = _mm_unpacklo_epi64(exp07, exp12);
		exp0712 = _mm_add_epi64(s64_2sse(exp0712), _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[8]),_mm_loadl_epi64(&constsFinal[13])));
		_mm_storel_epi64(&exp[07], exp0712);
		_mm_storel_epi64(&exp[12], _mm_unpackhi_epi64(exp0712, exp0712));
		
		//exp_14 = (p_xor_d[03]  + t512_31  - p_xor_d[11]  - p_xor_d[12] );
		__m128i exp14 = _mm_loadl_epi64(&p_xor_d[03]);
		exp14 = _mm_sub_epi64(exp14, _mm_loadl_epi64(&p_xor_d[11]));
		exp14 = _mm_sub_epi64(exp14, _mm_loadl_epi64(&p_xor_d[12]));
		exp14 = _mm_add_epi64(exp14, t512__31);
		//_mm_storel_epi64(&exp_14, exp14);
		
		
		   //exp[14] = s64_4(exp_14) + p512[15];
		//exp_06 = (p_xor_d[13]  - p_xor_d[03]  + p_xor_d[04]  - p_xor_d[11]  - p_xor_d[00] );
		__m128i exp06 = _mm_loadl_epi64(&p_xor_d[13]);
		exp06 = _mm_sub_epi64(exp06, _mm_loadl_epi64(&p_xor_d[03]));
		exp06 = _mm_add_epi64(exp06, _mm_loadl_epi64(&p_xor_d[04]));
		exp06 = _mm_sub_epi64(exp06, _mm_loadl_epi64(&p_xor_d[11]));
		exp06 = _mm_sub_epi64(exp06, _mm_loadl_epi64(&p_xor_d[00]));
		//_mm_storel_epi64(&exp_06, exp06);
		
	 	  //exp[06] = s64_1(exp_06) + p512[07];
		//t512_36 = (p_xor_d[06] + p_xor_d[14]);
		__m128i t512__36 = _mm_loadl_epi64(&p_xor_d[14]);
		t512__36 = _mm_add_epi64(t512__36, _mm_loadl_epi64(&p_xor_d[06]));
		//_mm_storel_epi64(&t512_36, t512__36);
		
		
		//exp_01 = (p_xor_d[11]  + t512_36  - p_xor_d[8]  - p_xor_d[15] );
		__m128i exp01 = _mm_loadl_epi64(&p_xor_d[11]);
		exp01 = _mm_sub_epi64(exp01, _mm_loadl_epi64(&p_xor_d[8]));
		exp01 = _mm_sub_epi64(exp01, _mm_loadl_epi64(&p_xor_d[15]));
		exp01 = _mm_add_epi64(exp01, t512__36);
		//_mm_storel_epi64(&exp_01, exp01);
		
		//exp[01] = s64_1(exp_01) + p512[02];
		//exp[06] = s64_1(exp_06) + p512[07];
		__m128i exp0106 = _mm_unpacklo_epi64(exp01, exp06);
		exp0106 = _mm_add_epi64(s64_1sse(exp0106), _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[02]),_mm_loadl_epi64(&constsFinal[07])));
		_mm_storel_epi64(&exp[01], exp0106);
		_mm_storel_epi64(&exp[06], _mm_unpackhi_epi64(exp0106, exp0106));
		//_mm_storeh_pd(&exp[06], (__m128d) exp0106);
		
		//exp_09 = (p_xor_d[00]  + t512_36  - p_xor_d[03]  - p_xor_d[07] );
		__m128i exp09 = _mm_loadl_epi64(&p_xor_d[00]);
		exp09 = _mm_sub_epi64(exp09, _mm_loadl_epi64(&p_xor_d[03]));
		exp09 = _mm_sub_epi64(exp09, _mm_loadl_epi64(&p_xor_d[07]));
		exp09 = _mm_add_epi64(exp09, t512__36);
		//_mm_storel_epi64(&exp_09, exp09);
		
		//exp[9] = s64_4(exp_09) + p512[10];
		//exp[14] = s64_4(exp_14) + p512[15];
		__m128i exp0914 = _mm_unpacklo_epi64(exp09, exp14);
		exp0914 = _mm_add_epi64(s64_4sse(exp0914), _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[10]),_mm_loadl_epi64(&constsFinal[15])));
		_mm_storel_epi64(&exp[9], exp0914);
		_mm_storel_epi64(&exp[14], _mm_unpackhi_epi64(exp0914, exp0914));
		//_mm_storeh_pd(&exp[14], (__m128d) exp0914);


		// first parts of Message expansion
		__m128i exp_0001 = _mm_load_si128(&exp[00]);//_mm_set_epi64((__m64) exp_01, (__m64) exp_00);
		__m128i exp1617 = s64_1sse(exp_0001);
		//exp_16  = s64_1(exp_00);

		//exp_17  = s64_1(exp_01);
		
		__m128i exp_0203 = _mm_load_si128(&exp[02]);//_mm_set_epi64((__m64) exp_03, (__m64) exp_02);
		exp1617 = _mm_add_epi64( s64_3sse(exp_0203) ,exp1617);
		//exp_16 += s64_3(exp_02);
		//exp_17 += s64_3(exp_03);
		
		__m128i exp_0102 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_0001, exp_0001), exp_0203);//_mm_set_epi64((__m64) exp_02, (__m64) exp_01); // change to reg-reg move ???
		//exp_16 += s64_2(exp_01);
		//exp_17 += s64_2(exp_02);
		exp1617 = _mm_add_epi64( s64_2sse(exp_0102) ,exp1617);
		
		__m128i exp_0405 = _mm_load_si128(&exp[04]);//_mm_set_epi64((__m64) exp_05, (__m64) exp_04);
		__m128i evenodd = _mm_add_epi64(exp_0203, exp_0405);
		//exp_16 += s64_1(exp_04);
		//exp_17 += s64_1(exp_05);
		exp1617 = _mm_add_epi64( s64_1sse(exp_0405) ,exp1617);
		
		__m128i exp0304 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_0203, exp_0203), exp_0405);//_mm_set_epi64((__m64) exp_04, (__m64) exp_03);
		//exp_16 += s64_0(exp_03);
		//exp_17 += s64_0(exp_04);
		exp1617 = _mm_add_epi64( s64_0sse(exp0304) ,exp1617);
		
		__m128i exp_0607 = _mm_load_si128(&exp[06]);//_mm_set_epi64((__m64) exp_07, (__m64) exp_06);
		evenodd = _mm_add_epi64(evenodd, exp_0607);
		//exp_16 += s64_3(exp_06);
		//exp_17 += s64_3(exp_07);
		exp1617 = _mm_add_epi64( s64_3sse(exp_0607) ,exp1617);
		
		__m128i exp_0506 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_0405, exp_0405), exp_0607);//_mm_set_epi64((__m64) exp_06, (__m64) exp_05);
		//exp_16 += s64_2(exp_05)
		//exp_17 += s64_2(exp_06);
		exp1617 = _mm_add_epi64( s64_2sse(exp_0506) ,exp1617);
		
		__m128i exp_0809 = _mm_load_si128(&exp[8]);//_mm_set_epi64((__m64) exp_09, (__m64) exp_08);
		evenodd = _mm_add_epi64(evenodd, exp_0809);
		//exp_16 += s64_1(exp_08);
		//exp_17 += s64_1(exp_09);
		exp1617 = _mm_add_epi64( s64_1sse(exp_0809) ,exp1617);
		
		__m128i exp_0708 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_0607, exp_0607), exp_0809);//_mm_set_epi64((__m64) exp_08, (__m64) exp_07);
		//exp_16 += s64_0(exp_07);
		//exp_17 += s64_0(exp_08);
		exp1617 = _mm_add_epi64( s64_0sse(exp_0708) ,exp1617);
		
		__m128i exp_1011 = _mm_load_si128(&exp[10]);//_mm_set_epi64((__m64) exp_11, (__m64) exp_10);
		evenodd = _mm_add_epi64(evenodd, exp_1011);
		//exp_16 += s64_3(exp_10);
		//exp_17 += s64_3(exp_11);
		exp1617 = _mm_add_epi64( s64_3sse(exp_1011) ,exp1617);
		
		__m128i exp_0910 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_0809, exp_0809), exp_1011);//_mm_set_epi64((__m64) exp_10, (__m64) exp_09);
		//exp_16 += s64_2(exp_09);
		//exp_17 += s64_2(exp_10);
		exp1617 = _mm_add_epi64( s64_2sse(exp_0910) ,exp1617);

		__m128i exp_1213 = _mm_load_si128(&exp[12]);//_mm_set_epi64((__m64) exp_13, (__m64) exp_12);
		evenodd = _mm_add_epi64(evenodd, exp_1213);
		//exp_16 += s64_1(exp_12);
		//exp_17 += s64_1(exp_13);
		exp1617 = _mm_add_epi64( s64_1sse(exp_1213) ,exp1617);
		
		__m128i exp_1112 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_1011, exp_1011), exp_1213);//_mm_set_epi64((__m64) exp_12, (__m64) exp_11);
		//exp_16 += s64_0(exp_11);
		//exp_17 += s64_0(exp_12);
		exp1617 = _mm_add_epi64( s64_0sse(exp_1112) ,exp1617);
		
		__m128i exp_1415 = _mm_load_si128(&exp[14]);//_mm_set_epi64((__m64) exp_15, (__m64) exp_14);
		evenodd = _mm_add_epi64(evenodd, exp_1415);
		//exp_16 += s64_3(exp_14);
		//exp_17 += s64_3(exp_15);
		exp1617 = _mm_add_epi64( s64_3sse(exp_1415) ,exp1617);
		
		__m128i exp_1314 = _mm_unpacklo_epi64(_mm_unpackhi_epi64(exp_1213, exp_1213), exp_1415);//_mm_set_epi64((__m64) exp_14, (__m64) exp_13);
		//exp_16 += s64_2(exp_13);
		//exp_17 += s64_2(exp_14);
		exp1617 = _mm_add_epi64( s64_2sse(exp_1314) ,exp1617);
		

		__m128i td64_0001 = _mm_load_si128(&td64[0]);
		__m128i td64_1011 = _mm_load_si128(&td64[10]);
		__m128i tdtemp = _mm_sub_epi64(td64_0001, td64_1011);
		// unaligned is slow (ofc)
		__m128i td64_0304 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[03]),_mm_loadl_epi64(&td64[04]));
		tdtemp = _mm_add_epi64(tdtemp, td64_0304);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[0]));

		// _mm_shuffle_epi32
		__m128i p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[07]),_mm_loadl_epi64(&constsFinal[8]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp1617 = _mm_add_epi64(tdtemp, exp1617);
		
		//exp_16 += ((td64_00 + td64_03 - td64_10 + 0x5555555555555550ull) ^ p512_07);
		//exp_17 += ((td64_01 + td64_04 - td64_11 + 0x5aaaaaaaaaaaaaa5ull) ^ p512_08);

		
		
		
        	//exp_28 = r64_01(exp_13);
       		//exp_28 += r64_02(exp_15);
		
		//exp_16 += s64_0(exp_15);
		//exp_17 += s64_0(exp_16);
		exp1617 = s64_0sse_acc(_mm_loadl_epi64(&exp[15]), exp1617);
		
		//struct pair temp;
		_mm_store_si128(&exp[16], exp1617);
		
		//----
		
		//         _mm_store_si128(&temp.x, exp1617);
		
		//temp.x[0] = exp_16;
		//temp.x[1] = exp_17;
		
		__m128i exp_1617 = exp1617;//_mm_load_si128(&exp[16]);
		
		__m128i exp1819 = evenodd;
		
		//exp_18 += s64_4( exp_16);
		//exp_19 += s64_4( exp_17);
		exp1819 = _mm_add_epi64(exp1819, s64_4sse(exp_1617));
		
		//exp_18 += r64_01(exp_03); // r64_01(exp_03) performs a shift left by 3 on exp_03 as well, as part of the rotate...
		//exp_19 += r64_01(exp_04);
		exp1819 = _mm_add_epi64(exp1819, r64_01sse(exp0304));
		
		//exp_18 += r64_02(exp_05);
		//exp_19 += r64_02(exp_06);
		exp1819 = _mm_add_epi64(exp1819, r64_02sse(exp_0506));
		
		//exp_18 += r64_03(exp_07);
		//exp_19 += r64_03(exp_08);
		exp1819 = _mm_add_epi64(exp1819, r64_03sse(exp_0708));
		
		//exp_18 += r64_04(exp_09);
		//exp_19 += r64_04(exp_10);
		exp1819 = _mm_add_epi64(exp1819, r64_04sse(exp_0910));
		
		//exp_18 += r64_05(exp_11); // s64_1(exp_13) and r64_06(exp_13) share one rotate, s64_0(exp_11) and r64_05(exp_11) share one rotate.
		//exp_19 += r64_05(exp_12); // s64_0(exp_12) and r64_05(exp_12) share one rotate. -ok
		exp1819 = _mm_add_epi64(exp1819, r64_05sse(exp_1112));
		
		//exp_18 += r64_06(exp_13);
		//exp_19 += r64_06(exp_14);
		exp1819 = _mm_add_epi64(exp1819, r64_06sse(exp_1314));
		
		//exp_18 += ((td64_02 + td64_05 - td64_12 + 0x5ffffffffffffffaull) ^ p512_09);
		//exp_19 += ((td64_03 + td64_06 - td64_13 + 0x655555555555554full) ^ p512_10);
		__m128i td64_0203 = _mm_load_si128(&td64[2]);
		__m128i td64_1213 = _mm_load_si128(&td64[12]);
		tdtemp = _mm_sub_epi64(td64_0203, td64_1213);
		__m128i td64_0506 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[05]),_mm_loadl_epi64(&td64[06]));
		tdtemp = _mm_add_epi64(tdtemp, td64_0506);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[2]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[9]),_mm_loadl_epi64(&constsFinal[10]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp1819 = _mm_add_epi64(tdtemp, exp1819);
		
		__m128i exp_1516 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[15]),_mm_loadl_epi64(&exp[16]));
		//exp_18 += r64_07(exp_15);
		//exp_19 += r64_07(exp_16);
		exp1819 = _mm_add_epi64(exp1819, r64_07sse(exp_1516));
		
		//exp_18 += s64_5( exp_17);
		//exp_19 += s64_5( exp_18);
		exp1819 = s64_5sse_acc(_mm_loadl_epi64(&exp[17]), exp1819);
		
		//struct pair temp;
		_mm_store_si128(&exp[18], exp1819);
		__m128i exp_1819 = exp1819;
		//exp_18 = temp.x[0];
		//exp_19 = temp.x[1];

		//exp[18] = exp_18;
		//exp[19] = exp_19;
		
		//XL64 = exp_16 =  exp[16];
		//XL64 ^= exp_17 = exp[17];
		//XL64 ^= exp_18 = exp[18];
		//XL64 ^= exp_19 = exp[19];
		__m128i XL64sse = _mm_xor_si128(exp_1617, exp_1819);

		/* expand32_22(20); */
		/* expand32_21(21); */
		//__m128i exp_0506 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[05]),_mm_loadl_epi64(&exp[06]));
		
		//exp_20 = r64_01(exp_05);
		//exp_21 = r64_01(exp_06);
		__m128i exp2021 = r64_01sse(exp_0506);
		
		
		//__m128i exp_0708 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[07]),_mm_loadl_epi64(&exp[8]));
		//exp_20 += r64_02(exp_07);
		//exp_21 += r64_02(exp_08);
		exp2021 = _mm_add_epi64(exp2021, r64_02sse(exp_0708));
		
		//__m128i exp_0910 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[9]),_mm_loadl_epi64(&exp[10]));
		//exp_20 += r64_03(exp_09);
		//exp_21 += r64_03(exp_10);
		exp2021 = _mm_add_epi64(exp2021, r64_03sse(exp_0910));
		
		//__m128i exp_1112 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[11]),_mm_loadl_epi64(&exp[12]));
		//exp_20 += r64_04(exp_11);
		//exp_21 += r64_04(exp_12);
		exp2021 = _mm_add_epi64(exp2021, r64_04sse(exp_1112));
		
		//__m128i exp_1314 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[13]),_mm_loadl_epi64(&exp[14]));
		//exp_21 += r64_05(exp_14);
		//exp_20 += r64_05(exp_13);
		exp2021 = _mm_add_epi64(exp2021, r64_05sse(exp_1314));
		
		//exp_1516 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[15]),_mm_loadl_epi64(&exp[16]));
		//exp_20 += r64_06(exp_15);
		//exp_21 += r64_06(exp_16);
		exp2021 = _mm_add_epi64(exp2021, r64_06sse(exp_1516));
		
		__m128i exp_1718 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[17]),_mm_loadl_epi64(&exp[18]));
		//exp_20 += r64_07(exp_17);
		//exp_21 += r64_07(exp_18);
		exp2021 = _mm_add_epi64(exp2021, r64_07sse(exp_1718));
		

		//__m128i exp_1819 = _mm_load_si128(&exp[18]);
		//exp_20 += s64_4( exp_18);
		//exp_21 += s64_4( exp_19);
		exp2021 = _mm_add_epi64(exp2021, s64_4sse(exp_1819));
		
		
		//exp_20 += ((td64_04 + td64_07 - td64_14 + 0x6aaaaaaaaaaaaaa4ull) ^ p512_11);
		//exp_21 += ((td64_05 + td64_08 - td64_15 + 0x6ffffffffffffff9ull) ^ p512_12);
		__m128i td64_0405 = _mm_load_si128(&td64[4]);
		__m128i td64_1415 = _mm_load_si128(&td64[14]);
		tdtemp = _mm_sub_epi64(td64_0405, td64_1415);
		__m128i td64_0708 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[07]),_mm_loadl_epi64(&td64[8]));
		tdtemp = _mm_add_epi64(tdtemp, td64_0708);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[4]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[11]),_mm_loadl_epi64(&constsFinal[12]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp2021 = _mm_add_epi64(tdtemp, exp2021);
		
		//TempEven64 = TempEven64 + exp_16 - exp_02; 
		//TempOdd64  = TempOdd64 + exp_17 - exp_03;
		evenodd = _mm_sub_epi64(evenodd, exp_0203);
		evenodd = _mm_add_epi64(evenodd, exp_1617);
		
		
		exp2021 = _mm_add_epi64(evenodd, exp2021);
		
		//---- 
		/* expand32_22(20); */
		//exp_20 += TempEven64;
		//exp_21 += TempOdd64;
		
		//exp_20 += s64_5( exp_19);
		//exp_21 += s64_5( exp_20);
		exp2021 = s64_5sse_acc(_mm_loadl_epi64(&exp[19]), exp2021);
		
		
		_mm_store_si128(&exp[20], exp2021);
		__m128i exp_2021 = exp2021;
		//exp_20 = temp.x[0];
		//exp_21 = temp.x[1];
		
		//XL64 ^= exp_20 = exp[20];
		//XL64 ^= exp_21 = exp[21];
		XL64sse = _mm_xor_si128(XL64sse, exp_2021);
		
		//exp[20] = exp_20;
		//exp[21] = exp_21;
		
		/* expand32_22(22); */
		/* expand32_21(23); */

		//exp_22 = r64_01(exp_07);
		//exp_23 = r64_01(exp_08);
		__m128i exp2223 = r64_01sse(exp_0708);
		
		//exp_22 += r64_02(exp_09);
		//exp_23 += r64_02(exp_10);
		exp2223 = _mm_add_epi64(exp2223, r64_02sse(exp_0910));
		
		//exp_22 += r64_03(exp_11);
		//exp_23 += r64_03(exp_12);
		exp2223 = _mm_add_epi64(exp2223, r64_03sse(exp_1112));
		
		//exp_22 += r64_04(exp_13);
		//exp_23 += r64_04(exp_14); // s64_0(exp_16) and r64_05(exp_16) share one rotate.
		exp2223 = _mm_add_epi64(exp2223, r64_04sse(exp_1314));
		
		//exp_22 += r64_05(exp_15); // s64_0(exp_15) and r64_05(exp_15) share one rotate. - ok
		//exp_23 += r64_05(exp_16);
		exp2223 = _mm_add_epi64(exp2223, r64_05sse(exp_1516));
		
		//exp_22 += r64_06(exp_17);
		//exp_23 += r64_06(exp_18);
		exp2223 = _mm_add_epi64(exp2223, r64_06sse(exp_1718));
		
		//exp_22 += ((td64_06 + td64_09 - td64_00 + 0x755555555555554eull) ^ p512_13);
		//exp_23 += ((td64_07 + td64_10 - td64_01 + 0x7aaaaaaaaaaaaaa3ull) ^ p512_14);
		__m128i td64_0607 = _mm_load_si128(&td64[6]);
		td64_0001 = _mm_load_si128(&td64[0]);
		tdtemp = _mm_sub_epi64(td64_0607, td64_0001);
		__m128i td64_0910 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[9]),_mm_loadl_epi64(&td64[10]));
		tdtemp = _mm_add_epi64(tdtemp, td64_0910);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[6]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[13]),_mm_loadl_epi64(&constsFinal[14]));
		
		
		//TempEven64 = TempEven64 + exp_18 - exp_04;
		//TempOdd64  = TempOdd64 + exp_19 - exp_05;
		//__m128i exp_1819 = _mm_load_si128(&exp[18]);
		evenodd = _mm_sub_epi64(evenodd, exp_0405);
		evenodd = _mm_add_epi64(evenodd, exp_1819);
		
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp2223 = _mm_add_epi64(tdtemp, exp2223);
		
		//exp_22 += TempEven64;
		//exp_23 += TempOdd64;
		exp2223 = _mm_add_epi64(evenodd, exp2223);
		
		__m128i exp_1920 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[19]),_mm_loadl_epi64(&exp[20]));
		//exp_22 += r64_07(exp_19);
		//exp_23 += r64_07(exp_20);
		exp2223 = _mm_add_epi64(exp2223, r64_07sse(exp_1920));
		
		//__m128i exp_2021 = _mm_load_si128(&exp[20]);
		//exp_22 += s64_4( exp_20);
		//exp_23 += s64_4( exp_21);
		exp2223 = _mm_add_epi64(exp2223, s64_4sse(exp_2021));
		
		//exp_22 += s64_5( exp_21);
		//exp_23 += s64_5( exp_22);
		exp2223 = s64_5sse_acc(_mm_loadl_epi64(&exp[21]), exp2223);
		
		_mm_store_si128(&exp[22], exp2223);
		__m128i exp_2223 = exp2223;
		//exp_22 = temp.x[0];
		//exp_23 = temp.x[1];
		
		
		//XL64 ^= exp_22 = exp[22];
		//XL64 ^= exp_23 = exp[23];
		XL64sse = _mm_xor_si128(XL64sse, exp_2223);
		
		//exp[22] = exp_22;
		//exp[23] = exp_23;
		
		/* expand32_22(24); */
		/* expand32_21(25); */
		
		//TempEven64 = TempEven64 + exp_20 - exp_06;
		//TempOdd64 = TempOdd64 + exp_21 - exp_07;
		evenodd = _mm_sub_epi64(evenodd, exp_0607);
		evenodd = _mm_add_epi64(evenodd, exp_2021);

		
		//exp_24 = r64_01(exp_09);
		//exp_25 = r64_01(exp_10);
		__m128i exp2425 = r64_01sse(exp_0910); 
		
		//exp_24 += TempEven64;
		//exp_25 += TempOdd64;
		exp2425 = _mm_add_epi64(evenodd, exp2425);
		
		
		//exp_24 += r64_02(exp_11);
		//exp_25 += r64_02(exp_12);
		exp2425 = _mm_add_epi64(exp2425, r64_02sse(exp_1112));
		
		//exp_24 += r64_03(exp_13);
		//exp_25 += r64_03(exp_14);
		exp2425 = _mm_add_epi64(exp2425, r64_03sse(exp_1314));
		
		//exp_24 += r64_04(exp_15);
		//exp_25 += r64_04(exp_16);
		exp2425 = _mm_add_epi64(exp2425, r64_04sse(exp_1516));
		
		//exp_24 += r64_05(exp_17);
		//exp_25 += r64_05(exp_18);
		exp2425 = _mm_add_epi64(exp2425, r64_05sse(exp_1718));
		
		//exp_24 += r64_06(exp_19);
		//exp_25 += r64_06(exp_20);
		exp2425 = _mm_add_epi64(exp2425, r64_06sse(exp_1920));
		
		__m128i exp_2122 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[21]),_mm_loadl_epi64(&exp[22]));
		//exp_24 += r64_07(exp_21);
		//exp_25 += r64_07(exp_22);
		exp2425 = _mm_add_epi64(exp2425, r64_07sse(exp_2122));
		
		//__m128i exp_2223 = _mm_load_si128(&exp[22]);
		//exp_24 += s64_4( exp_22);
		//exp_25 += s64_4( exp_23);
		exp2425 = _mm_add_epi64(exp2425, s64_4sse(exp_2223));
		
		//exp_24 += ((td64_08 + td64_11 - td64_02 + 0x7ffffffffffffff8ull) ^ p512_15);
		//exp_25 += ((td64_09 + td64_12 + 0x855555555555554dull - td64_03) ^ p512_00);
		__m128i td64_0809 = _mm_load_si128(&td64[8]);
		//td64_0001 = _mm_load_si128(&td64[0]);
		tdtemp = _mm_sub_epi64(td64_0809, td64_0203);
		__m128i td64_1112 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[11]),_mm_loadl_epi64(&td64[12]));
		tdtemp = _mm_add_epi64(tdtemp, td64_1112);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[8]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[15]),_mm_loadl_epi64(&constsFinal[0]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp2425 = _mm_add_epi64(tdtemp, exp2425);
		
		//exp_24 += s64_5( exp_23);
		//exp_25 += s64_5( exp_24);
		exp2425 = s64_5sse_acc(_mm_loadl_epi64(&exp[23]), exp2425);
		
		_mm_store_si128(&exp[24], exp2425);
		__m128i exp_2425 = exp2425;
		//exp_24 = temp.x[0];
		//exp_25 = temp.x[1];
		
		XL64sse = _mm_xor_si128(XL64sse, _mm_unpackhi_epi64(XL64sse, XL64sse));
		XL64sse = _mm_move_epi64(XL64sse);
		
		//_mm_storel_epi64(&XL64, XL64sse);
		
		//XL64 = 
		
		//exp_24 = exp[24];
		//XH64  =  XL64^exp_24;
		//XH64 ^= exp_25 = exp[25];
		__m128i XH64sse = _mm_xor_si128(XL64sse, exp_2425);
		
		
		//exp[24] = exp_24;
		//exp[25] = exp_25;
		
		
		/* expand32_22(26); */
		/* expand32_21(27); */
		//TempEven64 = TempEven64 + exp_22 - exp_08;
		//TempOdd64 = TempOdd64 + exp_23 - exp_09;
		evenodd = _mm_sub_epi64(evenodd, exp_0809);
		evenodd = _mm_add_epi64(evenodd, exp_2223);
		
		//exp_26 = r64_01(exp_11);
		//exp_27 = r64_01(exp_12);
		__m128i exp2627 = r64_01sse(exp_1112); 
		
		//exp_26 += TempEven64;
		//exp_27 += TempOdd64;
		exp2627 = _mm_add_epi64(evenodd, exp2627);
		
		//exp_26 += r64_02(exp_13);
		//exp_27 += r64_02(exp_14);
		exp2627 = _mm_add_epi64(exp2627, r64_02sse(exp_1314));
		
		//exp_26 += r64_03(exp_15);
		//exp_27 += r64_03(exp_16);
		exp2627 = _mm_add_epi64(exp2627, r64_03sse(exp_1516));
		
		//exp_26 += r64_04(exp_17);
		//exp_27 += r64_04(exp_18);
		exp2627 = _mm_add_epi64(exp2627, r64_04sse(exp_1718));
		
		//exp_26 += r64_05(exp_19);
		//exp_27 += r64_05(exp_20);
		exp2627 = _mm_add_epi64(exp2627, r64_05sse(exp_1920));
		
		//exp_26 += r64_06(exp_21);
		//exp_27 += r64_06(exp_22);
		exp2627 = _mm_add_epi64(exp2627, r64_06sse(exp_2122));
		
		__m128i exp_2324 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[23]),_mm_loadl_epi64(&exp[24]));
		//exp_26 += r64_07(exp_23);
		//exp_27 += r64_07(exp_24);
		exp2627 = _mm_add_epi64(exp2627, r64_07sse(exp_2324));
		
		//__m128i exp_2425 = _mm_load_si128(&exp[24]);
		//exp_26 += s64_4( exp_24);
		//exp_27 += s64_4( exp_25);
		exp2627 = _mm_add_epi64(exp2627, s64_4sse(exp_2425));
		
		//exp_26 += ((td64_10 + td64_13 - td64_04 + 0x8aaaaaaaaaaaaaa2ull) ^ p512_01);
		//exp_27 += ((td64_11 + td64_14 - td64_05 + 0x8ffffffffffffff7ull) ^ p512_02);
		//td64_1011 = _mm_load_si128(&td64[10]);
		//td64_0405 = _mm_load_si128(&td64[4]);
		tdtemp = _mm_sub_epi64(td64_1011, td64_0405);
		__m128i td64_1314 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[13]),_mm_loadl_epi64(&td64[14]));
		tdtemp = _mm_add_epi64(tdtemp, td64_1314);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[10]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[1]),_mm_loadl_epi64(&constsFinal[2]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp2627 = _mm_add_epi64(tdtemp, exp2627);

		//exp_26 += s64_5( exp_25);
		//exp_27 += s64_5( exp_26);
		exp2627 = s64_5sse_acc(_mm_loadl_epi64(&exp[25]), exp2627);
		
		_mm_store_si128(&exp[26], exp2627);
		__m128i exp_2627 = exp2627;
		//exp_26 = temp.x[0];
		//exp_27 = temp.x[1];
		
		//XH64 ^= exp_26 = exp[26];
		//XH64 ^= exp_27 = exp[27];
		XH64sse = _mm_xor_si128(XH64sse, exp_2627);

		//exp[26] = exp_26;
		//exp[27] = exp_27;
		
		/* expand32_22(28); */
		/* expand32_21(29); */
		
		//TempEven64 = TempEven64 + exp_24 - exp_10;
		//TempOdd64 = TempOdd64 + exp_25 - exp_11;
		evenodd = _mm_sub_epi64(evenodd, exp_1011);
		evenodd = _mm_add_epi64(evenodd, exp_2425);
		
		//exp_28 = r64_01(exp_13);
		//exp_29 = r64_01(exp_14);
		__m128i exp2829 = r64_01sse(exp_1314);
		
		//exp_28 += TempEven64;
		//exp_29 += TempOdd64;
		exp2829 = _mm_add_epi64(evenodd, exp2829);
		
		//exp_28 += r64_02(exp_15);
		//exp_29 += r64_02(exp_16);
		exp2829 = _mm_add_epi64(exp2829, r64_02sse(exp_1516));
		
		//exp_28 += r64_03(exp_17);
		//exp_29 += r64_03(exp_18);
		exp2829 = _mm_add_epi64(exp2829, r64_03sse(exp_1718));
		
		//exp_28 += r64_04(exp_19);
		//exp_29 += r64_04(exp_20);
		exp2829 = _mm_add_epi64(exp2829, r64_04sse(exp_1920));
		
		//exp_28 += r64_05(exp_21);
		//exp_29 += r64_05(exp_22);
		exp2829 = _mm_add_epi64(exp2829, r64_05sse(exp_2122));
		
		//exp_28 += r64_06(exp_23);
		//exp_29 += r64_06(exp_24);
		exp2829 = _mm_add_epi64(exp2829, r64_06sse(exp_2324));
		
		__m128i exp_2526 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[25]),_mm_loadl_epi64(&exp[26]));
		//exp_28 += r64_07(exp_25);
		//exp_29 += r64_07(exp_26);
		exp2829 = _mm_add_epi64(exp2829, r64_07sse(exp_2526));
		
		//__m128i exp_2627 = _mm_load_si128(&exp[26]);
		//exp_28 += s64_4( exp_26);
		//exp_29 += s64_4( exp_27);
		exp2829 = _mm_add_epi64(exp2829, s64_4sse(exp_2627));
		
		
		//exp_28 += ((td64_12 + td64_15 - td64_06 + 0x955555555555554cull) ^ p512_03);
		//exp_29 += ((td64_13 + td64_00 - td64_07 +  0x9aaaaaaaaaaaaaa1ull) ^ p512_04);
		tdtemp = _mm_sub_epi64(td64_1213, td64_0607);
		__m128i td64_1500 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[15]),_mm_loadl_epi64(&td64[00]));
		tdtemp = _mm_add_epi64(tdtemp, td64_1500);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[12]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[3]),_mm_loadl_epi64(&constsFinal[4]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp2829 = _mm_add_epi64(tdtemp, exp2829);
		
		//exp_28 += s64_5( exp_27);
		//exp_29 += s64_5( exp_28);
		exp2829 = s64_5sse_acc(_mm_loadl_epi64(&exp[27]), exp2829);
		
		_mm_store_si128(&exp[28], exp2829);
		__m128i exp_2829 = exp2829;
		//exp_28 = temp.x[0];
		//exp_29 = temp.x[1];
		
		//XH64 ^= exp_28 = exp[28];
		//XH64 ^= exp_29 = exp[29];
		XH64sse = _mm_xor_si128(XH64sse, exp_2829);
		
		//exp[28] = exp_28;
		//exp[29] = exp_29;
		
		
		/* expand32_22(30); */
		/* expand32_21(31); */
		//TempEven64 = TempEven64 + exp_26 - exp_12;
		//TempOdd64 = TempOdd64 + exp_27 - exp_13;
		evenodd = _mm_sub_epi64(evenodd, exp_1213);
		evenodd = _mm_add_epi64(evenodd, exp_2627);
		
		//_mm_store_si128(&temp.x, evenodd);
		//TempEven64 = temp.x[0];
		//TempOdd64  = temp.x[1];
		
		//exp_30 = r64_01(exp_15);
		//exp_31 = r64_01(exp_16);
		__m128i exp3031 = r64_01sse(exp_1516);
		
		//exp_30 += TempEven64;
		//exp_31 += TempOdd64;
		exp3031 = _mm_add_epi64(evenodd, exp3031);
		
		//exp_30 += r64_02(exp_17);
		//exp_31 += r64_02(exp_18);
		exp3031 = _mm_add_epi64(exp3031, r64_02sse(exp_1718));
		
		//exp_30 += r64_03(exp_19);
		//exp_31 += r64_03(exp_20);
		exp3031 = _mm_add_epi64(exp3031, r64_03sse(exp_1920));
		
		//exp_30 += r64_04(exp_21);
		//exp_31 += r64_04(exp_22);
		exp3031 = _mm_add_epi64(exp3031, r64_04sse(exp_2122));
		
		//exp_30 += r64_05(exp_23);
		//exp_31 += r64_05(exp_24);
		exp3031 = _mm_add_epi64(exp3031, r64_05sse(exp_2324));
		
		//exp_30 += r64_06(exp_25);
		//exp_31 += r64_06(exp_26);
		exp3031 = _mm_add_epi64(exp3031, r64_06sse(exp_2526));
		
		__m128i exp_2728 = _mm_unpacklo_epi64(_mm_loadl_epi64(&exp[27]),_mm_loadl_epi64(&exp[28]));
		//exp_30 += r64_07(exp_27);
		//exp_31 += r64_07(exp_28);
		exp3031 = _mm_add_epi64(exp3031, r64_07sse(exp_2728));
		
		//__m128i exp_2829 = _mm_load_si128(&exp[28]);
		//exp_30 += s64_4( exp_28);
		//exp_31 += s64_4( exp_29);
		exp3031 = _mm_add_epi64(exp3031, s64_4sse(exp_2829));
		
		//exp_30 += ((td64_14 + td64_01 - td64_08 + 0x9ffffffffffffff6ull) ^ p512_05);
		//exp_31 += ((td64_15 + td64_02 - td64_09 + 0xa55555555555554bull) ^ p512_06);
		tdtemp = _mm_sub_epi64(td64_1415, td64_0809);
		__m128i td64_0102 = _mm_unpacklo_epi64(_mm_loadl_epi64(&td64[1]),_mm_loadl_epi64(&td64[2]));
		tdtemp = _mm_add_epi64(tdtemp, td64_0102);
		tdtemp = _mm_add_epi64(tdtemp, _mm_load_si128(&consts[14]));
		
		p512temp = _mm_unpacklo_epi64(_mm_loadl_epi64(&constsFinal[5]),_mm_loadl_epi64(&constsFinal[6]));
		tdtemp = _mm_xor_si128(tdtemp, p512temp);//_mm_load_si128(&temp.x));
		exp3031 = _mm_add_epi64(tdtemp, exp3031);
		
		//exp_30 += s64_5( exp_29);
		//exp_31 += s64_5( exp_30);
		exp3031 = s64_5sse_acc(_mm_loadl_epi64(&exp[29]), exp3031);
		
		_mm_store_si128(&exp[30], exp3031);
		__m128i exp_3031 = exp3031;
		
		//XH64 ^= exp_30 = exp[30];
		//XH64 ^= exp_31 = exp[31];
		XH64sse = _mm_xor_si128(XH64sse, exp_3031);
		
		XH64sse = _mm_xor_si128(XH64sse, _mm_unpackhi_epi64(XH64sse, XH64sse));
		//XH64sse = _mm_move_epi64(XH64sse);
		
		    //_mm_storel_epi64(&XH64, XH64sse);
		
		__m128i XH64_2 = _mm_unpacklo_epi64(XH64sse, XH64sse);
		
		__m128i XL64_2 = XL64sse;
		XL64_2 = _mm_unpacklo_epi64(XL64_2, XL64_2);

		/*  Compute the double chaining pipe for the next message block. */
		//p512[00] = (    XL64    ^ exp[24] ^ exp[00]); 
		//p512[01] = (    XL64    ^ exp[25] ^ exp[01]);
		p512_0001 = _mm_xor_si128(XL64_2, exp_0001); // Change to manual load?
		p512_0001 = _mm_xor_si128(p512_0001, exp_2425);
		//_mm_store_si128(&p512[00], p512_0001);
		
		
		//p512[02] = (    XL64    ^ exp[26] ^ exp[02]);
		//p512[03] = (    XL64    ^ exp[27] ^ exp[03]);
		p512_0203 = _mm_xor_si128(XL64_2, exp_0203); // Change to manual load?
		p512_0203 = _mm_xor_si128(p512_0203, exp_2627);
		//_mm_store_si128(&p512[02], p512_0203);
		
		
		//p512[04] = (    XL64    ^ exp[28] ^ exp[04]);
		//p512[05] = (    XL64    ^ exp[29] ^ exp[05]);
		p512_0405 = _mm_xor_si128(XL64_2, exp_0405); // Change to manual load?
		p512_0405 = _mm_xor_si128(p512_0405, exp_2829);
		//_mm_store_si128(&p512[04], p512_0405);
		
		
		//p512[06] = (    XL64    ^ exp[30] ^ exp[06]);
		//p512[07] = (    XL64    ^ exp[31] ^ exp[07]);
		p512_0607 = _mm_xor_si128(XL64_2, exp_0607); // Change to manual load?
		p512_0607 = _mm_xor_si128(p512_0607, exp_3031);
		//_mm_store_si128(&p512[06], p512_0607);
		
		
		//p512[00] +=                       (shl(XH64, 5) ^ shr(exp[16],5) ^ data64[ 0]);
		//p512[01] +=                       (shr(XH64, 7) ^ shl(exp[17],8) ^ data64[ 1]);
		__m128i XH64_tmp1 = _mm_slli_epi64(XH64_2, 5);
		__m128i XH64_tmp2 = _mm_srli_epi64(XH64_2, 7);
		XH64_tmp1 = _mm_unpacklo_epi64(XH64_tmp1, XH64_tmp2);
		__m128i exp_tmp1 = _mm_srli_epi64(_mm_loadl_epi64(&exp[16]), 5); // Change to 1 load+unpack?
		__m128i exp_tmp2 = _mm_slli_epi64(_mm_loadl_epi64(&exp[17]), 8);
		exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&hashState512(state)->DoublePipe[0])); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[00]),_mm_loadl_epi64(&data64[01])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XH64_tmp1);
		
		p512_0001 = _mm_add_epi64(p512_0001, exp_tmp1);
		_mm_store_si128(&p512[00], p512_0001);
		
		
		//p512[02] +=                       (shr(XH64, 5) ^ shl(exp[18],5) ^ data64[ 2]);
		//p512[03] +=                       (shr(XH64, 1) ^ shl(exp[19],5) ^ data64[ 3]);
		XH64_tmp1 = _mm_srli_epi64(XH64_2, 5);
		XH64_tmp2 = _mm_srli_epi64(XH64_2, 1);
		XH64_tmp1 = _mm_unpacklo_epi64(XH64_tmp1, XH64_tmp2);
		exp_tmp1 = _mm_slli_epi64(_mm_load_si128(&exp[18]), 5);
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&hashState512(state)->DoublePipe[2])); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[00]),_mm_loadl_epi64(&data64[01])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XH64_tmp1);
		
		p512_0203 = _mm_add_epi64(p512_0203, exp_tmp1);
		_mm_store_si128(&p512[02], p512_0203);
		
		
		
		//p512[04] +=                       (shr(XH64, 3) ^     exp[20]    ^ data64[ 4]);
		//p512[05] +=                       (shl(XH64, 6) ^ shr(exp[21],6) ^ data64[ 5]);
		XH64_tmp1 = _mm_srli_epi64(XH64_2, 3);
		XH64_tmp2 = _mm_slli_epi64(XH64_2, 6);
		XH64_tmp1 = _mm_unpacklo_epi64(XH64_tmp1, XH64_tmp2);
		exp_tmp1 = _mm_loadl_epi64(&exp[20]); // Change to 1 load+unpack?
		exp_tmp2 = _mm_srli_epi64(_mm_loadl_epi64(&exp[21]), 6);
		exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&hashState512(state)->DoublePipe[4])); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[00]),_mm_loadl_epi64(&data64[01])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XH64_tmp1);
		
		p512_0405 = _mm_add_epi64(p512_0405, exp_tmp1);
		_mm_store_si128(&p512[04], p512_0405);
		
		
		//p512[06] +=                       (shr(XH64, 4) ^ shl(exp[22],6) ^ data64[ 6]);
		//p512[07] +=                       (shr(XH64,11) ^ shl(exp[23],2) ^ data64[ 7]);
		XH64_tmp1 = _mm_srli_epi64(XH64_2, 4);
		XH64_tmp2 = _mm_srli_epi64(XH64_2, 11);
		XH64_tmp1 = _mm_unpacklo_epi64(XH64_tmp1, XH64_tmp2);
		exp_tmp1 = _mm_slli_epi64(_mm_loadl_epi64(&exp[22]), 6); // Change to 1 load+unpack?
		exp_tmp2 = _mm_slli_epi64(_mm_loadl_epi64(&exp[23]), 2);
		exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&hashState512(state)->DoublePipe[6])); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[00]),_mm_loadl_epi64(&data64[01])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XH64_tmp1);
		
		p512_0607 = _mm_add_epi64(p512_0607, exp_tmp1);
		_mm_store_si128(&p512[06], p512_0607);
		
		
		//p512[ 8] = (shl(XL64,8) ^ exp[23] ^ exp[8]);
		//p512[ 9] = (shr(XL64,6) ^ exp[16] ^ exp[9]);
		__m128i XL64_tmp1 = _mm_slli_epi64(XL64_2, 8);
		__m128i XL64_tmp2 = _mm_srli_epi64(XL64_2, 6);
		XL64_tmp1 = _mm_unpacklo_epi64(XL64_tmp1, XL64_tmp2);
		exp_tmp1 = _mm_loadl_epi64(&exp[23]);
		exp_tmp2 = _mm_loadl_epi64(&exp[16]);
		exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&exp[8]));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XL64_tmp1);
		p512_0809 = exp_tmp1;
		//_mm_store_si128(&p512[8], exp_tmp1);
		
		
		
		//p512[10] = (shl(XL64,6) ^ exp[17] ^ exp[10]);
		//p512[11] = (shl(XL64,4) ^ exp[18] ^ exp[11]);
		XL64_tmp1 = _mm_slli_epi64(XL64_2, 6);
		XL64_tmp2 = _mm_slli_epi64(XL64_2, 4);
		XL64_tmp1 = _mm_unpacklo_epi64(XL64_tmp1, XL64_tmp2);
		//exp_tmp1 = _mm_loadl_epi64(&exp[17]); // TODO: test performance:
		//exp_tmp2 = _mm_loadl_epi64(&exp[18]);
		//exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		exp_tmp1 = exp_1718;
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&exp[10]));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XL64_tmp1);
		p512_1011 = exp_tmp1;
		//_mm_store_si128(&p512[10], exp_tmp1);
		
		
		//p512[12] = (shr(XL64,3) ^ exp[19] ^ exp[12]);
		//p512[13] = (shr(XL64,4) ^ exp[20] ^ exp[13]);
		XL64_tmp1 = _mm_srli_epi64(XL64_2, 3);
		XL64_tmp2 = _mm_srli_epi64(XL64_2, 4);
		XL64_tmp1 = _mm_unpacklo_epi64(XL64_tmp1, XL64_tmp2);
		//exp_tmp1 = _mm_loadl_epi64(&exp[19]); // TODO: test performance:
		//exp_tmp2 = _mm_loadl_epi64(&exp[20]);
		//exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		exp_tmp1 = exp_1920;
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&exp[12]));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XL64_tmp1);
		//_mm_store_si128(&p512[12], exp_tmp1);
		p512_1213 = exp_tmp1;
		
		//p512[14] = (shr(XL64,7) ^ exp[21] ^ exp[14]);
		//p512[15] = (shr(XL64,2) ^ exp[22] ^ exp[15]);
		XL64_tmp1 = _mm_srli_epi64(XL64_2, 7);
		XL64_tmp2 = _mm_srli_epi64(XL64_2, 2);
		XL64_tmp1 = _mm_unpacklo_epi64(XL64_tmp1, XL64_tmp2);
		//exp_tmp1 = _mm_loadl_epi64(&exp[21]); // TODO: test performance:
		//exp_tmp2 = _mm_loadl_epi64(&exp[22]);
		//exp_tmp1 = _mm_unpacklo_epi64(exp_tmp1, exp_tmp2);
		exp_tmp1 = exp_2122;
		
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&exp[14]));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, XL64_tmp1);
		//_mm_store_si128(&p512[14], exp_tmp1);
		p512_1415 = exp_tmp1;
		
		
		//p512[ 8] += (    XH64     ^     exp[24]    ^ data64[ 8]);
		//p512[ 9] += (    XH64     ^     exp[25]    ^ data64[ 9]);
		exp_tmp1 = _mm_xor_si128(XH64_2, _mm_load_si128(&exp[24])); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[08]),_mm_loadl_epi64(&data64[09])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&hashState512(state)->DoublePipe[8]));
		p512_0809 = _mm_add_epi64(p512_0809, exp_tmp1);
		//_mm_store_si128(&p512[8], p512_0809);
		
		
		//p512[10] += (    XH64     ^     exp[26]    ^ data64[10]);
		//p512[11] += (    XH64     ^     exp[27]    ^ data64[11]);
		exp_tmp1 = _mm_xor_si128(XH64_2, _mm_load_si128(&exp[26])); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[08]),_mm_loadl_epi64(&data64[09])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&hashState512(state)->DoublePipe[10]));
		p512_1011 = _mm_add_epi64(p512_1011, exp_tmp1);
		//_mm_store_si128(&p512[10], p512_1011);
		
		
		//p512[12] += (    XH64     ^     exp[28]    ^ data64[12]);
		//p512[13] += (    XH64     ^     exp[29]    ^ data64[13]);
		exp_tmp1 = _mm_xor_si128(XH64_2, _mm_load_si128(&exp[28])); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[08]),_mm_loadl_epi64(&data64[09])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&hashState512(state)->DoublePipe[12]));
		p512_1213 = _mm_add_epi64(p512_1213, exp_tmp1);
		//_mm_store_si128(&p512[12], p512_1213);
		
		
		//p512[14] += (    XH64     ^     exp[30]    ^ data64[14]);
		//p512[15] += (    XH64     ^     exp[31]    ^ data64[15]);
		exp_tmp1 = _mm_xor_si128(XH64_2, _mm_load_si128(&exp[30])); // TODO: test performance:
		//exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_unpacklo_epi64(_mm_loadl_epi64(&data64[08]),_mm_loadl_epi64(&data64[09])));
		exp_tmp1 = _mm_xor_si128(exp_tmp1, _mm_load_si128(&hashState512(state)->DoublePipe[14]));
		p512_1415 = _mm_add_epi64(p512_1415, exp_tmp1);
		//_mm_store_si128(&p512[14], p512_1415);
		
		
		
		//p512[ 8] += rotl64(p512[04], 9);
		roll9 = roll64_9sse(p512_0405);
		
		//p512[10] += rotl64(p512[06],11);
		roll11 = roll64_11sse(p512_0607);

		//p512[ 9] += rotl64(p512[05],10);
		//p512[11] += rotl64(p512[07],12);
		roll1012 = roll64_1sse(_mm_unpackhi_epi64(roll9, roll11));
		
		_mm_store_si128(&p512[8], _mm_add_epi64(p512_0809, _mm_unpacklo_epi64(roll9, roll1012)));
		// TODO: fix hack for gcc 4.4 compiler
		//_mm_store_si128(&p512[10], _mm_add_epi64(p512_1011, _mm_unpackhi_epi64(roll11, roll1012)));
		_mm_store_si128(&p512[10], _mm_add_epi64(p512_1011, roll1012));
		//_mm_storeh_pd(&p512[11], (__m128d) _mm_add_epi64(p512_1011, roll1012));
		_mm_storel_epi64(&p512[10], _mm_add_epi64(p512_1011, roll11));
	
		
		
		//p512[12] += rotl64(p512[00],13);
		roll13 = roll64_13sse(p512_0001);
		
		//p512[14] += rotl64(p512[02],15);
		roll15 = roll64_15sse(p512_0203);
		
		//p512[13] += rotl64(p512[01],14);
		//p512[15] += rotl64(p512[03],16);
		roll1416 = roll64_1sse(_mm_unpackhi_epi64(roll13, roll15));
		
		_mm_store_si128(&p512[12], _mm_add_epi64(p512_1213, _mm_unpacklo_epi64(roll13, roll1416)));
		// TODO: fix hack for gcc 4.4 compiler
		_mm_store_si128(&p512[14], _mm_add_epi64(p512_1415, roll1416));
		//_mm_storeh_pd(&p512[15], (__m128d) _mm_add_epi64(p512_1415, roll1416));
		_mm_storel_epi64(&p512[14], _mm_add_epi64(p512_1415, roll15));
	}
	
	// Only update the last part of the double pipe:
	_mm_store_si128(&hashState512(state)->DoublePipe[8], _mm_load_si128(&p512[8]));
	_mm_store_si128(&hashState512(state)->DoublePipe[10], _mm_load_si128(&p512[10]));
	_mm_store_si128(&hashState512(state)->DoublePipe[12], _mm_load_si128(&p512[12]));
	_mm_store_si128(&hashState512(state)->DoublePipe[14], _mm_load_si128(&p512[14]));
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
