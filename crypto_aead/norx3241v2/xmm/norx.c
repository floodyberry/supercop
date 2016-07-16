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

#define TWEAK_LOW_LATENCY
#define NORX_W 32                /* word size */
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

/* TODO: special cases for SSE2, XOP, ... */
#if defined(_MSC_VER)
    #define ALIGN(x) __declspec(align(x))
#else
    #define ALIGN(x) __attribute__((aligned(x)))
#endif

#define LOAD(in) _mm_load_si128((__m128i*)(in))
#define STORE(out, x) _mm_store_si128((__m128i*)(out), (x))
#define LOADU(in) _mm_loadu_si128((__m128i*)(in))
#define STOREU(out, x) _mm_storeu_si128((__m128i*)(out), (x))
#define LOADL(in) _mm_loadl_epi64((__m128i*)(in))
#define STOREL(out, x) _mm_storel_epi64((__m128i*)(out), (x))

#if defined(__SSSE3__)
#define BLEND(A, B) _mm_blend_epi16((A), (B), 0x0F)
#else
#define BLEND(A, B) _mm_or_si128(_mm_andnot_si128(_mm_set_epi32(0,0,-1,-1), (A)),  \
                                 _mm_and_si128   (_mm_set_epi32(0,0,-1,-1), (B)))
#endif

#  if defined(__XOP__)
#define ROT(X, C) _mm_roti_epi32((X), -(C))
#elif defined(__SSSE3__)
#define ROT(X, C)                                                                                 \
(                                                                                                 \
        (C) ==  8 ? _mm_shuffle_epi8((X), _mm_set_epi8(12,15,14,13, 8,11,10,9, 4,7,6,5, 0,3,2,1)) \
    :   (C) == 16 ? _mm_shuffle_epi8((X), _mm_set_epi8(13,12,15,14, 9,8,11,10, 5,4,7,6, 1,0,3,2)) \
    :   (C) == 31 ? _mm_or_si128(_mm_add_epi32((X), (X)), _mm_srli_epi32((X), 31))                \
    :   /* else */  _mm_or_si128(_mm_srli_epi32((X), (C)), _mm_slli_epi32((X), 32 - (C)))         \
)
#else
#define ROT(X, C)                                                                         \
(                                                                                         \
        (C) == 31 ? _mm_or_si128(_mm_add_epi32((X), (X)), _mm_srli_epi32((X), 31))        \
    :   /* else */  _mm_or_si128(_mm_srli_epi32((X), (C)), _mm_slli_epi32((X), 32 - (C))) \
)
#endif

#define XOR(A, B) _mm_xor_si128((A), (B))
#define AND(A, B) _mm_and_si128((A), (B))
#define ADD(A, B) _mm_add_epi32((A), (B))

#define  U0 0x0454EDABU
#define  U1 0xAC6851CCU
#define  U2 0xB707322FU
#define  U3 0xA0C7C90DU
#define  U4 0x99AB09ACU
#define  U5 0xA643466DU
#define  U6 0x21C22362U
#define  U7 0x1230C950U
#define  U8 0xA3D8D930U
#define  U9 0x3FA8B72CU
#define U10 0xED84EB49U
#define U11 0xEDCA4787U
#define U12 0x335463EBU
#define U13 0xF994220BU
#define U14 0xBE0BF5C9U
#define U15 0xD7C49104U

#define R0  8
#define R1 11
#define R2 16
#define R3 31

/* Implementation */
#if defined(TWEAK_LOW_LATENCY)
  #define G(A, B, C, D) \
  do                    \
  {                     \
      __m128i t0, t1;   \
                        \
      t0 = XOR( A,  B); \
      t1 = AND( A,  B); \
      t1 = ADD(t1, t1); \
       A = XOR(t0, t1); \
       D = XOR( D, t0); \
       D = XOR( D, t1); \
       D = ROT( D, R0); \
                        \
      t0 = XOR( C,  D); \
      t1 = AND( C,  D); \
      t1 = ADD(t1, t1); \
       C = XOR(t0, t1); \
       B = XOR( B, t0); \
       B = XOR( B, t1); \
       B = ROT( B, R1); \
                        \
      t0 = XOR( A,  B); \
      t1 = AND( A,  B); \
      t1 = ADD(t1, t1); \
       A = XOR(t0, t1); \
       D = XOR( D, t0); \
       D = XOR( D, t1); \
       D = ROT( D, R2); \
                        \
      t0 = XOR( C,  D); \
      t1 = AND( C,  D); \
      t1 = ADD(t1, t1); \
       C = XOR(t0, t1); \
       B = XOR( B, t0); \
       B = XOR( B, t1); \
       B = ROT( B, R3); \
  } while(0)
#else
  #define G(A, B, C, D) \
  do                    \
  {                     \
      __m128i t0, t1;   \
                        \
      t0 = XOR( A,  B); \
      t1 = AND( A,  B); \
      t1 = ADD(t1, t1); \
       A = XOR(t0, t1); \
       D = XOR( D,  A); \
       D = ROT( D, R0); \
                        \
      t0 = XOR( C,  D); \
      t1 = AND( C,  D); \
      t1 = ADD(t1, t1); \
       C = XOR(t0, t1); \
       B = XOR( B,  C); \
       B = ROT( B, R1); \
                        \
      t0 = XOR( A,  B); \
      t1 = AND( A,  B); \
      t1 = ADD(t1, t1); \
       A = XOR(t0, t1); \
       D = XOR( D,  A); \
       D = ROT( D, R2); \
                        \
      t0 = XOR( C,  D); \
      t1 = AND( C,  D); \
      t1 = ADD(t1, t1); \
       C = XOR(t0, t1); \
       B = XOR( B,  C); \
       B = ROT( B, R3); \
  } while(0)
#endif

#define DIAGONALIZE(A, B, C, D)                     \
do                                                  \
{                                                   \
    D = _mm_shuffle_epi32(D, _MM_SHUFFLE(2,1,0,3)); \
    C = _mm_shuffle_epi32(C, _MM_SHUFFLE(1,0,3,2)); \
    B = _mm_shuffle_epi32(B, _MM_SHUFFLE(0,3,2,1)); \
} while(0)

#define UNDIAGONALIZE(A, B, C, D)                   \
do                                                  \
{                                                   \
    D = _mm_shuffle_epi32(D, _MM_SHUFFLE(0,3,2,1)); \
    C = _mm_shuffle_epi32(C, _MM_SHUFFLE(1,0,3,2)); \
    B = _mm_shuffle_epi32(B, _MM_SHUFFLE(2,1,0,3)); \
} while(0)

#define F(S)                               \
do                                         \
{                                          \
    G(S[0], S[1], S[2], S[3]);             \
    DIAGONALIZE(S[0], S[1], S[2], S[3]);   \
    G(S[0], S[1], S[2], S[3]);             \
    UNDIAGONALIZE(S[0], S[1], S[2], S[3]); \
} while(0)

#define PERMUTE(S)               \
do                               \
{                                \
    int i;                       \
    for(i = 0; i < NORX_L; ++i)  \
    {                            \
        F(S);                    \
    }                            \
} while(0)

#define INJECT_DOMAIN_CONSTANT(S, TAG)             \
do                                                 \
{                                                  \
    S[3] = XOR(S[3], _mm_set_epi32(TAG, 0, 0, 0)); \
} while(0)

#define ABSORB_BLOCK(S, IN, TAG)      \
do                                    \
{                                     \
    INJECT_DOMAIN_CONSTANT(S, TAG);   \
    PERMUTE(S);                       \
    S[0] = XOR(S[0], LOADU(IN +  0)); \
    S[1] = XOR(S[1], LOADU(IN + 16)); \
    S[2] = XOR(S[2], LOADU(IN + 32)); \
} while(0)

#define ABSORB_LASTBLOCK(S, IN, INLEN, TAG)           \
do                                                    \
{                                                     \
    ALIGN(64) unsigned char lastblock[BYTES(NORX_R)]; \
    PAD(lastblock, sizeof lastblock, IN, INLEN);      \
    ABSORB_BLOCK(S, lastblock, TAG);                  \
} while(0)

#define ENCRYPT_BLOCK(S, OUT, IN)                             \
do                                                            \
{                                                             \
    INJECT_DOMAIN_CONSTANT(S, PAYLOAD_TAG);                   \
    PERMUTE(S);                                               \
    S[0] = XOR(S[0], LOADU(IN +  0)); STOREU(OUT +  0, S[0]); \
    S[1] = XOR(S[1], LOADU(IN + 16)); STOREU(OUT + 16, S[1]); \
    S[2] = XOR(S[2], LOADU(IN + 32)); STOREU(OUT + 32, S[2]); \
} while(0)

#define ENCRYPT_LASTBLOCK(S, OUT, IN, INLEN)          \
do                                                    \
{                                                     \
    ALIGN(64) unsigned char lastblock[BYTES(NORX_R)]; \
    PAD(lastblock, sizeof lastblock, IN, INLEN);      \
    ENCRYPT_BLOCK(S, lastblock, lastblock);           \
    memcpy(OUT, lastblock, INLEN);                    \
} while(0)

#define DECRYPT_BLOCK(S, OUT, IN)                                          \
do                                                                         \
{                                                                          \
    __m128i T[3];                                                          \
    INJECT_DOMAIN_CONSTANT(S, PAYLOAD_TAG);                                \
    PERMUTE(S);                                                            \
    T[0] = LOADU(IN +  0); STOREU(OUT +  0, XOR(S[0], T[0])); S[0] = T[0]; \
    T[1] = LOADU(IN + 16); STOREU(OUT + 16, XOR(S[1], T[1])); S[1] = T[1]; \
    T[2] = LOADU(IN + 32); STOREU(OUT + 32, XOR(S[2], T[2])); S[2] = T[2]; \
} while(0)

#define DECRYPT_LASTBLOCK(S, OUT, IN, INLEN)                                           \
do                                                                                     \
{                                                                                      \
    __m128i T[3];                                                                      \
    ALIGN(64) unsigned char lastblock[BYTES(NORX_R)] = {0};                            \
    INJECT_DOMAIN_CONSTANT(S, PAYLOAD_TAG);                                            \
    PERMUTE(S);                                                                        \
    STOREU(lastblock +   0, S[0]);                                                     \
    STOREU(lastblock +  16, S[1]);                                                     \
    STOREU(lastblock +  32, S[2]);                                                     \
    memcpy(lastblock, IN, INLEN);                                                      \
    lastblock[INLEN] ^= 0x01;                                                          \
    lastblock[BYTES(NORX_R)-1] ^= 0x80;                                                \
    T[0]= LOADU(lastblock +  0); STOREU(lastblock +  0, XOR(S[0], T[0])); S[0] = T[0]; \
    T[1]= LOADU(lastblock + 16); STOREU(lastblock + 16, XOR(S[1], T[1])); S[1] = T[1]; \
    T[2]= LOADU(lastblock + 32); STOREU(lastblock + 32, XOR(S[2], T[2])); S[2] = T[2]; \
    memcpy(OUT, lastblock, INLEN);                                                     \
} while(0)

#define INITIALISE(S, NONCE, KEY)                                    \
do                                                                   \
{                                                                    \
    uint64_t N;                                                      \
    memcpy(&N, NONCE, sizeof N);                                     \
    S[0] = _mm_set_epi32( U3,  U2, N >> 32, N&0xFFFFFFFF);           \
    S[1] = LOADU(KEY);                                               \
    S[2] = _mm_set_epi32(U11, U10,  U9,  U8);                        \
    S[3] = _mm_set_epi32(U15, U14, U13, U12);                        \
    S[3] = XOR(S[3], _mm_set_epi32(NORX_T, NORX_P, NORX_L, NORX_W)); \
    PERMUTE(S);                                                      \
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
    __m128i S[4];

    *clen = mlen + BYTES(NORX_T);
    INITIALISE(S, nonce, key);
    ABSORB_DATA(S, a, alen, HEADER_TAG);
    ENCRYPT_DATA(S, c, m, mlen);
    ABSORB_DATA(S, z, zlen, TRAILER_TAG);
    FINALISE(S);
    STOREU(c + mlen, S[0]);
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
    __m128i S[4];

    if (clen < BYTES(NORX_T)) { return -1; }

    *mlen = clen - BYTES(NORX_T);

    INITIALISE(S, nonce, key);
    ABSORB_DATA(S, a, alen, HEADER_TAG);
    DECRYPT_DATA(S, m, c, clen - BYTES(NORX_T));
    ABSORB_DATA(S, z, zlen, TRAILER_TAG);
    FINALISE(S);

    /* Verify tag */
    S[0] = _mm_cmpeq_epi8(S[0], LOADU(c + clen - BYTES(NORX_T)));
    return (((_mm_movemask_epi8(S[0]) & 0xFFFFU) + 1) >> 16) - 1;
}
