/*
   NORX reference source code package - reference C implementations

   Written 2014-2016 by:

        - Samuel Neves <sneves@dei.uc.pt>
        - Philipp Jovanovic <philipp@jovanovic.io>

   To the extent possible under law, the author(s) have dedicated all copyright
   and related and neighboring rights to this software to the public domain
   worldwide. This software is distributed without any warranty.

   You should have received a copy of the CC0 Public Domain Dedication along with
   this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
*/
#include <string.h>
#include "norx.h"

#include <immintrin.h>

const char * norx_version = "3.0";

#define NORX_W 64                /* word size */
#define NORX_L 4                 /* round number */
#define NORX_P 4                 /* parallelism degree */
#define NORX_T (NORX_W *  4)     /* tag size */
#define NORX_N (NORX_W *  4)     /* nonce size */
#define NORX_K (NORX_W *  4)     /* key size */
#define NORX_B (NORX_W * 16)     /* permutation width */
#define NORX_C (NORX_W *  4)     /* capacity */
#define NORX_R (NORX_B - NORX_C) /* rate */
#define TWEAK_LOW_LATENCY

#define BYTES(x) (((x) + 7) / 8)
#define WORDS(x) (((x) + (NORX_W-1)) / NORX_W)

#if defined(_MSC_VER)
    #define ALIGN(x) __declspec(align(x))
#else
    #define ALIGN(x) __attribute__((aligned(x)))
#endif

#define LOAD(in) _mm256_load_si256((__m256i*)(in))
#define STORE(out, x) _mm256_store_si256((__m256i*)(out), (x))
#define LOADU(in) _mm256_loadu_si256((__m256i*)(in))
#define STOREU(out, x) _mm256_storeu_si256((__m256i*)(out), (x))

#define LOAD128(in) _mm_load_si128((__m128i*)(in))
#define STORE128(out, x) _mm_store_si128((__m128i*)(out), (x))
#define LOADU128(in) _mm_loadu_si128((__m128i*)(in))
#define STOREU128(out, x) _mm_storeu_si128((__m128i*)(out), (x))

#define TO128(x) _mm256_castsi256_si128(x)
#define TO256(x) _mm256_castsi128_si256(x)

#define ROT(X, C) (                                                                                                                           \
        (C) ==  8 ? _mm256_shuffle_epi8((X), _mm256_set_epi8(8,15,14,13,12,11,10,9, 0,7,6,5,4,3,2,1, 8,15,14,13,12,11,10,9, 0,7,6,5,4,3,2,1)) \
    :   (C) == 40 ? _mm256_shuffle_epi8((X), _mm256_set_epi8(12,11,10,9,8,15,14,13, 4,3,2,1,0,7,6,5, 12,11,10,9,8,15,14,13, 4,3,2,1,0,7,6,5)) \
    :   (C) == 63 ? _mm256_or_si256(_mm256_add_epi64((X), (X)), _mm256_srli_epi64((X), 63))                                                   \
    :   /* else */  _mm256_or_si256(_mm256_srli_epi64((X), (C)), _mm256_slli_epi64((X), 64 - (C)))                                            \
)

#define XOR(A, B) _mm256_xor_si256((A), (B))
#define AND(A, B) _mm256_and_si256((A), (B))
#define ADD(A, B) _mm256_add_epi64((A), (B))

#define XOR128(A, B) _mm_xor_si128((A), (B))
#define AND128(A, B) _mm_and_si128((A), (B))
#define ADD128(A, B) _mm_add_epi64((A), (B))

#define  U0 0xE4D324772B91DF79ULL
#define  U1 0x3AEC9ABAAEB02CCBULL
#define  U2 0x9DFBA13DB4289311ULL
#define  U3 0xEF9EB4BF5A97F2C8ULL
#define  U4 0x3F466E92C1532034ULL
#define  U5 0xE6E986626CC405C1ULL
#define  U6 0xACE40F3B549184E1ULL
#define  U7 0xD9CFD35762614477ULL
#define  U8 0xB15E641748DE5E6BULL
#define  U9 0xAA95E955E10F8410ULL
#define U10 0x28D1034441A9DD40ULL
#define U11 0x7F31BBF964E93BF5ULL
#define U12 0xB5E9E22493DFFB96ULL
#define U13 0xB980C852479FAFBDULL
#define U14 0xDA24516BF55EAFD4ULL
#define U15 0x86026AE8536F1501ULL

#define R0  8
#define R1 19
#define R2 40
#define R3 63

/* Implementation */
#if defined(TWEAK_LOW_LATENCY)
  #define G(A, B, C, D) do { \
    __m256i t0, t1;          \
                             \
    t0 = XOR( A,  B);        \
    t1 = AND( A,  B);        \
    t1 = ADD(t1, t1);        \
     A = XOR(t0, t1);        \
     D = XOR( D, t0);        \
     D = XOR( D, t1);        \
     D = ROT( D, R0);        \
                             \
    t0 = XOR( C,  D);        \
    t1 = AND( C,  D);        \
    t1 = ADD(t1, t1);        \
     C = XOR(t0, t1);        \
     B = XOR( B, t0);        \
     B = XOR( B, t1);        \
     B = ROT( B, R1);        \
                             \
    t0 = XOR( A,  B);        \
    t1 = AND( A,  B);        \
    t1 = ADD(t1, t1);        \
     A = XOR(t0, t1);        \
     D = XOR( D, t0);        \
     D = XOR( D, t1);        \
     D = ROT( D, R2);        \
                             \
    t0 = XOR( C,  D);        \
    t1 = AND( C,  D);        \
    t1 = ADD(t1, t1);        \
     C = XOR(t0, t1);        \
     B = XOR( B, t0);        \
     B = XOR( B, t1);        \
     B = ROT( B, R3);        \
  } while(0)
#else
  #define G(A, B, C, D) do { \
    __m256i t0, t1;          \
                             \
    t0 = XOR( A,  B);        \
    t1 = AND( A,  B);        \
    t1 = ADD(t1, t1);        \
     A = XOR(t0, t1);        \
     D = XOR( D,  A);        \
     D = ROT( D, R0);        \
                             \
    t0 = XOR( C,  D);        \
    t1 = AND( C,  D);        \
    t1 = ADD(t1, t1);        \
     C = XOR(t0, t1);        \
     B = XOR( B,  C);        \
     B = ROT( B, R1);        \
                             \
    t0 = XOR( A,  B);        \
    t1 = AND( A,  B);        \
    t1 = ADD(t1, t1);        \
     A = XOR(t0, t1);        \
     D = XOR( D,  A);        \
     D = ROT( D, R2);        \
                             \
    t0 = XOR( C,  D);        \
    t1 = AND( C,  D);        \
    t1 = ADD(t1, t1);        \
     C = XOR(t0, t1);        \
     B = XOR( B,  C);        \
     B = ROT( B, R3);        \
  } while(0)
#endif

#define DIAGONALIZE(A, B, C, D) do {                     \
  D = _mm256_permute4x64_epi64(D, _MM_SHUFFLE(2,1,0,3)); \
  C = _mm256_permute4x64_epi64(C, _MM_SHUFFLE(1,0,3,2)); \
  B = _mm256_permute4x64_epi64(B, _MM_SHUFFLE(0,3,2,1)); \
} while(0)

#define UNDIAGONALIZE(A, B, C, D) do {                   \
  D = _mm256_permute4x64_epi64(D, _MM_SHUFFLE(0,3,2,1)); \
  C = _mm256_permute4x64_epi64(C, _MM_SHUFFLE(1,0,3,2)); \
  B = _mm256_permute4x64_epi64(B, _MM_SHUFFLE(2,1,0,3)); \
} while(0)

#define F(A, B, C, D) do {   \
  G(A, B, C, D);             \
  DIAGONALIZE(A, B, C, D);   \
  G(A, B, C, D);             \
  UNDIAGONALIZE(A, B, C, D); \
} while(0)

#define PERMUTE(A, B, C, D) do { \
  int i;                         \
  for(i = 0; i < NORX_L; ++i) {  \
    F(A, B, C, D);               \
  }                              \
} while(0)

#define INJECT_DOMAIN_CONSTANT(A, B, C, D, TAG) do { \
  D = XOR(D, _mm256_set_epi64x(TAG, 0, 0, 0));       \
} while(0)

#define INJECT_KEY(A, B, C, D, K) do { \
  D = XOR(D, K);                       \
} while(0)

#define ABSORB_BLOCK(A, B, C, D, IN, TAG) do { \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, TAG);   \
    PERMUTE(A, B, C, D);                       \
    A = XOR(A, LOADU(IN +  0));                \
    B = XOR(B, LOADU(IN + 32));                \
    C = XOR(C, LOADU(IN + 64));                \
} while(0)

#define ABSORB_LASTBLOCK(A, B, C, D, IN, INLEN, TAG) do { \
  ALIGN(64) unsigned char lastblock[BYTES(NORX_R)];       \
  PAD(lastblock, sizeof lastblock, IN, INLEN);            \
  ABSORB_BLOCK(A, B, C, D, lastblock, TAG);               \
} while(0)

#define ENCRYPT_BLOCK(A, B, C, D, OUT, IN) do {    \
  INJECT_DOMAIN_CONSTANT(A, B, C, D, PAYLOAD_TAG); \
  PERMUTE(A, B, C, D);                             \
  A = XOR(A, LOADU(IN +  0)); STOREU(OUT +  0, A); \
  B = XOR(B, LOADU(IN + 32)); STOREU(OUT + 32, B); \
  C = XOR(C, LOADU(IN + 64)); STOREU(OUT + 64, C); \
} while(0)

#define ENCRYPT_LASTBLOCK(A, B, C, D, OUT, IN, INLEN) do { \
  ALIGN(64) unsigned char lastblock[BYTES(NORX_R)];        \
  PAD(lastblock, sizeof lastblock, IN, INLEN);             \
  ENCRYPT_BLOCK(A, B, C, D, lastblock, lastblock);         \
  memcpy(OUT, lastblock, INLEN);                           \
} while(0)

#define DECRYPT_BLOCK(A, B, C, D, OUT, IN) do {              \
  __m256i W0, W1, W2;                                        \
  INJECT_DOMAIN_CONSTANT(A, B, C, D, PAYLOAD_TAG);           \
  PERMUTE(A, B, C, D);                                       \
  W0 = LOADU(IN +  0); STOREU(OUT +  0, XOR(A, W0)); A = W0; \
  W1 = LOADU(IN + 32); STOREU(OUT + 32, XOR(B, W1)); B = W1; \
  W2 = LOADU(IN + 64); STOREU(OUT + 64, XOR(C, W2)); C = W2; \
} while(0)

#define DECRYPT_LASTBLOCK(A, B, C, D, OUT, IN, INLEN) do {                \
  __m256i W0, W1, W2;                                                     \
  ALIGN(64) unsigned char lastblock[BYTES(NORX_R)] = {0};                 \
  INJECT_DOMAIN_CONSTANT(A, B, C, D, PAYLOAD_TAG);                        \
  PERMUTE(A, B, C, D);                                                    \
  STOREU(lastblock +   0, A);                                             \
  STOREU(lastblock +  32, B);                                             \
  STOREU(lastblock +  64, C);                                             \
  memcpy(lastblock, IN, INLEN);                                           \
  lastblock[INLEN] ^= 0x01;                                               \
  lastblock[BYTES(NORX_R)-1] ^= 0x80;                                     \
  W0 = LOADU(lastblock +  0); STOREU(lastblock +  0, XOR(A, W0)); A = W0; \
  W1 = LOADU(lastblock + 32); STOREU(lastblock + 32, XOR(B, W1)); B = W1; \
  W2 = LOADU(lastblock + 64); STOREU(lastblock + 64, XOR(C, W2)); C = W2; \
  memcpy(OUT, lastblock, INLEN);                                          \
} while(0)

#define INITIALISE(A, B, C, D, NONCE, K) do {                            \
  A = LOADU(NONCE);                                                      \
  B = K;                                                                 \
  C = _mm256_set_epi64x(U11, U10,  U9,  U8);                             \
  D = _mm256_set_epi64x(U15, U14, U13, U12);                             \
  D = XOR(D, _mm256_set_epi64x(NORX_T, NORX_P, NORX_L, NORX_W));         \
  PERMUTE(A, B, C, D);                                                   \
  INJECT_KEY(A, B, C, D, K);                                             \
} while(0)

#define ABSORB_DATA(A, B, C, D, IN, INLEN, TAG) do {  \
  if (INLEN > 0) {                                    \
    size_t i = 0;                                     \
    size_t l = INLEN;                                 \
    while (l >= BYTES(NORX_R)) {                      \
      ABSORB_BLOCK(A, B, C, D, IN + i, TAG);          \
      i += BYTES(NORX_R);                             \
      l -= BYTES(NORX_R);                             \
    }                                                 \
    ABSORB_LASTBLOCK(A, B, C, D, IN + i, l, TAG);     \
  }                                                   \
} while(0)

#define ENCRYPT_DATA(A, B, C, D, OUT, IN, INLEN) do {  \
  if (INLEN > 0) {                                     \
    size_t i = 0;                                      \
    size_t l = INLEN;                                  \
    while (l >= BYTES(NORX_R)) {                       \
      ENCRYPT_BLOCK(A, B, C, D, OUT + i, IN + i);      \
      i += BYTES(NORX_R);                              \
      l -= BYTES(NORX_R);                              \
    }                                                  \
    ENCRYPT_LASTBLOCK(A, B, C, D, OUT + i, IN + i, l); \
  }                                                    \
} while(0)

#define DECRYPT_DATA(A, B, C, D, OUT, IN, INLEN) do {  \
  if (INLEN > 0) {                                     \
    size_t i = 0;                                      \
    size_t l = INLEN;                                  \
    while (l >= BYTES(NORX_R)) {                       \
      DECRYPT_BLOCK(A, B, C, D, OUT + i, IN + i);      \
      i += BYTES(NORX_R);                              \
      l -= BYTES(NORX_R);                              \
    }                                                  \
    DECRYPT_LASTBLOCK(A, B, C, D, OUT + i, IN + i, l); \
  }                                                    \
} while(0)

#define FINALISE(A, B, C, D, K) do {             \
  INJECT_DOMAIN_CONSTANT(A, B, C, D, FINAL_TAG); \
  PERMUTE(A, B, C, D);                           \
  INJECT_KEY(A, B, C, D, K);                     \
  PERMUTE(A, B, C, D);                           \
  INJECT_KEY(A, B, C, D, K);                     \
} while(0)

#define PAD(OUT, OUTLEN, IN, INLEN) do { \
  memset(OUT, 0, OUTLEN);                \
  memcpy(OUT, IN, INLEN);                \
  OUT[INLEN] = 0x01;                     \
  OUT[OUTLEN - 1] |= 0x80;               \
} while(0)

#define G_V4(A, B, C, D) do { \
  __m256i t0, t1;             \
                              \
  t0 = XOR( A,  B);           \
  t1 = AND( A,  B);           \
  t1 = ADD(t1, t1);           \
   A = XOR(t0, t1);           \
   D = XOR( D,  A);           \
   D = ROT( D, R0);           \
                              \
  t0 = XOR( C,  D);           \
  t1 = AND( C,  D);           \
  t1 = ADD(t1, t1);           \
   C = XOR(t0, t1);           \
   B = XOR( B,  C);           \
   B = ROT( B, R1);           \
                              \
  t0 = XOR( A,  B);           \
  t1 = AND( A,  B);           \
  t1 = ADD(t1, t1);           \
   A = XOR(t0, t1);           \
   D = XOR( D,  A);           \
   D = ROT( D, R2);           \
                              \
  t0 = XOR( C,  D);           \
  t1 = AND( C,  D);           \
  t1 = ADD(t1, t1);           \
   C = XOR(t0, t1);           \
   B = XOR( B,  C);           \
   B = ROT( B, R3);           \
} while(0)

#define F_V4(S) do {                 \
  G_V4(S[ 0], S[ 4], S[ 8], S[12]);  \
  G_V4(S[ 1], S[ 5], S[ 9], S[13]);  \
  G_V4(S[ 2], S[ 6], S[10], S[14]);  \
  G_V4(S[ 3], S[ 7], S[11], S[15]);  \
  G_V4(S[ 0], S[ 5], S[10], S[15]);  \
  G_V4(S[ 1], S[ 6], S[11], S[12]);  \
  G_V4(S[ 2], S[ 7], S[ 8], S[13]);  \
  G_V4(S[ 3], S[ 4], S[ 9], S[14]);  \
} while(0)

#define PERMUTE_V4(S) do {                 \
  int i;                                   \
  for(i = 0; i < NORX_L; ++i) { F_V4(S); } \
} while(0)

#define INJECT_DOMAIN_CONSTANT_V4(S, TAG) do {   \
    S[15] = XOR(S[15], _mm256_set1_epi64x(TAG)); \
} while(0)

#define SLICE_STATE_V4(w, m) do {                  \
  __m256i t0, t1, t2, t3;                          \
  t0 = _mm256_unpacklo_epi64(m[ 0], m[ 4]);        \
  t1 = _mm256_unpackhi_epi64(m[ 0], m[ 4]);        \
  t2 = _mm256_unpacklo_epi64(m[ 8], m[12]);        \
  t3 = _mm256_unpackhi_epi64(m[ 8], m[12]);        \
  w[ 0] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  w[ 2] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  w[ 1] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  w[ 3] = _mm256_permute2x128_si256(t1, t3, 0x31); \
  t0 = _mm256_unpacklo_epi64(m[ 1], m[ 5]);        \
  t1 = _mm256_unpackhi_epi64(m[ 1], m[ 5]);        \
  t2 = _mm256_unpacklo_epi64(m[ 9], m[13]);        \
  t3 = _mm256_unpackhi_epi64(m[ 9], m[13]);        \
  w[ 4] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  w[ 6] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  w[ 5] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  w[ 7] = _mm256_permute2x128_si256(t1, t3, 0x31); \
  t0 = _mm256_unpacklo_epi64(m[ 2], m[ 6]);        \
  t1 = _mm256_unpackhi_epi64(m[ 2], m[ 6]);        \
  t2 = _mm256_unpacklo_epi64(m[10], m[14]);        \
  t3 = _mm256_unpackhi_epi64(m[10], m[14]);        \
  w[ 8] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  w[10] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  w[ 9] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  w[11] = _mm256_permute2x128_si256(t1, t3, 0x31); \
  t0 = _mm256_unpacklo_epi64(m[ 3], m[ 7]);        \
  t1 = _mm256_unpackhi_epi64(m[ 3], m[ 7]);        \
  t2 = _mm256_unpacklo_epi64(m[11], m[15]);        \
  t3 = _mm256_unpackhi_epi64(m[11], m[15]);        \
  w[12] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  w[14] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  w[13] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  w[15] = _mm256_permute2x128_si256(t1, t3, 0x31); \
} while(0)

#define UNSLICE_STATE_V4(u, v) do {                \
  __m256i t0, t1, t2, t3;                          \
  t0 = _mm256_unpacklo_epi64(v[ 0], v[ 1]);        \
  t1 = _mm256_unpackhi_epi64(v[ 0], v[ 1]);        \
  t2 = _mm256_unpacklo_epi64(v[ 2], v[ 3]);        \
  t3 = _mm256_unpackhi_epi64(v[ 2], v[ 3]);        \
  u[ 0] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  u[ 4] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  u[ 8] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  u[12] = _mm256_permute2x128_si256(t1, t3, 0x31); \
  t0 = _mm256_unpacklo_epi64(v[ 4], v[ 5]);        \
  t1 = _mm256_unpackhi_epi64(v[ 4], v[ 5]);        \
  t2 = _mm256_unpacklo_epi64(v[ 6], v[ 7]);        \
  t3 = _mm256_unpackhi_epi64(v[ 6], v[ 7]);        \
  u[ 1] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  u[ 5] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  u[ 9] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  u[13] = _mm256_permute2x128_si256(t1, t3, 0x31); \
  t0 = _mm256_unpacklo_epi64(v[ 8], v[ 9]);        \
  t1 = _mm256_unpackhi_epi64(v[ 8], v[ 9]);        \
  t2 = _mm256_unpacklo_epi64(v[10], v[11]);        \
  t3 = _mm256_unpackhi_epi64(v[10], v[11]);        \
  u[ 2] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  u[ 6] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  u[10] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  u[14] = _mm256_permute2x128_si256(t1, t3, 0x31); \
  t0 = _mm256_unpacklo_epi64(v[12], v[13]);        \
  t1 = _mm256_unpackhi_epi64(v[12], v[13]);        \
  t2 = _mm256_unpacklo_epi64(v[14], v[15]);        \
  t3 = _mm256_unpackhi_epi64(v[14], v[15]);        \
  u[ 3] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  u[ 7] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  u[11] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  u[15] = _mm256_permute2x128_si256(t1, t3, 0x31); \
} while(0)


#define SLICE_MSG_V4(u, v) do {                    \
  __m256i t0, t1, t2, t3;                          \
  t0 = _mm256_unpacklo_epi64(v[ 0], v[ 3]);        \
  t1 = _mm256_unpackhi_epi64(v[ 0], v[ 3]);        \
  t2 = _mm256_unpacklo_epi64(v[ 6], v[ 9]);        \
  t3 = _mm256_unpackhi_epi64(v[ 6], v[ 9]);        \
  u[ 0] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  u[ 2] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  u[ 1] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  u[ 3] = _mm256_permute2x128_si256(t1, t3, 0x31); \
  t0 = _mm256_unpacklo_epi64(v[ 1], v[ 4]);        \
  t1 = _mm256_unpackhi_epi64(v[ 1], v[ 4]);        \
  t2 = _mm256_unpacklo_epi64(v[ 7], v[10]);        \
  t3 = _mm256_unpackhi_epi64(v[ 7], v[10]);        \
  u[ 4] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  u[ 6] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  u[ 5] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  u[ 7] = _mm256_permute2x128_si256(t1, t3, 0x31); \
  t0 = _mm256_unpacklo_epi64(v[ 2], v[ 5]);        \
  t1 = _mm256_unpackhi_epi64(v[ 2], v[ 5]);        \
  t2 = _mm256_unpacklo_epi64(v[ 8], v[11]);        \
  t3 = _mm256_unpackhi_epi64(v[ 8], v[11]);        \
  u[ 8] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  u[10] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  u[ 9] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  u[11] = _mm256_permute2x128_si256(t1, t3, 0x31); \
} while(0)

#define UNSLICE_MSG_V4(u, v) do {                  \
  __m256i t0, t1, t2, t3;                          \
  t0 = _mm256_unpacklo_epi64(v[ 0], v[ 1]);        \
  t1 = _mm256_unpackhi_epi64(v[ 0], v[ 1]);        \
  t2 = _mm256_unpacklo_epi64(v[ 2], v[ 3]);        \
  t3 = _mm256_unpackhi_epi64(v[ 2], v[ 3]);        \
  u[ 0] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  u[ 6] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  u[ 3] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  u[ 9] = _mm256_permute2x128_si256(t1, t3, 0x31); \
  t0 = _mm256_unpacklo_epi64(v[ 4], v[ 5]);        \
  t1 = _mm256_unpackhi_epi64(v[ 4], v[ 5]);        \
  t2 = _mm256_unpacklo_epi64(v[ 6], v[ 7]);        \
  t3 = _mm256_unpackhi_epi64(v[ 6], v[ 7]);        \
  u[ 1] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  u[ 7] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  u[ 4] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  u[10] = _mm256_permute2x128_si256(t1, t3, 0x31); \
  t0 = _mm256_unpacklo_epi64(v[ 8], v[ 9]);        \
  t1 = _mm256_unpackhi_epi64(v[ 8], v[ 9]);        \
  t2 = _mm256_unpacklo_epi64(v[10], v[11]);        \
  t3 = _mm256_unpackhi_epi64(v[10], v[11]);        \
  u[ 2] = _mm256_permute2x128_si256(t0, t2, 0x20); \
  u[ 8] = _mm256_permute2x128_si256(t0, t2, 0x31); \
  u[ 5] = _mm256_permute2x128_si256(t1, t3, 0x20); \
  u[11] = _mm256_permute2x128_si256(t1, t3, 0x31); \
} while(0)


#define ENCRYPT_BLOCK_V4(S, OUT, IN) do {       \
    __m256i T[WORDS(NORX_R)], M[WORDS(NORX_R)]; \
    int k;                                      \
    for(k = 0; k < WORDS(NORX_R); ++k) {        \
      T[k] = LOADU(((IN) + 32 * k));            \
    }                                           \
    SLICE_MSG_V4(M, T);                         \
    INJECT_DOMAIN_CONSTANT_V4(S, PAYLOAD_TAG);  \
    PERMUTE_V4(S);                              \
    for(k = 0; k < WORDS(NORX_R); ++k) {        \
      M[k] = XOR(S[k], M[k]);                   \
      S[k] = M[k];                              \
    }                                           \
    UNSLICE_MSG_V4(T, M);                       \
    for(k = 0; k < WORDS(NORX_R); ++k) {        \
      STOREU((OUT) + k * 32, T[k]);             \
    }                                           \
} while(0)

#define DECRYPT_BLOCK_V4(S, OUT, IN) do {     \
  __m256i T[WORDS(NORX_R)], M[WORDS(NORX_R)]; \
  int k;                                      \
  for(k = 0; k < WORDS(NORX_R); ++k) {        \
    T[k] = LOADU(((IN) + 32 * k));            \
  }                                           \
  SLICE_MSG_V4(M, T);                         \
  INJECT_DOMAIN_CONSTANT_V4(S, PAYLOAD_TAG);  \
  PERMUTE_V4(S);                              \
  for(k = 0; k < WORDS(NORX_R); ++k) {        \
    __m256i C = M[k];                         \
    M[k] = XOR(S[k], C);                      \
    S[k] = C;                                 \
  }                                           \
  UNSLICE_MSG_V4(T, M);                       \
  for(k = 0; k < WORDS(NORX_R); ++k) {        \
    STOREU((OUT) + k * 32, T[k]);             \
  }                                           \
} while(0)

#define BRANCH_V4(S, A, B, C, D) do {                                                 \
  int i;                                                                              \
  INJECT_DOMAIN_CONSTANT(A, B, C, D, BRANCH_TAG);                                     \
  PERMUTE(A, B, C, D);                                                                \
  S[ 0] = _mm256_broadcastq_epi64(_mm256_castsi256_si128(A));                         \
  S[ 1] = _mm256_broadcastq_epi64(_mm_srli_si128(_mm256_castsi256_si128(A), 8));      \
  S[ 2] = _mm256_broadcastq_epi64(_mm256_extracti128_si256(A, 1));                    \
  S[ 3] = _mm256_broadcastq_epi64(_mm_srli_si128(_mm256_extracti128_si256(A, 1), 8)); \
  S[ 4] = _mm256_broadcastq_epi64(_mm256_castsi256_si128(B));                         \
  S[ 5] = _mm256_broadcastq_epi64(_mm_srli_si128(_mm256_castsi256_si128(B), 8));      \
  S[ 6] = _mm256_broadcastq_epi64(_mm256_extracti128_si256(B, 1));                    \
  S[ 7] = _mm256_broadcastq_epi64(_mm_srli_si128(_mm256_extracti128_si256(B, 1), 8)); \
  S[ 8] = _mm256_broadcastq_epi64(_mm256_castsi256_si128(C));                         \
  S[ 9] = _mm256_broadcastq_epi64(_mm_srli_si128(_mm256_castsi256_si128(C), 8));      \
  S[10] = _mm256_broadcastq_epi64(_mm256_extracti128_si256(C, 1));                    \
  S[11] = _mm256_broadcastq_epi64(_mm_srli_si128(_mm256_extracti128_si256(C, 1), 8)); \
  S[12] = _mm256_broadcastq_epi64(_mm256_castsi256_si128(D));                         \
  S[13] = _mm256_broadcastq_epi64(_mm_srli_si128(_mm256_castsi256_si128(D), 8));      \
  S[14] = _mm256_broadcastq_epi64(_mm256_extracti128_si256(D, 1));                    \
  S[15] = _mm256_broadcastq_epi64(_mm_srli_si128(_mm256_extracti128_si256(D, 1), 8)); \
  for(i = 0; i < WORDS(NORX_R); ++i) {                                                \
    S[i] = XOR(S[i], _mm256_set_epi64x(3, 2, 1, 0));                                  \
  }                                                                                   \
} while(0)


#define MERGE_V4(A, B, C, D, S) do {             \
  __m256i M[16];                                 \
  SLICE_STATE_V4(M, S);                          \
  INJECT_DOMAIN_CONSTANT_V4(M, MERGE_TAG);       \
  PERMUTE_V4(M);                                 \
  UNSLICE_STATE_V4(S, M);                        \
  A = XOR(XOR(S[ 0], S[ 4]), XOR(S[ 8], S[12])); \
  B = XOR(XOR(S[ 1], S[ 5]), XOR(S[ 9], S[13])); \
  C = XOR(XOR(S[ 2], S[ 6]), XOR(S[10], S[14])); \
  D = XOR(XOR(S[ 3], S[ 7]), XOR(S[11], S[15])); \
} while(0)

#define ENCRYPT_DATA_V4(A, B, C, D, OUT, IN, INLEN)  do {                  \
  if (INLEN > 0) {                                                         \
    __m256i S[16], T[16];                                                  \
    size_t l = INLEN;                                                      \
    unsigned char * out = OUT;                                             \
    unsigned char const * in  = IN;                                        \
    int j;                                                                 \
                                                                           \
    BRANCH_V4(S, A, B, C, D);                                              \
                                                                           \
    while (l >= NORX_P * BYTES(NORX_R)) {                                  \
        ENCRYPT_BLOCK_V4(S, out, in);                                      \
        l -= BYTES(NORX_R) * NORX_P;                                       \
        in += BYTES(NORX_R) * NORX_P;                                      \
        out += BYTES(NORX_R) * NORX_P;                                     \
    }                                                                      \
    UNSLICE_STATE_V4(T, S);                                                \
    for(j = 0; l >= BYTES(NORX_R); ++j) {                                  \
      ENCRYPT_BLOCK(T[4*j+0], T[4*j+1], T[4*j+2], T[4*j+3], out, in);      \
      l -= BYTES(NORX_R);                                                  \
      in += BYTES(NORX_R);                                                 \
      out += BYTES(NORX_R);                                                \
    }                                                                      \
    ENCRYPT_LASTBLOCK(T[4*j+0], T[4*j+1], T[4*j+2], T[4*j+3], out, in, l); \
                                                                           \
    MERGE_V4(A, B, C, D, T);                                               \
  }                                                                        \
} while(0)

#define DECRYPT_DATA_V4(A, B, C, D, OUT, IN, INLEN)  do {                  \
  if (INLEN > 0) {                                                         \
    __m256i S[16], T[16];                                                  \
    size_t l = INLEN;                                                      \
    unsigned char * out = OUT;                                             \
    unsigned char const * in  = IN;                                        \
    int j;                                                                 \
                                                                           \
    BRANCH_V4(S, A, B, C, D);                                              \
                                                                           \
    while (l >= NORX_P * BYTES(NORX_R)) {                                  \
        DECRYPT_BLOCK_V4(S, out, in);                                      \
        l -= BYTES(NORX_R) * NORX_P;                                       \
        in += BYTES(NORX_R) * NORX_P;                                      \
        out += BYTES(NORX_R) * NORX_P;                                     \
    }                                                                      \
    UNSLICE_STATE_V4(T, S);                                                \
    for(j = 0; l >= BYTES(NORX_R); ++j) {                                  \
      DECRYPT_BLOCK(T[4*j+0], T[4*j+1], T[4*j+2], T[4*j+3], out, in);      \
      l -= BYTES(NORX_R);                                                  \
      in += BYTES(NORX_R);                                                 \
      out += BYTES(NORX_R);                                                \
    }                                                                      \
    DECRYPT_LASTBLOCK(T[4*j+0], T[4*j+1], T[4*j+2], T[4*j+3], out, in, l); \
                                                                           \
    MERGE_V4(A, B, C, D, T);                                               \
  }                                                                        \
} while(0)


typedef enum tag__
{
    HEADER_TAG  = 0x01,
    PAYLOAD_TAG = 0x02,
    TRAILER_TAG = 0x04,
    FINAL_TAG   = 0x08,
    BRANCH_TAG  = 0x10,
    MERGE_TAG   = 0x20
} tag_t;

void norx_aead_encrypt(
  unsigned char *c, size_t *clen,
  const unsigned char *a, size_t alen,
  const unsigned char *m, size_t mlen,
  const unsigned char *z, size_t zlen,
  const unsigned char *nonce,
  const unsigned char *key
) {
  const __m256i K = LOADU(key);
  __m256i A, B, C, D;

  *clen = mlen + BYTES(NORX_T);
  INITIALISE(A, B, C, D, nonce, K);
  ABSORB_DATA(A, B, C, D, a, alen, HEADER_TAG);
  ENCRYPT_DATA_V4(A, B, C, D, c, m, mlen);
  ABSORB_DATA(A, B, C, D, z, zlen, TRAILER_TAG);
  FINALISE(A, B, C, D, K);
  STOREU(c + mlen, D);
}


int norx_aead_decrypt(
  unsigned char *m, size_t *mlen,
  const unsigned char *a, size_t alen,
  const unsigned char *c, size_t clen,
  const unsigned char *z, size_t zlen,
  const unsigned char *nonce,
  const unsigned char *key
) {
  const __m256i K = LOADU(key);
  __m256i A, B, C, D;

  if (clen < BYTES(NORX_T)) { return -1; }

  *mlen = clen - BYTES(NORX_T);

  INITIALISE(A, B, C, D, nonce, K);
  ABSORB_DATA(A, B, C, D, a, alen, HEADER_TAG);
  DECRYPT_DATA_V4(A, B, C, D, m, c, clen - BYTES(NORX_T));
  ABSORB_DATA(A, B, C, D, z, zlen, TRAILER_TAG);
  FINALISE(A, B, C, D, K);

  /* Verify tag */
  D = _mm256_cmpeq_epi8(D, LOADU(c + clen - BYTES(NORX_T)));
  return (((_mm256_movemask_epi8(D) & 0xFFFFFFFFULL) + 1) >> 32) - 1;
}
