
#ifndef __BLAKE256_LOAD_SSE41_H__
#define __BLAKE256_LOAD_SSE41_H__

#define LOAD_MSG_0_1(buf) \
t0 = TOI(_mm_shuffle_ps(TOF(m0), TOF(m1), _MM_SHUFFLE(2,0,2,0))); \
t1 = _mm_set_epi32(0xec4e6c89,0x299f31d0,0x3707344,0x85a308d3); \
buf = _mm_xor_si128(t0, t1); \
CACHE_STORE(buf, 0, 0);

#define LOAD_MSG_0_2(buf) \
t2 = TOI(_mm_shuffle_ps(TOF(m0), TOF(m1), _MM_SHUFFLE(3,1,3,1))); \
t3 = _mm_set_epi32(0x82efa98,0xa4093822,0x13198a2e,0x243f6a88); \
buf = _mm_xor_si128(t2, t3); \
CACHE_STORE(buf, 0, 1);

#define LOAD_MSG_0_3(buf) \
t0 = TOI(_mm_shuffle_ps(TOF(m2), TOF(m3), _MM_SHUFFLE(2,0,2,0))); \
t1 = _mm_set_epi32(0xb5470917,0xc97c50dd,0x34e90c6c,0x38d01377); \
buf = _mm_xor_si128(t0, t1); \
CACHE_STORE(buf, 0, 2);

#define LOAD_MSG_0_4(buf) \
t2 = TOI(_mm_shuffle_ps(TOF(m2), TOF(m3), _MM_SHUFFLE(3,1,3,1))); \
t3 = _mm_set_epi32(0x3f84d5b5,0xc0ac29b7,0xbe5466cf,0x452821e6); \
buf = _mm_xor_si128(t2, t3); \
CACHE_STORE(buf, 0, 3);


#define LOAD_MSG_1_1(buf) \
t0 = _mm_blend_epi16(m1, m2, 0x0C); \
t1 = _mm_slli_si128(m3, 4); \
t2 = _mm_blend_epi16(t0, t1, 0xF0); \
s0 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(2,1,0,3)); \
s1 = _mm_set_epi32(0x82efa98,0xb5470917,0x452821e6,0xbe5466cf); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 1, 0);


#define LOAD_MSG_1_2(buf) \
t0 = _mm_shuffle_epi32(m2,_MM_SHUFFLE(0,0,2,0)); \
t1 = _mm_blend_epi16(m1,m3,0xC0); \
t2 = _mm_blend_epi16(t0, t1, 0xF0); \
s3 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(2,3,0,1)); \
s2 = _mm_set_epi32(0xc97c50dd,0x38d01377,0xa4093822,0x3f84d5b5); \
buf = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 1, 1);

#define LOAD_MSG_1_3(buf) \
t0 = _mm_slli_si128(m1, 4); \
t1 = _mm_blend_epi16(m2, t0, 0x30); \
t2 = _mm_blend_epi16(m0, t1, 0xF0); \
s0 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(2,3,0,1)); \
s1 = _mm_set_epi32(0x3707344,0xec4e6c89,0x13198a2e,0xc0ac29b7); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 1, 2);

#define LOAD_MSG_1_4(buf) \
t0 = _mm_unpackhi_epi32(m0,m1); \
t1 = _mm_slli_si128(m3, 4); \
t2 = _mm_blend_epi16(t0, t1, 0x0C); \
s3 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(2,3,0,1)); \
s2 = _mm_set_epi32(0x299f31d0,0x34e90c6c,0x243f6a88,0x85a308d3); \
buf = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 1, 3);



#define LOAD_MSG_2_1(buf) \
t0 = _mm_unpackhi_epi32(m2,m3); \
t1 = _mm_blend_epi16(m3,m1,0x0C); \
t2 = _mm_blend_epi16(t0, t1, 0x0F); \
s0 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(3,1,0,2)); \
s1 = _mm_set_epi32(0xc97c50dd,0x13198a2e,0x243f6a88,0x452821e6); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 2, 0);

#define LOAD_MSG_2_2(buf) \
t0 = _mm_unpacklo_epi32(m2,m0); \
t1 = _mm_blend_epi16(t0, m0, 0xF0); \
t2 = _mm_slli_si128(m3, 8); \
s3 = _mm_blend_epi16(t1, t2, 0xC0); \
s2 = _mm_set_epi32(0xb5470917,0x299f31d0,0xc0ac29b7,0x34e90c6c); \
buf = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 2, 1);

#define LOAD_MSG_2_3(buf) \
t0 = _mm_blend_epi16(m0, m2, 0x3C); \
t1 = _mm_srli_si128(m1, 12); \
t2 = _mm_blend_epi16(t0,t1,0x03); \
s0 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(1,0,3,2)); \
s1 = _mm_set_epi32(0xa4093822,0x85a308d3,0x82efa98,0x3f84d5b5); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 2, 2);

#define LOAD_MSG_2_4(buf) \
t0 = _mm_slli_si128(m3, 4); \
t1 = _mm_blend_epi16(m0, m1, 0x33); \
t2 = _mm_blend_epi16(t1, t0, 0xC0); \
s3 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(0,1,2,3)); \
s2 = _mm_set_epi32(0x38d01377,0xec4e6c89,0x3707344,0xbe5466cf); \
buf = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 2, 3);


#define LOAD_MSG_3_1(buf) \
t0 = _mm_unpackhi_epi32(m0,m1); \
t1 = _mm_unpackhi_epi32(t0, m2); \
t2 = _mm_blend_epi16(t1, m3, 0x0C); \
s0 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(3,1,0,2)); \
s1 = _mm_set_epi32(0x3f84d5b5,0xc0ac29b7,0x85a308d3,0x38d01377); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 3, 0);

#define LOAD_MSG_3_2(buf) \
t0 = _mm_slli_si128(m2, 8); \
t1 = _mm_blend_epi16(m3,m0,0x0C); \
t2 = _mm_blend_epi16(t1, t0, 0xC0); \
s3 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(2,0,1,3)); \
s2 = _mm_set_epi32(0x34e90c6c,0xc97c50dd,0x3707344,0xec4e6c89); \
buf = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 3, 1);

#define LOAD_MSG_3_3(buf) \
t0 = _mm_blend_epi16(m0,m1,0x0F); \
t1 = _mm_blend_epi16(t0, m3, 0xC0); \
s0 = _mm_shuffle_epi32(t1, _MM_SHUFFLE(3,0,1,2)); \
s1 = _mm_set_epi32(0x452821e6,0x243f6a88,0xbe5466cf,0x82efa98); \
buf = _mm_xor_si128(s0, s1); \
CACHE_STORE(buf, 3, 2);

#define LOAD_MSG_3_4(buf) \
t0 = _mm_unpacklo_epi32(m0,m2); \
t1 = _mm_unpackhi_epi32(m1,m2); \
s3 = _mm_unpacklo_epi64(t1,t0); \
s2 = _mm_set_epi32(0xb5470917,0xa4093822,0x299f31d0,0x13198a2e); \
buf = _mm_xor_si128(s2, s3); \
CACHE_STORE(buf, 3, 3);

#define LOAD_MSG_4_1(buf) \
t0 = _mm_unpacklo_epi64(m1,m2); \
t1 = _mm_unpackhi_epi64(m0,m2); \
t2 = _mm_blend_epi16(t0,t1,0x33); \
s0 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(2,0,1,3)); \
s1 = _mm_set_epi32(0xb5470917,0xa4093822,0xec4e6c89,0x243f6a88); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_4_2(buf) \
t0 = _mm_unpackhi_epi64(m1,m3); \
t1 = _mm_unpacklo_epi64(m0,m1); \
s3 = _mm_blend_epi16(t0,t1,0x33); \
s2 = _mm_set_epi32(0xbe5466cf,0x13198a2e,0x299f31d0,0x38d01377); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_4_3(buf) \
t0 = _mm_unpackhi_epi64(m3,m1); \
t1 = _mm_unpackhi_epi64(m2,m0); \
s0 = _mm_blend_epi16(t1,t0,0x33); \
s1 = _mm_set_epi32(0xc97c50dd,0x452821e6,0xc0ac29b7,0x85a308d3); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_4_4(buf) \
t0 = _mm_blend_epi16(m0,m2,0x03); \
t1 = _mm_slli_si128(t0, 8); \
t2 = _mm_blend_epi16(t1,m3,0x0F); \
s3 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(1,2,0,3)); \
s2 = _mm_set_epi32(0x3707344,0x82efa98,0x34e90c6c,0x3f84d5b5); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_5_1(buf) \
t0 = _mm_unpackhi_epi32(m0,m1); \
t1 = _mm_unpacklo_epi32(m0,m2); \
s0 = _mm_unpacklo_epi64(t0,t1); \
s1 = _mm_set_epi32(0x3707344,0x34e90c6c,0xbe5466cf,0xc0ac29b7); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_5_2(buf) \
t0 = _mm_srli_si128(m2, 4); \
t1 = _mm_blend_epi16(m0,m3,0x03); \
s3 = _mm_blend_epi16(t1,t0,0x3C); \
s2 = _mm_set_epi32(0x452821e6,0x243f6a88,0x82efa98,0x13198a2e); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_5_3(buf) \
t0 = _mm_blend_epi16(m1,m0,0x0C); \
t1 = _mm_srli_si128(m3, 4); \
t2 = _mm_blend_epi16(t0,t1,0x30); \
s0 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(1,2,3,0)); \
s1 = _mm_set_epi32(0x38d01377,0x3f84d5b5,0x299f31d0,0xc97c50dd); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_5_4(buf) \
t0 = _mm_unpacklo_epi64(m1,m2); \
t1= _mm_shuffle_epi32(m3, _MM_SHUFFLE(0,2,0,1)); \
s3 = _mm_blend_epi16(t0,t1,0x33); \
s2 = _mm_set_epi32(0x85a308d3,0xb5470917,0xec4e6c89,0xa4093822); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_6_1(buf) \
t0 = _mm_slli_si128(m1, 12); \
t1 = _mm_blend_epi16(m0,m3,0x33); \
s0 = _mm_blend_epi16(t1,t0,0xC0); \
s1 = _mm_set_epi32(0xbe5466cf,0xc97c50dd,0xb5470917,0x299f31d0); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_6_2(buf) \
t0 = _mm_blend_epi16(m3,m2,0x30); \
t1 = _mm_srli_si128(m1, 4); \
t2 = _mm_blend_epi16(t0,t1,0x03); \
s3 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(2,1,3,0)); \
s2 = _mm_set_epi32(0xa4093822,0x3f84d5b5,0x85a308d3,0xc0ac29b7); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_6_3(buf) \
t0 = _mm_unpacklo_epi64(m0,m2); \
t1 = _mm_srli_si128(m1, 4); \
s0 = _mm_shuffle_epi32(_mm_blend_epi16(t0,t1,0x0C), _MM_SHUFFLE(2,3,1,0)); \
s1 = _mm_set_epi32(0x34e90c6c,0x13198a2e,0x3707344,0xec4e6c89); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_6_4(buf) \
t0 = _mm_unpackhi_epi32(m1,m2); \
t1 = _mm_unpackhi_epi64(m0,t0); \
s3 = _mm_shuffle_epi32(t1, _MM_SHUFFLE(3,0,1,2)); \
s2 = _mm_set_epi32(0x452821e6,0x38d01377,0x82efa98,0x243f6a88); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_7_1(buf) \
t0 = _mm_unpackhi_epi32(m0,m1); \
t1 = _mm_blend_epi16(t0,m3,0x0F); \
s0 = _mm_shuffle_epi32(t1,_MM_SHUFFLE(2,0,3,1)); \
s1 = _mm_set_epi32(0x38d01377,0x85a308d3,0x3f84d5b5,0x34e90c6c); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_7_2(buf) \
t0 = _mm_blend_epi16(m2,m3,0x30); \
t1 = _mm_srli_si128(m0,4); \
t2 = _mm_blend_epi16(t0,t1,0x03); \
s3 = _mm_shuffle_epi32(t2, _MM_SHUFFLE(1,0,2,3)); \
s2 = _mm_set_epi32(0x3707344,0xc0ac29b7,0xec4e6c89,0xc97c50dd); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_7_3(buf) \
t0 = _mm_unpackhi_epi64(m0,m3); \
t1 = _mm_unpacklo_epi64(m1,m2); \
t2 = _mm_blend_epi16(t0,t1,0x3C); \
s0 = _mm_shuffle_epi32(t2,_MM_SHUFFLE(0,2,3,1)); \
s1 = _mm_set_epi32(0xbe5466cf,0x82efa98,0xa4093822,0x243f6a88); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_7_4(buf) \
t0 = _mm_unpacklo_epi32(m0,m1); \
t1 = _mm_unpackhi_epi32(m1,m2); \
s3 = _mm_unpacklo_epi64(t0,t1); \
s2 = _mm_set_epi32(0x13198a2e,0x452821e6,0xb5470917,0x299f31d0); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_8_1(buf) \
t0 = _mm_unpackhi_epi32(m1,m3); \
t1 = _mm_unpacklo_epi64(t0,m0); \
t2 = _mm_blend_epi16(t1,m2,0xC0); \
s0 = _mm_shufflehi_epi16(t2,_MM_SHUFFLE(1,0,3,2)); \
s1 = _mm_set_epi32(0x452821e6,0x3707344,0x38d01377,0xb5470917); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_8_2(buf) \
t0 = _mm_unpackhi_epi32(m0,m3); \
t1 = _mm_blend_epi16(m2,t0,0xF0); \
s3 = _mm_shuffle_epi32(t1,_MM_SHUFFLE(0,2,1,3)); \
s2 = _mm_set_epi32(0x243f6a88,0x34e90c6c,0x3f84d5b5,0x82efa98); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_8_3(buf) \
t0 = _mm_blend_epi16(m2,m0,0x0C); \
t1 = _mm_slli_si128(t0,4); \
s0 = _mm_blend_epi16(t1,m3,0x0F); \
s1 = _mm_set_epi32(0x299f31d0,0xa4093822,0xec4e6c89,0x13198a2e); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_8_4(buf) \
t0 = _mm_blend_epi16(m1,m0,0x30); \
s3 = _mm_shuffle_epi32(t0,_MM_SHUFFLE(1,0,3,2)); \
s2 = _mm_set_epi32(0xbe5466cf,0x85a308d3,0xc97c50dd,0xc0ac29b7); \
buf = _mm_xor_si128(s2, s3); \


#define LOAD_MSG_9_1(buf) \
t0 = _mm_blend_epi16(m0,m2,0x03); \
t1 = _mm_blend_epi16(m1,m2,0x30); \
t2 = _mm_blend_epi16(t1,t0,0x0F); \
s0 = _mm_shuffle_epi32(t2,_MM_SHUFFLE(1,3,0,2)); \
s1 = _mm_set_epi32(0x299f31d0,0x82efa98,0xa4093822,0x13198a2e); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_9_2(buf) \
t0 = _mm_slli_si128(m0,4); \
t1 = _mm_blend_epi16(m1,t0,0xC0); \
s3 = _mm_shuffle_epi32(t1,_MM_SHUFFLE(1,2,0,3)); \
s2 = _mm_set_epi32(0x85a308d3,0xec4e6c89,0x452821e6,0xbe5466cf); \
buf = _mm_xor_si128(s2, s3); \

#define LOAD_MSG_9_3(buf) \
t0 = _mm_unpackhi_epi32(m0,m3); \
t1 = _mm_unpacklo_epi32(m2,m3); \
t2 = _mm_unpackhi_epi64(t0,t1); \
s0 = _mm_shuffle_epi32(t2,_MM_SHUFFLE(3,0,2,1)); \
s1 = _mm_set_epi32(0x243f6a88,0xc0ac29b7,0x3f84d5b5,0x34e90c6c); \
buf = _mm_xor_si128(s0, s1); \

#define LOAD_MSG_9_4(buf) \
t0 = _mm_blend_epi16(m3,m2,0xC0); \
t1 = _mm_unpacklo_epi32(m0,m3); \
t2 = _mm_blend_epi16(t0,t1,0x0F); \
s3 = _mm_shuffle_epi32(t2,_MM_SHUFFLE(0,1,2,3)); \
s2 = _mm_set_epi32(0xc97c50dd,0x3707344,0x38d01377,0xb5470917); \
buf = _mm_xor_si128(s2, s3); \

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

