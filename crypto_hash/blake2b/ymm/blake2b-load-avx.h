#pragma once
#ifndef __BLAKE2B_LOAD_AVX_H__
#define __BLAKE2B_LOAD_AVX_H__

#define LOAD_MSG_0_1(b0,b1) \
t1 = _mm256_extractf128_si256(m0, 1); \
b0 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m0), t1); \
t1 = _mm256_extractf128_si256(m1, 1); \
b1 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m1), t1); \

#define LOAD_MSG_0_2(b0,b1) \
t1 = _mm256_extractf128_si256(m0, 1); \
b0 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m0), t1); \
t1 = _mm256_extractf128_si256(m1, 1); \
b1 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m1), t1); \

#define LOAD_MSG_0_3(b0,b1) \
t1 = _mm256_extractf128_si256(m2, 1); \
b0 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m2), t1); \
t1 = _mm256_extractf128_si256(m3, 1); \
b1 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m3), t1); \

#define LOAD_MSG_0_4(b0,b1) \
t1 = _mm256_extractf128_si256(m2, 1); \
b0 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m2), t1); \
t1 = _mm256_extractf128_si256(m3, 1); \
b1 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m3), t1); \

#define LOAD_MSG_1_1(b0,b1) \
t0 = _mm256_extractf128_si256(m3, 1); \
b0 = _mm_unpacklo_epi64(t0, _mm256_castsi256_si128(m1)); \
b1 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m2), _mm256_castsi256_si128(m3)); \

#define LOAD_MSG_1_2(b0,b1) \
t0 = _mm256_extractf128_si256(m2, 1); \
b0 = _mm_unpacklo_epi64(t0, _mm256_castsi256_si128(m2)); \
t0 = _mm256_extractf128_si256(m3, 1); \
t1 = _mm256_extractf128_si256(m1, 1); \
b1 = _mm_alignr_epi8(t1, t0, 8); \

#define LOAD_MSG_1_3(b0,b1) \
b0 = _mm_shuffle_epi32(_mm256_castsi256_si128(m0), _MM_SHUFFLE(1,0,3,2)); \
t0 = _mm256_extractf128_si256(m2, 1); \
b1 = _mm_unpackhi_epi64(t0, _mm256_castsi256_si128(m1)); \

#define LOAD_MSG_1_4(b0,b1) \
t1 = _mm256_extractf128_si256(m0, 1); \
b0 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m3), t1); \
t0 = _mm256_extractf128_si256(m1, 1); \
t1 = _mm256_extractf128_si256(m0, 1); \
b1 = _mm_unpackhi_epi64(t0, t1); \

#define LOAD_MSG_2_1(b0,b1) \
t0 = _mm256_extractf128_si256(m2, 1); \
b0 = _mm_alignr_epi8(_mm256_castsi256_si128(m3), t0, 8); \
t1 = _mm256_extractf128_si256(m3, 1); \
b1 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m1), t1); \

#define LOAD_MSG_2_2(b0,b1) \
b0 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m2), _mm256_castsi256_si128(m0)); \
t0 = _mm256_extractf128_si256(m0, 1); \
b1 = _mm_blend_epi16(t0, _mm256_castsi256_si128(m3), 0xf0); \

#define LOAD_MSG_2_3(b0,b1) \
t0 = _mm256_extractf128_si256(m2, 1); \
t1 = _mm256_extractf128_si256(m0, 1); \
b0 = _mm_blend_epi16(t0, t1, 0xf0); \
t0 = _mm256_extractf128_si256(m1, 1); \
b1 = _mm_unpackhi_epi64(t0, _mm256_castsi256_si128(m2)); \

#define LOAD_MSG_2_4(b0,b1) \
t0 = _mm256_extractf128_si256(m3, 1); \
t1 = _mm256_extractf128_si256(m1, 1); \
b0 = _mm_unpacklo_epi64(t0, t1); \
b1 = _mm_alignr_epi8(_mm256_castsi256_si128(m1), _mm256_castsi256_si128(m0), 8); \

#define LOAD_MSG_3_1(b0,b1) \
t0 = _mm256_extractf128_si256(m1, 1); \
t1 = _mm256_extractf128_si256(m0, 1); \
b0 = _mm_unpackhi_epi64(t0, t1); \
t1 = _mm256_extractf128_si256(m2, 1); \
b1 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m3), t1); \

#define LOAD_MSG_3_2(b0,b1) \
b0 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m2), _mm256_castsi256_si128(m0)); \
t1 = _mm256_extractf128_si256(m3, 1); \
b1 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m3), t1); \

#define LOAD_MSG_3_3(b0,b1) \
t0 = _mm256_extractf128_si256(m0, 1); \
b0 = _mm_blend_epi16(t0, _mm256_castsi256_si128(m1), 0xf0); \
t1 = _mm256_extractf128_si256(m3, 1); \
b1 = _mm_blend_epi16(_mm256_castsi256_si128(m1), t1, 0xf0); \

#define LOAD_MSG_3_4(b0,b1) \
t0 = _mm256_extractf128_si256(m1, 1); \
t1 = _mm256_extractf128_si256(m2, 1); \
b0 = _mm_unpacklo_epi64(t0, t1); \
b1 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m0), _mm256_castsi256_si128(m2)); \

#define LOAD_MSG_4_1(b0,b1) \
b0 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m2), _mm256_castsi256_si128(m1)); \
t0 = _mm256_extractf128_si256(m0, 1); \
t1 = _mm256_extractf128_si256(m2, 1); \
b1 = _mm_unpacklo_epi64(t0, t1); \

#define LOAD_MSG_4_2(b0,b1) \
t1 = _mm256_extractf128_si256(m1, 1); \
b0 = _mm_blend_epi16(_mm256_castsi256_si128(m0), t1, 0xf0); \
t1 = _mm256_extractf128_si256(m3, 1); \
b1 = _mm_blend_epi16(_mm256_castsi256_si128(m1), t1, 0xf0); \

#define LOAD_MSG_4_3(b0,b1) \
t0 = _mm256_extractf128_si256(m3, 1); \
t1 = _mm256_extractf128_si256(m2, 1); \
b0 = _mm_blend_epi16(t0, t1, 0xf0); \
t0 = _mm256_extractf128_si256(m1, 1); \
t1 = _mm256_extractf128_si256(m0, 1); \
b1 = _mm_blend_epi16(t0, t1, 0xf0); \

#define LOAD_MSG_4_4(b0,b1) \
b0 = _mm_alignr_epi8(_mm256_castsi256_si128(m3), _mm256_castsi256_si128(m0), 8); \
b1 = _mm_blend_epi16(_mm256_castsi256_si128(m2), _mm256_castsi256_si128(m3), 0xf0); \

#define LOAD_MSG_5_1(b0,b1) \
t0 = _mm256_extractf128_si256(m0, 1); \
t1 = _mm256_extractf128_si256(m1, 1); \
b0 = _mm_unpacklo_epi64(t0, t1); \
b1 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m0), _mm256_castsi256_si128(m2)); \

#define LOAD_MSG_5_2(b0,b1) \
t1 = _mm256_extractf128_si256(m2, 1); \
b0 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m3), t1); \
t0 = _mm256_extractf128_si256(m2, 1); \
t1 = _mm256_extractf128_si256(m0, 1); \
b1 = _mm_unpackhi_epi64(t0, t1); \

#define LOAD_MSG_5_3(b0,b1) \
t1 = _mm256_extractf128_si256(m1, 1); \
b0 = _mm_blend_epi16(_mm256_castsi256_si128(m1), t1, 0xf0); \
t0 = _mm256_extractf128_si256(m3, 1); \
b1 = _mm_unpackhi_epi64(t0, _mm256_castsi256_si128(m0)); \

#define LOAD_MSG_5_4(b0,b1) \
b0 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m3), _mm256_castsi256_si128(m1)); \
t0 = _mm256_extractf128_si256(m3, 1); \
b1 = _mm_blend_epi16(t0, _mm256_castsi256_si128(m2), 0xf0); \

#define LOAD_MSG_6_1(b0,b1) \
b0 = _mm_blend_epi16(_mm256_castsi256_si128(m3), _mm256_castsi256_si128(m0), 0xf0); \
t0 = _mm256_extractf128_si256(m3, 1); \
b1 = _mm_unpacklo_epi64(t0, _mm256_castsi256_si128(m1)); \

#define LOAD_MSG_6_2(b0,b1) \
t1 = _mm256_extractf128_si256(m3, 1); \
b0 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m1), t1); \
t1 = _mm256_extractf128_si256(m2, 1); \
b1 = _mm_alignr_epi8(t1, _mm256_castsi256_si128(m3), 8); \

#define LOAD_MSG_6_3(b0,b1) \
t1 = _mm256_extractf128_si256(m1, 1); \
b0 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m0), t1); \
b1 = _mm_shuffle_epi32(_mm256_castsi256_si128(m2), _MM_SHUFFLE(1,0,3,2)); \

#define LOAD_MSG_6_4(b0,b1) \
t0 = _mm256_extractf128_si256(m1, 1); \
t1 = _mm256_extractf128_si256(m0, 1); \
b0 = _mm_unpackhi_epi64(t0, t1); \
t0 = _mm256_extractf128_si256(m0, 1); \
t1 = _mm256_extractf128_si256(m2, 1); \
b1 = _mm_blend_epi16(t0, t1, 0xf0); \

#define LOAD_MSG_7_1(b0,b1) \
t1 = _mm256_extractf128_si256(m1, 1); \
b0 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m3), t1); \
t1 = _mm256_extractf128_si256(m0, 1); \
b1 = _mm_blend_epi16(_mm256_castsi256_si128(m3), t1, 0xf0); \

#define LOAD_MSG_7_2(b0,b1) \
t0 = _mm256_extractf128_si256(m2, 1); \
t1 = _mm256_extractf128_si256(m3, 1); \
b0 = _mm_alignr_epi8(t1, t0, 8); \
b1 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m0), _mm256_castsi256_si128(m2)); \

#define LOAD_MSG_7_3(b0,b1) \
t1 = _mm256_extractf128_si256(m3, 1); \
b0 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m1), t1); \
t1 = _mm256_extractf128_si256(m0, 1); \
b1 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m2), t1); \

#define LOAD_MSG_7_4(b0,b1) \
b0 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m0), _mm256_castsi256_si128(m1)); \
t0 = _mm256_extractf128_si256(m1, 1); \
t1 = _mm256_extractf128_si256(m2, 1); \
b1 = _mm_unpacklo_epi64(t0, t1); \

#define LOAD_MSG_8_1(b0,b1) \
t0 = _mm256_extractf128_si256(m1, 1); \
t1 = _mm256_extractf128_si256(m3, 1); \
b0 = _mm_unpacklo_epi64(t0, t1); \
t0 = _mm256_extractf128_si256(m2, 1); \
b1 = _mm_alignr_epi8(_mm256_castsi256_si128(m0), t0, 8); \

#define LOAD_MSG_8_2(b0,b1) \
t0 = _mm256_extractf128_si256(m3, 1); \
b0 = _mm_unpackhi_epi64(t0, _mm256_castsi256_si128(m2)); \
t0 = _mm256_extractf128_si256(m0, 1); \
b1 = _mm_alignr_epi8(_mm256_castsi256_si128(m2), t0, 8); \

#define LOAD_MSG_8_3(b0,b1) \
b0 = _mm256_castsi256_si128(m3); \
t1 = _mm256_extractf128_si256(m2, 1); \
b1 = _mm_alignr_epi8(t1, _mm256_castsi256_si128(m0), 8); \

#define LOAD_MSG_8_4(b0,b1) \
t0 = _mm256_extractf128_si256(m0, 1); \
t1 = _mm256_extractf128_si256(m1, 1); \
b0 = _mm_blend_epi16(t0, t1, 0xf0); \
b1 = _mm256_castsi256_si128(m1); \

#define LOAD_MSG_9_1(b0,b1) \
t0 = _mm256_extractf128_si256(m2, 1); \
b0 = _mm_unpacklo_epi64(t0, _mm256_castsi256_si128(m2)); \
t0 = _mm256_extractf128_si256(m1, 1); \
b1 = _mm_unpackhi_epi64(t0, _mm256_castsi256_si128(m0)); \

#define LOAD_MSG_9_2(b0,b1) \
t0 = _mm256_extractf128_si256(m0, 1); \
b0 = _mm_unpacklo_epi64(t0, _mm256_castsi256_si128(m1)); \
t0 = _mm256_extractf128_si256(m1, 1); \
b1 = _mm_blend_epi16(t0, _mm256_castsi256_si128(m1), 0xf0); \

#define LOAD_MSG_9_3(b0,b1) \
t0 = _mm256_extractf128_si256(m3, 1); \
b0 = _mm_unpackhi_epi64(t0, _mm256_castsi256_si128(m2)); \
t0 = _mm256_extractf128_si256(m0, 1); \
b1 = _mm_unpackhi_epi64(t0, _mm256_castsi256_si128(m3)); \

#define LOAD_MSG_9_4(b0,b1) \
t0 = _mm256_extractf128_si256(m2, 1); \
t1 = _mm256_extractf128_si256(m3, 1); \
b0 = _mm_alignr_epi8(t1, t0, 8); \
b1 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m3), _mm256_castsi256_si128(m0)); \

#define LOAD_MSG_10_1(b0,b1) \
t1 = _mm256_extractf128_si256(m0, 1); \
b0 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m0), t1); \
t1 = _mm256_extractf128_si256(m1, 1); \
b1 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m1), t1); \

#define LOAD_MSG_10_2(b0,b1) \
t1 = _mm256_extractf128_si256(m0, 1); \
b0 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m0), t1); \
t1 = _mm256_extractf128_si256(m1, 1); \
b1 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m1), t1); \

#define LOAD_MSG_10_3(b0,b1) \
t1 = _mm256_extractf128_si256(m2, 1); \
b0 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m2), t1); \
t1 = _mm256_extractf128_si256(m3, 1); \
b1 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m3), t1); \

#define LOAD_MSG_10_4(b0,b1) \
t1 = _mm256_extractf128_si256(m2, 1); \
b0 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m2), t1); \
t1 = _mm256_extractf128_si256(m3, 1); \
b1 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m3), t1); \

#define LOAD_MSG_11_1(b0,b1) \
t0 = _mm256_extractf128_si256(m3, 1); \
b0 = _mm_unpacklo_epi64(t0, _mm256_castsi256_si128(m1)); \
b1 = _mm_unpackhi_epi64(_mm256_castsi256_si128(m2), _mm256_castsi256_si128(m3)); \

#define LOAD_MSG_11_2(b0,b1) \
t0 = _mm256_extractf128_si256(m2, 1); \
b0 = _mm_unpacklo_epi64(t0, _mm256_castsi256_si128(m2)); \
t0 = _mm256_extractf128_si256(m3, 1); \
t1 = _mm256_extractf128_si256(m1, 1); \
b1 = _mm_alignr_epi8(t1, t0, 8); \

#define LOAD_MSG_11_3(b0,b1) \
b0 = _mm_shuffle_epi32(_mm256_castsi256_si128(m0), _MM_SHUFFLE(1,0,3,2)); \
t0 = _mm256_extractf128_si256(m2, 1); \
b1 = _mm_unpackhi_epi64(t0, _mm256_castsi256_si128(m1)); \

#define LOAD_MSG_11_4(b0,b1) \
t1 = _mm256_extractf128_si256(m0, 1); \
b0 = _mm_unpacklo_epi64(_mm256_castsi256_si128(m3), t1); \
t0 = _mm256_extractf128_si256(m1, 1); \
t1 = _mm256_extractf128_si256(m0, 1); \
b1 = _mm_unpackhi_epi64(t0, t1); \



#endif

