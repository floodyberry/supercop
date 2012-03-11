
#ifndef __BLAKE512_ROUNDS_H__
#define __BLAKE512_ROUNDS_H__

#define ROTR(x, c) ( ((x) >> (c)) | ((x) << (64-(c))) )

#ifndef HAVE_XOP
	#define BSWAP64(x) _mm_shuffle_epi8((x), u8to64)

	#define _mm_roti_epi64(x, c) \
	(-(c) == 32) ? _mm_shuffle_epi32((x), _MM_SHUFFLE(2,3,0,1))  \
	: (-(c) == 16) ? _mm_shuffle_epi8((x), r16) \
		: _mm_xor_si128(_mm_srli_epi64((x), -(c)), _mm_slli_epi64((x), 64-(-c))) 
#else
	#define BSWAP64(x) _mm_perm_epi8((x),(x),u8to64)
#endif



#define LOAD_MSG_0_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[0], m.u128[1]); \
t1 = _mm_set_epi64x(0x82EFA98EC4E6C89ULL, 0x13198A2E03707344ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[4] ^ 0xBE5466CF34E90C6CULL; \
b1h = m.u64[6] ^ 0x3F84D5B5B5470917ULL; \
} while(0) 


#define LOAD_MSG_0_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[0], m.u128[1]); \
t1 = _mm_set_epi64x(0xA4093822299F31D0ULL, 0x243F6A8885A308D3ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[5] ^ 0x452821E638D01377ULL; \
b1h = m.u64[7] ^ 0xC0AC29B7C97C50DDULL; \
} while(0) 


#define LOAD_MSG_0_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[4], m.u128[5]); \
t1 = _mm_set_epi64x(0xB8E1AFED6A267E96ULL, 0xD1310BA698DFB5ACULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[12] ^ 0x24A19947B3916CF7ULL; \
b1h = m.u64[14] ^ 0x636920D871574E69ULL; \
} while(0) 


#define LOAD_MSG_0_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[4], m.u128[5]); \
t1 = _mm_set_epi64x(0x2FFD72DBD01ADFB7ULL, 0x9216D5D98979FB1BULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[13] ^ 0xBA7C9045F12C7F99ULL; \
b1h = m.u64[15] ^ 0x801F2E2858EFC16ULL; \
} while(0) 


#define LOAD_MSG_1_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[7], m.u128[2]); \
t1 = _mm_set_epi64x(0x9216D5D98979FB1BULL, 0x2FFD72DBD01ADFB7ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[9] ^ 0x636920D871574E69ULL; \
b1h = m.u64[13] ^ 0xC0AC29B7C97C50DDULL; \
} while(0) 


#define LOAD_MSG_1_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[5], m.u128[4]); \
t1 = _mm_set_epi64x(0x452821E638D01377ULL, 0x801F2E2858EFC16ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[15] ^ 0xD1310BA698DFB5ACULL; \
b1h = m.u64[6] ^ 0x24A19947B3916CF7ULL; \
} while(0) 


#define LOAD_MSG_1_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_shuffle_epi32(m.u128[0], _MM_SHUFFLE(1,0,3,2)); \
t1 = _mm_set_epi64x(0xA4093822299F31D0ULL, 0xBA7C9045F12C7F99ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[11] ^ 0x3F84D5B5B5470917ULL; \
b1h = m.u64[5] ^ 0x82EFA98EC4E6C89ULL; \
} while(0) 


#define LOAD_MSG_1_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[6], m.u128[1]); \
t1 = _mm_set_epi64x(0x243F6A8885A308D3ULL, 0x13198A2E03707344ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[7] ^ 0xB8E1AFED6A267E96ULL; \
b1h = m.u64[3] ^ 0xBE5466CF34E90C6CULL; \
} while(0) 


#define LOAD_MSG_2_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_alignr_epi8(m.u128[6], m.u128[5], 8); \
t1 = _mm_set_epi64x(0x243F6A8885A308D3ULL, 0x9216D5D98979FB1BULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[5] ^ 0xA4093822299F31D0ULL; \
b1h = m.u64[15] ^ 0x24A19947B3916CF7ULL; \
} while(0) 


#define LOAD_MSG_2_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[4], m.u128[0]); \
t1 = _mm_set_epi64x(0xBA7C9045F12C7F99ULL, 0xB8E1AFED6A267E96ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[2] ^ 0xBE5466CF34E90C6CULL; \
b1h = m.u64[13] ^ 0x636920D871574E69ULL; \
} while(0) 


#define LOAD_MSG_2_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_blend_epi16(m.u128[5], m.u128[1], 0xF0); \
t1 = _mm_set_epi64x(0xC0AC29B7C97C50DDULL, 0x801F2E2858EFC16ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[7] ^ 0x13198A2E03707344ULL; \
b1h = m.u64[9] ^ 0x452821E638D01377ULL; \
} while(0) 


#define LOAD_MSG_2_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[7], m.u128[3]); \
t1 = _mm_set_epi64x(0x82EFA98EC4E6C89ULL, 0x2FFD72DBD01ADFB7ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[1] ^ 0x3F84D5B5B5470917ULL; \
b1h = m.u64[4] ^ 0xD1310BA698DFB5ACULL; \
} while(0) 


#define LOAD_MSG_3_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[3], m.u128[1]); \
t1 = _mm_set_epi64x(0x13198A2E03707344ULL, 0xD1310BA698DFB5ACULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[13] ^ 0xBA7C9045F12C7F99ULL; \
b1h = m.u64[11] ^ 0x801F2E2858EFC16ULL; \
} while(0) 


#define LOAD_MSG_3_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[4], m.u128[0]); \
t1 = _mm_set_epi64x(0x82EFA98EC4E6C89ULL, 0x3F84D5B5B5470917ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[12] ^ 0x24A19947B3916CF7ULL; \
b1h = m.u64[14] ^ 0xB8E1AFED6A267E96ULL; \
} while(0) 


#define LOAD_MSG_3_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_blend_epi16(m.u128[1], m.u128[2], 0xF0); \
t1 = _mm_set_epi64x(0x2FFD72DBD01ADFB7ULL, 0xC0AC29B7C97C50DDULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[4] ^ 0x243F6A8885A308D3ULL; \
b1h = m.u64[15] ^ 0x9216D5D98979FB1BULL; \
} while(0) 


#define LOAD_MSG_3_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[3], m.u128[5]); \
t1 = _mm_set_epi64x(0xBE5466CF34E90C6CULL, 0xA4093822299F31D0ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[0] ^ 0x452821E638D01377ULL; \
b1h = m.u64[8] ^ 0x636920D871574E69ULL; \
} while(0) 


#define LOAD_MSG_4_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[4], m.u128[2]); \
t1 = _mm_set_epi64x(0x3F84D5B5B5470917ULL, 0x243F6A8885A308D3ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[2] ^ 0x452821E638D01377ULL; \
b1h = m.u64[10] ^ 0x636920D871574E69ULL; \
} while(0) 


#define LOAD_MSG_4_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_blend_epi16(m.u128[0], m.u128[3], 0xF0); \
t1 = _mm_set_epi64x(0xBE5466CF34E90C6CULL, 0xD1310BA698DFB5ACULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[4] ^ 0xA4093822299F31D0ULL; \
b1h = m.u64[15] ^ 0x2FFD72DBD01ADFB7ULL; \
} while(0) 


#define LOAD_MSG_4_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_blend_epi16(m.u128[7], m.u128[5], 0xF0); \
t1 = _mm_set_epi64x(0xBA7C9045F12C7F99ULL, 0x13198A2E03707344ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[6] ^ 0x9216D5D98979FB1BULL; \
b1h = m.u64[3] ^ 0x24A19947B3916CF7ULL; \
} while(0) 


#define LOAD_MSG_4_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_alignr_epi8(m.u128[6], m.u128[0], 8); \
t1 = _mm_set_epi64x(0xB8E1AFED6A267E96ULL, 0x801F2E2858EFC16ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[8] ^ 0xC0AC29B7C97C50DDULL; \
b1h = m.u64[13] ^ 0x82EFA98EC4E6C89ULL; \
} while(0) 


#define LOAD_MSG_5_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[1], m.u128[3]); \
t1 = _mm_set_epi64x(0x2FFD72DBD01ADFB7ULL, 0xBA7C9045F12C7F99ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[0] ^ 0xB8E1AFED6A267E96ULL; \
b1h = m.u64[8] ^ 0x82EFA98EC4E6C89ULL; \
} while(0) 


#define LOAD_MSG_5_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[6], m.u128[5]); \
t1 = _mm_set_epi64x(0xC0AC29B7C97C50DDULL, 0xA4093822299F31D0ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[11] ^ 0x243F6A8885A308D3ULL; \
b1h = m.u64[3] ^ 0x9216D5D98979FB1BULL; \
} while(0) 


#define LOAD_MSG_5_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_blend_epi16(m.u128[2], m.u128[3], 0xF0); \
t1 = _mm_set_epi64x(0xBE5466CF34E90C6CULL, 0x24A19947B3916CF7ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[15] ^ 0x801F2E2858EFC16ULL; \
b1h = m.u64[1] ^ 0xD1310BA698DFB5ACULL; \
} while(0) 


#define LOAD_MSG_5_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[6], m.u128[2]); \
t1 = _mm_set_epi64x(0x3F84D5B5B5470917ULL, 0x452821E638D01377ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[14] ^ 0x636920D871574E69ULL; \
b1h = m.u64[9] ^ 0x13198A2E03707344ULL; \
} while(0) 


#define LOAD_MSG_6_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_blend_epi16(m.u128[6], m.u128[0], 0xF0); \
t1 = _mm_set_epi64x(0x636920D871574E69ULL, 0xBE5466CF34E90C6CULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[14] ^ 0x24A19947B3916CF7ULL; \
b1h = m.u64[4] ^ 0x2FFD72DBD01ADFB7ULL; \
} while(0) 


#define LOAD_MSG_6_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[2], m.u128[7]); \
t1 = _mm_set_epi64x(0x13198A2E03707344ULL, 0xBA7C9045F12C7F99ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[13] ^ 0x801F2E2858EFC16ULL; \
b1h = m.u64[10] ^ 0x452821E638D01377ULL; \
} while(0) 


#define LOAD_MSG_6_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[0], m.u128[3]); \
t1 = _mm_set_epi64x(0x82EFA98EC4E6C89ULL, 0x3F84D5B5B5470917ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[9] ^ 0xA4093822299F31D0ULL; \
b1h = m.u64[8] ^ 0xB8E1AFED6A267E96ULL; \
} while(0) 


#define LOAD_MSG_6_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[3], m.u128[1]); \
t1 = _mm_set_epi64x(0xC0AC29B7C97C50DDULL, 0x243F6A8885A308D3ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[2] ^ 0xD1310BA698DFB5ACULL; \
b1h = m.u64[11] ^ 0x9216D5D98979FB1BULL; \
} while(0) 


#define LOAD_MSG_7_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[6], m.u128[3]); \
t1 = _mm_set_epi64x(0x801F2E2858EFC16ULL, 0xB8E1AFED6A267E96ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[12] ^ 0x13198A2E03707344ULL; \
b1h = m.u64[3] ^ 0xD1310BA698DFB5ACULL; \
} while(0) 


#define LOAD_MSG_7_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_alignr_epi8(m.u128[7], m.u128[5], 8); \
t1 = _mm_set_epi64x(0x3F84D5B5B5470917ULL, 0x24A19947B3916CF7ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[1] ^ 0xBA7C9045F12C7F99ULL; \
b1h = m.u64[9] ^ 0x82EFA98EC4E6C89ULL; \
} while(0) 


#define LOAD_MSG_7_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[2], m.u128[7]); \
t1 = _mm_set_epi64x(0x452821E638D01377ULL, 0x243F6A8885A308D3ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[8] ^ 0xC0AC29B7C97C50DDULL; \
b1h = m.u64[2] ^ 0x2FFD72DBD01ADFB7ULL; \
} while(0) 


#define LOAD_MSG_7_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[0], m.u128[2]); \
t1 = _mm_set_epi64x(0x636920D871574E69ULL, 0xBE5466CF34E90C6CULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[6] ^ 0x9216D5D98979FB1BULL; \
b1h = m.u64[10] ^ 0xA4093822299F31D0ULL; \
} while(0) 


#define LOAD_MSG_8_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[3], m.u128[7]); \
t1 = _mm_set_epi64x(0xD1310BA698DFB5ACULL, 0x636920D871574E69ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[11] ^ 0x82EFA98EC4E6C89ULL; \
b1h = m.u64[0] ^ 0x9216D5D98979FB1BULL; \
} while(0) 


#define LOAD_MSG_8_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[7], m.u128[4]); \
t1 = _mm_set_epi64x(0x801F2E2858EFC16ULL, 0xC0AC29B7C97C50DDULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[3] ^ 0xB8E1AFED6A267E96ULL; \
b1h = m.u64[8] ^ 0x243F6A8885A308D3ULL; \
} while(0) 


#define LOAD_MSG_8_3(b0, b1l, b1h) \
do \
{ \
t0 = m.u128[6]; \
t1 = _mm_set_epi64x(0x3F84D5B5B5470917ULL, 0xA4093822299F31D0ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[1] ^ 0x452821E638D01377ULL; \
b1h = m.u64[10] ^ 0xBE5466CF34E90C6CULL; \
} while(0) 


#define LOAD_MSG_8_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_blend_epi16(m.u128[1], m.u128[3], 0xF0); \
t1 = _mm_set_epi64x(0x24A19947B3916CF7ULL, 0xBA7C9045F12C7F99ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[4] ^ 0x13198A2E03707344ULL; \
b1h = m.u64[5] ^ 0x2FFD72DBD01ADFB7ULL; \
} while(0) 


#define LOAD_MSG_9_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[5], m.u128[4]); \
t1 = _mm_set_epi64x(0x452821E638D01377ULL, 0xA4093822299F31D0ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[7] ^ 0xC0AC29B7C97C50DDULL; \
b1h = m.u64[1] ^ 0xBE5466CF34E90C6CULL; \
} while(0) 


#define LOAD_MSG_9_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[1], m.u128[2]); \
t1 = _mm_set_epi64x(0x9216D5D98979FB1BULL, 0x2FFD72DBD01ADFB7ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[6] ^ 0x3F84D5B5B5470917ULL; \
b1h = m.u64[5] ^ 0x13198A2E03707344ULL; \
} while(0) 


#define LOAD_MSG_9_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[7], m.u128[4]); \
t1 = _mm_set_epi64x(0x801F2E2858EFC16ULL, 0xB8E1AFED6A267E96ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[3] ^ 0xBA7C9045F12C7F99ULL; \
b1h = m.u64[13] ^ 0x243F6A8885A308D3ULL; \
} while(0) 


#define LOAD_MSG_9_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_alignr_epi8(m.u128[7], m.u128[5], 8); \
t1 = _mm_set_epi64x(0xD1310BA698DFB5ACULL, 0x636920D871574E69ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[12] ^ 0x82EFA98EC4E6C89ULL; \
b1h = m.u64[0] ^ 0x24A19947B3916CF7ULL; \
} while(0) 


#define LOAD_MSG_10_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[0], m.u128[1]); \
t1 = _mm_set_epi64x(0x82EFA98EC4E6C89ULL, 0x13198A2E03707344ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[4] ^ 0xBE5466CF34E90C6CULL; \
b1h = m.u64[6] ^ 0x3F84D5B5B5470917ULL; \
} while(0) 


#define LOAD_MSG_10_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[0], m.u128[1]); \
t1 = _mm_set_epi64x(0xA4093822299F31D0ULL, 0x243F6A8885A308D3ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[5] ^ 0x452821E638D01377ULL; \
b1h = m.u64[7] ^ 0xC0AC29B7C97C50DDULL; \
} while(0) 


#define LOAD_MSG_10_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[4], m.u128[5]); \
t1 = _mm_set_epi64x(0xB8E1AFED6A267E96ULL, 0xD1310BA698DFB5ACULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[12] ^ 0x24A19947B3916CF7ULL; \
b1h = m.u64[14] ^ 0x636920D871574E69ULL; \
} while(0) 


#define LOAD_MSG_10_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[4], m.u128[5]); \
t1 = _mm_set_epi64x(0x2FFD72DBD01ADFB7ULL, 0x9216D5D98979FB1BULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[13] ^ 0xBA7C9045F12C7F99ULL; \
b1h = m.u64[15] ^ 0x801F2E2858EFC16ULL; \
} while(0) 


#define LOAD_MSG_11_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[7], m.u128[2]); \
t1 = _mm_set_epi64x(0x9216D5D98979FB1BULL, 0x2FFD72DBD01ADFB7ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[9] ^ 0x636920D871574E69ULL; \
b1h = m.u64[13] ^ 0xC0AC29B7C97C50DDULL; \
} while(0) 


#define LOAD_MSG_11_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[5], m.u128[4]); \
t1 = _mm_set_epi64x(0x452821E638D01377ULL, 0x801F2E2858EFC16ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[15] ^ 0xD1310BA698DFB5ACULL; \
b1h = m.u64[6] ^ 0x24A19947B3916CF7ULL; \
} while(0) 


#define LOAD_MSG_11_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_shuffle_epi32(m.u128[0], _MM_SHUFFLE(1,0,3,2)); \
t1 = _mm_set_epi64x(0xA4093822299F31D0ULL, 0xBA7C9045F12C7F99ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[11] ^ 0x3F84D5B5B5470917ULL; \
b1h = m.u64[5] ^ 0x82EFA98EC4E6C89ULL; \
} while(0) 


#define LOAD_MSG_11_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[6], m.u128[1]); \
t1 = _mm_set_epi64x(0x243F6A8885A308D3ULL, 0x13198A2E03707344ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[7] ^ 0xB8E1AFED6A267E96ULL; \
b1h = m.u64[3] ^ 0xBE5466CF34E90C6CULL; \
} while(0) 


#define LOAD_MSG_12_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_alignr_epi8(m.u128[6], m.u128[5], 8); \
t1 = _mm_set_epi64x(0x243F6A8885A308D3ULL, 0x9216D5D98979FB1BULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[5] ^ 0xA4093822299F31D0ULL; \
b1h = m.u64[15] ^ 0x24A19947B3916CF7ULL; \
} while(0) 


#define LOAD_MSG_12_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[4], m.u128[0]); \
t1 = _mm_set_epi64x(0xBA7C9045F12C7F99ULL, 0xB8E1AFED6A267E96ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[2] ^ 0xBE5466CF34E90C6CULL; \
b1h = m.u64[13] ^ 0x636920D871574E69ULL; \
} while(0) 


#define LOAD_MSG_12_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_blend_epi16(m.u128[5], m.u128[1], 0xF0); \
t1 = _mm_set_epi64x(0xC0AC29B7C97C50DDULL, 0x801F2E2858EFC16ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[7] ^ 0x13198A2E03707344ULL; \
b1h = m.u64[9] ^ 0x452821E638D01377ULL; \
} while(0) 


#define LOAD_MSG_12_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[7], m.u128[3]); \
t1 = _mm_set_epi64x(0x82EFA98EC4E6C89ULL, 0x2FFD72DBD01ADFB7ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[1] ^ 0x3F84D5B5B5470917ULL; \
b1h = m.u64[4] ^ 0xD1310BA698DFB5ACULL; \
} while(0) 


#define LOAD_MSG_13_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[3], m.u128[1]); \
t1 = _mm_set_epi64x(0x13198A2E03707344ULL, 0xD1310BA698DFB5ACULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[13] ^ 0xBA7C9045F12C7F99ULL; \
b1h = m.u64[11] ^ 0x801F2E2858EFC16ULL; \
} while(0) 


#define LOAD_MSG_13_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[4], m.u128[0]); \
t1 = _mm_set_epi64x(0x82EFA98EC4E6C89ULL, 0x3F84D5B5B5470917ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[12] ^ 0x24A19947B3916CF7ULL; \
b1h = m.u64[14] ^ 0xB8E1AFED6A267E96ULL; \
} while(0) 


#define LOAD_MSG_13_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_blend_epi16(m.u128[1], m.u128[2], 0xF0); \
t1 = _mm_set_epi64x(0x2FFD72DBD01ADFB7ULL, 0xC0AC29B7C97C50DDULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[4] ^ 0x243F6A8885A308D3ULL; \
b1h = m.u64[15] ^ 0x9216D5D98979FB1BULL; \
} while(0) 


#define LOAD_MSG_13_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[3], m.u128[5]); \
t1 = _mm_set_epi64x(0xBE5466CF34E90C6CULL, 0xA4093822299F31D0ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[0] ^ 0x452821E638D01377ULL; \
b1h = m.u64[8] ^ 0x636920D871574E69ULL; \
} while(0) 


#define LOAD_MSG_14_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[4], m.u128[2]); \
t1 = _mm_set_epi64x(0x3F84D5B5B5470917ULL, 0x243F6A8885A308D3ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[2] ^ 0x452821E638D01377ULL; \
b1h = m.u64[10] ^ 0x636920D871574E69ULL; \
} while(0) 


#define LOAD_MSG_14_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_blend_epi16(m.u128[0], m.u128[3], 0xF0); \
t1 = _mm_set_epi64x(0xBE5466CF34E90C6CULL, 0xD1310BA698DFB5ACULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[4] ^ 0xA4093822299F31D0ULL; \
b1h = m.u64[15] ^ 0x2FFD72DBD01ADFB7ULL; \
} while(0) 


#define LOAD_MSG_14_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_blend_epi16(m.u128[7], m.u128[5], 0xF0); \
t1 = _mm_set_epi64x(0xBA7C9045F12C7F99ULL, 0x13198A2E03707344ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[6] ^ 0x9216D5D98979FB1BULL; \
b1h = m.u64[3] ^ 0x24A19947B3916CF7ULL; \
} while(0) 


#define LOAD_MSG_14_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_alignr_epi8(m.u128[6], m.u128[0], 8); \
t1 = _mm_set_epi64x(0xB8E1AFED6A267E96ULL, 0x801F2E2858EFC16ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[8] ^ 0xC0AC29B7C97C50DDULL; \
b1h = m.u64[13] ^ 0x82EFA98EC4E6C89ULL; \
} while(0) 


#define LOAD_MSG_15_1(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[1], m.u128[3]); \
t1 = _mm_set_epi64x(0x2FFD72DBD01ADFB7ULL, 0xBA7C9045F12C7F99ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[0] ^ 0xB8E1AFED6A267E96ULL; \
b1h = m.u64[8] ^ 0x82EFA98EC4E6C89ULL; \
} while(0) 


#define LOAD_MSG_15_2(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpacklo_epi64(m.u128[6], m.u128[5]); \
t1 = _mm_set_epi64x(0xC0AC29B7C97C50DDULL, 0xA4093822299F31D0ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[11] ^ 0x243F6A8885A308D3ULL; \
b1h = m.u64[3] ^ 0x9216D5D98979FB1BULL; \
} while(0) 


#define LOAD_MSG_15_3(b0, b1l, b1h) \
do \
{ \
t0 = _mm_blend_epi16(m.u128[2], m.u128[3], 0xF0); \
t1 = _mm_set_epi64x(0xBE5466CF34E90C6CULL, 0x24A19947B3916CF7ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[15] ^ 0x801F2E2858EFC16ULL; \
b1h = m.u64[1] ^ 0xD1310BA698DFB5ACULL; \
} while(0) 


#define LOAD_MSG_15_4(b0, b1l, b1h) \
do \
{ \
t0 = _mm_unpackhi_epi64(m.u128[6], m.u128[2]); \
t1 = _mm_set_epi64x(0x3F84D5B5B5470917ULL, 0x452821E638D01377ULL); \
b0 = _mm_xor_si128(t0, t1); \
b1l = m.u64[14] ^ 0x636920D871574E69ULL; \
b1h = m.u64[9] ^ 0x13198A2E03707344ULL; \
} while(0) 


#define G1(row1l,row2l,row3l,row4l,row1hl,row1hh,row2hl,row2hh,row3hl,row3hh,row4hl,row4hh,b0,b1l,b1h) \
row1l   = _mm_add_epi64(_mm_add_epi64(row1l, b0), row2l); \
row1hl += b1l + row2hl; \
row1hh += b1h + row2hh; \
\
row4l   = _mm_xor_si128(row4l, row1l); \
row4hl ^= row1hl; \
row4hh ^= row1hh; \
\
row4l  = _mm_roti_epi64(row4l, -32); \
row4hl = ROTR(row4hl, 32); \
row4hh = ROTR(row4hh, 32); \
\
row3l  = _mm_add_epi64(row3l, row4l); \
row3hl += row4hl; \
row3hh += row4hh; \
\
row2l   = _mm_xor_si128(row2l, row3l); \
row2hl ^= row3hl; \
row2hh ^= row3hh; \
\
row2l  = _mm_roti_epi64(row2l, -25);\
row2hl = ROTR(row2hl, 25); \
row2hh = ROTR(row2hh, 25);

#define G2(row1l,row2l,row3l,row4l,row1hl,row1hh,row2hl,row2hh,row3hl,row3hh,row4hl,row4hh,b0,b1l,b1h) \
row1l   = _mm_add_epi64(_mm_add_epi64(row1l, b0), row2l); \
row1hl += b1l + row2hl; \
row1hh += b1h + row2hh; \
\
row4l   = _mm_xor_si128(row4l, row1l); \
row4hl ^= row1hl; \
row4hh ^= row1hh; \
\
row4l  = _mm_roti_epi64(row4l, -16); \
row4hl = ROTR(row4hl, 16); \
row4hh = ROTR(row4hh, 16); \
\
row3l  = _mm_add_epi64(row3l, row4l); \
row3hl += row4hl; \
row3hh += row4hh; \
\
row2l   = _mm_xor_si128(row2l, row3l); \
row2hl ^= row3hl; \
row2hh ^= row3hh; \
\
row2l  = _mm_roti_epi64(row2l, -11);\
row2hl = ROTR(row2hl, 11); \
row2hh = ROTR(row2hh, 11);

#define DIAGONALIZE(row1l,row2l,row3l,row4l,row1hl,row1hh,row2hl,row2hh,row3hl,row3hh,row4hl,row4hh) \
	/* 3 2 1 0 -> 2 1 0 3 */ \
	u0 = row4hl; \
	u1 = row4hh; \
	row4hl = _mm_extract_epi64(row4l, 1); \
	row4hh = u0; \
	t0     = _mm_cvtsi64_si128(u1); \
	row4l  = _mm_unpacklo_epi64(t0, row4l); \
	/* 3 2 1 0 -> 1 0 3 2 */ \
	u0     = _mm_cvtsi128_si64(row3l); \
	u1     = _mm_extract_epi64(row3l, 1); \
	t0     = _mm_cvtsi64_si128(row3hl); \
	t1     = _mm_cvtsi64_si128(row3hh); \
	row3hl = u0; \
	row3hh = u1; \
	row3l  = _mm_unpacklo_epi64(t0, t1); \
	/* 3 2 1 0 -> 0 3 2 1 */ \
	u0 = row2hl; \
	u1 = row2hh; \
	row2hh = _mm_cvtsi128_si64(row2l); \
	row2hl = u1; \
	t0 = _mm_cvtsi64_si128(u0); \
	row2l = _mm_alignr_epi8(t0, row2l, 8); 


#define UNDIAGONALIZE(row1l,row2l,row3l,row4l,row1hl,row1hh,row2hl,row2hh,row3hl,row3hh,row4hl,row4hh) \
	/* 3 2 1 0 -> 0 3 2 1 */ \
	u0 = row4hl; \
	u1 = row4hh; \
	row4hh = _mm_cvtsi128_si64(row4l); \
	row4hl = u1; \
	t0 = _mm_cvtsi64_si128(u0); \
	row4l = _mm_alignr_epi8(t0, row4l, 8); \
	/* 3 2 1 0 -> 1 0 3 2 */ \
	u0     = _mm_cvtsi128_si64(row3l); \
	u1     = _mm_extract_epi64(row3l, 1); \
	t0     = _mm_cvtsi64_si128(row3hl); \
	t1     = _mm_cvtsi64_si128(row3hh); \
	row3hl = u0; \
	row3hh = u1; \
	row3l  = _mm_unpacklo_epi64(t0, t1); \
	/* 3 2 1 0 -> 2 1 0 3 */ \
	u0 = row2hl; \
	u1 = row2hh; \
	row2hl = _mm_extract_epi64(row2l, 1); \
	row2hh = u0; \
	t0     = _mm_cvtsi64_si128(u1); \
	row2l  = _mm_unpacklo_epi64(t0, row2l); 

#define ROUND(r) \
  LOAD_MSG_ ##r ##_1(b0, b1l, b1h); \
  G1(row1l,row2l,row3l,row4l,row1hl,row1hh,row2hl,row2hh,row3hl,row3hh,row4hl,row4hh,b0,b1l,b1h); \
  LOAD_MSG_ ##r ##_2(b0, b1l, b1h); \
  G2(row1l,row2l,row3l,row4l,row1hl,row1hh,row2hl,row2hh,row3hl,row3hh,row4hl,row4hh,b0,b1l,b1h); \
  DIAGONALIZE(row1l,row2l,row3l,row4l,row1hl,row1hh,row2hl,row2hh,row3hl,row3hh,row4hl,row4hh); \
  LOAD_MSG_ ##r ##_3(b0, b1l, b1h); \
  G1(row1l,row2l,row3l,row4l,row1hl,row1hh,row2hl,row2hh,row3hl,row3hh,row4hl,row4hh,b0,b1l,b1h); \
  LOAD_MSG_ ##r ##_4(b0, b1l,b1h); \
  G2(row1l,row2l,row3l,row4l,row1hl,row1hh,row2hl,row2hh,row3hl,row3hh,row4hl,row4hh,b0,b1l,b1h); \
  UNDIAGONALIZE(row1l,row2l,row3l,row4l,row1hl,row1hh,row2hl,row2hh,row3hl,row3hh,row4hl,row4hh);

#endif

