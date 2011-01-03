/*
 * file        : fugue_vperm.c
 * version     : 1.0.208
 * date        : 14.12.2010
 * 
 * - vperm and aes_ni implementations of hash function Fugue
 * - implements NIST hash api
 * - assumes that message lenght is multiple of 8-bits
 * - _FUGUE_VPERM_ must be defined if compiling with ../main.c
 * - default version is vperm, define AES_NI for aes_ni version
 * 
 * Cagdas Calik
 * ccalik@metu.edu.tr
 * Institute of Applied Mathematics, Middle East Technical University, Turkey.
 *
 */


#include <memory.h>
#include "hash_api.h"
#include "vperm.h"


#ifdef AES_NI
#include <wmmintrin.h>
#else
#include <tmmintrin.h>
#endif



MYALIGN const unsigned int _k_s0F[] = {0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F, 0x0F0F0F0F};
MYALIGN const unsigned int _k_ipt[] = {0x5A2A7000, 0xC2B2E898, 0x52227808, 0xCABAE090, 0x317C4D00, 0x4C01307D, 0xB0FDCC81, 0xCD80B1FC};
MYALIGN const unsigned int _k_opt[] = {0xD6B66000, 0xFF9F4929, 0xDEBE6808, 0xF7974121, 0x50BCEC00, 0x01EDBD51, 0xB05C0CE0, 0xE10D5DB1};
MYALIGN const unsigned int _k_inv[] = {0x0D080180, 0x0E05060F, 0x0A0B0C02, 0x04070309, 0x0F0B0780, 0x01040A06, 0x02050809, 0x030D0E0C};
MYALIGN const unsigned int _k_sb1[] = {0xCB503E00, 0xB19BE18F, 0x142AF544, 0xA5DF7A6E, 0xFAE22300, 0x3618D415, 0x0D2ED9EF, 0x3BF7CCC1};
MYALIGN const unsigned int _k_sb2[] = {0x0B712400, 0xE27A93C6, 0xBC982FCD, 0x5EB7E955, 0x0AE12900, 0x69EB8840, 0xAB82234A, 0xC2A163C8};
MYALIGN const unsigned int _k_sb3[] = {0xC0211A00, 0x53E17249, 0xA8B2DA89, 0xFB68933B, 0xF0030A00, 0x5FF35C55, 0xA6ACFAA5, 0xF956AF09};
MYALIGN const unsigned int _k_sb4[] = {0x3FD64100, 0xE1E937A0, 0x49087E9F, 0xA876DE97, 0xC393EA00, 0x3D50AED7, 0x876D2914, 0xBA44FE79};
MYALIGN const unsigned int _k_sb5[] = {0xF4867F00, 0x5072D62F, 0x5D228BDB, 0x0DA9A4F9, 0x3971C900, 0x0B487AC2, 0x8A43F0FB, 0x81B332B8};
MYALIGN const unsigned int _k_sb7[] = {0xFFF75B00, 0xB20845E9, 0xE1BAA416, 0x531E4DAC, 0x3390E000, 0x62A3F282, 0x21C1D3B1, 0x43125170};
MYALIGN const unsigned int _k_sbo[] = {0x6FBDC700, 0xD0D26D17, 0xC502A878, 0x15AABF7A, 0x5FBB6A00, 0xCFE474A5, 0x412B35FA, 0x8E1E90D1};
MYALIGN const unsigned int _k_h63[] = {0x63636363, 0x63636363, 0x63636363, 0x63636363};
MYALIGN const unsigned int _k_hc6[] = {0xc6c6c6c6, 0xc6c6c6c6, 0xc6c6c6c6, 0xc6c6c6c6};
MYALIGN const unsigned int _k_h5b[] = {0x5b5b5b5b, 0x5b5b5b5b, 0x5b5b5b5b, 0x5b5b5b5b};
MYALIGN const unsigned int _k_h4e[] = {0x4e4e4e4e, 0x4e4e4e4e, 0x4e4e4e4e, 0x4e4e4e4e};
MYALIGN const unsigned int _k_h0e[] = {0x0e0e0e0e, 0x0e0e0e0e, 0x0e0e0e0e, 0x0e0e0e0e};
MYALIGN const unsigned int _k_h15[] = {0x15151515, 0x15151515, 0x15151515, 0x15151515};
MYALIGN const unsigned int _k_aesmix1[] = {0x0f0a0500, 0x030e0904, 0x07020d08, 0x0b06010c};
MYALIGN const unsigned int _k_aesmix2[] = {0x000f0a05, 0x04030e09, 0x0807020d, 0x0c0b0601};
MYALIGN const unsigned int _k_aesmix3[] = {0x05000f0a, 0x0904030e, 0x0d080702, 0x010c0b06};
MYALIGN const unsigned int _k_aesmix4[] = {0x0a05000f, 0x0e090403, 0x020d0807, 0x06010c0b};



MYALIGN const unsigned long long _supermix1a[]	= {0x0202010807020100, 0x0a05000f06010c0b};
MYALIGN const unsigned long long _supermix1b[]	= {0x0b0d080703060504, 0x0e0a090c050e0f0a};
MYALIGN const unsigned long long _supermix1c[]	= {0x0402060c070d0003, 0x090a060580808080};
MYALIGN const unsigned long long _supermix1d[]	= {0x808080800f0e0d0c, 0x0f0e0d0c80808080};
MYALIGN const unsigned long long _supermix2a[]	= {0x07020d0880808080, 0x0b06010c050e0f0a};
MYALIGN const unsigned long long _supermix4a[]	= {0x000f0a050c0b0601, 0x0302020404030e09};
MYALIGN const unsigned long long _supermix4b[]	= {0x07020d08080e0d0d, 0x07070908050e0f0a};
MYALIGN const unsigned long long _supermix4c[]	= {0x0706050403020000, 0x0302000007060504};
MYALIGN const unsigned long long _supermix7a[]	= {0x010c0b060d080702, 0x0904030e03000104};
MYALIGN const unsigned long long _supermix7b[]	= {0x8080808080808080, 0x0504070605040f06};
MYALIGN const unsigned long long _k_n[] = {0x4E4E4E4E4E4E4E4E, 0x1B1B1B1B0E0E0E0E};
MYALIGN const unsigned int _maskd3n[] = {0xffffffff, 0xffffffff, 0xffffffff, 0x00000000};
MYALIGN const unsigned char _shift_one_mask[]   = {7, 4, 5, 6, 11, 8, 9, 10, 15, 12, 13, 14, 3, 0, 1, 2};
MYALIGN const unsigned char _shift_four_mask[]  = {13, 14, 15, 12, 1, 2, 3, 0, 5, 6, 7, 4, 9, 10, 11, 8};
MYALIGN const unsigned char _shift_seven_mask[] = {10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5};
MYALIGN const unsigned char _aes_shift_rows[]   = {0, 5, 10, 15, 4, 9, 14, 3, 8, 13, 2, 7, 12, 1, 6, 11};
MYALIGN const unsigned int _inv_shift_rows[] = {0x070a0d00, 0x0b0e0104, 0x0f020508, 0x0306090c};
MYALIGN const unsigned int _zero[] = {0x00000000, 0x00000000, 0x00000000, 0x00000000};
MYALIGN const unsigned int _mul2mask[] = {0x1b1b0000, 0x00000000, 0x00000000, 0x00000000};
MYALIGN const unsigned int _mul4mask[] = {0x2d361b00, 0x00000000, 0x00000000, 0x00000000};
MYALIGN const unsigned int _lsbmask2[] = {0x03030303, 0x03030303, 0x03030303, 0x03030303};



MYALIGN const unsigned int _IV256[] = 	{	
			0x00000000, 0xdebd52e9, 0x5f137166, 0x00000000, 
			0x68f6d4e0, 0x94b5b0d2, 0x1d626cf9, 0x00000000,	
			0xde29f9fb,	0x99e84991,	0x48c2f834, 0x00000000};

MYALIGN const unsigned int _IV384[] =	{	
			0x0dec61aa, 0x1f2e2531, 0xc7b41da0, 0x00000000,
			0x85096000, 0x4af45e21, 0x9c5e1b74, 0x00000000,
			0x9a3e69fa, 0x40b03e47, 0x8aae02e5, 0x00000000,
			0xe0259ca9, 0x7c5195bc, 0xa195105c, 0x00000000};

MYALIGN const unsigned int _IV512[] = {		
			0x00000000, 0x00000000,	0x7ea50788, 0x00000000,
			0x75af16e6, 0xdbe4d3c5, 0x27b09aac, 0x00000000,
			0x17f115d9, 0x54cceeb6, 0x0b02e806, 0x00000000,
			0xd1ef924a, 0xc9e2c6aa, 0x9813b2dd, 0x00000000,
			0x3858e6ca, 0x3f207f43, 0xe778ea25, 0x00000000,
			0xd6dd1f95, 0x1dd16eda, 0x67353ee1, 0x00000000};

#include "crypto_hash.h"

 int crypto_hash(
   unsigned char *out,
   const unsigned char *in,
   unsigned long long inlen
 )
 {

	 if(Hash(512, in, inlen * 8, out) == SUCCESS) 
		 return 0;
	 
	 return -1;
 }

/*
int main()
{
	return 0;
}
*/

// SSE 4.1
//#define PACK_S0(s0, s1, t1)\
//		s0 = _mm_castps_si128(_mm_insert_ps(_mm_castsi128_ps(s0), _mm_castsi128_ps(s1), 0x30))

#define PACK_S0(s0, s1, t1)\
	t1 = _mm_shuffle_epi32(s1, _MM_SHUFFLE(0, 3, 3, 3));\
	s0 = _mm_xor_si128(s0, t1);


// SSE 4.1
//#define UNPACK_S0(s0, s1, t1)\
//		s1 = _mm_castps_si128(_mm_insert_ps(_mm_castsi128_ps(s1), _mm_castsi128_ps(s0), 0xc0));\
//		s0 = _mm_and_si128(s0, M128(_maskd3n))

#define UNPACK_S0(s0, s1, t1)\
	t1 = _mm_shuffle_epi32(s0, _MM_SHUFFLE(3, 3, 3, 3));\
	s1 = _mm_castps_si128(_mm_move_ss(_mm_castsi128_ps(s1), _mm_castsi128_ps(t1)));\
	s0 = _mm_and_si128(s0, M128(_maskd3n))

//#define CMIX(s1, s2, r1, r2, t1, t2)\
//	t1 = s1;\
//	t1 = _mm_castps_si128(_mm_shuffle_ps(_mm_castsi128_ps(t1), _mm_castsi128_ps(s2), _MM_SHUFFLE(3, 0, 2, 1)));\
//	r1 = _mm_xor_si128(r1, t1);\
//	r2 = _mm_xor_si128(r2, t1);

#define CMIX(s1, s2, r1, r2, t1, t2)\
	t1 = _mm_shuffle_epi32(s1, 0xf9);\
	t2 = _mm_shuffle_epi32(s2, 0xcf);\
	t1 = _mm_xor_si128(t1, t2);\
	r1 = _mm_xor_si128(r1, t1);\
	r2 = _mm_xor_si128(r2, t1)

#ifdef AES_NI
#define TIX256(msg, s10, s8, s24, s0, t1, t2, t3)\
	t1 = _mm_shuffle_epi32(s0, _MM_SHUFFLE(3, 3, 0, 3));\
	s10 = _mm_xor_si128(s10, t1);\
	t1 = _mm_castps_si128(_mm_load_ss((float*)msg));\
	s0 = _mm_castps_si128(_mm_move_ss(_mm_castsi128_ps(s0), _mm_castsi128_ps(t1)));\
	t1 = _mm_slli_si128(t1, 8);\
	s8 = _mm_xor_si128(s8, t1);\
	t1 = _mm_shuffle_epi32(s24, _MM_SHUFFLE(3, 3, 0, 3));\
	s0 = _mm_xor_si128(s0, t1)
#else
#define TIX256(msg, s10, s8, s24, s0, t1, t2, t3)\
	t1 = _mm_shuffle_epi32(s0, _MM_SHUFFLE(3, 3, 0, 3));\
	s10 = _mm_xor_si128(s10, t1);\
	t1 = _mm_castps_si128(_mm_load_ss((float*)msg));\
	TRANSFORM(t1, _k_ipt, t2, t3);\
	s0 = _mm_castps_si128(_mm_move_ss(_mm_castsi128_ps(s0), _mm_castsi128_ps(t1)));\
	t1 = _mm_slli_si128(t1, 8);\
	s8 = _mm_xor_si128(s8, t1);\
	t1 = _mm_shuffle_epi32(s24, _MM_SHUFFLE(3, 3, 0, 3));\
	s0 = _mm_xor_si128(s0, t1)
#endif

#ifdef AES_NI
#define TIX384(msg, s16, s8, s27, s30, s0, s4, t1, t2, t3)\
	t1 = _mm_shuffle_epi32(s0, _MM_SHUFFLE(3, 3, 0, 3));\
	s16 = _mm_xor_si128(s16, t1);\
	t1 = _mm_castps_si128(_mm_load_ss((float*)msg));\
	s0 = _mm_castps_si128(_mm_move_ss(_mm_castsi128_ps(s0), _mm_castsi128_ps(t1)));\
	t1 = _mm_slli_si128(t1, 8);\
	s8 = _mm_xor_si128(s8, t1);\
	t1 = _mm_shuffle_epi32(s27, _MM_SHUFFLE(3, 3, 0, 3));\
	s0 = _mm_xor_si128(s0, t1);\
	t1 = _mm_shuffle_epi32(s30, _MM_SHUFFLE(3, 3, 0, 3));\
	s4 = _mm_xor_si128(s4, t1)
#else
#define TIX384(msg, s16, s8, s27, s30, s0, s4, t1, t2, t3)\
	t1 = _mm_shuffle_epi32(s0, _MM_SHUFFLE(3, 3, 0, 3));\
	s16 = _mm_xor_si128(s16, t1);\
	t1 = _mm_castps_si128(_mm_load_ss((float*)msg));\
	TRANSFORM(t1, _k_ipt, t2, t3);\
	s0 = _mm_castps_si128(_mm_move_ss(_mm_castsi128_ps(s0), _mm_castsi128_ps(t1)));\
	t1 = _mm_slli_si128(t1, 8);\
	s8 = _mm_xor_si128(s8, t1);\
	t1 = _mm_shuffle_epi32(s27, _MM_SHUFFLE(3, 3, 0, 3));\
	s0 = _mm_xor_si128(s0, t1);\
	t1 = _mm_shuffle_epi32(s30, _MM_SHUFFLE(3, 3, 0, 3));\
	s4 = _mm_xor_si128(s4, t1)
#endif


#ifdef AES_NI
#define TIX512(msg, s22, s8, s24, s27, s30, s0, s4, s7, t1, t2, t3)\
	t1 = _mm_shuffle_epi32(s0, _MM_SHUFFLE(3, 3, 0, 3));\
	s22 = _mm_xor_si128(s22, t1);\
	t1 = _mm_castps_si128(_mm_load_ss((float*)msg));\
	s0 = _mm_castps_si128(_mm_move_ss(_mm_castsi128_ps(s0), _mm_castsi128_ps(t1)));\
	t1 = _mm_slli_si128(t1, 8);\
	s8 = _mm_xor_si128(s8, t1);\
	t1 = _mm_shuffle_epi32(s24, _MM_SHUFFLE(3, 3, 0, 3));\
	s0 = _mm_xor_si128(s0, t1);\
	t1 = _mm_shuffle_epi32(s27, _MM_SHUFFLE(3, 3, 0, 3));\
	s4 = _mm_xor_si128(s4, t1);\
	t1 = _mm_shuffle_epi32(s30, _MM_SHUFFLE(3, 3, 0, 3));\
	s7 = _mm_xor_si128(s7, t1)
#else
#define TIX512(msg, s22, s8, s24, s27, s30, s0, s4, s7, t1, t2, t3)\
	t1 = _mm_shuffle_epi32(s0, _MM_SHUFFLE(3, 3, 0, 3));\
	s22 = _mm_xor_si128(s22, t1);\
	t1 = _mm_castps_si128(_mm_load_ss((float*)msg));\
	TRANSFORM(t1, _k_ipt, t2, t3);\
	s0 = _mm_castps_si128(_mm_move_ss(_mm_castsi128_ps(s0), _mm_castsi128_ps(t1)));\
	t1 = _mm_slli_si128(t1, 8);\
	s8 = _mm_xor_si128(s8, t1);\
	t1 = _mm_shuffle_epi32(s24, _MM_SHUFFLE(3, 3, 0, 3));\
	s0 = _mm_xor_si128(s0, t1);\
	t1 = _mm_shuffle_epi32(s27, _MM_SHUFFLE(3, 3, 0, 3));\
	s4 = _mm_xor_si128(s4, t1);\
	t1 = _mm_shuffle_epi32(s30, _MM_SHUFFLE(3, 3, 0, 3));\
	s7 = _mm_xor_si128(s7, t1)
#endif



#ifdef AES_NI
#define PRESUPERMIX(x, t1, s1, s2, t2)\
	s1 = x;\
	s2 = _mm_add_epi8(x, x);\
	t2 = _mm_add_epi8(s2, s2);\
	t1 = _mm_srli_epi16(x, 6);\
	t1 = _mm_and_si128(t1, M128(_lsbmask2));\
	s2 = _mm_xor_si128(s2, _mm_shuffle_epi8(M128(_mul2mask), t1));\
	x  = _mm_xor_si128(t2, _mm_shuffle_epi8(M128(_mul4mask), t1))

#define SUBSTITUTE(r0, _t1, _t2, _t3, _t0)\
			_t2 = _mm_shuffle_epi8(r0, M128(_inv_shift_rows));\
			_t2 = _mm_aesenclast_si128(_t2, M128(_zero))
	
#define SUPERMIX(t0, t1, t2, t3, t4)\
	PRESUPERMIX(t0, t1, t2, t3, t4);\
	POSTSUPERMIX(t0, t1, t2, t3, t4)


#else

#define PRESUPERMIX(t0, t1, t2, t3)\
		t2 = _mm_xor_si128(_mm_shuffle_epi8(M128(_k_sb1 + 0), t0), _mm_shuffle_epi8(M128(_k_sb1 + 1), t1));\
		t3 = _mm_xor_si128(_mm_shuffle_epi8(M128(_k_sb2 + 0), t0), _mm_shuffle_epi8(M128(_k_sb2 + 1), t1));\
		t0 = _mm_xor_si128(_mm_shuffle_epi8(M128(_k_sb4 + 0), t0), _mm_shuffle_epi8(M128(_k_sb4 + 1), t1))


#define SUBSTITUTE SUBSTITUTE_VPERM_CORE

#define SUPERMIX(t0, t1, t2, t3, t4)\
	PRESUPERMIX(t0, t1, t2, t3);\
	POSTSUPERMIX(t0, t1, t2, t3, t4);\
	t4 = _mm_xor_si128(t4, M128(_k_n))

#endif


#if 1
#define POSTSUPERMIX(t0, t1, t2, t3, t4)\
		t1 = t2;\
		t1 = _mm_shuffle_epi8(t1, M128(_supermix1b));\
		t4 = t1;\
		t1 = _mm_shuffle_epi8(t1, M128(_supermix1c));\
		t4 = _mm_xor_si128(t4, t1);\
		t1 = t4;\
		t1 = _mm_shuffle_epi8(t1, M128(_supermix1d));\
		t4 = _mm_xor_si128(t4, t1);\
		t1 = t2;\
		t1 = _mm_shuffle_epi8(t1, M128(_supermix1a));\
		t4 = _mm_xor_si128(t4, t1);\
		t2 = _mm_xor_si128(t2, t3);\
		t2 = _mm_xor_si128(t2, t0);\
		t2 = _mm_shuffle_epi8(t2, M128(_supermix7a));\
		t4 = _mm_xor_si128(t4, t2);\
		t2 = _mm_shuffle_epi8(t2, M128(_supermix7b));\
		t4 = _mm_xor_si128(t4, t2);\
		t3 = _mm_shuffle_epi8(t3, M128(_supermix2a));\
		t1 = t0;\
		t1 = _mm_shuffle_epi8(t1, M128(_supermix4a));\
		t4 = _mm_xor_si128(t4, t1);\
		t0 = _mm_shuffle_epi8(t0, M128(_supermix4b));\
		t0 = _mm_xor_si128(t0, t3);\
		t4 = _mm_xor_si128(t4, t0);\
		t0 = _mm_shuffle_epi8(t0, M128(_supermix4c));\
		t4 = _mm_xor_si128(t4, t0)
#else

#define POSTSUPERMIX(t0, t1, t2, t3, t4)\
	t0 = _mm_shuffle_epi8(t0, aes_shift_rows);\
	t1 = _mm_shuffle_epi8(t1, aes_shift_rows);\
	VPERM_LOOKUP(t0, t1, k_sb1, xmm_in, t2);\
	VPERM_LOOKUP(t0, t1, k_sb4, xmm_4x, t2);\
	VPERM_LOOKUP(t0, t1, k_sb7, xmm_7x, t2);\
	xmm_out1  = _mm_shuffle_epi8(xmm_in, shift_one_mask);\
	xmm_out2  = _mm_shuffle_epi8(xmm_4x, shift_four_mask);\
	xmm_out   = _mm_shuffle_epi8(xmm_7x, shift_seven_mask);\
	xmm_out1  = _mm_xor_si128(xmm_in, xmm_out1);\
	xmm_out   = _mm_xor_si128(xmm_out, xmm_out2);\
	xmm_out   = _mm_xor_si128(xmm_out, xmm_out1);\
	t1        =  _mm_shuffle_epi32(xmm_in, 0x5b);\
	t3        =  _mm_unpackhi_epi32(xmm_7x, xmm_4x);\
	t0        =  _mm_unpacklo_epi32(xmm_7x, xmm_4x);\
	t2        =  _mm_unpacklo_epi64(t1, t3);\
	xmm_in    =  _mm_unpackhi_epi64(xmm_in, t0);\
	t1        =  _mm_unpackhi_epi64(t1, t3);\
	xmm_out   =  _mm_xor_si128(xmm_out, t1);\
	t2        =  _mm_xor_si128(t2, xmm_in);\
	xmm_out   =  _mm_xor_si128(xmm_out, t2);\
	t4		  =	 _mm_xor_si128(xmm_out, k_n)
#endif


//#define SUBROUND256(r1, r2, r0, r5)\
//	CMIX(r1, r2, r0, r5, t1);\
//	PACK_S0(r0, r1, t1);\
//	SUBSTITUTE(r0, t1, t2, t3, t4);\
//	SUPERMIX(t2, t3, t4, t1, r0);\
//	UNPACK_S0(r0, r1, t3)

#define SUBROUND256_2(r1, r2, r0, r5, s1, s2, s0, s5)\
	CMIX(r1, r2, r0, r5, _t0, _t1);\
	PACK_S0(r0, r1, _t0);\
	SUBSTITUTE(r0, _t1, _t2, _t3, _t0);\
	SUPERMIX(_t2, _t3, _t0, _t1, r0);\
	_t0 = _mm_shuffle_epi32(r0, 0x39);\
	s0  = _mm_xor_si128(s0, _t0);\
	_t0 = _mm_and_si128(_t0, M128(_maskd3n));\
	s5  = _mm_xor_si128(s5, _t0);\
	UNPACK_S0(r0, r1, _t3);\
	SUBSTITUTE(s0, _t1, _t2, _t3, _t0);\
	SUPERMIX(_t2, _t3, _t0, _t1, s0);\
	UNPACK_S0(s0, s1, _t3)


#define SUBROUND512_3(r1a, r1b, r1c, r1d, r2a, r2b, r2c, r2d, r3a, r3b, r3c, r3d)\
	CMIX(r1a, r1b, r1c, r1d, _t0, _t1);\
	PACK_S0(r1c, r1a, _t0);\
	SUBSTITUTE(r1c, _t1, _t2, _t3, _t0);\
	SUPERMIX(_t2, _t3, _t0, _t1, r1c);\
	_t0 = _mm_shuffle_epi32(r1c, 0x39);\
	r2c = _mm_xor_si128(r2c, _t0);\
	_t0 = _mm_and_si128(_t0, M128(_maskd3n));\
	r2d = _mm_xor_si128(r2d, _t0);\
	UNPACK_S0(r1c, r1a, _t3);\
	SUBSTITUTE(r2c, _t1, _t2, _t3, _t0);\
	SUPERMIX(_t2, _t3, _t0, _t1, r2c);\
	_t0 = _mm_shuffle_epi32(r2c, 0x39);\
	r3c = _mm_xor_si128(r3c, _t0);\
	_t0 = _mm_and_si128(_t0, M128(_maskd3n));\
	r3d = _mm_xor_si128(r3d, _t0);\
	UNPACK_S0(r2c, r2a, _t3);\
	SUBSTITUTE(r3c, _t1, _t2, _t3, _t0);\
	SUPERMIX(_t2, _t3, _t0, _t1, r3c);\
	UNPACK_S0(r3c, r3a, _t3)


#define SUBROUND512_4(r1a, r1b, r1c, r1d, r2a, r2b, r2c, r2d, r3a, r3b, r3c, r3d, r4a, r4b, r4c, r4d)\
	CMIX(r1a, r1b, r1c, r1d, _t0, _t1);\
	PACK_S0(r1c, r1a, _t0);\
	SUBSTITUTE(r1c, _t1, _t2, _t3, _t0);\
	SUPERMIX(_t2, _t3, _t0, _t1, r1c);\
	_t0 = _mm_shuffle_epi32(r1c, 0x39);\
	r2c = _mm_xor_si128(r2c, _t0);\
	_t0 = _mm_and_si128(_t0, M128(_maskd3n));\
	r2d = _mm_xor_si128(r2d, _t0);\
	UNPACK_S0(r1c, r1a, _t3);\
	SUBSTITUTE(r2c, _t1, _t2, _t3, _t0);\
	SUPERMIX(_t2, _t3, _t0, _t1, r2c);\
	_t0 = _mm_shuffle_epi32(r2c, 0x39);\
	r3c = _mm_xor_si128(r3c, _t0);\
	_t0 = _mm_and_si128(_t0, M128(_maskd3n));\
	r3d = _mm_xor_si128(r3d, _t0);\
	UNPACK_S0(r2c, r2a, _t3);\
	SUBSTITUTE(r3c, _t1, _t2, _t3, _t0);\
	SUPERMIX(_t2, _t3, _t0, _t1, r3c);\
	_t0 = _mm_shuffle_epi32(r3c, 0x39);\
	r4c = _mm_xor_si128(r4c, _t0);\
	_t0 = _mm_and_si128(_t0, M128(_maskd3n));\
	r4d = _mm_xor_si128(r4d, _t0);\
	UNPACK_S0(r3c, r3a, _t3);\
	SUBSTITUTE(r4c, _t1, _t2, _t3, _t0);\
	SUPERMIX(_t2, _t3, _t0, _t1, r4c);\
	UNPACK_S0(r4c, r4a, _t3)


/*
#define UPDATE_VARS\
		ctx->base++;\
		pmsg += 4;\
		uBlockCount--;\
		if(uBlockCount == 0) break

#define UPDATE_VARS_LAST\
		ctx->base = 0;\
		pmsg += 4;\
		uBlockCount--


#define PROCESS256_BLOCK1\
		TIX256(pmsg, ctx->state[3], ctx->state[2], ctx->state[8], ctx->state[0], _t0, _t1, _t2);\
		SUBROUND256_2(ctx->state[0], ctx->state[1], ctx->state[9], ctx->state[4], ctx->state[9], ctx->state[0], ctx->state[8], ctx->state[3])

#define PROCESS256_BLOCK2\
		TIX256(pmsg, ctx->state[1], ctx->state[0], ctx->state[6], ctx->state[8], _t0, _t1, _t2);\
		SUBROUND256_2(ctx->state[8], ctx->state[9], ctx->state[7], ctx->state[2], ctx->state[7], ctx->state[8], ctx->state[6], ctx->state[1])

#define PROCESS256_BLOCK3\
		TIX256(pmsg, ctx->state[9], ctx->state[8], ctx->state[4], ctx->state[6], _t0, _t1, _t2);\
		SUBROUND256_2(ctx->state[6], ctx->state[7], ctx->state[5], ctx->state[0], ctx->state[5], ctx->state[6], ctx->state[4], ctx->state[9])

#define PROCESS256_BLOCK4\
		TIX256(pmsg, ctx->state[7], ctx->state[6], ctx->state[2], ctx->state[4], _t0, _t1, _t2);\
		SUBROUND256_2(ctx->state[4], ctx->state[5], ctx->state[3], ctx->state[8], ctx->state[3], ctx->state[4], ctx->state[2], ctx->state[7])

#define PROCESS256_BLOCK5\
		TIX256(pmsg, ctx->state[5], ctx->state[4], ctx->state[0], ctx->state[2], _t0, _t1, _t2);\
		SUBROUND256_2(ctx->state[2], ctx->state[3], ctx->state[1], ctx->state[6], ctx->state[1], ctx->state[2], ctx->state[0], ctx->state[5])
*/

void Compress256(hashState *ctx, const unsigned char *pmsg, unsigned int uBlockCount)
{
//	unsigned int r, b, i, j;
//	__m128i t1, t2, t3, s1, s2, s3, k;
//	__m128i _s0, _s1, _s2, _s3, _s4, _s5, _s6, _s7, _s8, _s9;
	__m128i _t0, _t1, _t2, _t3;
//	__m128i xmm_out, xmm_out1, xmm_out2, xmm_in, xmm_4x, xmm_7x;

	switch(ctx->base)
	{
		case 1:
			TIX256(pmsg, ctx->state[1], ctx->state[0], ctx->state[6], ctx->state[8], _t0, _t1, _t2);
			SUBROUND256_2(ctx->state[8], ctx->state[9], ctx->state[7], ctx->state[2], ctx->state[7], ctx->state[8], ctx->state[6], ctx->state[1]);
			ctx->base++;
			pmsg += 4;
			uBlockCount--;
			if(uBlockCount == 0) 
				break;
		case 2:
			TIX256(pmsg, ctx->state[9], ctx->state[8], ctx->state[4], ctx->state[6], _t0, _t1, _t2);
			SUBROUND256_2(ctx->state[6], ctx->state[7], ctx->state[5], ctx->state[0], ctx->state[5], ctx->state[6], ctx->state[4], ctx->state[9]);
			ctx->base++;
			pmsg += 4;
			uBlockCount--;
			if(uBlockCount == 0) 
				break;
		case 3:
			TIX256(pmsg, ctx->state[7], ctx->state[6], ctx->state[2], ctx->state[4], _t0, _t1, _t2);
			SUBROUND256_2(ctx->state[4], ctx->state[5], ctx->state[3], ctx->state[8], ctx->state[3], ctx->state[4], ctx->state[2], ctx->state[7]);
			ctx->base++;
			pmsg += 4;
			uBlockCount--;
			if(uBlockCount == 0) 
				break;
		case 4:
			TIX256(pmsg, ctx->state[5], ctx->state[4], ctx->state[0], ctx->state[2], _t0, _t1, _t2);
			SUBROUND256_2(ctx->state[2], ctx->state[3], ctx->state[1], ctx->state[6], ctx->state[1], ctx->state[2], ctx->state[0], ctx->state[5]);
			ctx->base = 0;
			pmsg += 4;
			uBlockCount--;
			break;
	}


	while(uBlockCount > 0)
	{
		TIX256(pmsg, ctx->state[3], ctx->state[2], ctx->state[8], ctx->state[0], _t0, _t1, _t2);
		SUBROUND256_2(ctx->state[0], ctx->state[1], ctx->state[9], ctx->state[4], ctx->state[9], ctx->state[0], ctx->state[8], ctx->state[3]);
		ctx->base++;
		pmsg += 4;
		uBlockCount--;
		if(uBlockCount == 0) 
			break;

		TIX256(pmsg, ctx->state[1], ctx->state[0], ctx->state[6], ctx->state[8], _t0, _t1, _t2);
		SUBROUND256_2(ctx->state[8], ctx->state[9], ctx->state[7], ctx->state[2], ctx->state[7], ctx->state[8], ctx->state[6], ctx->state[1]);
		ctx->base++;
		pmsg += 4;
		uBlockCount--;
		if(uBlockCount == 0) 
			break;

		TIX256(pmsg, ctx->state[9], ctx->state[8], ctx->state[4], ctx->state[6], _t0, _t1, _t2);
		SUBROUND256_2(ctx->state[6], ctx->state[7], ctx->state[5], ctx->state[0], ctx->state[5], ctx->state[6], ctx->state[4], ctx->state[9]);
		ctx->base++;
		pmsg += 4;
		uBlockCount--;
		if(uBlockCount == 0) 
			break;

		TIX256(pmsg, ctx->state[7], ctx->state[6], ctx->state[2], ctx->state[4], _t0, _t1, _t2);
		SUBROUND256_2(ctx->state[4], ctx->state[5], ctx->state[3], ctx->state[8], ctx->state[3], ctx->state[4], ctx->state[2], ctx->state[7]);
		ctx->base++;
		pmsg += 4;
		uBlockCount--;
		if(uBlockCount == 0) 
			break;

		TIX256(pmsg, ctx->state[5], ctx->state[4], ctx->state[0], ctx->state[2], _t0, _t1, _t2);
		SUBROUND256_2(ctx->state[2], ctx->state[3], ctx->state[1], ctx->state[6], ctx->state[1], ctx->state[2], ctx->state[0], ctx->state[5]);
		ctx->base = 0;
		pmsg += 4;
		uBlockCount--;
	}
}

#define LOADCOLUMN(x, s, a)\
		block[0] = col[(base + a + 0) % s];\
		block[1] = col[(base + a + 1) % s];\
		block[2] = col[(base + a + 2) % s];\
		block[3] = col[(base + a + 3) % s];\
		x = _mm_loadu_si128((__m128i*)block)

#define STORECOLUMN(x, s)\
		_mm_storeu_si128((__m128i*)block, x);\
		col[(base + 0) % s] = block[0];\
		col[(base + 1) % s] = block[1];\
		col[(base + 2) % s] = block[2];\
		col[(base + 3) % s] = block[3]


void Final256(hashState *ctx, BitSequence *hashval)
{
	unsigned int i, col[30], block[4], base, uBlockCount = 5;
	__m128i t1, t2;
	__m128i r0, _t0, _t1, _t2, _t3;


#if 0
	switch(ctx->base)
	{
		case 1:
			SUBROUND256_2(ctx->state[8], ctx->state[9], ctx->state[7], ctx->state[2], ctx->state[7], ctx->state[8], ctx->state[6], ctx->state[1]);
			uBlockCount--;
		case 2:
			SUBROUND256_2(ctx->state[6], ctx->state[7], ctx->state[5], ctx->state[0], ctx->state[5], ctx->state[6], ctx->state[4], ctx->state[9]);
			uBlockCount--;
		case 3:
			SUBROUND256_2(ctx->state[4], ctx->state[5], ctx->state[3], ctx->state[8], ctx->state[3], ctx->state[4], ctx->state[2], ctx->state[7]);
			uBlockCount--;
		case 4:
			SUBROUND256_2(ctx->state[2], ctx->state[3], ctx->state[1], ctx->state[6], ctx->state[1], ctx->state[2], ctx->state[0], ctx->state[5]);
			uBlockCount--;
			break;
	}

	while(1)
	{
		SUBROUND256_2(ctx->state[0], ctx->state[1], ctx->state[9], ctx->state[4], ctx->state[9], ctx->state[0], ctx->state[8], ctx->state[3]);
		uBlockCount--;
		if(uBlockCount == 0)
			break;

		SUBROUND256_2(ctx->state[8], ctx->state[9], ctx->state[7], ctx->state[2], ctx->state[7], ctx->state[8], ctx->state[6], ctx->state[1]);
		uBlockCount--;
		if(uBlockCount == 0)
			break;

		SUBROUND256_2(ctx->state[6], ctx->state[7], ctx->state[5], ctx->state[0], ctx->state[5], ctx->state[6], ctx->state[4], ctx->state[9]);
		uBlockCount--;
		if(uBlockCount == 0)
			break;

		SUBROUND256_2(ctx->state[4], ctx->state[5], ctx->state[3], ctx->state[8], ctx->state[3], ctx->state[4], ctx->state[2], ctx->state[7]);
		uBlockCount--;
		if(uBlockCount == 0)
			break;
		SUBROUND256_2(ctx->state[2], ctx->state[3], ctx->state[1], ctx->state[6], ctx->state[1], ctx->state[2], ctx->state[0], ctx->state[5]);
		uBlockCount--;
		if(uBlockCount == 0)
			break;
	}
#endif


	for(i = 0; i < 10; i++)
	{
		_mm_storeu_si128((__m128i*)block, ctx->state[i]);

		col[3 * i + 0] = block[0];
		col[3 * i + 1] = block[1];
		col[3 * i + 2] = block[2];
	}

	base = (30 - (6 * ctx->base)) % 30;

	for(i = 0; i < 10; i++)
	{
		// ROR3
		base = (base + 27) % 30;

		// CMIX
		col[(base +  0) % 30] ^= col[(base + 4) % 30];
		col[(base +  1) % 30] ^= col[(base + 5) % 30];
		col[(base +  2) % 30] ^= col[(base + 6) % 30];
		col[(base +  15) % 30] ^= col[(base + 4) % 30];
		col[(base +  16) % 30] ^= col[(base + 5) % 30];
		col[(base +  17) % 30] ^= col[(base + 6) % 30];

		// SMIX
		LOADCOLUMN(r0, 30, 0);
		SUBSTITUTE(r0, _t1, _t2, _t3, _t0);
		SUPERMIX(_t2, _t3, _t0, _t1, r0);
		STORECOLUMN(r0, 30);
	}

	for(i = 0; i < 13; i++)
	{
		// S4 += S0; S15 += S0;
		col[(base +  4) % 30] ^= col[(base + 0) % 30];
		col[(base + 15) % 30] ^= col[(base + 0) % 30];

		// ROR15
		base = (base + 15) % 30;

		// SMIX
		LOADCOLUMN(r0, 30, 0);
		SUBSTITUTE(r0, _t1, _t2, _t3, _t0);
		SUPERMIX(_t2, _t3, _t0, _t1, r0);
		STORECOLUMN(r0, 30);

		// S4 += S0; S16 += S0;
		col[(base +  4) % 30] ^= col[(base + 0) % 30];
		col[(base + 16) % 30] ^= col[(base + 0) % 30];

		// ROR 14
		base = (base + 16) % 30;

		// SMIX
		LOADCOLUMN(r0, 30, 0);
		SUBSTITUTE(r0, _t1, _t2, _t3, _t0);
		SUPERMIX(_t2, _t3, _t0, _t1, r0);
		STORECOLUMN(r0, 30);
	}

	// S4 += S0; S15 += S0;
	col[(base +  4) % 30] ^= col[(base + 0) % 30];
	col[(base + 15) % 30] ^= col[(base + 0) % 30];

	// Transform to the standard basis and store output; S1 || S2 || S3 || S4
	LOADCOLUMN(r0, 30, 1);
#ifndef AES_NI
	TRANSFORM(r0, _k_opt, t1, t2);
#endif
	_mm_storeu_si128((__m128i*)hashval, r0);

	// Transform to the standard basis and store output; S15 || S16 || S7 || S8
	LOADCOLUMN(r0, 30, 15);
#ifndef AES_NI
	TRANSFORM(r0, _k_opt, t1, t2);
#endif
	_mm_storeu_si128((__m128i*)hashval + 1, r0);
}


void Compress384(hashState *ctx, const unsigned char *pmsg, unsigned int uBlockCount)
{
//	unsigned int r, b, i, j;
//	__m128i t1, t2, t3, s1, s2, s3, k;
//	__m128i _s0, _s1, _s2, _s3, _s4, _s5, _s6, _s7, _s8, _s9;
	__m128i _t0, _t1, _t2, _t3;
//	__m128i xmm_out, xmm_out1, xmm_out2, xmm_in, xmm_4x, xmm_7x;

	switch(ctx->base)
	{
		case 1:
			TIX384(pmsg, ctx->state[2], ctx->state[11], ctx->state[6], ctx->state[7], ctx->state[9], ctx->state[10], _t0, _t1, _t2);
			SUBROUND512_3(ctx->state[9], ctx->state[10], ctx->state[8], ctx->state[2], ctx->state[8], ctx->state[9], ctx->state[7], ctx->state[1], ctx->state[7], ctx->state[8], ctx->state[6], ctx->state[0]);
			ctx->base++;
			pmsg += 4;
			uBlockCount--;
			if(uBlockCount == 0) 
				break;
		case 2:
			TIX384(pmsg, ctx->state[11], ctx->state[8], ctx->state[3], ctx->state[4], ctx->state[6], ctx->state[7], _t0, _t1, _t2);
			SUBROUND512_3(ctx->state[6], ctx->state[7], ctx->state[5], ctx->state[11], ctx->state[5], ctx->state[6], ctx->state[4], ctx->state[10], ctx->state[4], ctx->state[5], ctx->state[3], ctx->state[9]);
			ctx->base++;
			pmsg += 4;
			uBlockCount--;
			if(uBlockCount == 0) 
				break;
		case 3:
			TIX384(pmsg, ctx->state[8], ctx->state[5], ctx->state[0], ctx->state[1], ctx->state[3], ctx->state[4], _t0, _t1, _t2);
			SUBROUND512_3(ctx->state[3], ctx->state[4], ctx->state[2], ctx->state[8], ctx->state[2], ctx->state[3], ctx->state[1], ctx->state[7], ctx->state[1], ctx->state[2], ctx->state[0], ctx->state[6]);
			ctx->base = 0;
			pmsg += 4;
			uBlockCount--;
			break;
	}


	while(uBlockCount > 0)
	{
		TIX384(pmsg, ctx->state[5], ctx->state[2], ctx->state[9], ctx->state[10], ctx->state[0], ctx->state[1], _t0, _t1, _t2);
		SUBROUND512_3(ctx->state[0], ctx->state[1], ctx->state[11], ctx->state[5], ctx->state[11], ctx->state[0], ctx->state[10], ctx->state[4], ctx->state[10], ctx->state[11], ctx->state[9], ctx->state[3]);
		ctx->base++;
		pmsg += 4;
		uBlockCount--;
		if(uBlockCount == 0) 
			break;

		TIX384(pmsg, ctx->state[2], ctx->state[11], ctx->state[6], ctx->state[7], ctx->state[9], ctx->state[10], _t0, _t1, _t2);
		SUBROUND512_3(ctx->state[9], ctx->state[10], ctx->state[8], ctx->state[2], ctx->state[8], ctx->state[9], ctx->state[7], ctx->state[1], ctx->state[7], ctx->state[8], ctx->state[6], ctx->state[0]);
		ctx->base++;
		pmsg += 4;
		uBlockCount--;
		if(uBlockCount == 0) 
			break;

		TIX384(pmsg, ctx->state[11], ctx->state[8], ctx->state[3], ctx->state[4], ctx->state[6], ctx->state[7], _t0, _t1, _t2);
		SUBROUND512_3(ctx->state[6], ctx->state[7], ctx->state[5], ctx->state[11], ctx->state[5], ctx->state[6], ctx->state[4], ctx->state[10], ctx->state[4], ctx->state[5], ctx->state[3], ctx->state[9]);
		ctx->base++;
		pmsg += 4;
		uBlockCount--;
		if(uBlockCount == 0) 
			break;

		TIX384(pmsg, ctx->state[8], ctx->state[5], ctx->state[0], ctx->state[1], ctx->state[3], ctx->state[4], _t0, _t1, _t2);
		SUBROUND512_3(ctx->state[3], ctx->state[4], ctx->state[2], ctx->state[8], ctx->state[2], ctx->state[3], ctx->state[1], ctx->state[7], ctx->state[1], ctx->state[2], ctx->state[0], ctx->state[6]);
		ctx->base = 0;
		pmsg += 4;
		uBlockCount--;
	}

}

void Final384(hashState *ctx, BitSequence *hashval)
{
	unsigned int i, col[36], block[4], base;
	__m128i t1, t2;
	__m128i r0, _t0, _t1, _t2, _t3;

	for(i = 0; i < 12; i++)
	{
		_mm_storeu_si128((__m128i*)block, ctx->state[i]);

		col[3 * i + 0] = block[0];
		col[3 * i + 1] = block[1];
		col[3 * i + 2] = block[2];
	}

	base = (36 - (9 * ctx->base)) % 36;

	for(i = 0; i < 18; i++)
	{
		// ROR3
		base = (base + 33) % 36;

		// CMIX
		col[(base +  0) % 36] ^= col[(base + 4) % 36];
		col[(base +  1) % 36] ^= col[(base + 5) % 36];
		col[(base +  2) % 36] ^= col[(base + 6) % 36];
		col[(base +  18) % 36] ^= col[(base + 4) % 36];
		col[(base +  19) % 36] ^= col[(base + 5) % 36];
		col[(base +  20) % 36] ^= col[(base + 6) % 36];

		// SMIX
		LOADCOLUMN(r0, 36, 0);
		SUBSTITUTE(r0, _t1, _t2, _t3, _t0);
		SUPERMIX(_t2, _t3, _t0, _t1, r0);
		STORECOLUMN(r0, 36);
	}

	for(i = 0; i < 13; i++)
	{
		// S4 += S0; S12 += S0; S24 += S0;
		col[(base +  4) % 36] ^= col[(base + 0) % 36];
		col[(base + 12) % 36] ^= col[(base + 0) % 36];
		col[(base + 24) % 36] ^= col[(base + 0) % 36];

		// ROR12
		base = (base + 24) % 36;

		// SMIX
		LOADCOLUMN(r0, 36, 0);
		SUBSTITUTE(r0, _t1, _t2, _t3, _t0);
		SUPERMIX(_t2, _t3, _t0, _t1, r0);
		STORECOLUMN(r0, 36);

		// S4 += S0; S13 += S0; S24 += S0;
		col[(base +  4) % 36] ^= col[(base + 0) % 36];
		col[(base + 13) % 36] ^= col[(base + 0) % 36];
		col[(base + 24) % 36] ^= col[(base + 0) % 36];

		// ROR12
		base = (base + 24) % 36;

		// SMIX
		LOADCOLUMN(r0, 36, 0);
		SUBSTITUTE(r0, _t1, _t2, _t3, _t0);
		SUPERMIX(_t2, _t3, _t0, _t1, r0);
		STORECOLUMN(r0, 36);

		// S4 += S0; S13 += S0; S25 += S0;
		col[(base +  4) % 36] ^= col[(base + 0) % 36];
		col[(base + 13) % 36] ^= col[(base + 0) % 36];
		col[(base + 25) % 36] ^= col[(base + 0) % 36];

		// ROR11
		base = (base + 25) % 36;

		// SMIX
		LOADCOLUMN(r0, 36, 0);
		SUBSTITUTE(r0, _t1, _t2, _t3, _t0);
		SUPERMIX(_t2, _t3, _t0, _t1, r0);
		STORECOLUMN(r0, 36);
	}

	// S4 += S0; S12 += S0; S24 += S0;
	col[(base +  4) % 36] ^= col[(base + 0) % 36];
	col[(base + 12) % 36] ^= col[(base + 0) % 36];
	col[(base + 24) % 36] ^= col[(base + 0) % 36];

	// Transform to the standard basis and store output; S1 || S2 || S3 || S4
	LOADCOLUMN(r0, 36, 1);
#ifndef AES_NI
	TRANSFORM(r0, _k_opt, t1, t2);
#endif
	_mm_storeu_si128((__m128i*)hashval, r0);


	// Transform to the standard basis and store output; S12 || S13 || S14 || S15
	LOADCOLUMN(r0, 36, 12);
#ifndef AES_NI
	TRANSFORM(r0, _k_opt, t1, t2);
#endif
	_mm_storeu_si128((__m128i*)hashval + 1, r0);

	// Transform to the standard basis and store output; S24 || S25 || S26 || S27
	LOADCOLUMN(r0, 36, 24);
#ifndef AES_NI
	TRANSFORM(r0, _k_opt, t1, t2);
#endif
	_mm_storeu_si128((__m128i*)hashval + 2, r0);
}


void Compress512(hashState *ctx, const unsigned char *pmsg, unsigned int uBlockCount)
{
//	unsigned int r, b, i, j;
//	__m128i t1, t2, t3, s1, s2, s3, k;
//	__m128i _s0, _s1, _s2, _s3, _s4, _s5, _s6, _s7, _s8, _s9;
	__m128i _t0, _t1, _t2, _t3;
//	__m128i xmm_out, xmm_out1, xmm_out2, xmm_in, xmm_4x, xmm_7x;

	switch(ctx->base)
	{
		case 1:
			TIX512(pmsg, ctx->state[3], ctx->state[10], ctx->state[4], ctx->state[5], ctx->state[6], ctx->state[8], ctx->state[9], ctx->state[10], _t0, _t1, _t2);
			SUBROUND512_4(ctx->state[8], ctx->state[9], ctx->state[7], ctx->state[1], ctx->state[7], ctx->state[8], ctx->state[6], ctx->state[0], ctx->state[6], ctx->state[7], ctx->state[5], ctx->state[11], ctx->state[5], ctx->state[6], ctx->state[4], ctx->state[10]);
			ctx->base++;
			pmsg += 4;
			uBlockCount--;
			if(uBlockCount == 0)
				break;
		case 2:
			TIX512(pmsg, ctx->state[11], ctx->state[6], ctx->state[0], ctx->state[1], ctx->state[2], ctx->state[4], ctx->state[5], ctx->state[6], _t0, _t1, _t2);
			SUBROUND512_4(ctx->state[4], ctx->state[5], ctx->state[3], ctx->state[9], ctx->state[3], ctx->state[4], ctx->state[2], ctx->state[8], ctx->state[2], ctx->state[3], ctx->state[1], ctx->state[7], ctx->state[1], ctx->state[2], ctx->state[0], ctx->state[6]);
			ctx->base = 0;
			pmsg += 4;
			uBlockCount--;
			break;
	}


	while(uBlockCount > 0)
	{
		TIX512(pmsg, ctx->state[7], ctx->state[2], ctx->state[8], ctx->state[9], ctx->state[10], ctx->state[0], ctx->state[1], ctx->state[2], _t0, _t1, _t2);
		SUBROUND512_4(ctx->state[0], ctx->state[1], ctx->state[11], ctx->state[5], ctx->state[11], ctx->state[0], ctx->state[10], ctx->state[4], ctx->state[10], ctx->state[11], ctx->state[9], ctx->state[3], ctx->state[9], ctx->state[10], ctx->state[8], ctx->state[2]);

		ctx->base++;
		pmsg += 4;
		uBlockCount--;
		if(uBlockCount == 0)
			break;

		TIX512(pmsg, ctx->state[3], ctx->state[10], ctx->state[4], ctx->state[5], ctx->state[6], ctx->state[8], ctx->state[9], ctx->state[10], _t0, _t1, _t2);
		SUBROUND512_4(ctx->state[8], ctx->state[9], ctx->state[7], ctx->state[1], ctx->state[7], ctx->state[8], ctx->state[6], ctx->state[0], ctx->state[6], ctx->state[7], ctx->state[5], ctx->state[11], ctx->state[5], ctx->state[6, ctx->state[4], ctx->state[10]);

		ctx->base++;
		pmsg += 4;
		uBlockCount--;
		if(uBlockCount == 0)
			break;

		TIX512(pmsg, ctx->state[11], ctx->state[6], ctx->state[0], ctx->state[1], ctx->state[2], ctx->state[4], ctx->state[5], ctx->state[6], _t0, _t1, _t2);
		SUBROUND512_4(ctx->state[4], ctx->state[5], ctx->state[3], ctx->state[9], ctx->state[3], ctx->state[4], ctx->state[2], ctx->state[8], ctx->state[2], ctx->state[3], ctx->state[1], ctx->state[7], ctx->state[1], ctx->state[2], ctx->state[0], ctx->state[6]);

		ctx->base = 0;
		pmsg += 4;
		uBlockCount--;
	}

}

void Final512(hashState *ctx, BitSequence *hashval)
{
	unsigned int i, col[36], block[4], base;
	__m128i t1, t2;
	__m128i r0, _t0, _t1, _t2, _t3;

	for(i = 0; i < 12; i++)
	{
		_mm_storeu_si128((__m128i*)block, ctx->state[i]);

		col[3 * i + 0] = block[0];
		col[3 * i + 1] = block[1];
		col[3 * i + 2] = block[2];
	}

	base = (36 - (12 * ctx->base)) % 36;

	for(i = 0; i < 32; i++)
	{
		// ROR3
		base = (base + 33) % 36;

		// CMIX
		col[(base +  0) % 36] ^= col[(base + 4) % 36];
		col[(base +  1) % 36] ^= col[(base + 5) % 36];
		col[(base +  2) % 36] ^= col[(base + 6) % 36];
		col[(base +  18) % 36] ^= col[(base + 4) % 36];
		col[(base +  19) % 36] ^= col[(base + 5) % 36];
		col[(base +  20) % 36] ^= col[(base + 6) % 36];

		// SMIX
		LOADCOLUMN(r0, 36, 0);
		SUBSTITUTE(r0, _t1, _t2, _t3, _t0);
		SUPERMIX(_t2, _t3, _t0, _t1, r0);
		STORECOLUMN(r0, 36);
	}

	for(i = 0; i < 13; i++)
	{
		// S4 += S0; S9 += S0; S18 += S0; S27 += S0;
		col[(base +  4) % 36] ^= col[(base + 0) % 36];
		col[(base +  9) % 36] ^= col[(base + 0) % 36];
		col[(base + 18) % 36] ^= col[(base + 0) % 36];
		col[(base + 27) % 36] ^= col[(base + 0) % 36];

		// ROR9
		base = (base + 27) % 36;

		// SMIX
		LOADCOLUMN(r0, 36, 0);
		SUBSTITUTE(r0, _t1, _t2, _t3, _t0);
		SUPERMIX(_t2, _t3, _t0, _t1, r0);
		STORECOLUMN(r0, 36);

		// S4 += S0; S10 += S0; S18 += S0; S27 += S0;
		col[(base +  4) % 36] ^= col[(base + 0) % 36];
		col[(base + 10) % 36] ^= col[(base + 0) % 36];
		col[(base + 18) % 36] ^= col[(base + 0) % 36];
		col[(base + 27) % 36] ^= col[(base + 0) % 36];

		// ROR9
		base = (base + 27) % 36;

		// SMIX
		LOADCOLUMN(r0, 36, 0);
		SUBSTITUTE(r0, _t1, _t2, _t3, _t0);
		SUPERMIX(_t2, _t3, _t0, _t1, r0);
		STORECOLUMN(r0, 36);

		// S4 += S0; S10 += S0; S19 += S0; S27 += S0;
		col[(base +  4) % 36] ^= col[(base + 0) % 36];
		col[(base + 10) % 36] ^= col[(base + 0) % 36];
		col[(base + 19) % 36] ^= col[(base + 0) % 36];
		col[(base + 27) % 36] ^= col[(base + 0) % 36];

		// ROR9
		base = (base + 27) % 36;

		// SMIX
		LOADCOLUMN(r0, 36, 0);
		SUBSTITUTE(r0, _t1, _t2, _t3, _t0);
		SUPERMIX(_t2, _t3, _t0, _t1, r0);
		STORECOLUMN(r0, 36);

		// S4 += S0; S10 += S0; S19 += S0; S28 += S0;
		col[(base +  4) % 36] ^= col[(base + 0) % 36];
		col[(base + 10) % 36] ^= col[(base + 0) % 36];
		col[(base + 19) % 36] ^= col[(base + 0) % 36];
		col[(base + 28) % 36] ^= col[(base + 0) % 36];

		// ROR8
		base = (base + 28) % 36;

		// SMIX
		LOADCOLUMN(r0, 36, 0);
		SUBSTITUTE(r0, _t1, _t2, _t3, _t0);
		SUPERMIX(_t2, _t3, _t0, _t1, r0);
		STORECOLUMN(r0, 36);
	}

	// S4 += S0; S9 += S0; S18 += S0; S27 += S0;
	col[(base +  4) % 36] ^= col[(base + 0) % 36];
	col[(base +  9) % 36] ^= col[(base + 0) % 36];
	col[(base + 18) % 36] ^= col[(base + 0) % 36];
	col[(base + 27) % 36] ^= col[(base + 0) % 36];

	// Transform to the standard basis and store output; S1 || S2 || S3 || S4
	LOADCOLUMN(r0, 36, 1);
#ifndef AES_NI
	TRANSFORM(r0, _k_opt, t1, t2);
#endif
	_mm_storeu_si128((__m128i*)hashval, r0);

	// Transform to the standard basis and store output; S9 || S10 || S11 || S12
	LOADCOLUMN(r0, 36, 9);
#ifndef AES_NI
	TRANSFORM(r0, _k_opt, t1, t2);
#endif
	_mm_storeu_si128((__m128i*)hashval + 1, r0);

	// Transform to the standard basis and store output; S18 || S19 || S20 || S21
	LOADCOLUMN(r0, 36, 18);
#ifndef AES_NI
	TRANSFORM(r0, _k_opt, t1, t2);
#endif
	_mm_storeu_si128((__m128i*)hashval + 2, r0);

	// Transform to the standard basis and store output; S27 || S28 || S29 || S30
	LOADCOLUMN(r0, 36, 27);
#ifndef AES_NI
	TRANSFORM(r0, _k_opt, t1, t2);
#endif
	_mm_storeu_si128((__m128i*)hashval + 3, r0);
}




HashReturn Init(hashState *ctx, int nHashSize)
{
	int i;
	__m128i t1, t2;

	ctx->processed_bits = 0;
	ctx->uBufferBytes = 0;
	ctx->base = 0;

	switch(nHashSize)
	{
		case 256:
			ctx->uHashSize = 256;
			ctx->uBlockLength = 4;

			for(i = 0; i < 7; i++)
				ctx->state[i] = _mm_set_epi32(0, 0, 0, 0);

			ctx->state[7] = _mm_loadu_si128((__m128i*)_IV256 + 0);
			ctx->state[8] = _mm_loadu_si128((__m128i*)_IV256 + 1);
			ctx->state[9] = _mm_loadu_si128((__m128i*)_IV256 + 2);

#ifndef AES_NI
			TRANSFORM(ctx->state[7], _k_ipt, t1, t2);
			TRANSFORM(ctx->state[8], _k_ipt, t1, t2);
			TRANSFORM(ctx->state[9], _k_ipt, t1, t2);
#endif
			break;

		case 384:
			ctx->uHashSize = 384;
			ctx->uBlockLength = 4;

			for(i = 0; i < 8; i++)
				ctx->state[i] = _mm_set_epi32(0, 0, 0, 0);

			ctx->state[8]  = _mm_loadu_si128((__m128i*)_IV384 + 0);
			ctx->state[9]  = _mm_loadu_si128((__m128i*)_IV384 + 1);
			ctx->state[10] = _mm_loadu_si128((__m128i*)_IV384 + 2);
			ctx->state[11] = _mm_loadu_si128((__m128i*)_IV384 + 3);

	#ifndef AES_NI
			TRANSFORM(ctx->state[8],  _k_ipt, t1, t2);
			TRANSFORM(ctx->state[9],  _k_ipt, t1, t2);
			TRANSFORM(ctx->state[10], _k_ipt, t1, t2);
			TRANSFORM(ctx->state[11], _k_ipt, t1, t2);
	#endif
			break;

		case 512:
			ctx->uHashSize = 512;
			ctx->uBlockLength = 4;

			for(i = 0; i < 6; i++)
				ctx->state[i] = _mm_set_epi32(0, 0, 0, 0);

			ctx->state[6]  = _mm_loadu_si128((__m128i*)_IV512 + 0);
			ctx->state[7]  = _mm_loadu_si128((__m128i*)_IV512 + 1);
			ctx->state[8]  = _mm_loadu_si128((__m128i*)_IV512 + 2);
			ctx->state[9]  = _mm_loadu_si128((__m128i*)_IV512 + 3);
			ctx->state[10] = _mm_loadu_si128((__m128i*)_IV512 + 4);
			ctx->state[11] = _mm_loadu_si128((__m128i*)_IV512 + 5);

#ifndef AES_NI
			TRANSFORM(ctx->state[6],  _k_ipt, t1, t2);
			TRANSFORM(ctx->state[7],  _k_ipt, t1, t2);
			TRANSFORM(ctx->state[8],  _k_ipt, t1, t2);
			TRANSFORM(ctx->state[9],  _k_ipt, t1, t2);
			TRANSFORM(ctx->state[10], _k_ipt, t1, t2);
			TRANSFORM(ctx->state[11], _k_ipt, t1, t2);
#endif
			break;

		default:
			return BAD_HASHBITLEN;
	}


	return SUCCESS;
}


HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen)
{
	unsigned int uByteLength, uBlockCount, uRemainingBytes;

	uByteLength = (unsigned int)(databitlen / 8);

	if(state->uBufferBytes + uByteLength >= state->uBlockLength)
	{
		if(state->uBufferBytes != 0)
		{
			// Fill the buffer
			memcpy(state->buffer + state->uBufferBytes, (void*)data, state->uBlockLength - state->uBufferBytes);

			// Process the buffer
			if(state->uHashSize == 256)
				Compress256(state, state->buffer, 1);
			else if(state->uHashSize == 384)
				Compress384(state, state->buffer, 1);
			else
				Compress512(state, state->buffer, 1);

			state->processed_bits += state->uBlockLength * 8;
			data += state->uBlockLength - state->uBufferBytes;
			uByteLength -= state->uBlockLength - state->uBufferBytes;
		}

		// buffer now does not contain any unprocessed bytes

		uBlockCount = uByteLength / state->uBlockLength;
		uRemainingBytes = uByteLength % state->uBlockLength;

		if(uBlockCount > 0)
		{
			if(state->uHashSize == 256)
				Compress256(state, data, uBlockCount);
			else if(state->uHashSize == 384)
				Compress384(state, data, uBlockCount);
			else
				Compress512(state, data, uBlockCount);

			state->processed_bits += uBlockCount * state->uBlockLength * 8;
			data += uBlockCount * state->uBlockLength;
		}

		if(uRemainingBytes > 0)
		{
			memcpy(state->buffer, (void*)data, uRemainingBytes);
		}

		state->uBufferBytes = uRemainingBytes;
	}
	else
	{
		memcpy(state->buffer + state->uBufferBytes, (void*)data, uByteLength);
		state->uBufferBytes += uByteLength;
	}

	return SUCCESS;
}

HashReturn Final(hashState *state, BitSequence *hashval)
{
	unsigned int i;
	BitSequence lengthbuf[8];

	// Update message bit count
	state->processed_bits += state->uBufferBytes * 8;

	// Pad the remaining buffer bytes with zero
	if(state->uBufferBytes != 0)
	{
		if(state->uBufferBytes != state->uBlockLength)
			memset(state->buffer + state->uBufferBytes, 0, state->uBlockLength - state->uBufferBytes);

		if(state->uHashSize == 256)
			Compress256(state, state->buffer, 1);
		else if(state->uHashSize == 384)
			Compress384(state, state->buffer, 1);
		else
			Compress512(state, state->buffer, 1);
	}

	// Last two blocks are message length in bits
	for(i = 0; i < 8; i++)
		lengthbuf[i] = ((state->processed_bits) >> (8 * (7 - i))) & 0xff;

	// Process the last two blocks
	if(state->uHashSize == 256)
		Compress256(state, lengthbuf, 2);
	else if(state->uHashSize == 384)
		Compress384(state, lengthbuf, 2);
	else
		Compress512(state, lengthbuf, 2);


	// Finalization
	if(state->uHashSize == 256)
		Final256(state, hashval);
	else if(state->uHashSize == 384)
		Final384(state, hashval);
	else
		Final512(state, hashval);


	return SUCCESS;
}



HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval)
{
	HashReturn hRet;
	hashState hs;

	hRet = Init(&hs, hashbitlen);
	if(hRet != SUCCESS)
		return hRet;

	hRet = Update(&hs, data, databitlen);
	if(hRet != SUCCESS)
		return hRet;

	hRet = Final(&hs, hashval);
	if(hRet != SUCCESS)
		return hRet;

	return SUCCESS;
}


