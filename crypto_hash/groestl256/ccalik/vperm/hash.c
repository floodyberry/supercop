/*
 * file        : grostl_vperm.c
 * version     : 1.0.208
 * date        : 14.12.2010
 * 
 * - vperm and aes_ni implementations of hash function Grostl
 * - implements NIST hash api
 * - assumes that message lenght is multiple of 8-bits
 * - _GROSTL_VPERM_ must be defined if compiling with ../main.c
 * - default version is vperm, define AES_NI for aes_ni version
 *
 * Cagdas CALIK
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

MYALIGN const unsigned int	_zero[]			= {0x00000000, 0x00000000, 0x00000000, 0x00000000};
MYALIGN const unsigned int	_mul2mask[]		= {0x1b1b0000, 0x00000000, 0x00000000, 0x00000000};
MYALIGN const unsigned int	_mul4mask[]		= {0x2d361b00, 0x00000000, 0x00000000, 0x00000000};
MYALIGN const unsigned int 	_lsbmask[]		= {0x01010101, 0x01010101, 0x01010101, 0x01010101};
MYALIGN const unsigned int 	_lsbmask2[]		= {0x03030303, 0x03030303, 0x03030303, 0x03030303};
MYALIGN const unsigned int 	_transpose1[]	= {0x060e070f, 0x040c050d, 0x020a030b, 0x00080109};
MYALIGN const unsigned int 	_highqmask[]	= {0x00000000, 0x00000000, 0xffffffff, 0xffffffff};
MYALIGN const unsigned int 	_duphimask[]	= {0x0b0a0908, 0x0f0e0d0c, 0x0b0a0908, 0x0f0e0d0c};
MYALIGN const unsigned int 	_duplomask[]	= {0x03020100, 0x07060504, 0x03020100, 0x07060504};
MYALIGN const unsigned int 	_invshiftrows[]	= {0x070a0d00, 0x0b0e0104, 0x0f020508, 0x0306090c};
MYALIGN const unsigned int 	_invmask[]		= {0x0c0d0e0f, 0x08090a0b, 0x04050607, 0x00010203};



#include "crypto_hash.h"

 int crypto_hash(
   unsigned char *out,
   const unsigned char *in,
   unsigned long long inlen
 )
 {

	 if(Hash(256, in, inlen * 8, out) == SUCCESS) 
		 return 0;
	 
	 return -1;
 }

/*
int main()
{
	return 0;
}
*/

#define GROSTL_MIXROW(y, s2a, s2b, s2c, s2d, s3a, s3b, s3c, s5a, s5b, s5c, s5d) \
			y[s2a] = _mm_xor_si128(y[s2a], s2);\
			y[s2b] = _mm_xor_si128(y[s2b], s2);\
			y[s2c] = _mm_xor_si128(y[s2c], s2);\
			y[s2d] = _mm_xor_si128(y[s2d], s2);\
			y[s3a] = _mm_xor_si128(y[s3a], s3);\
			y[s3b] = _mm_xor_si128(y[s3b], s3);\
			y[s3c] = _mm_xor_si128(y[s3c], s3);\
			y[s5a] = _mm_xor_si128(y[s5a], s5);\
			y[s5b] = _mm_xor_si128(y[s5b], s5);\
			y[s5c] = _mm_xor_si128(y[s5c], s5);\
			y[s5d] = _mm_xor_si128(y[s5d], s5)


// x2[i]: 0, 1, 5, 7
// x3[i]: 3, 5, 6
// x5[i]: 1, 2, 4, 5
#define GROSTL_ROUND2(x, y, i, s2a, s2b, s2c, s2d, s3a, s3b, s3c, s5a, s5b, s5c, s5d) \
			x[i] = _mm_shuffle_epi8(x[i], ctx->shift[i]);\
			SUBSTITUTE_VPERM_CORE(x[i], t1, t2, t3, t4);\
			VPERM_LOOKUP(t2, t3, _k_sb2, s2, t1);\
			VPERM_LOOKUP(t2, t3, _k_sb3, s3, t1);\
			VPERM_LOOKUP(t2, t3, _k_sb5, s5, t1);\
			GROSTL_MIXROW(y, s2a, s2b, s2c, s2d, s3a, s3b, s3c, s5a, s5b, s5c, s5d)


#define GROSTL_ROUND_UNROLL2(x, y, s2a, s2b, s2c, s2d, s3a, s3b, s3c, s5a, s5b, s5c, s5d) \
			GROSTL_ROUND2(x, y, 0,  (s2a + 0) % 8, (s2b + 0) % 8, (s2c + 0) % 8, (s2d + 0) % 8, (s3a + 0) % 8, (s3b + 0) % 8, (s3c + 0) % 8, (s5a + 0) % 8, (s5b + 0) % 8, (s5c + 0) % 8, (s5d + 0) % 8);\
			GROSTL_ROUND2(x, y, 1,  (s2a + 1) % 8, (s2b + 1) % 8, (s2c + 1) % 8, (s2d + 1) % 8, (s3a + 1) % 8, (s3b + 1) % 8, (s3c + 1) % 8, (s5a + 1) % 8, (s5b + 1) % 8, (s5c + 1) % 8, (s5d + 1) % 8);\
			GROSTL_ROUND2(x, y, 2,  (s2a + 2) % 8, (s2b + 2) % 8, (s2c + 2) % 8, (s2d + 2) % 8, (s3a + 2) % 8, (s3b + 2) % 8, (s3c + 2) % 8, (s5a + 2) % 8, (s5b + 2) % 8, (s5c + 2) % 8, (s5d + 2) % 8);\
			GROSTL_ROUND2(x, y, 3,  (s2a + 3) % 8, (s2b + 3) % 8, (s2c + 3) % 8, (s2d + 3) % 8, (s3a + 3) % 8, (s3b + 3) % 8, (s3c + 3) % 8, (s5a + 3) % 8, (s5b + 3) % 8, (s5c + 3) % 8, (s5d + 3) % 8);\
			GROSTL_ROUND2(x, y, 4,  (s2a + 4) % 8, (s2b + 4) % 8, (s2c + 4) % 8, (s2d + 4) % 8, (s3a + 4) % 8, (s3b + 4) % 8, (s3c + 4) % 8, (s5a + 4) % 8, (s5b + 4) % 8, (s5c + 4) % 8, (s5d + 4) % 8);\
			GROSTL_ROUND2(x, y, 5,  (s2a + 5) % 8, (s2b + 5) % 8, (s2c + 5) % 8, (s2d + 5) % 8, (s3a + 5) % 8, (s3b + 5) % 8, (s3c + 5) % 8, (s5a + 5) % 8, (s5b + 5) % 8, (s5c + 5) % 8, (s5d + 5) % 8);\
			GROSTL_ROUND2(x, y, 6,  (s2a + 6) % 8, (s2b + 6) % 8, (s2c + 6) % 8, (s2d + 6) % 8, (s3a + 6) % 8, (s3b + 6) % 8, (s3c + 6) % 8, (s5a + 6) % 8, (s5b + 6) % 8, (s5c + 6) % 8, (s5d + 6) % 8);\
			GROSTL_ROUND2(x, y, 7,  (s2a + 7) % 8, (s2b + 7) % 8, (s2c + 7) % 8, (s2d + 7) % 8, (s3a + 7) % 8, (s3b + 7) % 8, (s3c + 7) % 8, (s5a + 7) % 8, (s5b + 7) % 8, (s5c + 7) % 8, (s5d + 7) % 8)

#define GROSTL_ROUND_AESNI(x, y, i) \
				x[i] = _mm_aesenclast_si128(x[i], M128(_zero));\
				x[i] = _mm_shuffle_epi8(x[i], M128(_invshiftrows));\
				x[i] = _mm_shuffle_epi8(x[i], ctx->shift[i]);\
				s2 = _mm_add_epi8(x[i], x[i]);\
				s4 = _mm_add_epi8(s2, s2);\
				t1 = _mm_srli_epi16(x[i], 6);\
				t1 = _mm_and_si128(t1, M128(_lsbmask2));\
				t2 = _mm_shuffle_epi8(M128(_mul2mask), t1);\
				s2 = _mm_xor_si128(s2, t2);\
				t2 = _mm_shuffle_epi8(M128(_mul4mask), t1);\
				s4 = _mm_xor_si128(s4, t2);\
				s3 = _mm_xor_si128(x[i], s2);\
				s5 = _mm_xor_si128(x[i], s4);\
				GROSTL_MIXROW(y, i, (1 + i) % 8, (5 + i) % 8, (7 + i) % 8,  (3 + i) % 8, (5 + i) % 8, (6 + i) % 8,  (1 + i) % 8, (2 + i) % 8, (4 + i) % 8, (5 + i) % 8)


#define GROSTL_FULL_ROUND(x, y, i) \
			x[0] = _mm_xor_si128(x[0], ctx->addconstP[i]);\
			x[7] = _mm_xor_si128(x[7], ctx->addconstQ[i]);\
			y[0] = _mm_xor_si128(y[0], y[0]);\
			y[1] = y[0];\
			y[2] = y[0];\
			y[3] = y[0];\
			y[4] = y[0];\
			y[5] = y[0];\
			y[6] = y[0];\
			y[7] = y[0];\
			GROSTL_ROUND_UNROLL2(x, y, 0, 1, 5, 7,  3, 5, 6,  1, 2, 4, 5);\
			x[0] = _mm_xor_si128(y[0], M128(_k_h15));\
			x[1] = _mm_xor_si128(y[1], M128(_k_h15));\
			x[2] = _mm_xor_si128(y[2], M128(_k_h15));\
			x[3] = _mm_xor_si128(y[3], M128(_k_h15));\
			x[4] = _mm_xor_si128(y[4], M128(_k_h15));\
			x[5] = _mm_xor_si128(y[5], M128(_k_h15));\
			x[6] = _mm_xor_si128(y[6], M128(_k_h15));\
			x[7] = _mm_xor_si128(y[7], M128(_k_h15))


void Compress256(hashState *ctx, const unsigned char *pmsg, unsigned int uBlockCount)
{
	unsigned int b, r;
	__m128i x[8], m[4], y[8], t1, t2, t3, t4, s2, s3, s5, u[4], u2[4];
	__m128i statelocal[8], mtranspose[8];

#ifdef AES_NI
	__m128i x2[8], x3[8], x4[8], x5[8], x7[8], s1, s4;
#endif

	// transpose cv
	u[0]	= _mm_shuffle_epi8(ctx->state[0], M128(_transpose1));
	u[1]	= _mm_shuffle_epi8(ctx->state[1], M128(_transpose1));
	u[2]	= _mm_shuffle_epi8(ctx->state[2], M128(_transpose1));
	u[3]	= _mm_shuffle_epi8(ctx->state[3], M128(_transpose1));
	u2[0]	= _mm_unpacklo_epi16(u[3], u[2]);
	u2[1]	= _mm_unpacklo_epi16(u[1], u[0]);
	u2[2]	= _mm_unpackhi_epi16(u[3], u[2]);
	u2[3]	= _mm_unpackhi_epi16(u[1], u[0]);
	u[0]	= _mm_unpackhi_epi32(u2[2], u2[3]);
	u[1]	= _mm_unpacklo_epi32(u2[2], u2[3]);
	u[2]	= _mm_unpackhi_epi32(u2[0], u2[1]);
	u[3]	= _mm_unpacklo_epi32(u2[0], u2[1]);

	statelocal[0] = _mm_and_si128(u[0], M128(_highqmask));
	statelocal[1] = _mm_slli_si128(u[0], 8);
	statelocal[2] = _mm_and_si128(u[1], M128(_highqmask));
	statelocal[3] = _mm_slli_si128(u[1], 8);
	statelocal[4] = _mm_and_si128(u[2], M128(_highqmask));
	statelocal[5] = _mm_slli_si128(u[2], 8);
	statelocal[6] = _mm_and_si128(u[3], M128(_highqmask));
	statelocal[7] = _mm_slli_si128(u[3], 8);


#ifndef AES_NI
		// transform state
		TRANSFORM(statelocal[0], _k_ipt, t1, t2);
		TRANSFORM(statelocal[1], _k_ipt, t1, t2);
		TRANSFORM(statelocal[2], _k_ipt, t1, t2);
		TRANSFORM(statelocal[3], _k_ipt, t1, t2);
		TRANSFORM(statelocal[4], _k_ipt, t1, t2);
		TRANSFORM(statelocal[5], _k_ipt, t1, t2);
		TRANSFORM(statelocal[6], _k_ipt, t1, t2);
		TRANSFORM(statelocal[7], _k_ipt, t1, t2);
#endif

	for(b = 0; b < uBlockCount; b++)
	{
		// load message
		m[0] = _mm_loadu_si128((__m128i*)pmsg + 0);
		m[1] = _mm_loadu_si128((__m128i*)pmsg + 1);
		m[2] = _mm_loadu_si128((__m128i*)pmsg + 2);
		m[3] = _mm_loadu_si128((__m128i*)pmsg + 3);


#ifndef AES_NI
		// transform message
		TRANSFORM(m[0], _k_ipt, t1, t2);
		TRANSFORM(m[1], _k_ipt, t1, t2);
		TRANSFORM(m[2], _k_ipt, t1, t2);
		TRANSFORM(m[3], _k_ipt, t1, t2);
#endif


		// transpose message
		u[0]  = _mm_shuffle_epi8(m[0], M128(_transpose1));
		u[1]  = _mm_shuffle_epi8(m[1], M128(_transpose1));
		u[2]  = _mm_shuffle_epi8(m[2], M128(_transpose1));
		u[3]  = _mm_shuffle_epi8(m[3], M128(_transpose1));
		u2[0] = _mm_unpacklo_epi16(u[3], u[2]);
		u2[1] = _mm_unpacklo_epi16(u[1], u[0]);
		u2[2] = _mm_unpackhi_epi16(u[3], u[2]);
		u2[3] = _mm_unpackhi_epi16(u[1], u[0]);
		u[0]  = _mm_unpackhi_epi32(u2[2], u2[3]);
		u[1]  = _mm_unpacklo_epi32(u2[2], u2[3]);
		u[2]  = _mm_unpackhi_epi32(u2[0], u2[1]);
		u[3]  = _mm_unpacklo_epi32(u2[0], u2[1]);

		// duplicate message to high and low qwords
#if 1
		mtranspose[0] = _mm_shuffle_epi32(u[0], _MM_SHUFFLE(3, 2, 3, 2));
		mtranspose[1] = _mm_shuffle_epi32(u[0], _MM_SHUFFLE(1, 0, 1, 0));
		mtranspose[2] = _mm_shuffle_epi32(u[1], _MM_SHUFFLE(3, 2, 3, 2));
		mtranspose[3] = _mm_shuffle_epi32(u[1], _MM_SHUFFLE(1, 0, 1, 0));
		mtranspose[4] = _mm_shuffle_epi32(u[2], _MM_SHUFFLE(3, 2, 3, 2));
		mtranspose[5] = _mm_shuffle_epi32(u[2], _MM_SHUFFLE(1, 0, 1, 0));
		mtranspose[6] = _mm_shuffle_epi32(u[3], _MM_SHUFFLE(3, 2, 3, 2));
		mtranspose[7] = _mm_shuffle_epi32(u[3], _MM_SHUFFLE(1, 0, 1, 0));
#elif 1
		mtranspose[0] = _mm_unpackhi_epi64(u[0], u[0]);
		mtranspose[1] = _mm_unpacklo_epi64(u[0], u[0]);
		mtranspose[2] = _mm_unpackhi_epi64(u[1], u[1]);
		mtranspose[3] = _mm_unpacklo_epi64(u[1], u[1]);
		mtranspose[4] = _mm_unpackhi_epi64(u[2], u[2]);
		mtranspose[5] = _mm_unpacklo_epi64(u[2], u[2]);
		mtranspose[6] = _mm_unpackhi_epi64(u[3], u[3]);
		mtranspose[7] = _mm_unpacklo_epi64(u[3], u[3]);
#else
		mtranspose[0] = _mm_shuffle_epi8(u[0], M128(_duphimask));
		mtranspose[1] = _mm_shuffle_epi8(u[0], M128(_duplomask));
		mtranspose[2] = _mm_shuffle_epi8(u[1], M128(_duphimask));
		mtranspose[3] = _mm_shuffle_epi8(u[1], M128(_duplomask));
		mtranspose[4] = _mm_shuffle_epi8(u[2], M128(_duphimask));
		mtranspose[5] = _mm_shuffle_epi8(u[2], M128(_duplomask));
		mtranspose[6] = _mm_shuffle_epi8(u[3], M128(_duphimask));
		mtranspose[7] = _mm_shuffle_epi8(u[3], M128(_duplomask));
#endif

		// xor cv and message
		x[0] = _mm_xor_si128(statelocal[0], mtranspose[0]);
		x[1] = _mm_xor_si128(statelocal[1], mtranspose[1]);
		x[2] = _mm_xor_si128(statelocal[2], mtranspose[2]);
		x[3] = _mm_xor_si128(statelocal[3], mtranspose[3]);
		x[4] = _mm_xor_si128(statelocal[4], mtranspose[4]);
		x[5] = _mm_xor_si128(statelocal[5], mtranspose[5]);
		x[6] = _mm_xor_si128(statelocal[6], mtranspose[6]);
		x[7] = _mm_xor_si128(statelocal[7], mtranspose[7]);

	
		// UNROLL
		//for(i = 0; i < 5; i++)
		//{
		//	GROSTL_FULL_ROUND(2 * i + 0);
		//	GROSTL_FULL_ROUND(2 * i + 1);
		//}
		

		for(r = 0; r < 10; r++)
		{
			// addconstant
			x[0] = _mm_xor_si128(x[0], ctx->addconstP[r]);
			x[7] = _mm_xor_si128(x[7], ctx->addconstQ[r]);

			y[0] = M128(_zero);
			y[1] = M128(_zero);
			y[2] = M128(_zero);
			y[3] = M128(_zero);
			y[4] = M128(_zero);
			y[5] = M128(_zero);
			y[6] = M128(_zero);
			y[7] = M128(_zero);

#ifdef AES_NI
			GROSTL_ROUND_AESNI(x, y, 0);
			GROSTL_ROUND_AESNI(x, y, 1);
			GROSTL_ROUND_AESNI(x, y, 2);
			GROSTL_ROUND_AESNI(x, y, 3);
			GROSTL_ROUND_AESNI(x, y, 4);
			GROSTL_ROUND_AESNI(x, y, 5);
			GROSTL_ROUND_AESNI(x, y, 6);
			GROSTL_ROUND_AESNI(x, y, 7);

			x[0] = y[0];
			x[1] = y[1];
			x[2] = y[2];
			x[3] = y[3];
			x[4] = y[4];
			x[5] = y[5];
			x[6] = y[6];
			x[7] = y[7];
#else

			GROSTL_ROUND_UNROLL2(x, y, 0, 1, 5, 7,  3, 5, 6,  1, 2, 4, 5);

			x[0] = _mm_xor_si128(y[0], M128(_k_h15));
			x[1] = _mm_xor_si128(y[1], M128(_k_h15));
			x[2] = _mm_xor_si128(y[2], M128(_k_h15));
			x[3] = _mm_xor_si128(y[3], M128(_k_h15));
			x[4] = _mm_xor_si128(y[4], M128(_k_h15));
			x[5] = _mm_xor_si128(y[5], M128(_k_h15));
			x[6] = _mm_xor_si128(y[6], M128(_k_h15));
			x[7] = _mm_xor_si128(y[7], M128(_k_h15));
#endif		
		}

		// P ^ Q
		if(!ctx->bFinalBlock)
		{
#if 1
		x[0] = _mm_xor_si128(x[0], _mm_unpacklo_epi64(x[0], x[0]));
		x[1] = _mm_xor_si128(x[1], _mm_unpacklo_epi64(x[1], x[1]));
		x[2] = _mm_xor_si128(x[2], _mm_unpacklo_epi64(x[2], x[2]));
		x[3] = _mm_xor_si128(x[3], _mm_unpacklo_epi64(x[3], x[3]));
		x[4] = _mm_xor_si128(x[4], _mm_unpacklo_epi64(x[4], x[4]));
		x[5] = _mm_xor_si128(x[5], _mm_unpacklo_epi64(x[5], x[5]));
		x[6] = _mm_xor_si128(x[6], _mm_unpacklo_epi64(x[6], x[6]));
		x[7] = _mm_xor_si128(x[7], _mm_unpacklo_epi64(x[7], x[7]));
#else
		x[0] = _mm_xor_si128(x[0], _mm_alignr_epi8(x[0], t1, 8));
		x[1] = _mm_xor_si128(x[1], _mm_alignr_epi8(x[1], t1, 8));
		x[2] = _mm_xor_si128(x[2], _mm_alignr_epi8(x[2], t1, 8));
		x[3] = _mm_xor_si128(x[3], _mm_alignr_epi8(x[3], t1, 8));
		x[4] = _mm_xor_si128(x[4], _mm_alignr_epi8(x[4], t1, 8));
		x[5] = _mm_xor_si128(x[5], _mm_alignr_epi8(x[5], t1, 8));
		x[6] = _mm_xor_si128(x[6], _mm_alignr_epi8(x[6], t1, 8));
		x[7] = _mm_xor_si128(x[7], _mm_alignr_epi8(x[7], t1, 8));
#endif
		}

		statelocal[0] = _mm_xor_si128(statelocal[0], x[0]);
		statelocal[1] = _mm_xor_si128(statelocal[1], x[1]);
		statelocal[2] = _mm_xor_si128(statelocal[2], x[2]);
		statelocal[3] = _mm_xor_si128(statelocal[3], x[3]);
		statelocal[4] = _mm_xor_si128(statelocal[4], x[4]);
		statelocal[5] = _mm_xor_si128(statelocal[5], x[5]);
		statelocal[6] = _mm_xor_si128(statelocal[6], x[6]);
		statelocal[7] = _mm_xor_si128(statelocal[7], x[7]);
	}

	// transpose to original cv format
	statelocal[0] = _mm_unpackhi_epi64(statelocal[1], statelocal[0]);
	statelocal[2] = _mm_unpackhi_epi64(statelocal[3], statelocal[2]);
	statelocal[4] = _mm_unpackhi_epi64(statelocal[5], statelocal[4]);
	statelocal[6] = _mm_unpackhi_epi64(statelocal[7], statelocal[6]);
	u[0] = _mm_shuffle_epi8(statelocal[0], M128(_transpose1));
	u[1] = _mm_shuffle_epi8(statelocal[2], M128(_transpose1));
	u[2] = _mm_shuffle_epi8(statelocal[4], M128(_transpose1));
	u[3] = _mm_shuffle_epi8(statelocal[6], M128(_transpose1));
	u2[0] = _mm_unpacklo_epi16(u[0], u[1]);
	u2[1] = _mm_unpacklo_epi16(u[2], u[3]);
	u2[2] = _mm_unpackhi_epi16(u[0], u[1]);
	u2[3] = _mm_unpackhi_epi16(u[2], u[3]);
	
	ctx->state[0] = _mm_unpacklo_epi32(u2[0], u2[1]);
	ctx->state[1] = _mm_unpackhi_epi32(u2[0], u2[1]);
	ctx->state[2] = _mm_unpacklo_epi32(u2[2], u2[3]);
	ctx->state[3] = _mm_unpackhi_epi32(u2[2], u2[3]);

#ifndef AES_NI
		TRANSFORM(ctx->state[0], _k_opt, t1, t2);
		TRANSFORM(ctx->state[1], _k_opt, t1, t2);
		TRANSFORM(ctx->state[2], _k_opt, t1, t2);
		TRANSFORM(ctx->state[3], _k_opt, t1, t2);
#endif

	ctx->processed_blocks += uBlockCount;
}


void Compress512(hashState *ctx, const unsigned char *pmsg, unsigned int uBlockCount)
{
	unsigned int b, r;
	__m128i x[8], m[8], y[8], t1, t2, t3, t4, s2, s3, s5, u[8], u2[8];
	__m128i statelocal[8];

#ifdef AES_NI
	__m128i x2[8], x3[8], x4[8], x5[8], x7[8], s1, s4;
#endif

	// transpose cv
	u[0]  = _mm_shuffle_epi8(ctx->state[0], M128(_transpose1));
	u[1]  = _mm_shuffle_epi8(ctx->state[1], M128(_transpose1));
	u[2]  = _mm_shuffle_epi8(ctx->state[2], M128(_transpose1));
	u[3]  = _mm_shuffle_epi8(ctx->state[3], M128(_transpose1));
	u[4]  = _mm_shuffle_epi8(ctx->state[4], M128(_transpose1));
	u[5]  = _mm_shuffle_epi8(ctx->state[5], M128(_transpose1));
	u[6]  = _mm_shuffle_epi8(ctx->state[6], M128(_transpose1));
	u[7]  = _mm_shuffle_epi8(ctx->state[7], M128(_transpose1));
	u2[0] = _mm_unpacklo_epi16(u[7], u[6]);
	u2[1] = _mm_unpacklo_epi16(u[5], u[4]);
	u2[2] = _mm_unpacklo_epi16(u[3], u[2]);
	u2[3] = _mm_unpacklo_epi16(u[1], u[0]);
	u2[4] = _mm_unpackhi_epi16(u[7], u[6]);
	u2[5] = _mm_unpackhi_epi16(u[5], u[4]);
	u2[6] = _mm_unpackhi_epi16(u[3], u[2]);
	u2[7] = _mm_unpackhi_epi16(u[1], u[0]);
	u[0]  = _mm_unpackhi_epi32(u2[6], u2[7]);
	u[1]  = _mm_unpacklo_epi32(u2[6], u2[7]);
	u[2]  = _mm_unpackhi_epi32(u2[4], u2[5]);
	u[3]  = _mm_unpacklo_epi32(u2[4], u2[5]);
	u[4]  = _mm_unpackhi_epi32(u2[2], u2[3]);
	u[5]  = _mm_unpacklo_epi32(u2[2], u2[3]);
	u[6]  = _mm_unpackhi_epi32(u2[0], u2[1]);
	u[7]  = _mm_unpacklo_epi32(u2[0], u2[1]);
	statelocal[0] = _mm_unpackhi_epi64(u[2], u[0]);
	statelocal[1] = _mm_unpacklo_epi64(u[2], u[0]);
	statelocal[2] = _mm_unpackhi_epi64(u[3], u[1]);
	statelocal[3] = _mm_unpacklo_epi64(u[3], u[1]);
	statelocal[4] = _mm_unpackhi_epi64(u[6], u[4]);
	statelocal[5] = _mm_unpacklo_epi64(u[6], u[4]);
	statelocal[6] = _mm_unpackhi_epi64(u[7], u[5]);
	statelocal[7] = _mm_unpacklo_epi64(u[7], u[5]);

#ifndef AES_NI
		TRANSFORM(statelocal[0], _k_ipt, t1, t2);
		TRANSFORM(statelocal[1], _k_ipt, t1, t2);
		TRANSFORM(statelocal[2], _k_ipt, t1, t2);
		TRANSFORM(statelocal[3], _k_ipt, t1, t2);
		TRANSFORM(statelocal[4], _k_ipt, t1, t2);
		TRANSFORM(statelocal[5], _k_ipt, t1, t2);
		TRANSFORM(statelocal[6], _k_ipt, t1, t2);
		TRANSFORM(statelocal[7], _k_ipt, t1, t2);
#endif



	for(b = 0; b < uBlockCount; b++)
	{
		// load message
		m[0] = _mm_loadu_si128((__m128i*)pmsg + 0);
		m[1] = _mm_loadu_si128((__m128i*)pmsg + 1);
		m[2] = _mm_loadu_si128((__m128i*)pmsg + 2);
		m[3] = _mm_loadu_si128((__m128i*)pmsg + 3);
		m[4] = _mm_loadu_si128((__m128i*)pmsg + 4);
		m[5] = _mm_loadu_si128((__m128i*)pmsg + 5);
		m[6] = _mm_loadu_si128((__m128i*)pmsg + 6);
		m[7] = _mm_loadu_si128((__m128i*)pmsg + 7);

#ifndef AES_NI
		TRANSFORM(m[0], _k_ipt, t1, t2);
		TRANSFORM(m[1], _k_ipt, t1, t2);
		TRANSFORM(m[2], _k_ipt, t1, t2);
		TRANSFORM(m[3], _k_ipt, t1, t2);
		TRANSFORM(m[4], _k_ipt, t1, t2);
		TRANSFORM(m[5], _k_ipt, t1, t2);
		TRANSFORM(m[6], _k_ipt, t1, t2);
		TRANSFORM(m[7], _k_ipt, t1, t2);
#endif


		// transpose message
		u[0]  = _mm_shuffle_epi8(m[0], M128(_transpose1));
		u[1]  = _mm_shuffle_epi8(m[1], M128(_transpose1));
		u[2]  = _mm_shuffle_epi8(m[2], M128(_transpose1));
		u[3]  = _mm_shuffle_epi8(m[3], M128(_transpose1));
		u[4]  = _mm_shuffle_epi8(m[4], M128(_transpose1));
		u[5]  = _mm_shuffle_epi8(m[5], M128(_transpose1));
		u[6]  = _mm_shuffle_epi8(m[6], M128(_transpose1));
		u[7]  = _mm_shuffle_epi8(m[7], M128(_transpose1));
		u2[0] = _mm_unpacklo_epi16(u[7], u[6]);
		u2[1] = _mm_unpacklo_epi16(u[5], u[4]);
		u2[2] = _mm_unpacklo_epi16(u[3], u[2]);
		u2[3] = _mm_unpacklo_epi16(u[1], u[0]);
		u2[4] = _mm_unpackhi_epi16(u[7], u[6]);
		u2[5] = _mm_unpackhi_epi16(u[5], u[4]);
		u2[6] = _mm_unpackhi_epi16(u[3], u[2]);
		u2[7] = _mm_unpackhi_epi16(u[1], u[0]);
		u[0]  = _mm_unpackhi_epi32(u2[6], u2[7]);
		u[1]  = _mm_unpacklo_epi32(u2[6], u2[7]);
		u[2]  = _mm_unpackhi_epi32(u2[4], u2[5]);
		u[3]  = _mm_unpacklo_epi32(u2[4], u2[5]);
		u[4]  = _mm_unpackhi_epi32(u2[2], u2[3]);
		u[5]  = _mm_unpacklo_epi32(u2[2], u2[3]);
		u[6]  = _mm_unpackhi_epi32(u2[0], u2[1]);
		u[7]  = _mm_unpacklo_epi32(u2[0], u2[1]);
		u2[0] = _mm_unpackhi_epi64(u[2], u[0]);
		u2[1] = _mm_unpacklo_epi64(u[2], u[0]);
		u2[2] = _mm_unpackhi_epi64(u[3], u[1]);
		u2[3] = _mm_unpacklo_epi64(u[3], u[1]);
		u2[4] = _mm_unpackhi_epi64(u[6], u[4]);
		u2[5] = _mm_unpacklo_epi64(u[6], u[4]);
		u2[6] = _mm_unpackhi_epi64(u[7], u[5]);
		u2[7] = _mm_unpacklo_epi64(u[7], u[5]);

		// xor cv and message
		x[0] = _mm_xor_si128(statelocal[0], u2[0]);
		x[1] = _mm_xor_si128(statelocal[1], u2[1]);
		x[2] = _mm_xor_si128(statelocal[2], u2[2]);
		x[3] = _mm_xor_si128(statelocal[3], u2[3]);
		x[4] = _mm_xor_si128(statelocal[4], u2[4]);
		x[5] = _mm_xor_si128(statelocal[5], u2[5]);
		x[6] = _mm_xor_si128(statelocal[6], u2[6]);
		x[7] = _mm_xor_si128(statelocal[7], u2[7]);

		//
		// P
		//
		for(r = 0; r < 14; r++)
		{
			// addconstant
			x[0] = _mm_xor_si128(x[0], ctx->addconstP[r]);

			y[0] = M128(_zero);
			y[1] = M128(_zero);
			y[2] = M128(_zero);
			y[3] = M128(_zero);
			y[4] = M128(_zero);
			y[5] = M128(_zero);
			y[6] = M128(_zero);
			y[7] = M128(_zero);


#ifdef AES_NI
			GROSTL_ROUND_AESNI(x, y, 0);
			GROSTL_ROUND_AESNI(x, y, 1);
			GROSTL_ROUND_AESNI(x, y, 2);
			GROSTL_ROUND_AESNI(x, y, 3);
			GROSTL_ROUND_AESNI(x, y, 4);
			GROSTL_ROUND_AESNI(x, y, 5);
			GROSTL_ROUND_AESNI(x, y, 6);
			GROSTL_ROUND_AESNI(x, y, 7);

			x[0] = y[0];
			x[1] = y[1];
			x[2] = y[2];
			x[3] = y[3];
			x[4] = y[4];
			x[5] = y[5];
			x[6] = y[6];
			x[7] = y[7];
#else

			GROSTL_ROUND_UNROLL2(x, y, 0, 1, 5, 7,  3, 5, 6,  1, 2, 4, 5);

			x[0] = _mm_xor_si128(y[0], M128(_k_h15));
			x[1] = _mm_xor_si128(y[1], M128(_k_h15));
			x[2] = _mm_xor_si128(y[2], M128(_k_h15));
			x[3] = _mm_xor_si128(y[3], M128(_k_h15));
			x[4] = _mm_xor_si128(y[4], M128(_k_h15));
			x[5] = _mm_xor_si128(y[5], M128(_k_h15));
			x[6] = _mm_xor_si128(y[6], M128(_k_h15));
			x[7] = _mm_xor_si128(y[7], M128(_k_h15));
#endif
		}

		//
		// Q
		//
		for(r = 0; r < 14; r++)
		{
			// addconstant
			u2[7] = _mm_xor_si128(u2[7], ctx->addconstQ[r]);

			y[0] = M128(_zero);
			y[1] = M128(_zero);
			y[2] = M128(_zero);
			y[3] = M128(_zero);
			y[4] = M128(_zero);
			y[5] = M128(_zero);
			y[6] = M128(_zero);
			y[7] = M128(_zero);


#ifdef AES_NI
			GROSTL_ROUND_AESNI(u2, y, 0);
			GROSTL_ROUND_AESNI(u2, y, 1);
			GROSTL_ROUND_AESNI(u2, y, 2);
			GROSTL_ROUND_AESNI(u2, y, 3);
			GROSTL_ROUND_AESNI(u2, y, 4);
			GROSTL_ROUND_AESNI(u2, y, 5);
			GROSTL_ROUND_AESNI(u2, y, 6);
			GROSTL_ROUND_AESNI(u2, y, 7);

			u2[0] = y[0];
			u2[1] = y[1];
			u2[2] = y[2];
			u2[3] = y[3];
			u2[4] = y[4];
			u2[5] = y[5];
			u2[6] = y[6];
			u2[7] = y[7];
#else

			GROSTL_ROUND_UNROLL2(u2, y, 0, 1, 5, 7,  3, 5, 6,  1, 2, 4, 5);

			u2[0] = _mm_xor_si128(y[0], M128(_k_h15));
			u2[1] = _mm_xor_si128(y[1], M128(_k_h15));
			u2[2] = _mm_xor_si128(y[2], M128(_k_h15));
			u2[3] = _mm_xor_si128(y[3], M128(_k_h15));
			u2[4] = _mm_xor_si128(y[4], M128(_k_h15));
			u2[5] = _mm_xor_si128(y[5], M128(_k_h15));
			u2[6] = _mm_xor_si128(y[6], M128(_k_h15));
			u2[7] = _mm_xor_si128(y[7], M128(_k_h15));
#endif
		}


		// P ^ Q
		if(!ctx->bFinalBlock)
		{
			x[0] = _mm_xor_si128(u2[0], x[0]);
			x[1] = _mm_xor_si128(u2[1], x[1]);
			x[2] = _mm_xor_si128(u2[2], x[2]);
			x[3] = _mm_xor_si128(u2[3], x[3]);
			x[4] = _mm_xor_si128(u2[4], x[4]);
			x[5] = _mm_xor_si128(u2[5], x[5]);
			x[6] = _mm_xor_si128(u2[6], x[6]);
			x[7] = _mm_xor_si128(u2[7], x[7]);
		}

		statelocal[0] = _mm_xor_si128(statelocal[0], x[0]);
		statelocal[1] = _mm_xor_si128(statelocal[1], x[1]);
		statelocal[2] = _mm_xor_si128(statelocal[2], x[2]);
		statelocal[3] = _mm_xor_si128(statelocal[3], x[3]);
		statelocal[4] = _mm_xor_si128(statelocal[4], x[4]);
		statelocal[5] = _mm_xor_si128(statelocal[5], x[5]);
		statelocal[6] = _mm_xor_si128(statelocal[6], x[6]);
		statelocal[7] = _mm_xor_si128(statelocal[7], x[7]);
	}


#ifndef AES_NI
		TRANSFORM(statelocal[0], _k_opt, t1, t2);
		TRANSFORM(statelocal[1], _k_opt, t1, t2);
		TRANSFORM(statelocal[2], _k_opt, t1, t2);
		TRANSFORM(statelocal[3], _k_opt, t1, t2);
		TRANSFORM(statelocal[4], _k_opt, t1, t2);
		TRANSFORM(statelocal[5], _k_opt, t1, t2);
		TRANSFORM(statelocal[6], _k_opt, t1, t2);
		TRANSFORM(statelocal[7], _k_opt, t1, t2);
#endif

	// transpose to original cv format
	u[0]  = _mm_shuffle_epi8(statelocal[0], M128(_invmask));
	u[1]  = _mm_shuffle_epi8(statelocal[1], M128(_invmask));
	u[2]  = _mm_shuffle_epi8(statelocal[2], M128(_invmask));
	u[3]  = _mm_shuffle_epi8(statelocal[3], M128(_invmask));
	u[4]  = _mm_shuffle_epi8(statelocal[4], M128(_invmask));
	u[5]  = _mm_shuffle_epi8(statelocal[5], M128(_invmask));
	u[6]  = _mm_shuffle_epi8(statelocal[6], M128(_invmask));
	u[7]  = _mm_shuffle_epi8(statelocal[7], M128(_invmask));
	u2[0]  = _mm_unpacklo_epi8(u[0], u[1]);
	u2[1]  = _mm_unpacklo_epi8(u[2], u[3]);
	u2[2]  = _mm_unpacklo_epi8(u[4], u[5]);
	u2[3]  = _mm_unpacklo_epi8(u[6], u[7]);
	u2[4]  = _mm_unpackhi_epi8(u[0], u[1]);
	u2[5]  = _mm_unpackhi_epi8(u[2], u[3]);
	u2[6]  = _mm_unpackhi_epi8(u[4], u[5]);
	u2[7]  = _mm_unpackhi_epi8(u[6], u[7]);
	u[0] = _mm_unpacklo_epi16(u2[0], u2[1]);
	u[1] = _mm_unpacklo_epi16(u2[2], u2[3]);
	u[2] = _mm_unpacklo_epi16(u2[4], u2[5]);
	u[3] = _mm_unpacklo_epi16(u2[6], u2[7]);
	u[4] = _mm_unpackhi_epi16(u2[0], u2[1]);
	u[5] = _mm_unpackhi_epi16(u2[2], u2[3]);
	u[6] = _mm_unpackhi_epi16(u2[4], u2[5]);
	u[7] = _mm_unpackhi_epi16(u2[6], u2[7]);
	ctx->state[0]  = _mm_unpacklo_epi32(u[0], u[1]);
	ctx->state[1]  = _mm_unpackhi_epi32(u[0], u[1]);
	ctx->state[2]  = _mm_unpacklo_epi32(u[4], u[5]);
	ctx->state[3]  = _mm_unpackhi_epi32(u[4], u[5]);
	ctx->state[4]  = _mm_unpacklo_epi32(u[2], u[3]);
	ctx->state[5]  = _mm_unpackhi_epi32(u[2], u[3]);
	ctx->state[6]  = _mm_unpacklo_epi32(u[6], u[7]);
	ctx->state[7]  = _mm_unpackhi_epi32(u[6], u[7]);

	ctx->processed_blocks += uBlockCount;
}




HashReturn Init(hashState *ctx, int nHashSize)
{
	int i;
	__m128i t1, t2;

	ctx->processed_blocks = 0;
	ctx->uBufferBytes = 0;
	ctx->bFinalBlock = 0;

	switch(nHashSize)
	{
		case 256:
			ctx->uHashSize = 256;
			ctx->uBlockLength = 64;
			ctx->uRounds = 10;
			ctx->state[0] = _mm_set_epi32(0, 0, 0, 0);
			ctx->state[1] = _mm_set_epi32(0, 0, 0, 0);
			ctx->state[2] = _mm_set_epi32(0, 0, 0, 0);
			ctx->state[3] = _mm_set_epi32(0x00010000, 0, 0, 0);
			ctx->shift[0] = _mm_set_epi32(0x0f0e0d0c, 0x0b0a0908, 0x07060504, 0x03020100);
			ctx->shift[1] = _mm_set_epi32(0x0e0d0c0b, 0x0a09080f, 0x06050403, 0x02010007);
			ctx->shift[2] = _mm_set_epi32(0x0d0c0b0a, 0x09080f0e, 0x05040302, 0x01000706);
			ctx->shift[3] = _mm_set_epi32(0x0c0b0a09, 0x080f0e0d, 0x04030201, 0x00070605);
			ctx->shift[4] = _mm_set_epi32(0x0b0a0908, 0x0f0e0d0c, 0x03020100, 0x07060504);
			ctx->shift[5] = _mm_set_epi32(0x0a09080f, 0x0e0d0c0b, 0x02010007, 0x06050403);
			ctx->shift[6] = _mm_set_epi32(0x09080f0e, 0x0d0c0b0a, 0x01000706, 0x05040302);
			ctx->shift[7] = _mm_set_epi32(0x080f0e0d, 0x0c0b0a09, 0x00070605, 0x04030201);

			for(i = 0; i < 10; i++)
			{
				ctx->addconstP[i] = _mm_set_epi32(i << 24, 0, 0, 0);
				ctx->addconstQ[i] = _mm_set_epi32(0, 0, (~i) << 24, 0);

		#ifndef AES_NI
				TRANSFORM(ctx->addconstP[i], _k_ipt, t1, t2);
				TRANSFORM(ctx->addconstQ[i], _k_ipt, t1, t2);
		#endif
			}
			break;

		case 512:
			ctx->uHashSize = 512;
			ctx->uBlockLength = 128;
			ctx->uRounds = 14;
			ctx->state[0] = _mm_set_epi32(0, 0, 0, 0);
			ctx->state[1] = _mm_set_epi32(0, 0, 0, 0);
			ctx->state[2] = _mm_set_epi32(0, 0, 0, 0);
			ctx->state[3] = _mm_set_epi32(0, 0, 0, 0);
			ctx->state[4] = _mm_set_epi32(0, 0, 0, 0);
			ctx->state[5] = _mm_set_epi32(0, 0, 0, 0);
			ctx->state[6] = _mm_set_epi32(0, 0, 0, 0);
			ctx->state[7] = _mm_set_epi32(0x00020000, 0, 0, 0);
			ctx->shift[0] = _mm_set_epi32(0x0f0e0d0c, 0x0b0a0908, 0x07060504, 0x03020100);
			ctx->shift[1] = _mm_set_epi32(0x0e0d0c0b, 0x0a090807, 0x06050403, 0x0201000f);
			ctx->shift[2] = _mm_set_epi32(0x0d0c0b0a, 0x09080706, 0x05040302, 0x01000f0e);
			ctx->shift[3] = _mm_set_epi32(0x0c0b0a09, 0x08070605, 0x04030201, 0x000f0e0d);
			ctx->shift[4] = _mm_set_epi32(0x0b0a0908, 0x07060504, 0x03020100, 0x0f0e0d0c);
			ctx->shift[5] = _mm_set_epi32(0x0a090807, 0x06050403, 0x0201000f, 0x0e0d0c0b);
			ctx->shift[6] = _mm_set_epi32(0x09080706, 0x05040302, 0x01000f0e, 0x0d0c0b0a);
			ctx->shift[7] = _mm_set_epi32(0x04030201, 0x000f0e0d, 0x0c0b0a09, 0x08070605);

			for(i = 0; i < 14; i++)
			{
				ctx->addconstP[i] = _mm_set_epi32(i << 24, 0, 0, 0);
				ctx->addconstQ[i] = _mm_set_epi32((~i) << 24, 0, 0, 0);

		#ifndef AES_NI
				TRANSFORM(ctx->addconstP[i], _k_ipt, t1, t2);
				TRANSFORM(ctx->addconstQ[i], _k_ipt, t1, t2);
		#endif
			}
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
			else
				Compress512(state, state->buffer, 1);

			//state->processed_blocks++;
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
			else
				Compress512(state, data, uBlockCount);

			//state->processed_blocks += uBlockCount;
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

	// Pad with 0x80
	state->buffer[state->uBufferBytes++] = 0x80;

	// Enough buffer space to pad the block count?
	if((state->uBlockLength - state->uBufferBytes) >= 8)
	{
		// Pad the block count
		memset(state->buffer + state->uBufferBytes, 0, state->uBlockLength - state->uBufferBytes - 8);
		for(i = 0; i < 8; i++)
			state->buffer[state->uBlockLength - 8 + i] = ((state->processed_blocks + 1) >> (8 * (7 - i))) & 0xff;

		// Compress
		if(state->uHashSize == 256)
			Compress256(state, state->buffer, 1);
		else
			Compress512(state, state->buffer, 1);

	}
	else
	{
		// Fill with zero and compress
		memset(state->buffer, 0, state->uBlockLength - state->uBufferBytes);
		if(state->uHashSize == 256)
			Compress256(state, state->buffer, 1);
		else
			Compress512(state, state->buffer, 1);


		// Last block is (zero || blockcount)
		memset(state->buffer, 0, state->uBlockLength - 8);
		for(i = 0; i < 8; i++)
			state->buffer[state->uBlockLength - 8 + i] = ((state->processed_blocks + 2) >> (8 * (7 - i))) & 0xff;

		// Compress the last block
		if(state->uHashSize == 256)
			Compress256(state, state->buffer, 1);
		else
			Compress512(state, state->buffer, 1);
	}

	// Final compression
	state->bFinalBlock = 1;
	memset(state->buffer, 0, state->uBlockLength);

	if(state->uHashSize == 256)
	{
		Compress256(state, state->buffer, 1);

		_mm_storeu_si128((__m128i*)hashval + 0, state->state[2]);
		_mm_storeu_si128((__m128i*)hashval + 1, state->state[3]);
	}
	else
	{
		Compress512(state, state->buffer, 1);

		_mm_storeu_si128((__m128i*)hashval + 0, state->state[4]);
		_mm_storeu_si128((__m128i*)hashval + 1, state->state[5]);
		_mm_storeu_si128((__m128i*)hashval + 2, state->state[6]);
		_mm_storeu_si128((__m128i*)hashval + 3, state->state[7]);
	}

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


