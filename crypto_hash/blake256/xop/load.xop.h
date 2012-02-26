
#ifndef __BLAKE256_LOAD_XOP_H__
#define __BLAKE256_LOAD_XOP_H__

#define TOB(x) ((x)*4*0x01010101 + 0x03020100) // ..or not TOB

//Basic VPPERM emulation, for testing purposes
// static __m128i _mm_perm_epi8(const __m128i src1, const __m128i src2, const __m128i sel)
// {
//    const __m128i sixteen = _mm_set1_epi8(16);
//    const __m128i s0 = _mm_shuffle_epi8(src1, sel);
//    const __m128i s1 = _mm_shuffle_epi8(src2, _mm_sub_epi8(sel, sixteen));
//    const __m128i mask = _mm_or_si128(_mm_cmpeq_epi8(sel, sixteen), 
//                                      _mm_cmpgt_epi8(sel, sixteen)); // (>=16) = 0xff : 00
//    return _mm_blendv_epi8(s0, s1, mask);
// }

#define LOAD_MSG_0_1(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(6),TOB(4),TOB(2),TOB(0)) ); \
s1 = _mm_set_epi32(0xec4e6c89,0x299f31d0,0x3707344,0x85a308d3); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 0, 0);

#define LOAD_MSG_0_2(buf) \
s2 = _mm_set_epi32(0x82efa98,0xa4093822,0x13198a2e,0x243f6a88); \
s3 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(7),TOB(5),TOB(3),TOB(1)) ); \
buf = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 0, 1);

#define LOAD_MSG_0_3(buf) \
s0 = _mm_perm_epi8(m2, m3, _mm_set_epi32(TOB(6),TOB(4),TOB(2),TOB(0)) ); \
s1 = _mm_set_epi32(0xb5470917,0xc97c50dd,0x34e90c6c,0x38d01377); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 0, 2);

#define LOAD_MSG_0_4(buf) \
s2 = _mm_set_epi32(0x3f84d5b5,0xc0ac29b7,0xbe5466cf,0x452821e6); \
s3 = _mm_perm_epi8(m2, m3, _mm_set_epi32(TOB(7),TOB(5),TOB(3),TOB(1)) ); \
buf4 = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 0, 3);


#define LOAD_MSG_1_1(buf) \
s0 = _mm_perm_epi8(m1, m2, _mm_set_epi32(TOB(0),TOB(5),TOB(0),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m3, _mm_set_epi32(TOB(5),TOB(2),TOB(1),TOB(6)) ); \
s1 = _mm_set_epi32(0x82efa98,0xb5470917,0x452821e6,0xbe5466cf); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 1, 0);

#define LOAD_MSG_1_2(buf) \
s2 = _mm_set_epi32(0xc97c50dd,0x38d01377,0xa4093822,0x3f84d5b5); \
s3 = _mm_perm_epi8(m1, m2, _mm_set_epi32(TOB(2),TOB(0),TOB(4),TOB(6)) ); \
s3 = _mm_perm_epi8(s3, m3, _mm_set_epi32(TOB(3),TOB(7),TOB(1),TOB(0)) ); \
buf = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 1, 1);

#define LOAD_MSG_1_3(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(5),TOB(0),TOB(0),TOB(1)) ); \
s0 = _mm_perm_epi8(s0, m2, _mm_set_epi32(TOB(3),TOB(7),TOB(1),TOB(0)) ); \
s1 = _mm_set_epi32(0x3707344,0xec4e6c89,0x13198a2e,0xc0ac29b7); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 1, 2);

#define LOAD_MSG_1_4(buf) \
s2 = _mm_set_epi32(0x299f31d0,0x34e90c6c,0x243f6a88,0x85a308d3); \
s3 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(3),TOB(7),TOB(2),TOB(0)) ); \
s3 = _mm_perm_epi8(s3, m3, _mm_set_epi32(TOB(3),TOB(2),TOB(1),TOB(4)) ); \
buf4 = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 1, 3);


#define LOAD_MSG_2_1(buf) \
s0 = _mm_perm_epi8(m1, m2, _mm_set_epi32(TOB(0),TOB(1),TOB(0),TOB(7)) ); \
s0 = _mm_perm_epi8(s0, m3, _mm_set_epi32(TOB(7),TOB(2),TOB(4),TOB(0)) ); \
s1 = _mm_set_epi32(0xc97c50dd,0x13198a2e,0x243f6a88,0x452821e6); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 2, 0);

#define LOAD_MSG_2_2(buf) \
s2 = _mm_set_epi32(0xb5470917,0x299f31d0,0xc0ac29b7,0x34e90c6c); \
s3 = _mm_perm_epi8(m0, m2, _mm_set_epi32(TOB(0),TOB(2),TOB(0),TOB(4)) ); \
s3 = _mm_perm_epi8(s3, m3, _mm_set_epi32(TOB(5),TOB(2),TOB(1),TOB(0)) ); \
buf = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 2, 1);

#define LOAD_MSG_2_3(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(0),TOB(7),TOB(3),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m2, _mm_set_epi32(TOB(5),TOB(2),TOB(1),TOB(6)) ); \
s1 = _mm_set_epi32(0xa4093822,0x85a308d3,0x82efa98,0x3f84d5b5); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 2, 2);

#define LOAD_MSG_2_4(buf) \
s2 = _mm_set_epi32(0x38d01377,0xec4e6c89,0x3707344,0xbe5466cf); \
s3 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(4),TOB(1),TOB(6),TOB(0)) ); \
s3 = _mm_perm_epi8(s3, m3, _mm_set_epi32(TOB(3),TOB(2),TOB(1),TOB(6)) ); \
buf4 = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 2, 3);


#define LOAD_MSG_3_1(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(0),TOB(0),TOB(3),TOB(7)) ); \
s0 = _mm_perm_epi8(s0, m2, _mm_set_epi32(TOB(7),TOB(2),TOB(1),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m3, _mm_set_epi32(TOB(3),TOB(5),TOB(1),TOB(0)) ); \
s1 = _mm_set_epi32(0x3f84d5b5,0xc0ac29b7,0x85a308d3,0x38d01377); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 3, 0);

#define LOAD_MSG_3_2(buf) \
s2 = _mm_set_epi32(0x34e90c6c,0xc97c50dd,0x3707344,0xec4e6c89); \
s3 = _mm_perm_epi8(m0, m2, _mm_set_epi32(TOB(0),TOB(0),TOB(1),TOB(5)) ); \
s3 = _mm_perm_epi8(s3, m3, _mm_set_epi32(TOB(6),TOB(4),TOB(1),TOB(0)) ); \
buf = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 3, 1);

#define LOAD_MSG_3_3(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(0),TOB(4),TOB(5),TOB(2)) ); \
s0 = _mm_perm_epi8(s0, m3, _mm_set_epi32(TOB(7),TOB(2),TOB(1),TOB(0)) ); \
s1 = _mm_set_epi32(0x452821e6,0x243f6a88,0xbe5466cf,0x82efa98); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 3, 2);

#define LOAD_MSG_3_4(buf) \
s2 = _mm_set_epi32(0xb5470917,0xa4093822,0x299f31d0,0x13198a2e); \
s3 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(0),TOB(0),TOB(0),TOB(6)) ); \
s3 = _mm_perm_epi8(s3, m2, _mm_set_epi32(TOB(4),TOB(2),TOB(6),TOB(0)) ); \
buf4 = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 3, 3);


#define LOAD_MSG_4_1(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(0),TOB(2),TOB(5),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m2, _mm_set_epi32(TOB(6),TOB(2),TOB(1),TOB(5)) ); \
s1 = _mm_set_epi32(0xb5470917,0xa4093822,0xec4e6c89,0x243f6a88); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_4_2(buf) \
s2 = _mm_set_epi32(0xbe5466cf,0x13198a2e,0x299f31d0,0x38d01377); \
s3 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(0),TOB(4),TOB(7),TOB(0)) ); \
s3 = _mm_perm_epi8(s3, m3, _mm_set_epi32(TOB(7),TOB(2),TOB(1),TOB(0)) ); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_4_3(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(3),TOB(6),TOB(0),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m2, _mm_set_epi32(TOB(3),TOB(2),TOB(7),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m3, _mm_set_epi32(TOB(3),TOB(2),TOB(1),TOB(6)) ); \
s1 = _mm_set_epi32(0xc97c50dd,0x452821e6,0xc0ac29b7,0x85a308d3); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_4_4(buf) \
s2 = _mm_set_epi32(0x3707344,0x82efa98,0x34e90c6c,0x3f84d5b5); \
s3 = _mm_perm_epi8(m0, m2, _mm_set_epi32(TOB(0),TOB(4),TOB(0),TOB(1)) ); \
s3 = _mm_perm_epi8(s3, m3, _mm_set_epi32(TOB(5),TOB(2),TOB(4),TOB(0)) ); \
buf4 = _mm_xor_si128(s2, s3); \


#define LOAD_MSG_5_1(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(0),TOB(0),TOB(6),TOB(2)) ); \
s0 = _mm_perm_epi8(s0, m2, _mm_set_epi32(TOB(4),TOB(2),TOB(1),TOB(0)) ); \
s1 = _mm_set_epi32(0x3707344,0x34e90c6c,0xbe5466cf,0xc0ac29b7); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_5_2(buf) \
s2 = _mm_set_epi32(0x452821e6,0x243f6a88,0x82efa98,0x13198a2e); \
s3 = _mm_perm_epi8(m0, m2, _mm_set_epi32(TOB(3),TOB(7),TOB(6),TOB(0)) ); \
s3 = _mm_perm_epi8(s3, m3, _mm_set_epi32(TOB(3),TOB(2),TOB(1),TOB(4)) ); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_5_3(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(1),TOB(0),TOB(7),TOB(4)) ); \
s0 = _mm_perm_epi8(s0, m3, _mm_set_epi32(TOB(3),TOB(7),TOB(1),TOB(0)) ); \
s1 = _mm_set_epi32(0x38d01377,0x3f84d5b5,0x299f31d0,0xc97c50dd); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_5_4(buf) \
s2 = _mm_set_epi32(0x85a308d3,0xb5470917,0xec4e6c89,0xa4093822); \
s3 = _mm_perm_epi8(m1, m2, _mm_set_epi32(TOB(5),TOB(0),TOB(1),TOB(0)) ); \
s3 = _mm_perm_epi8(s3, m3, _mm_set_epi32(TOB(3),TOB(6),TOB(1),TOB(5)) ); \
buf4 = _mm_xor_si128(s2, s3); \


#define LOAD_MSG_6_1(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(4),TOB(0),TOB(1),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m3, _mm_set_epi32(TOB(3),TOB(6),TOB(1),TOB(4)) ); \
s1 = _mm_set_epi32(0xbe5466cf,0xc97c50dd,0xb5470917,0x299f31d0); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_6_2(buf) \
s2 = _mm_set_epi32(0xa4093822,0x3f84d5b5,0x85a308d3,0xc0ac29b7); \
s3 = _mm_perm_epi8(m1, m2, _mm_set_epi32(TOB(6),TOB(0),TOB(0),TOB(1)) ); \
s3 = _mm_perm_epi8(s3, m3, _mm_set_epi32(TOB(3),TOB(5),TOB(7),TOB(0)) ); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_6_3(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(0),TOB(0),TOB(6),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m2, _mm_set_epi32(TOB(4),TOB(5),TOB(1),TOB(0)) ); \
s1 = _mm_set_epi32(0x34e90c6c,0x13198a2e,0x3707344,0xec4e6c89); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_6_4(buf) \
s2 = _mm_set_epi32(0x452821e6,0x38d01377,0x82efa98,0x243f6a88); \
s3 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(0),TOB(2),TOB(3),TOB(7)) ); \
s3 = _mm_perm_epi8(s3, m2, _mm_set_epi32(TOB(7),TOB(2),TOB(1),TOB(0)) ); \
buf4 = _mm_xor_si128(s2, s3); \


#define LOAD_MSG_7_1(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(3),TOB(0),TOB(7),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m3, _mm_set_epi32(TOB(3),TOB(4),TOB(1),TOB(5)) ); \
s1 = _mm_set_epi32(0x38d01377,0x85a308d3,0x3f84d5b5,0x34e90c6c); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_7_2(buf) \
s2 = _mm_set_epi32(0x3707344,0xc0ac29b7,0xec4e6c89,0xc97c50dd); \
s3 = _mm_perm_epi8(m0, m2, _mm_set_epi32(TOB(5),TOB(1),TOB(0),TOB(7)) ); \
s3 = _mm_perm_epi8(s3, m3, _mm_set_epi32(TOB(3),TOB(2),TOB(6),TOB(0)) ); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_7_3(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(2),TOB(0),TOB(0),TOB(5)) ); \
s0 = _mm_perm_epi8(s0, m2, _mm_set_epi32(TOB(3),TOB(4),TOB(1),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m3, _mm_set_epi32(TOB(3),TOB(2),TOB(7),TOB(0)) ); \
s1 = _mm_set_epi32(0xbe5466cf,0x82efa98,0xa4093822,0x243f6a88); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_7_4(buf) \
s2 = _mm_set_epi32(0x13198a2e,0x452821e6,0xb5470917,0x299f31d0); \
s3 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(0),TOB(6),TOB(4),TOB(0)) ); \
s3 = _mm_perm_epi8(s3, m2, _mm_set_epi32(TOB(6),TOB(2),TOB(1),TOB(0)) ); \
buf4 = _mm_xor_si128(s2, s3); \


#define LOAD_MSG_8_1(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(0),TOB(0),TOB(0),TOB(6)) ); \
s0 = _mm_perm_epi8(s0, m2, _mm_set_epi32(TOB(3),TOB(7),TOB(1),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m3, _mm_set_epi32(TOB(3),TOB(2),TOB(6),TOB(0)) ); \
s1 = _mm_set_epi32(0x452821e6,0x3707344,0x38d01377,0xb5470917); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_8_2(buf) \
s2 = _mm_set_epi32(0x243f6a88,0x34e90c6c,0x3f84d5b5,0x82efa98); \
s3 = _mm_perm_epi8(m0, m2, _mm_set_epi32(TOB(4),TOB(3),TOB(5),TOB(0)) ); \
s3 = _mm_perm_epi8(s3, m3, _mm_set_epi32(TOB(3),TOB(2),TOB(1),TOB(7)) ); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_8_3(buf) \
s0 = _mm_perm_epi8(m0, m2, _mm_set_epi32(TOB(6),TOB(1),TOB(0),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m3, _mm_set_epi32(TOB(3),TOB(2),TOB(5),TOB(4)) ); \
s1 = _mm_set_epi32(0x299f31d0,0xa4093822,0xec4e6c89,0x13198a2e); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_8_4(buf) \
s2 = _mm_set_epi32(0xbe5466cf,0x85a308d3,0xc97c50dd,0xc0ac29b7); \
s3 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(5),TOB(4),TOB(7),TOB(2)) ); \
buf4 = _mm_xor_si128(s2, s3); \


#define LOAD_MSG_9_1(buf) \
s0 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(1),TOB(7),TOB(0),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m2, _mm_set_epi32(TOB(3),TOB(2),TOB(4),TOB(6)) ); \
s1 = _mm_set_epi32(0x299f31d0,0x82efa98,0xa4093822,0x13198a2e); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_9_2(buf) \
s2 = _mm_set_epi32(0x85a308d3,0xec4e6c89,0x452821e6,0xbe5466cf); \
s3 = _mm_perm_epi8(m0, m1, _mm_set_epi32(TOB(5),TOB(6),TOB(4),TOB(2)) ); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_9_3(buf) \
s0 = _mm_perm_epi8(m0, m2, _mm_set_epi32(TOB(0),TOB(3),TOB(5),TOB(0)) ); \
s0 = _mm_perm_epi8(s0, m3, _mm_set_epi32(TOB(5),TOB(2),TOB(1),TOB(7)) ); \
s1 = _mm_set_epi32(0x243f6a88,0xc0ac29b7,0x3f84d5b5,0x34e90c6c); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_9_4(buf) \
s2 = _mm_set_epi32(0xc97c50dd,0x3707344,0x38d01377,0xb5470917); \
s3 = _mm_perm_epi8(m0, m2, _mm_set_epi32(TOB(0),TOB(0),TOB(0),TOB(7)) ); \
s3 = _mm_perm_epi8(s3, m3, _mm_set_epi32(TOB(3),TOB(4),TOB(6),TOB(0)) ); \
buf4 = _mm_xor_si128(s2, s3); \

#ifdef CACHE_MESSAGE

#define LOAD_MSG_10_1(buf) CACHE_LOAD(buf, 0, 0)
#define LOAD_MSG_10_2(buf) CACHE_LOAD(buf, 0, 1)
#define LOAD_MSG_10_3(buf) CACHE_LOAD(buf, 0, 2)
#define LOAD_MSG_10_4(buf) CACHE_LOAD(buf, 0, 3)

#define LOAD_MSG_11_1(buf) CACHE_LOAD(buf, 1, 0)
#define LOAD_MSG_11_2(buf) CACHE_LOAD(buf, 1, 1)
#define LOAD_MSG_11_3(buf) CACHE_LOAD(buf, 1, 2)
#define LOAD_MSG_11_4(buf) CACHE_LOAD(buf, 1, 3)

#define LOAD_MSG_12_1(buf) CACHE_LOAD(buf, 2, 0)
#define LOAD_MSG_12_2(buf) CACHE_LOAD(buf, 2, 1)
#define LOAD_MSG_12_3(buf) CACHE_LOAD(buf, 2, 2)
#define LOAD_MSG_12_4(buf) CACHE_LOAD(buf, 2, 3)

#define LOAD_MSG_13_1(buf) CACHE_LOAD(buf, 3, 0)
#define LOAD_MSG_13_2(buf) CACHE_LOAD(buf, 3, 1)
#define LOAD_MSG_13_3(buf) CACHE_LOAD(buf, 3, 2)
#define LOAD_MSG_13_4(buf) CACHE_LOAD(buf, 3, 3)

#else

#define LOAD_MSG_10_1 LOAD_MSG_0_1
#define LOAD_MSG_10_2 LOAD_MSG_0_2
#define LOAD_MSG_10_3 LOAD_MSG_0_3
#define LOAD_MSG_10_4 LOAD_MSG_0_4

#define LOAD_MSG_11_1 LOAD_MSG_1_1
#define LOAD_MSG_11_2 LOAD_MSG_1_2
#define LOAD_MSG_11_3 LOAD_MSG_1_3
#define LOAD_MSG_11_4 LOAD_MSG_1_4

#define LOAD_MSG_12_1 LOAD_MSG_2_1
#define LOAD_MSG_12_2 LOAD_MSG_2_2
#define LOAD_MSG_12_3 LOAD_MSG_2_3
#define LOAD_MSG_12_4 LOAD_MSG_2_4

#define LOAD_MSG_13_1 LOAD_MSG_3_1
#define LOAD_MSG_13_2 LOAD_MSG_3_2
#define LOAD_MSG_13_3 LOAD_MSG_3_3
#define LOAD_MSG_13_4 LOAD_MSG_3_4

#endif

#endif

