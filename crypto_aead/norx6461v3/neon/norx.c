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
#include <stdint.h>
#include <string.h>
#include <arm_neon.h>
#include "norx.h"

const char * norx_version = "3.0";

#define NORX_W 64                /* word size */
#define NORX_L 6                 /* round number */
#define NORX_P 1                 /* parallelism degree */
#define NORX_T (NORX_W *  4)     /* tag size */
#define NORX_N (NORX_W *  4)     /* nonce size */
#define NORX_K (NORX_W *  4)     /* key size */
#define NORX_B (NORX_W * 16)     /* permutation width */
#define NORX_C (NORX_W *  4)     /* capacity */
#define NORX_R (NORX_B - NORX_C) /* rate */

#define BYTES(x) (((x) + 7) / 8)
#define WORDS(x) (((x) + (NORX_W-1)) / NORX_W)

#define ALIGN(x) __attribute__((aligned(x)))

#define U32TOU64(X) vreinterpretq_u64_u32(X)
#define U64TOU32(X) vreinterpretq_u32_u64(X)
#define U8TOU32(X)  vreinterpretq_u32_u8(X)
#define U32TOU8(X)  vreinterpretq_u8_u32(X)
#define U8TOU64(X)  vreinterpretq_u64_u8(X)
#define U64TOU8(X)  vreinterpretq_u8_u64(X)

#define LOAD(in) U8TOU64( vld1q_u8((uint8_t *)(in)) )
#define STORE(out, x) vst1q_u8((uint8_t*)(out), U64TOU8(x))
#define LOADU(in) LOAD(in)
#define STOREU(out, x) STORE(out, x)

#define XOR(A, B) veorq_u64((A), (B))
#define AND(A, B) vandq_u64((A), (B))
#define ADD(A, B) vaddq_u64((A), (B))

#if 0
#define SHL(A) vshlq_n_u64((A), 1)
#else
#define SHL(A) ADD((A), (A))
#endif

#if 0
#define ROT_63(X) vsriq_n_u64(SHL(X), (X), 63)
#else
#define ROT_63(X) veorq_u64(SHL(X), vshrq_n_u64(X, 63))
#endif

#if 1
#define ROT_N(X, C) vsriq_n_u64(vshlq_n_u64((X), 64-(C)), (X), (C))
#else
#define ROT_N(X, C) veorq_u64(vshrq_n_u64((X), (C)), vshlq_n_u64(X, 64-(C)))
#endif

#define ROT(X, C)               \
(                               \
        (C) == 63 ? ROT_63(X)   \
    :   /* else */  ROT_N(X, C) \
)

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
#define G(A0, A1, B0, B1, C0, C1, D0, D1)  \
do                                         \
{                                          \
    uint64x2_t l0, l1, r0, r1;             \
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

#define DIAGONALIZE(A0, A1, B0, B1, C0, C1, D0, D1)           \
do                                                            \
{                                                             \
    uint64x2_t t0, t1;                                        \
                                                              \
    t0 = vcombine_u64( vget_high_u64(B0), vget_low_u64(B1) ); \
    t1 = vcombine_u64( vget_high_u64(B1), vget_low_u64(B0) ); \
    B0 = t0;                                                  \
    B1 = t1;                                                  \
                                                              \
    t0 = C0;                                                  \
    C0 = C1;                                                  \
    C1 = t0;                                                  \
                                                              \
    t0 = vcombine_u64( vget_high_u64(D0), vget_low_u64(D1) ); \
    t1 = vcombine_u64( vget_high_u64(D1), vget_low_u64(D0) ); \
    D0 = t1;                                                  \
    D1 = t0;                                                  \
} while(0)

#define UNDIAGONALIZE(A0, A1, B0, B1, C0, C1, D0, D1)         \
do                                                            \
{                                                             \
    uint64x2_t t0, t1;                                        \
                                                              \
    t0 = vcombine_u64( vget_high_u64(B1), vget_low_u64(B0) ); \
    t1 = vcombine_u64( vget_high_u64(B0), vget_low_u64(B1) ); \
    B0 = t0;                                                  \
    B1 = t1;                                                  \
                                                              \
    t0 = C0;                                                  \
    C0 = C1;                                                  \
    C1 = t0;                                                  \
                                                              \
    t0 = vcombine_u64( vget_high_u64(D1), vget_low_u64(D0) ); \
    t1 = vcombine_u64( vget_high_u64(D0), vget_low_u64(D1) ); \
    D0 = t1;                                                  \
    D1 = t0;                                                  \
} while(0)

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

#define INJECT_DOMAIN_CONSTANT(S, TAG)                                \
do                                                                    \
{                                                                     \
    S[7] = XOR(S[7], vcombine_u64(vcreate_u64(0), vcreate_u64(TAG))); \
} while(0)

#define INJECT_KEY(S, K0, K1) do { \
    S[6] = XOR(S[6], K0);          \
    S[7] = XOR(S[7], K1);          \
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
    ALIGN(32) unsigned char lastblock[BYTES(NORX_R)]; \
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
    ALIGN(32) unsigned char lastblock[BYTES(NORX_R)]; \
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
        uint64x2_t T = LOADU(IN + j * 2 * BYTES(NORX_W));  \
        STOREU(OUT + j * 2 * BYTES(NORX_W), XOR(S[j], T)); \
        S[j] = T;                                          \
    }                                                      \
} while(0)

#define DECRYPT_LASTBLOCK(S, OUT, IN, INLEN)                     \
do                                                               \
{                                                                \
    size_t j;                                                    \
    ALIGN(32) unsigned char lastblock[BYTES(NORX_R)];            \
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
        uint64x2_t T = LOADU(lastblock + j * 2 * BYTES(NORX_W)); \
        STOREU(lastblock + j * 2 * BYTES(NORX_W), XOR(S[j], T)); \
        S[j] = T;                                                \
    }                                                            \
    memcpy(OUT, lastblock, INLEN);                               \
} while(0)

#define INITIALISE(S, NONCE, K0, K1) do {                                       \
    S[0] = LOADU(NONCE +  0);                                                   \
    S[1] = LOADU(NONCE + 16);                                                   \
    S[2] = K0;                                                                  \
    S[3] = K1;                                                                  \
    S[4] = vcombine_u64( vcreate_u64( U8), vcreate_u64( U9) );                  \
    S[5] = vcombine_u64( vcreate_u64(U10), vcreate_u64(U11) );                  \
    S[6] = vcombine_u64( vcreate_u64(U12), vcreate_u64(U13) );                  \
    S[7] = vcombine_u64( vcreate_u64(U14), vcreate_u64(U15) );                  \
    S[6] = XOR(S[6], vcombine_u64( vcreate_u64(NORX_W), vcreate_u64(NORX_L) )); \
    S[7] = XOR(S[7], vcombine_u64( vcreate_u64(NORX_P), vcreate_u64(NORX_T) )); \
    PERMUTE(S);                                                                 \
    INJECT_KEY(S, K0, K1);                                                      \
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

#define FINALISE(S, K0, K1)                         \
do                                                  \
{                                                   \
    INJECT_DOMAIN_CONSTANT(S, FINAL_TAG);           \
    PERMUTE(S);                                     \
    INJECT_KEY(S, K0, K1);                          \
    PERMUTE(S);                                     \
    INJECT_KEY(S, K0, K1);                          \
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
    const uint64x2_t K0 = LOADU(key +  0);
    const uint64x2_t K1 = LOADU(key + 16);
    uint64x2_t S[8];

    *clen = mlen + BYTES(NORX_T);
    INITIALISE(S, nonce, K0, K1);
    ABSORB_DATA(S, a, alen, HEADER_TAG);
    ENCRYPT_DATA(S, c, m, mlen);
    ABSORB_DATA(S, z, zlen, TRAILER_TAG);
    FINALISE(S, K0, K1);
    STOREU(c + mlen,                   S[6]);
    STOREU(c + mlen + BYTES(NORX_T)/2, S[7]);
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
    const uint64x2_t K0 = LOADU(key +  0);
    const uint64x2_t K1 = LOADU(key + 16);
    uint64x2_t S[8];
    uint32x4_t T[2];

    if (clen < BYTES(NORX_T)) { return -1; }

    *mlen = clen - BYTES(NORX_T);

    INITIALISE(S, nonce, K0, K1);
    ABSORB_DATA(S, a, alen, HEADER_TAG);
    DECRYPT_DATA(S, m, c, clen - BYTES(NORX_T));
    ABSORB_DATA(S, z, zlen, TRAILER_TAG);
    FINALISE(S, K0, K1);

    /* Verify tag */
    T[0] = vceqq_u32(U64TOU32(S[6]), U8TOU32( vld1q_u8((uint8_t *)(c + clen - BYTES(NORX_T)  )) ));
    T[1] = vceqq_u32(U64TOU32(S[7]), U8TOU32( vld1q_u8((uint8_t *)(c + clen - BYTES(NORX_T)/2)) ));
    T[0] = vandq_u32(T[0], T[1]);
    return 0xFFFFFFFFFFFFFFFFULL == (vgetq_lane_u64(U32TOU64(T[0]), 0) & vgetq_lane_u64(U32TOU64(T[0]), 1)) ? 0 : -1;
}

