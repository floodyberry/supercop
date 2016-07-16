/*
   NORX reference source code package - reference C implementations

   Written 2014-2015 by:

        - Samuel Neves <sneves@dei.uc.pt>
        - Philipp Jovanovic <jovanovic@fim.uni-passau.de>

   To the extent possible under law, the author(s) have dedicated all copyright
   and related and neighboring rights to this software to the public domain
   worldwide. This software is distributed without any warranty.

   You should have received a copy of the CC0 Public Domain Dedication along with
   this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
*/
#include <string.h>
#include "norx.h"

#if defined(_MSC_VER)
  #include <intrin.h>
#else
  #if defined(__XOP__)
    #include <x86intrin.h>
  #else
    #include <immintrin.h>
  #endif
#endif

const char * norx_version = "2.0";

#define NORX_W 64                /* word size */
#define NORX_L 4                 /* round number */
#define NORX_P 1                 /* parallelism degree */
#define NORX_T (NORX_W *  4)     /* tag size */
#define NORX_N (NORX_W *  2)     /* nonce size */
#define NORX_K (NORX_W *  4)     /* key size */
#define NORX_B (NORX_W * 16)     /* permutation width */
#define NORX_C (NORX_W *  4)     /* capacity */
#define NORX_R (NORX_B - NORX_C) /* rate */

#define BYTES(x) (((x) + 7) / 8)
#define WORDS(x) (((x) + (NORX_W-1)) / NORX_W)

#if defined(_MSC_VER)
    #define ALIGN(x) __declspec(align(x))
#else
    #define ALIGN(x) __attribute__((aligned(x)))
#endif

#define LOAD(in) _mm_load_si128((__m128i*)(in))
#define STORE(out, x) _mm_store_si128((__m128i*)(out), (x))
#define LOADU(in) _mm_loadu_si128((__m128i*)(in))
#define STOREU(out, x) _mm_storeu_si128((__m128i*)(out), (x))

#  if defined(__XOP__)
#define ROT(X, C) _mm_roti_epi64((X), -(C))
#elif defined(__SSSE3__)
#define ROT(X, C)                                                                               \
(                                                                                               \
        (C) ==  8 ? _mm_shuffle_epi8((X), _mm_set_epi8(8,15,14,13,12,11,10,9, 0,7,6,5,4,3,2,1)) \
    :   (C) == 40 ? _mm_shuffle_epi8((X), _mm_set_epi8(12,11,10,9,8,15,14,13, 4,3,2,1,0,7,6,5)) \
    :   (C) == 63 ? _mm_or_si128(_mm_add_epi64((X), (X)), _mm_srli_epi64((X), 63))              \
    :   /* else */  _mm_or_si128(_mm_srli_epi64((X), (C)), _mm_slli_epi64((X), 64 - (C)))       \
)
#else
#define ROT(X, C)                                                                               \
(                                                                                               \
        (C) == 63 ? _mm_or_si128(_mm_add_epi64((X), (X)), _mm_srli_epi64((X), 63))              \
    :   /* else */  _mm_or_si128(_mm_srli_epi64((X), (C)), _mm_slli_epi64((X), 64 - (C)))       \
)
#endif

#define XOR(A, B) _mm_xor_si128((A), (B))
#define AND(A, B) _mm_and_si128((A), (B))
#define ADD(A, B) _mm_add_epi64((A), (B))

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
  #define G(A0, A1, B0, B1, C0, C1, D0, D1)  \
  do                                         \
  {                                          \
      __m128i l0, l1, r0, r1;                \
                                             \
      l0 = XOR(A0, B0);    r0 = XOR(A1, B1); \
      l1 = AND(A0, B0);    r1 = AND(A1, B1); \
      l1 = ADD(l1, l1);    r1 = ADD(r1, r1); \
      A0 = XOR(l0, l1);    A1 = XOR(r0, r1); \
      D0 = XOR(D0, l0);    D1 = XOR(D1, r0); \
      D0 = XOR(D0, l1);    D1 = XOR(D1, r1); \
      D0 = ROT(D0, R0);    D1 = ROT(D1, R0); \
                                             \
      l0 = XOR(C0, D0);    r0 = XOR(C1, D1); \
      l1 = AND(C0, D0);    r1 = AND(C1, D1); \
      l1 = ADD(l1, l1);    r1 = ADD(r1, r1); \
      C0 = XOR(l0, l1);    C1 = XOR(r0, r1); \
      B0 = XOR(B0, l0);    B1 = XOR(B1, r0); \
      B0 = XOR(B0, l1);    B1 = XOR(B1, r1); \
      B0 = ROT(B0, R1);    B1 = ROT(B1, R1); \
                                             \
      l0 = XOR(A0, B0);    r0 = XOR(A1, B1); \
      l1 = AND(A0, B0);    r1 = AND(A1, B1); \
      l1 = ADD(l1, l1);    r1 = ADD(r1, r1); \
      A0 = XOR(l0, l1);    A1 = XOR(r0, r1); \
      D0 = XOR(D0, l0);    D1 = XOR(D1, r0); \
      D0 = XOR(D0, l1);    D1 = XOR(D1, r1); \
      D0 = ROT(D0, R2);    D1 = ROT(D1, R2); \
                                             \
      l0 = XOR(C0, D0);    r0 = XOR(C1, D1); \
      l1 = AND(C0, D0);    r1 = AND(C1, D1); \
      l1 = ADD(l1, l1);    r1 = ADD(r1, r1); \
      C0 = XOR(l0, l1);    C1 = XOR(r0, r1); \
      B0 = XOR(B0, l0);    B1 = XOR(B1, r0); \
      B0 = XOR(B0, l1);    B1 = XOR(B1, r1); \
      B0 = ROT(B0, R3);    B1 = ROT(B1, R3); \
  } while(0)
#else
    #define G(A0, A1, B0, B1, C0, C1, D0, D1)  \
    do                                         \
    {                                          \
        __m128i l0, l1, r0, r1;                \
                                               \
        l0 = XOR(A0, B0);    r0 = XOR(A1, B1); \
        l1 = AND(A0, B0);    r1 = AND(A1, B1); \
        l1 = ADD(l1, l1);    r1 = ADD(r1, r1); \
        A0 = XOR(l0, l1);    A1 = XOR(r0, r1); \
        D0 = XOR(D0, A0);    D1 = XOR(D1, A1); \
        D0 = ROT(D0, R0);    D1 = ROT(D1, R0); \
                                               \
        l0 = XOR(C0, D0);    r0 = XOR(C1, D1); \
        l1 = AND(C0, D0);    r1 = AND(C1, D1); \
        l1 = ADD(l1, l1);    r1 = ADD(r1, r1); \
        C0 = XOR(l0, l1);    C1 = XOR(r0, r1); \
        B0 = XOR(B0, C0);    B1 = XOR(B1, C1); \
        B0 = ROT(B0, R1);    B1 = ROT(B1, R1); \
                                               \
        l0 = XOR(A0, B0);    r0 = XOR(A1, B1); \
        l1 = AND(A0, B0);    r1 = AND(A1, B1); \
        l1 = ADD(l1, l1);    r1 = ADD(r1, r1); \
        A0 = XOR(l0, l1);    A1 = XOR(r0, r1); \
        D0 = XOR(D0, A0);    D1 = XOR(D1, A1); \
        D0 = ROT(D0, R2);    D1 = ROT(D1, R2); \
                                               \
        l0 = XOR(C0, D0);    r0 = XOR(C1, D1); \
        l1 = AND(C0, D0);    r1 = AND(C1, D1); \
        l1 = ADD(l1, l1);    r1 = ADD(r1, r1); \
        C0 = XOR(l0, l1);    C1 = XOR(r0, r1); \
        B0 = XOR(B0, C0);    B1 = XOR(B1, C1); \
        B0 = ROT(B0, R3);    B1 = ROT(B1, R3); \
    } while(0)
#endif

#if defined(__SSSE3__)
#define DIAGONALIZE(A0, A1, B0, B1, C0, C1, D0, D1) \
do                                                  \
{                                                   \
    __m128i t0, t1;                                 \
                                                    \
    t0 = _mm_alignr_epi8(B1, B0, 8);                \
    t1 = _mm_alignr_epi8(B0, B1, 8);                \
    B0 = t0;                                        \
    B1 = t1;                                        \
                                                    \
    t0 = C0;                                        \
    C0 = C1;                                        \
    C1 = t0;                                        \
                                                    \
    t0 = _mm_alignr_epi8(D1, D0, 8);                \
    t1 = _mm_alignr_epi8(D0, D1, 8);                \
    D0 = t1;                                        \
    D1 = t0;                                        \
} while(0)

#define UNDIAGONALIZE(A0, A1, B0, B1, C0, C1, D0, D1) \
do                                                    \
{                                                     \
    __m128i t0, t1;                                   \
                                                      \
    t0 = _mm_alignr_epi8(B0, B1, 8);                  \
    t1 = _mm_alignr_epi8(B1, B0, 8);                  \
    B0 = t0;                                          \
    B1 = t1;                                          \
                                                      \
    t0 = C0;                                          \
    C0 = C1;                                          \
    C1 = t0;                                          \
                                                      \
    t0 = _mm_alignr_epi8(D0, D1, 8);                  \
    t1 = _mm_alignr_epi8(D1, D0, 8);                  \
    D0 = t1;                                          \
    D1 = t0;                                          \
} while(0)

#else

#define DIAGONALIZE(A0, A1, B0, B1, C0, C1, D0, D1)          \
do                                                           \
{                                                            \
    __m128i t0, t1;                                          \
                                                             \
    t0 = D0; t1 = B0;                                        \
    D0 = C0; C0 = C1; C1 = D0;                               \
    D0 = _mm_unpackhi_epi64(D1, _mm_unpacklo_epi64(t0, t0)); \
    D1 = _mm_unpackhi_epi64(t0, _mm_unpacklo_epi64(D1, D1)); \
    B0 = _mm_unpackhi_epi64(B0, _mm_unpacklo_epi64(B1, B1)); \
    B1 = _mm_unpackhi_epi64(B1, _mm_unpacklo_epi64(t1, t1)); \
} while(0)

#define UNDIAGONALIZE(A0, A1, B0, B1, C0, C1, D0, D1)        \
do                                                           \
{                                                            \
    __m128i t0, t1;                                          \
                                                             \
    t0 = C0; C0 = C1; C1 = t0;                               \
    t0 = B0; t1 = D0;                                        \
    B0 = _mm_unpackhi_epi64(B1, _mm_unpacklo_epi64(B0, B0)); \
    B1 = _mm_unpackhi_epi64(t0, _mm_unpacklo_epi64(B1, B1)); \
    D0 = _mm_unpackhi_epi64(D0, _mm_unpacklo_epi64(D1, D1)); \
    D1 = _mm_unpackhi_epi64(D1, _mm_unpacklo_epi64(t1, t1)); \
} while(0)

#endif

#define F(S)                                                       \
do                                                                 \
{                                                                  \
    G(S[0], S[1], S[2], S[3], S[4], S[5], S[6], S[7]);             \
    DIAGONALIZE(S[0], S[1], S[2], S[3], S[4], S[5], S[6], S[7]);   \
    G(S[0], S[1], S[2], S[3], S[4], S[5], S[6], S[7]);             \
    UNDIAGONALIZE(S[0], S[1], S[2], S[3], S[4], S[5], S[6], S[7]); \
} while(0)

#define PERMUTE(S)              \
do                              \
{                               \
    int i;                      \
    for(i = 0; i < NORX_L; ++i) \
    {                           \
        F(S);                   \
    }                           \
} while(0)

#define INJECT_DOMAIN_CONSTANT(S, TAG)        \
do                                            \
{                                             \
    S[7] = XOR(S[7], _mm_set_epi64x(TAG, 0)); \
} while(0)

#define ABSORB_BLOCK(S, IN, TAG)                             \
do                                                           \
{                                                            \
    size_t j;                                                \
    INJECT_DOMAIN_CONSTANT(S, TAG);                          \
    PERMUTE(S);                                              \
    for (j = 0; j < WORDS(NORX_R)/2; ++j)                    \
    {                                                        \
        S[j] = XOR(S[j], LOADU(IN + j * 2 * BYTES(NORX_W))); \
    }                                                        \
} while(0)

#define ABSORB_LASTBLOCK(S, IN, INLEN, TAG)           \
do                                                    \
{                                                     \
    ALIGN(64) unsigned char lastblock[BYTES(NORX_R)]; \
    PAD(lastblock, sizeof lastblock, IN, INLEN);      \
    ABSORB_BLOCK(S, lastblock, TAG);                  \
} while(0)

#define ENCRYPT_BLOCK(S, OUT, IN)                            \
do                                                           \
{                                                            \
    size_t j;                                                \
    INJECT_DOMAIN_CONSTANT(S, PAYLOAD_TAG);                  \
    PERMUTE(S);                                              \
    for (j = 0; j < WORDS(NORX_R)/2; ++j)                    \
    {                                                        \
        S[j] = XOR(S[j], LOADU(IN + j * 2 * BYTES(NORX_W))); \
        STOREU(OUT + j * 2 * BYTES(NORX_W), S[j]);           \
    }                                                        \
} while(0)

#define ENCRYPT_LASTBLOCK(S, OUT, IN, INLEN)          \
do                                                    \
{                                                     \
    ALIGN(64) unsigned char lastblock[BYTES(NORX_R)]; \
    PAD(lastblock, sizeof lastblock, IN, INLEN);      \
    ENCRYPT_BLOCK(S, lastblock, lastblock);           \
    memcpy(OUT, lastblock, INLEN);                    \
} while(0)

#define DECRYPT_BLOCK(S, OUT, IN)                          \
do                                                         \
{                                                          \
    size_t j;                                              \
    INJECT_DOMAIN_CONSTANT(S, PAYLOAD_TAG);                \
    PERMUTE(S);                                            \
    for (j = 0; j < WORDS(NORX_R)/2; ++j)                  \
    {                                                      \
        __m128i T = LOADU(IN + j * 2 * BYTES(NORX_W));     \
        STOREU(OUT + j * 2 * BYTES(NORX_W), XOR(S[j], T)); \
        S[j] = T;                                          \
    }                                                      \
} while(0)

#define DECRYPT_LASTBLOCK(S, OUT, IN, INLEN)                     \
do                                                               \
{                                                                \
    size_t j;                                                    \
    ALIGN(64) unsigned char lastblock[BYTES(NORX_R)] = {0};      \
    INJECT_DOMAIN_CONSTANT(S, PAYLOAD_TAG);                      \
    PERMUTE(S);                                                  \
    for (j = 0; j < WORDS(NORX_R)/2; ++j)                        \
    {                                                            \
        STOREU(lastblock + j * 2 * BYTES(NORX_W), S[j]);         \
    }                                                            \
    memcpy(lastblock, IN, INLEN);                                \
    lastblock[INLEN] ^= 0x01;                                    \
    lastblock[BYTES(NORX_R) - 1] ^= 0x80;                        \
    for (j = 0; j < WORDS(NORX_R)/2; ++j)                        \
    {                                                            \
        __m128i T = LOADU(lastblock + j * 2 * BYTES(NORX_W));    \
        STOREU(lastblock + j * 2 * BYTES(NORX_W), XOR(S[j], T)); \
        S[j] = T;                                                \
    }                                                            \
    memcpy(OUT, lastblock, INLEN);                               \
} while(0)

#define INITIALISE(S, NONCE, KEY)                     \
do                                                    \
{                                                     \
    S[0] = LOADU(NONCE);                              \
    S[1] = _mm_set_epi64x( U3,  U2);                    \
    S[2] = LOADU(KEY + 0 * 2 * BYTES(NORX_W));        \
    S[3] = LOADU(KEY + 1 * 2 * BYTES(NORX_W));        \
    S[4] = _mm_set_epi64x( U9,  U8);                  \
    S[5] = _mm_set_epi64x(U11, U10);                  \
    S[6] = _mm_set_epi64x(U13, U12);                  \
    S[7] = _mm_set_epi64x(U15, U14);                  \
    S[6] = XOR(S[6], _mm_set_epi64x(NORX_L, NORX_W)); \
    S[7] = XOR(S[7], _mm_set_epi64x(NORX_T, NORX_P)); \
    PERMUTE(S);                                       \
} while(0)

#define ABSORB_DATA(S, IN, INLEN, TAG)       \
do                                           \
{                                            \
    if (INLEN > 0)                           \
    {                                        \
        size_t i = 0;                        \
        size_t l = INLEN;                    \
        while (l >= BYTES(NORX_R))           \
        {                                    \
            ABSORB_BLOCK(S, IN + i, TAG);    \
            i += BYTES(NORX_R);              \
            l -= BYTES(NORX_R);              \
        }                                    \
        ABSORB_LASTBLOCK(S, IN + i, l, TAG); \
    }                                        \
} while(0)

#define ENCRYPT_DATA(S, OUT, IN, INLEN)           \
do                                                \
{                                                 \
    if (INLEN > 0)                                \
    {                                             \
        size_t i = 0;                             \
        size_t l = INLEN;                         \
        while (l >= BYTES(NORX_R))                \
        {                                         \
            ENCRYPT_BLOCK(S, OUT + i, IN + i);    \
            i += BYTES(NORX_R);                   \
            l -= BYTES(NORX_R);                   \
        }                                         \
        ENCRYPT_LASTBLOCK(S, OUT + i, IN + i, l); \
    }                                             \
} while(0)

#define DECRYPT_DATA(S, OUT, IN, INLEN)           \
do                                                \
{                                                 \
    if (INLEN > 0)                                \
    {                                             \
        size_t i = 0;                             \
        size_t l = INLEN;                         \
        while (l >= BYTES(NORX_R))                \
        {                                         \
            DECRYPT_BLOCK(S, OUT + i, IN + i);    \
            i += BYTES(NORX_R);                   \
            l -= BYTES(NORX_R);                   \
        }                                         \
        DECRYPT_LASTBLOCK(S, OUT + i, IN + i, l); \
    }                                             \
} while(0)

#define FINALISE(S)                       \
do                                        \
{                                         \
    INJECT_DOMAIN_CONSTANT(S, FINAL_TAG); \
    PERMUTE(S);                           \
    PERMUTE(S);                           \
} while(0)

#define PAD(OUT, OUTLEN, IN, INLEN) \
do                                  \
{                                   \
    memset(OUT, 0, OUTLEN);         \
    memcpy(OUT, IN, INLEN);         \
    OUT[INLEN] = 0x01;              \
    OUT[OUTLEN - 1] |= 0x80;        \
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
)
{
    __m128i S[8];

    *clen = mlen + BYTES(NORX_T);
    INITIALISE(S, nonce, key);
    ABSORB_DATA(S, a, alen, HEADER_TAG);
    ENCRYPT_DATA(S, c, m, mlen);
    ABSORB_DATA(S, z, zlen, TRAILER_TAG);
    FINALISE(S);
    STOREU(c + mlen,                   S[0]);
    STOREU(c + mlen + BYTES(NORX_T)/2, S[1]);
}


int norx_aead_decrypt(
  unsigned char *m, size_t *mlen,
  const unsigned char *a, size_t alen,
  const unsigned char *c, size_t clen,
  const unsigned char *z, size_t zlen,
  const unsigned char *nonce,
  const unsigned char *key
)
{
    __m128i S[8];

    if (clen < BYTES(NORX_T)) { return -1; }

    *mlen = clen - BYTES(NORX_T);

    INITIALISE(S, nonce, key);
    ABSORB_DATA(S, a, alen, HEADER_TAG);
    DECRYPT_DATA(S, m, c, clen - BYTES(NORX_T));
    ABSORB_DATA(S, z, zlen, TRAILER_TAG);
    FINALISE(S);

    /* Verify tag */
    S[0] = _mm_cmpeq_epi8(S[0], LOADU(c + clen - BYTES(NORX_T)  ));
    S[1] = _mm_cmpeq_epi8(S[1], LOADU(c + clen - BYTES(NORX_T)/2));
    return (((_mm_movemask_epi8(AND(S[0], S[1])) & 0xFFFFUL) + 1) >> 16) - 1;
}

