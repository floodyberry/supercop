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

const char * norx_version = "2.0";

#define TWEAK_LOW_LATENCY
#define NORX_W 32                /* word size */
#define NORX_L 6                 /* round number */
#define NORX_P 1                 /* parallelism degree */
#define NORX_T (NORX_W *  4)     /* tag size */
#define NORX_N (NORX_W *  2)     /* nonce size */
#define NORX_K (NORX_W *  4)     /* key size */
#define NORX_B (NORX_W * 16)     /* permutation width */
#define NORX_C (NORX_W *  4)     /* capacity */
#define NORX_R (NORX_B - NORX_C) /* rate */

#define BYTES(x) (((x) + 7) / 8)
#define WORDS(x) (((x) + (NORX_W-1)) / NORX_W)

#define ALIGN(x) __attribute__((aligned(x)))

#define LOAD(in) vreinterpretq_u32_u8( vld1q_u8((uint8_t *)(in)) )
#define LOADU(in) LOAD((in))

#define STORE(out, x) vst1q_u8((uint8_t*)(out), vreinterpretq_u8_u32(x))
#define STOREU(out, x) STORE((out), (x))

#define LOADL(in) vcombine_u32( vreinterpret_u32_u8( vld1_u8((uint8_t *)(in)) ), vcreate_u32(0))
#define STOREL(out, x) vst1_u8((uint8_t *)(out), vget_low_u8(vreinterpretq_u8_u32(x)))


#define ROT(X, C)  \
( \
            (C) == 16 ? vreinterpretq_u32_u16(vrev32q_u16(vreinterpretq_u16_u32(X))) \
    :       (C) == 31 ? /* vsriq_n_u32(SHL(X), (X), (C))*/ veorq_u32(vshrq_n_u32(X, C), SHL(X) ) \
    :   /* else */  /*vsriq_n_u32(vshlq_n_u32((X), 32-(C)), (X), (C)) */ veorq_u32(vshrq_n_u32(X, C), vshlq_n_u32(X, 32-(C))) \
)

#define XOR(A, B) veorq_u32((A), (B))
#define AND(A, B) vandq_u32((A), (B))
#define ADD(A, B) vaddq_u32((A), (B))
#if 0
#define SHL(A)    vshlq_n_u32((A), 1)
#else
#define SHL(A) vaddq_u32(A, A)
#endif

#define BLEND(A, B) vcombine_u32(vget_low_u32(B), vget_high_u32(A))
#define SETV(A0, A1, A2, A3) {A0, A1, A2, A3}

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
	#define G(A, B, C, D)  \
	do                     \
	{                      \
	    uint32x4_t t0, t1; \
	                       \
	    t0 = XOR( A,  B);  \
	    t1 = AND( A,  B);  \
	    t1 = SHL(t1);      \
	    A  = XOR(t0, t1);  \
	    D  = XOR( D, t0);  \
	    D  = XOR( D, t1);  \
	    D  = ROT( D, R0);  \
	                       \
	    t0 = XOR( C,  D);  \
	    t1 = AND( C,  D);  \
	    t1 = SHL(t1);      \
	    C  = XOR(t0, t1);  \
	    B  = XOR( B, t0);  \
	    B  = XOR( B, t1);  \
	    B  = ROT( B, R1);  \
	                       \
	    t0 = XOR( A,  B);  \
	    t1 = AND( A,  B);  \
	    t1 = SHL(t1);      \
	    A  = XOR(t0, t1);  \
	    D  = XOR( D, t0);  \
	    D  = XOR( D, t1);  \
	    D  = ROT( D, R2);  \
	                       \
	    t0 = XOR( C,  D);  \
	    t1 = AND( C,  D);  \
	    t1 = SHL(t1);      \
	    C  = XOR(t0, t1);  \
	    B  = XOR( B, t0);  \
	    B  = XOR( B, t1);  \
	    B  = ROT( B, R3);  \
	} while(0)
#else
	#define G(A, B, C, D)  \
	do                     \
	{                      \
	    uint32x4_t t0, t1; \
	                       \
	    t0 = XOR( A,  B);  \
	    t1 = AND( A,  B);  \
	    t1 = SHL(t1);      \
	    A  = XOR(t0, t1);  \
	    D  = XOR( D,  A);  \
	    D  = ROT( D, R0);  \
	                       \
	    t0 = XOR( C,  D);  \
	    t1 = AND( C,  D);  \
	    t1 = SHL(t1);      \
	    C  = XOR(t0, t1);  \
	    B  = XOR( B,  C);  \
	    B  = ROT( B, R1);  \
	                       \
	    t0 = XOR( A,  B);  \
	    t1 = AND( A,  B);  \
	    t1 = SHL(t1);      \
	    A  = XOR(t0, t1);  \
	    D  = XOR( D,  A);  \
	    D  = ROT( D, R2);  \
	                       \
	    t0 = XOR( C,  D);  \
	    t1 = AND( C,  D);  \
	    t1 = SHL(t1);      \
	    C  = XOR(t0, t1);  \
	    B  = XOR( B,  C);  \
	    B  = ROT( B, R3);  \
	} while(0)
#endif


#define DIAGONALIZE(A, B, C, D)                          \
do                                                       \
{                                                        \
    D = vextq_u32(D, D, 3);                              \
    /* C = vextq_u32(C, C, 2); */                        \
    C = vcombine_u32(vget_high_u32(C), vget_low_u32(C)); \
    B = vextq_u32(B, B, 1);                              \
} while(0)

#define UNDIAGONALIZE(A, B, C, D)                        \
do                                                       \
{                                                        \
    D = vextq_u32(D, D, 1);                              \
    /* C = vextq_u32(C, C, 2); */                        \
    C = vcombine_u32(vget_high_u32(C), vget_low_u32(C)); \
    B = vextq_u32(B, B, 3);                              \
} while(0)

#define F(A, B, C, D)          \
do                             \
{                              \
    G(A, B, C, D);             \
    DIAGONALIZE(A, B, C, D);   \
    G(A, B, C, D);             \
    UNDIAGONALIZE(A, B, C, D); \
} while(0)

#define PERMUTE(A, B, C, D)      \
do                               \
{                                \
    int i;                       \
    for(i = 0; i < NORX_L; ++i)  \
    {                            \
        F(A, B, C, D);           \
    }                            \
} while(0)

#define INJECT_DOMAIN_CONSTANT(A, B, C, D, TAG)  \
do                                               \
{                                                \
    const uint32x4_t tag = SETV(0,0,0,TAG);      \
    D = XOR(D, tag);                             \
} while(0)


#define ABSORB_BLOCK(A, B, C, D, IN, TAG)    \
do                                           \
{                                            \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, TAG); \
    PERMUTE(A, B, C, D);                     \
    A = XOR(A, LOADU(IN +  0));              \
    B = XOR(B, LOADU(IN + 16));              \
    C = XOR(C, LOADU(IN + 32));              \
} while(0)

#define ABSORB_LASTBLOCK(A, B, C, D, IN, INLEN, TAG)  \
do                                                    \
{                                                     \
    ALIGN(32) unsigned char lastblock[BYTES(NORX_R)]; \
    PAD(lastblock, sizeof lastblock, IN, INLEN);      \
    ABSORB_BLOCK(A, B, C, D, lastblock, TAG);         \
} while(0)

#define ENCRYPT_BLOCK(A, B, C, D, OUT, IN)           \
do                                                   \
{                                                    \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, PAYLOAD_TAG); \
    PERMUTE(A, B, C, D);                             \
    A = XOR(A, LOADU(IN +  0)); STOREU(OUT +  0, A); \
    B = XOR(B, LOADU(IN + 16)); STOREU(OUT + 16, B); \
    C = XOR(C, LOADU(IN + 32)); STOREU(OUT + 32, C); \
} while(0)

#define ENCRYPT_LASTBLOCK(A, B, C, D, OUT, IN, INLEN) \
do                                                    \
{                                                     \
    ALIGN(32) unsigned char lastblock[BYTES(NORX_R)]; \
    PAD(lastblock, sizeof lastblock, IN, INLEN);      \
    ENCRYPT_BLOCK(A, B, C, D, lastblock, lastblock);  \
    memcpy(OUT, lastblock, INLEN);                    \
} while(0)

#define DECRYPT_BLOCK(A, B, C, D, OUT, IN)                     \
do                                                             \
{                                                              \
    uint32x4_t W0, W1, W2;                                     \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, PAYLOAD_TAG);           \
    PERMUTE(A, B, C, D);                                       \
    W0 = LOADU(IN +  0); STOREU(OUT +  0, XOR(A, W0)); A = W0; \
    W1 = LOADU(IN + 16); STOREU(OUT + 16, XOR(B, W1)); B = W1; \
    W2 = LOADU(IN + 32); STOREU(OUT + 32, XOR(C, W2)); C = W2; \
} while(0)

#define DECRYPT_LASTBLOCK(A, B, C, D, OUT, IN, INLEN)                       \
do                                                                          \
{                                                                           \
    uint32x4_t W0, W1, W2;                                                  \
    ALIGN(32) unsigned char lastblock[BYTES(NORX_R)] = {0};                 \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, PAYLOAD_TAG);                        \
    PERMUTE(A, B, C, D);                                                    \
    STOREU(lastblock +   0, A);                                             \
    STOREU(lastblock +  16, B);                                             \
    STOREU(lastblock +  32, C);                                             \
    memcpy(lastblock, IN, INLEN);                                           \
    lastblock[INLEN] ^= 0x01;                                               \
    lastblock[BYTES(NORX_R)-1]  ^= 0x80;                                    \
    W0 = LOADU(lastblock +  0); STOREU(lastblock +  0, XOR(A, W0)); A = W0; \
    W1 = LOADU(lastblock + 16); STOREU(lastblock + 16, XOR(B, W1)); B = W1; \
    W2 = LOADU(lastblock + 32); STOREU(lastblock + 32, XOR(C, W2)); C = W2; \
    memcpy(OUT, lastblock, INLEN);                                          \
} while(0)

#define INITIALISE(A, B, C, D, N, K)                             \
do                                                               \
{                                                                \
    const uint32x4_t A_ = SETV(N & 0xFFFFFFFF, N >> 32, U2, U3); \
    const uint32x4_t C_ = SETV( U8,  U9, U10, U11);              \
    const uint32x4_t D_ = SETV(U12, U13, U14, U15);              \
    const uint32x4_t P_ = SETV(NORX_W, NORX_L, NORX_P, NORX_T);  \
    A = A_;                                                      \
    B = LOADU(K);                                                \
    C = C_;                                                      \
    D = D_;                                                      \
    D = XOR(D, P_);                                              \
    PERMUTE(A, B, C, D);                                         \
} while(0)

#define ABSORB_DATA(A, B, C, D, IN, INLEN, TAG)       \
do                                                    \
{                                                     \
    if (INLEN > 0)                                    \
    {                                                 \
        size_t i = 0;                                 \
        size_t l = INLEN;                             \
        while (l >= BYTES(NORX_R))                    \
        {                                             \
            ABSORB_BLOCK(A, B, C, D, IN + i, TAG);    \
            i += BYTES(NORX_R);                       \
            l -= BYTES(NORX_R);                       \
        }                                             \
        ABSORB_LASTBLOCK(A, B, C, D, IN + i, l, TAG); \
    }                                                 \
} while(0)

#define ENCRYPT_DATA(A, B, C, D, OUT, IN, INLEN)           \
do                                                         \
{                                                          \
    if (INLEN > 0)                                         \
    {                                                      \
        size_t i = 0;                                      \
        size_t l = INLEN;                                  \
        while (l >= BYTES(NORX_R))                         \
        {                                                  \
            ENCRYPT_BLOCK(A, B, C, D, OUT + i, IN + i);    \
            i += BYTES(NORX_R);                            \
            l -= BYTES(NORX_R);                            \
        }                                                  \
        ENCRYPT_LASTBLOCK(A, B, C, D, OUT + i, IN + i, l); \
    }                                                      \
} while(0)

#define DECRYPT_DATA(A, B, C, D, OUT, IN, INLEN)           \
do                                                         \
{                                                          \
    if (INLEN > 0)                                         \
    {                                                      \
        size_t i = 0;                                      \
        size_t l = INLEN;                                  \
        while (l >= BYTES(NORX_R))                         \
        {                                                  \
            DECRYPT_BLOCK(A, B, C, D, OUT + i, IN + i);    \
            i += BYTES(NORX_R);                            \
            l -= BYTES(NORX_R);                            \
        }                                                  \
        DECRYPT_LASTBLOCK(A, B, C, D, OUT + i, IN + i, l); \
    }                                                      \
} while(0)

#define FINALISE(A, B, C, D)                       \
do                                                 \
{                                                  \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, FINAL_TAG); \
    PERMUTE(A, B, C, D);                           \
    PERMUTE(A, B, C, D);                           \
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
    uint32x4_t A, B, C, D;
    uint64_t N;

    memcpy(&N, nonce, sizeof N);
    *clen = mlen + BYTES(NORX_T);
    INITIALISE(A, B, C, D, N, key);
    ABSORB_DATA(A, B, C, D, a, alen, HEADER_TAG);
    ENCRYPT_DATA(A, B, C, D, c, m, mlen);
    ABSORB_DATA(A, B, C, D, z, zlen, TRAILER_TAG);
    FINALISE(A, B, C, D);
    STORE(c + mlen, A);
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
    uint32x4_t A, B, C, D;
    uint64_t N;

    if(clen < BYTES(NORX_T)) { return -1; }

    memcpy(&N, nonce, sizeof N);
    *mlen = clen - BYTES(NORX_T);
    INITIALISE(A, B, C, D, N, key);
    ABSORB_DATA(A, B, C, D, a, alen, HEADER_TAG);
    DECRYPT_DATA(A, B, C, D, m, c, clen - BYTES(NORX_T));
    ABSORB_DATA(A, B, C, D, z, zlen, TRAILER_TAG);
    FINALISE(A, B, C, D);

    /* Verify tag */
    A = vceqq_u32(A, LOADU(c + clen - BYTES(NORX_T)));
    return 0xFFFFFFFF == (vgetq_lane_u32(A, 0) & vgetq_lane_u32(A, 1) & vgetq_lane_u32(A, 2) & vgetq_lane_u32(A, 3)) ? 0 : -1;
}




