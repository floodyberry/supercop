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

#include <stdio.h>
#include <string.h>

#if defined(_MSC_VER)
    #include <intrin.h>
#else
    #include <x86intrin.h>
#endif

typedef enum tag__
{
    HEADER_TAG  = 1 << 0,
    PAYLOAD_TAG = 1 << 1,
    TRAILER_TAG = 1 << 2,
    FINAL_TAG   = 1 << 3,
    BRANCH_TAG  = 1 << 4,
    MERGE_TAG   = 1 << 5
} tag_t;

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
#define ROT(X, C)  \
( \
        (C) ==  8 ? _mm_shuffle_epi8((X), _mm_set_epi8(8,15,14,13,12,11,10,9, 0,7,6,5,4,3,2,1)) \
    :   (C) == 40 ? _mm_shuffle_epi8((X), _mm_set_epi8(12,11,10,9,8,15,14,13, 4,3,2,1,0,7,6,5)) \
    :   (C) == 63 ? _mm_or_si128(_mm_add_epi64((X), (X)), _mm_srli_epi64((X), 63))              \
    :   /* else */  _mm_or_si128(_mm_srli_epi64((X), (C)), _mm_slli_epi64((X), 64 - (C)))       \
)
#else
#define ROT(X, C)  \
( \
        (C) == 63 ? _mm_or_si128(_mm_add_epi64((X), (X)), _mm_srli_epi64((X), 63))              \
    :   /* else */  _mm_or_si128(_mm_srli_epi64((X), (C)), _mm_slli_epi64((X), 64 - (C)))       \
)
#endif


#define XOR(A, B) _mm_xor_si128((A), (B))
#define AND(A, B) _mm_and_si128((A), (B))
#define ADD(A, B) _mm_add_epi64((A), (B))

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
#if defined(TWEAK_LOW_LATENCY)
	#define G(A0, A1, B0, B1, C0, C1, D0, D1)   \
	do                                          \
	{                                           \
	    __m128i l0, r0, l1, r1;                 \
	                                            \
	    l0 = XOR(A0, B0);    r0 = XOR(A1, B1);  \
	    l1 = AND(A0, B0);    r1 = AND(A1, B1);  \
	    l1 = ADD(l1, l1);    r1 = ADD(r1, r1);  \
	    A0 = XOR(l0, l1);    A1 = XOR(r0, r1);  \
	    D0 = XOR(D0, l0);    D1 = XOR(D1, r0);  \
	    D0 = XOR(D0, l1);    D1 = XOR(D1, r1);  \
	    D0 = ROT(D0, R0);    D1 = ROT(D1, R0);  \
	                                            \
	    l0 = XOR(C0, D0);    r0 = XOR(C1, D1);  \
	    l1 = AND(C0, D0);    r1 = AND(C1, D1);  \
	    l1 = ADD(l1, l1);    r1 = ADD(r1, r1);  \
	    C0 = XOR(l0, l1);    C1 = XOR(r0, r1);  \
	    B0 = XOR(B0, l0);    B1 = XOR(B1, r0);  \
	    B0 = XOR(B0, l1);    B1 = XOR(B1, r1);  \
	    B0 = ROT(B0, R1);    B1 = ROT(B1, R1);  \
	                                            \
	    l0 = XOR(A0, B0);    r0 = XOR(A1, B1);  \
	    l1 = AND(A0, B0);    r1 = AND(A1, B1);  \
	    l1 = ADD(l1, l1);    r1 = ADD(r1, r1);  \
	    A0 = XOR(l0, l1);    A1 = XOR(r0, r1);  \
	    D0 = XOR(D0, l0);    D1 = XOR(D1, r0);  \
	    D0 = XOR(D0, l1);    D1 = XOR(D1, r1);  \
	    D0 = ROT(D0, R2);    D1 = ROT(D1, R2);  \
	                                            \
	    l0 = XOR(C0, D0);    r0 = XOR(C1, D1);  \
	    l1 = AND(C0, D0);    r1 = AND(C1, D1);  \
	    l1 = ADD(l1, l1);    r1 = ADD(r1, r1);  \
	    C0 = XOR(l0, l1);    C1 = XOR(r0, r1);  \
	    B0 = XOR(B0, l0);    B1 = XOR(B1, r0);  \
	    B0 = XOR(B0, l1);    B1 = XOR(B1, r1);  \
	    B0 = ROT(B0, R3);    B1 = ROT(B1, R3);  \
	} while(0)
#else
    #define G(A0, A1, B0, B1, C0, C1, D0, D1)   \
    do                                          \
    {                                           \
        __m128i l0, r0, l1, r1;                 \
                                                \
        l0 = XOR(A0, B0);    r0 = XOR(A1, B1);  \
        l1 = AND(A0, B0);    r1 = AND(A1, B1);  \
        l1 = ADD(l1, l1);    r1 = ADD(r1, r1);  \
        A0 = XOR(l0, l1);    A1 = XOR(r0, r1);  \
        D0 = XOR(D0, A0);    D1 = XOR(D1, A1);  \
        D0 = ROT(D0, R0);    D1 = ROT(D1, R0);  \
                                                \
        l0 = XOR(C0, D0);    r0 = XOR(C1, D1);  \
        l1 = AND(C0, D0);    r1 = AND(C1, D1);  \
        l1 = ADD(l1, l1);    r1 = ADD(r1, r1);  \
        C0 = XOR(l0, l1);    C1 = XOR(r0, r1);  \
        B0 = XOR(B0, C0);    B1 = XOR(B1, C1);  \
        B0 = ROT(B0, R1);    B1 = ROT(B1, R1);  \
                                                \
        l0 = XOR(A0, B0);    r0 = XOR(A1, B1);  \
        l1 = AND(A0, B0);    r1 = AND(A1, B1);  \
        l1 = ADD(l1, l1);    r1 = ADD(r1, r1);  \
        A0 = XOR(l0, l1);    A1 = XOR(r0, r1);  \
        D0 = XOR(D0, A0);    D1 = XOR(D1, A1);  \
        D0 = ROT(D0, R2);    D1 = ROT(D1, R2);  \
                                                \
        l0 = XOR(C0, D0);    r0 = XOR(C1, D1);  \
        l1 = AND(C0, D0);    r1 = AND(C1, D1);  \
        l1 = ADD(l1, l1);    r1 = ADD(r1, r1);  \
        C0 = XOR(l0, l1);    C1 = XOR(r0, r1);  \
        B0 = XOR(B0, C0);    B1 = XOR(B1, C1);  \
        B0 = ROT(B0, R3);    B1 = ROT(B1, R3);  \
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

#define F(A0, A1, B0, B1, C0, C1, D0, D1)         \
do                                                \
{                                                 \
    G(A0, A1, B0, B1, C0, C1, D0, D1);            \
    DIAGONALIZE(A0, A1, B0, B1, C0, C1, D0, D1);  \
    G(A0, A1, B0, B1, C0, C1, D0, D1);            \
    UNDIAGONALIZE(A0, A1, B0, B1, C0, C1, D0, D1);\
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
    D1 = XOR(D1, _mm_set_epi64x(TAG, 0));                                 \
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
    __m128i W0, W1, W2, W3, W4;                                          \
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
    __m128i W0, W1, W2, W3, W4;                                                \
    INJECT_DOMAIN_CONSTANT(A0, A1, B0, B1, C0, C1, D0, D1, PAYLOAD_TAG);       \
    PERMUTE(A0, A1, B0, B1, C0, C1, D0, D1);                                   \
    STOREU(lastblock +   0, A0);                                               \
    STOREU(lastblock +  16, A1);                                               \
    STOREU(lastblock +  32, B0);                                               \
    STOREU(lastblock +  48, B1);                                               \
    STOREU(lastblock +  64, C0);                                               \
    block_copy(lastblock, IN, INLEN);                                          \
    lastblock[clen] ^= 0x01;                                                   \
    lastblock[80-1] ^= 0x80;                                                   \
    W0 = LOADU(lastblock +  0); STOREU(lastblock +  0, XOR(A0, W0)); A0 = W0;  \
    W1 = LOADU(lastblock + 16); STOREU(lastblock + 16, XOR(A1, W1)); A1 = W1;  \
    W2 = LOADU(lastblock + 32); STOREU(lastblock + 32, XOR(B0, W2)); B0 = W2;  \
    W3 = LOADU(lastblock + 48); STOREU(lastblock + 48, XOR(B1, W3)); B1 = W3;  \
    W4 = LOADU(lastblock + 64); STOREU(lastblock + 64, XOR(C0, W4)); C0 = W4;  \
    block_copy(OUT, lastblock, INLEN);                                         \
} while(0)

#define INITIALIZE(A0, A1, B0, B1, C0, C1, D0, D1, N, K0, K1)               \
do                                                                          \
{                                                                           \
    A0 = XOR(_mm_slli_si128(N, 8), _mm_set_epi64x(0, U0));                  \
    A1 = XOR(_mm_srli_si128(N, 8), _mm_set_epi64x(U1, 0));                  \
    B0 = K0;                                                                \
    B1 = K1;                                                                \
    C0 = _mm_set_epi64x(U3, U2);                                            \
    C1 = _mm_set_epi64x(U5, U4);                                            \
    D0 = _mm_set_epi64x(U7, U6);                                            \
    D1 = _mm_set_epi64x(U9, U8);                                            \
    D1 = XOR(D1, _mm_set_epi64x(0, NORX_PARAMETER));                        \
    PERMUTE(A0, A1, B0, B1, C0, C1, D0, D1);                                \
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
    block_copy(BLOCK, IN, INLEN);       \
    BLOCK[INLEN] = 0x01;                \
    BLOCK[BLOCKLEN - 1] |= 0x80;        \
} while(0)

/* inlen <= 80 */
static void block_copy(unsigned char *out, const unsigned char *in, const size_t inlen)
{
    if( inlen & 64 )
    {
        STOREU(out +  0, LOADU(in +  0));
        STOREU(out + 16, LOADU(in + 16));
        STOREU(out + 32, LOADU(in + 32));
        STOREU(out + 48, LOADU(in + 48));
        in += 64; out += 64;
    }
    if( inlen & 32 )
    {
        STOREU(out +  0, LOADU(in +  0));
        STOREU(out + 16, LOADU(in + 16));
        in += 32; out += 32;
    }
    if( inlen & 16 )
    {
        STOREU(out +  0, LOADU(in +  0));
        in += 16; out += 16;
    }
    if( inlen & 8 )
    {
        memcpy(out, in, 8);
        in += 8; out += 8;
    }
    if( inlen & 4 )
    {
        memcpy(out, in, 4);
        in += 4; out += 4;
    }
    if( inlen & 2 )
    {
        memcpy(out, in, 2);
        in += 2; out += 2;
    }
    if( inlen & 1 )
    {
        memcpy(out, in, 1);
        in += 1; out += 1;
    }
}

int crypto_aead_encrypt(
    unsigned char *c, unsigned long long *clen,
    const unsigned char *m, unsigned long long mlen,
    const unsigned char *ad, unsigned long long adlen,
    const unsigned char *nsec,
    const unsigned char *npub,
    const unsigned char *k
    )
{
    ALIGN(64) unsigned char lastblock[80];
    __m128i A0, A1, B0, B1, C0, C1, D0, D1;
    const __m128i N  = LOADU(npub);
    const __m128i K0 = LOADU(k +  0);
    const __m128i K1 = LOADU(k + 16);

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
        block_copy(c, lastblock, mlen);
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
    const unsigned char *c, unsigned long long clen,
    const unsigned char *ad, unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k
    )
{
    ALIGN(64) unsigned char lastblock[80];
    __m128i A0, A1, B0, B1, C0, C1, D0, D1;
    const __m128i N  = LOADU(npub);
    const __m128i K0 = LOADU(k +  0);
    const __m128i K1 = LOADU(k + 16);

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
    A0 = _mm_cmpeq_epi8(A0, LOADU(c +  0));
    A1 = _mm_cmpeq_epi8(A1, LOADU(c + 16));
    return _mm_movemask_epi8(AND(A0, A1)) == 0xFFFF ? 0 : -1;
}

