/*
   NORX reference source code package - reference C implementations

   Written in 2014 by Samuel Neves <sneves@dei.uc.pt>

   To the extent possible under law, the author(s) have dedicated all copyright
   and related and neighboring rights to this software to the public domain
   worldwide. This software is distributed without any warranty.

   You should have received a copy of the CC0 Public Domain Dedication along with
   this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
*/

#if 1
#   include "crypto_aead.h"
#endif

#include "config.h"

#include <stdint.h>
#include <stdio.h>
#include <string.h>

#include <arm_neon.h>

typedef enum tag__
{
    HEADER_TAG  = 1 << 0,
    PAYLOAD_TAG = 1 << 1,
    TRAILER_TAG = 1 << 2,
    FINAL_TAG   = 1 << 3,
    BRANCH_TAG  = 1 << 4,
    MERGE_TAG   = 1 << 5
} tag_t;

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


/* NORX64-specific constants */
#define NORX_PARAMETER ((NORX_R << 26) | (NORX_D << 18) | (NORX_W << 10) | NORX_A)

#define U0 0x243F6A8885A308D3ULL
#define U1 0x13198A2E03707344ULL
#define U2 0xA4093822299F31D0ULL
#define U3 0x082EFA98EC4E6C89ULL
#define U4 0xAE8858DC339325A1ULL
#define U5 0x670A134EE52D7FA6ULL
#define U6 0xC4316D80CD967541ULL
#define U7 0xD21DFBF8B630B762ULL
#define U8 0x375A18D261E7F892ULL
#define U9 0x343D1F187D92285BULL

#define R0  8
#define R1 19
#define R2 40
#define R3 63

/* Implementation */
#define G(A0, A1, B0, B1, C0, C1, D0, D1)   \
do                                          \
{                                           \
    uint64x2_t l0, r0, l1, r1;              \
                                            \
    l0 = XOR(A0, B0);    r0 = XOR(A1, B1);  \
    l1 = AND(A0, B0);    r1 = AND(A1, B1);  \
    l1 = SHL(    l1);    r1 = SHL(    r1);  \
    A0 = XOR(l0, l1);    A1 = XOR(r0, r1);  \
    D0 = XOR(D0, A0);    D1 = XOR(D1, A1);  \
    D0 = ROT(D0, R0);    D1 = ROT(D1, R0);  \
                                            \
    l0 = XOR(C0, D0);    r0 = XOR(C1, D1);  \
    l1 = AND(C0, D0);    r1 = AND(C1, D1);  \
    l1 = SHL(    l1);    r1 = SHL(    r1);  \
    C0 = XOR(l0, l1);    C1 = XOR(r0, r1);  \
    B0 = XOR(B0, C0);    B1 = XOR(B1, C1);  \
    B0 = ROT(B0, R1);    B1 = ROT(B1, R1);  \
                                            \
    l0 = XOR(A0, B0);    r0 = XOR(A1, B1);  \
    l1 = AND(A0, B0);    r1 = AND(A1, B1);  \
    l1 = SHL(    l1);    r1 = SHL(    r1);  \
    A0 = XOR(l0, l1);    A1 = XOR(r0, r1);  \
    D0 = XOR(D0, A0);    D1 = XOR(D1, A1);  \
    D0 = ROT(D0, R2);    D1 = ROT(D1, R2);  \
                                            \
    l0 = XOR(C0, D0);    r0 = XOR(C1, D1);  \
    l1 = AND(C0, D0);    r1 = AND(C1, D1);  \
    l1 = SHL(    l1);    r1 = SHL(    r1);  \
    C0 = XOR(l0, l1);    C1 = XOR(r0, r1);  \
    B0 = XOR(B0, C0);    B1 = XOR(B1, C1);  \
    B0 = ROT(B0, R3);    B1 = ROT(B1, R3);  \
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

#define F(A0, A1, B0, B1, C0, C1, D0, D1)          \
do                                                 \
{                                                  \
    G(A0, A1, B0, B1, C0, C1, D0, D1);             \
    DIAGONALIZE(A0, A1, B0, B1, C0, C1, D0, D1);   \
    G(A0, A1, B0, B1, C0, C1, D0, D1);             \
    UNDIAGONALIZE(A0, A1, B0, B1, C0, C1, D0, D1); \
} while(0)


#define PERMUTE(A0, A1, B0, B1, C0, C1, D0, D1) \
do                                              \
{                                               \
    int i;                                      \
    for(i = 0; i < NORX_R; ++i)                 \
    {                                           \
        F(A0, A1, B0, B1, C0, C1, D0, D1);      \
    }                                           \
} while(0)

#define INJECT_DOMAIN_CONSTANT(A0, A1, B0, B1, C0, C1, D0, D1, TAG)       \
do                                                                        \
{                                                                         \
    D1 = XOR(D1, vcombine_u64(vcreate_u64(0), vcreate_u64(TAG)));         \
} while(0)


#define ABSORB_BLOCK(A0, A1, B0, B1, C0, C1, D0, D1, BLOCK)             \
do                                                                      \
{                                                                       \
    INJECT_DOMAIN_CONSTANT(A0, A1, B0, B1, C0, C1, D0, D1, HEADER_TAG); \
    PERMUTE(A0, A1, B0, B1, C0, C1, D0, D1);                            \
    A0 = XOR(A0, LOADU(BLOCK +  0));                                    \
    A1 = XOR(A1, LOADU(BLOCK + 16));                                    \
    B0 = XOR(B0, LOADU(BLOCK + 32));                                    \
    B1 = XOR(B1, LOADU(BLOCK + 48));                                    \
    C0 = XOR(C0, LOADU(BLOCK + 64));                                    \
} while(0)

#define ENCRYPT_BLOCK(A0, A1, B0, B1, C0, C1, D0, D1, IN, OUT)           \
do                                                                       \
{                                                                        \
    INJECT_DOMAIN_CONSTANT(A0, A1, B0, B1, C0, C1, D0, D1, PAYLOAD_TAG); \
    PERMUTE(A0, A1, B0, B1, C0, C1, D0, D1);                             \
    A0 = XOR(A0, LOADU(IN +  0)); STOREU(OUT +  0, A0);                  \
    A1 = XOR(A1, LOADU(IN + 16)); STOREU(OUT + 16, A1);                  \
    B0 = XOR(B0, LOADU(IN + 32)); STOREU(OUT + 32, B0);                  \
    B1 = XOR(B1, LOADU(IN + 48)); STOREU(OUT + 48, B1);                  \
    C0 = XOR(C0, LOADU(IN + 64)); STOREU(OUT + 64, C0);                  \
} while(0)

#define DECRYPT_BLOCK(A0, A1, B0, B1, C0, C1, D0, D1, IN, OUT)           \
do                                                                       \
{                                                                        \
    uint64x2_t W0, W1, W2, W3, W4;                                       \
    INJECT_DOMAIN_CONSTANT(A0, A1, B0, B1, C0, C1, D0, D1, PAYLOAD_TAG); \
    PERMUTE(A0, A1, B0, B1, C0, C1, D0, D1);                             \
    W0 = LOADU(IN +  0); STOREU(OUT +  0, XOR(A0, W0)); A0 = W0;         \
    W1 = LOADU(IN + 16); STOREU(OUT + 16, XOR(A1, W1)); A1 = W1;         \
    W2 = LOADU(IN + 32); STOREU(OUT + 32, XOR(B0, W2)); B0 = W2;         \
    W3 = LOADU(IN + 48); STOREU(OUT + 48, XOR(B1, W3)); B1 = W3;         \
    W4 = LOADU(IN + 64); STOREU(OUT + 64, XOR(C0, W4)); C0 = W4;         \
} while(0)

#define DECRYPT_LASTBLOCK(A0, A1, B0, B1, C0, C1, D0, D1, IN, INLEN, OUT)      \
do                                                                             \
{                                                                              \
    uint64x2_t W0, W1, W2, W3, W4;                                             \
    INJECT_DOMAIN_CONSTANT(A0, A1, B0, B1, C0, C1, D0, D1, PAYLOAD_TAG);       \
    PERMUTE(A0, A1, B0, B1, C0, C1, D0, D1);                                   \
    STOREU(lastblock +   0, A0);                                               \
    STOREU(lastblock +  16, A1);                                               \
    STOREU(lastblock +  32, B0);                                               \
    STOREU(lastblock +  48, B1);                                               \
    STOREU(lastblock +  64, C0);                                               \
    memcpy(lastblock, IN, INLEN);                                              \
    lastblock[clen] ^= 0x01;                                                   \
    lastblock[80-1] ^= 0x80;                                                   \
    W0 = LOADU(lastblock +  0); STOREU(lastblock +  0, XOR(A0, W0)); A0 = W0;  \
    W1 = LOADU(lastblock + 16); STOREU(lastblock + 16, XOR(A1, W1)); A1 = W1;  \
    W2 = LOADU(lastblock + 32); STOREU(lastblock + 32, XOR(B0, W2)); B0 = W2;  \
    W3 = LOADU(lastblock + 48); STOREU(lastblock + 48, XOR(B1, W3)); B1 = W3;  \
    W4 = LOADU(lastblock + 64); STOREU(lastblock + 64, XOR(C0, W4)); C0 = W4;  \
    memcpy(OUT, lastblock, INLEN);                                             \
} while(0)

#define INITIALIZE(A0, A1, B0, B1, C0, C1, D0, D1, N, K0, K1)                \
do                                                                           \
{                                                                            \
    A0 = vcombine_u64(  vcreate_u64(U0), vget_low_u64(N) );                  \
    A1 = vcombine_u64( vget_high_u64(N), vcreate_u64(U1) );                  \
    B0 = K0;                                                                 \
    B1 = K1;                                                                 \
    C0 = vcombine_u64(vcreate_u64(U2), vcreate_u64(U3));                     \
    C1 = vcombine_u64(vcreate_u64(U4), vcreate_u64(U5));                     \
    D0 = vcombine_u64(vcreate_u64(U6), vcreate_u64(U7));                     \
    D1 = vcombine_u64(vcreate_u64(U8), vcreate_u64(U9));                     \
    D1 = XOR(D1, vcombine_u64(vcreate_u64(NORX_PARAMETER), vcreate_u64(0))); \
    PERMUTE(A0, A1, B0, B1, C0, C1, D0, D1);                                 \
} while(0)

#define FINALIZE(A0, A1, B0, B1, C0, C1, D0, D1)                       \
do                                                                     \
{                                                                      \
    INJECT_DOMAIN_CONSTANT(A0, A1, B0, B1, C0, C1, D0, D1, FINAL_TAG); \
    PERMUTE(A0, A1, B0, B1, C0, C1, D0, D1);                           \
    PERMUTE(A0, A1, B0, B1, C0, C1, D0, D1);                           \
} while(0)

#define PAD(BLOCK, BLOCKLEN, IN, INLEN) \
do                                      \
{                                       \
    memset(BLOCK, 0, BLOCKLEN);         \
    memcpy(BLOCK, IN, INLEN);           \
    BLOCK[INLEN] = 0x01;                \
    BLOCK[BLOCKLEN - 1] |= 0x80;        \
} while(0)

int crypto_aead_encrypt(
    unsigned char *c, unsigned long long *clen,
    const unsigned char *m, unsigned long long mlen_,
    const unsigned char *ad, unsigned long long adlen_,
    const unsigned char *nsec,
    const unsigned char *npub,
    const unsigned char *k
    )
{
    ALIGN(32) unsigned char lastblock[80];
    uint64x2_t A0, A1, B0, B1, C0, C1, D0, D1;
    const uint64x2_t N  = LOADU(npub);
    const uint64x2_t K0 = LOADU(k +  0);
    const uint64x2_t K1 = LOADU(k + 16);
    size_t mlen = mlen_;
    size_t adlen = adlen_;

    *clen = mlen + NORX_A/8;

    /* Initialization */
    INITIALIZE(A0, A1, B0, B1, C0, C1, D0, D1, N, K0, K1);

    /* Process header, if exists */
    if( adlen > 0 )
    {
        while(adlen >= 80)
        {
            ABSORB_BLOCK(A0, A1, B0, B1, C0, C1, D0, D1, ad);
            ad += 80; adlen -= 80;
        }
        PAD(lastblock, sizeof lastblock, ad, adlen);
        ABSORB_BLOCK(A0, A1, B0, B1, C0, C1, D0, D1, lastblock);
    }

    /* Encrypt payload */
    if(mlen > 0)
    {
        while( mlen >= 80 )
        {
            ENCRYPT_BLOCK(A0, A1, B0, B1, C0, C1, D0, D1, m, c);
            mlen -= 80; m += 80; c += 80;
        }
        /* Handle last block */
        PAD(lastblock, sizeof lastblock, m, mlen);
        ENCRYPT_BLOCK(A0, A1, B0, B1, C0, C1, D0, D1, lastblock, lastblock);
        memcpy(c, lastblock, mlen);
        c += mlen;
    }

    /* No trailer in CAESAR API, ignore */

    /* Finalize, and output tag */
    FINALIZE(A0, A1, B0, B1, C0, C1, D0, D1);
    STOREU(c +  0, A0);
    STOREU(c + 16, A1);
    return 0;
}


int crypto_aead_decrypt(
    unsigned char *m, unsigned long long *mlen,
    unsigned char *nsec,
    const unsigned char *c, unsigned long long clen_,
    const unsigned char *ad, unsigned long long adlen_,
    const unsigned char *npub,
    const unsigned char *k
    )
{
    ALIGN(32) unsigned char lastblock[80];
    uint64x2_t A0, A1, B0, B1, C0, C1, D0, D1;
    const uint64x2_t N  = LOADU(npub);
    const uint64x2_t K0 = LOADU(k +  0);
    const uint64x2_t K1 = LOADU(k + 16);
    uint32x4_t T0, T1;
    size_t clen = clen_;
    size_t adlen = adlen_;

    if(clen < NORX_A/8)
        return -1;

    clen -= NORX_A/8;
    *mlen = clen;

    /* Initialization */
    INITIALIZE(A0, A1, B0, B1, C0, C1, D0, D1, N, K0, K1);

    /* Process header, if exists */
    if( adlen > 0 )
    {
        while(adlen >= 80)
        {
            ABSORB_BLOCK(A0, A1, B0, B1, C0, C1, D0, D1, ad);
            ad += 80;
            adlen -= 80;
        }
        PAD(lastblock, sizeof lastblock, ad, adlen);
        ABSORB_BLOCK(A0, A1, B0, B1, C0, C1, D0, D1, lastblock);
    }

    /* Decrypt payload */
    if(clen > 0)
    {
        while(clen >= 80)
        {
            DECRYPT_BLOCK(A0, A1, B0, B1, C0, C1, D0, D1, c, m);
            c += 80; m += 80; clen -= 80;
        }

        /* Final block */
        DECRYPT_LASTBLOCK(A0, A1, B0, B1, C0, C1, D0, D1, c, clen, m);
        c += clen;
    }

    /* No trailer in CAESAR API, ignore */

    /* Finalize, and output tag */
    FINALIZE(A0, A1, B0, B1, C0, C1, D0, D1);


    /* Verify tag */
    T0 = vceqq_u32(U64TOU32(A0), U8TOU32( vld1q_u8((uint8_t *)(c +  0)) ));
    T1 = vceqq_u32(U64TOU32(A1), U8TOU32( vld1q_u8((uint8_t *)(c + 16)) ));
    T0 = vandq_u32(T0, T1);
    return 0xFFFFFFFFFFFFFFFFULL == (vgetq_lane_u64(U32TOU64(T0), 0) & vgetq_lane_u64(U32TOU64(T0), 1)) ? 0 : -1;
}

