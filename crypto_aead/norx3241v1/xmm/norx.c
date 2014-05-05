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
#define ROT(X, C)                                                                                 \
(                                                                                                 \
        (C) == 31 ? _mm_or_si128(_mm_add_epi32((X), (X)), _mm_srli_epi32((X), 31))                \
    :   /* else */  _mm_or_si128(_mm_srli_epi32((X), (C)), _mm_slli_epi32((X), 32 - (C)))         \
)
#endif

#define XOR(A, B) _mm_xor_si128((A), (B))
#define AND(A, B) _mm_and_si128((A), (B))
#define ADD(A, B) _mm_add_epi32((A), (B))

/* NORX32-specific constants */
#define NORX_PARAMETER ((NORX_R << 26) | (NORX_D << 18) | (NORX_W << 10) | NORX_A)

#define U0 0x243F6A88
#define U1 0x85A308D3
#define U2 0x13198A2E
#define U3 0x03707344
#define U4 0x254F537A
#define U5 0x38531D48
#define U6 0x839C6E83
#define U7 0xF97A3AE5
#define U8 0x8C91D88C
#define U9 0x11EAFB59

#define R0  8
#define R1 11
#define R2 16
#define R3 31

/* Implementation */
#if defined(TWEAK_LOW_LATENCY)
	#define G(A, B, C, D)  \
	do                     \
	{                      \
	    __m128i t0, t1;    \
	                       \
	    t0 = XOR( A,  B);  \
	    t1 = AND( A,  B);  \
	    t1 = ADD(t1, t1);  \
	    A  = XOR(t0, t1);  \
	    D  = XOR( D, t0);  \
	    D  = XOR( D, t1);  \
	    D  = ROT( D, R0);  \
	                       \
	    t0 = XOR( C,  D);  \
	    t1 = AND( C,  D);  \
	    t1 = ADD(t1, t1);  \
	    C  = XOR(t0, t1);  \
	    B  = XOR( B, t0);  \
	    B  = XOR( B, t1);  \
	    B  = ROT( B, R1);  \
	                       \
	    t0 = XOR( A,  B);  \
	    t1 = AND( A,  B);  \
	    t1 = ADD(t1, t1);  \
	    A  = XOR(t0, t1);  \
	    D  = XOR( D, t0);  \
	    D  = XOR( D, t1);  \
	    D  = ROT( D, R2);  \
	                       \
	    t0 = XOR( C,  D);  \
	    t1 = AND( C,  D);  \
	    t1 = ADD(t1, t1);  \
	    C  = XOR(t0, t1);  \
	    B  = XOR( B, t0);  \
	    B  = XOR( B, t1);  \
	    B  = ROT( B, R3);  \
	} while(0)
#else
	#define G(A, B, C, D)  \
	do                     \
	{                      \
	    __m128i t0, t1;    \
	                       \
	    t0 = XOR( A,  B);  \
	    t1 = AND( A,  B);  \
	    t1 = ADD(t1, t1);  \
	    A  = XOR(t0, t1);  \
	    D  = XOR( D,  A);  \
	    D  = ROT( D, R0);  \
	                       \
	    t0 = XOR( C,  D);  \
	    t1 = AND( C,  D);  \
	    t1 = ADD(t1, t1);  \
	    C  = XOR(t0, t1);  \
	    B  = XOR( B,  C);  \
	    B  = ROT( B, R1);  \
	                       \
	    t0 = XOR( A,  B);  \
	    t1 = AND( A,  B);  \
	    t1 = ADD(t1, t1);  \
	    A  = XOR(t0, t1);  \
	    D  = XOR( D,  A);  \
	    D  = ROT( D, R2);  \
	                       \
	    t0 = XOR( C,  D);  \
	    t1 = AND( C,  D);  \
	    t1 = ADD(t1, t1);  \
	    C  = XOR(t0, t1);  \
	    B  = XOR( B,  C);  \
	    B  = ROT( B, R3);  \
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
    for(i = 0; i < NORX_R; ++i)  \
    {                            \
        F(A, B, C, D);           \
    }                            \
} while(0)


#define INJECT_DOMAIN_CONSTANT(A, B, C, D, TAG)  \
do                                               \
{                                                \
    D = XOR(D, _mm_set_epi32(TAG, 0, 0, 0));     \
} while(0)


#define ABSORB_BLOCK(A, B, C, D, BLOCK)             \
do                                                  \
{                                                   \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, HEADER_TAG); \
    PERMUTE(A, B, C, D);                            \
    A = XOR(A, LOADU(BLOCK +  0));                  \
    B = XOR(B, LOADU(BLOCK + 16));                  \
    C = XOR(C, LOADL(BLOCK + 32));                  \
} while(0)

#define ENCRYPT_BLOCK(A, B, C, D, IN, OUT)           \
do                                                   \
{                                                    \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, PAYLOAD_TAG); \
    PERMUTE(A, B, C, D);                             \
    A = XOR(A, LOADU(IN +  0)); STOREU(OUT +  0, A); \
    B = XOR(B, LOADU(IN + 16)); STOREU(OUT + 16, B); \
    C = XOR(C, LOADL(IN + 32)); STOREL(OUT + 32, C); \
} while(0)

#define DECRYPT_BLOCK(A, B, C, D, IN, OUT)                      \
do                                                              \
{                                                               \
    __m128i W0, W1, W2;                                         \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, PAYLOAD_TAG);            \
    PERMUTE(A, B, C, D);                                        \
    W0 = LOADU(IN +  0); STOREU(OUT +  0, XOR(A, W0)); A = W0;  \
    W1 = LOADU(IN + 16); STOREU(OUT + 16, XOR(B, W1)); B = W1;  \
    W2 = LOADL(IN + 32); STOREL(OUT + 32, XOR(C, W2)); C = BLEND(C, W2); \
} while(0)

#define DECRYPT_LASTBLOCK(A, B, C, D, IN, INLEN, OUT)      \
do                                                         \
{                                                          \
    __m128i W0, W1, W2;                                    \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, PAYLOAD_TAG);       \
    PERMUTE(A, B, C, D);                                   \
    STOREU(lastblock +   0, A);                            \
    STOREU(lastblock +  16, B);                            \
    STOREL(lastblock +  32, C);                            \
    block_copy(lastblock, IN, INLEN);                      \
    lastblock[clen] ^= 0x01;                               \
    lastblock[40-1] ^= 0x80;                               \
    W0 = LOADU(lastblock +  0); STOREU(lastblock +  0, XOR(A, W0)); A = W0;  \
    W1 = LOADU(lastblock + 16); STOREU(lastblock + 16, XOR(B, W1)); B = W1;  \
    W2 = LOADL(lastblock + 32); STOREL(lastblock + 32, XOR(C, W2)); C = BLEND(C, W2); \
    block_copy(OUT, lastblock, INLEN);                     \
} while(0)

#define INITIALIZE(A, B, C, D, N, K)                    \
do                                                      \
{                                                       \
    A = _mm_set_epi32(U1, N >> 32, N&0xFFFFFFFF, U0);   \
    B = K;                                              \
    C = _mm_set_epi32(U5, U4, U3, U2);                  \
    D = _mm_set_epi32(U9, U8, U7, U6);                  \
    D = XOR(D, _mm_set_epi32(0, NORX_PARAMETER, 0, 0)); \
    PERMUTE(A, B, C, D);                                \
} while(0)

#define FINALIZE(A, B, C, D)                       \
do                                                 \
{                                                  \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, FINAL_TAG); \
    PERMUTE(A, B, C, D);                           \
    PERMUTE(A, B, C, D);                           \
} while(0)

#define PAD(BLOCK, BLOCKLEN, IN, INLEN) \
do                                      \
{                                       \
    memset(BLOCK, 0, BLOCKLEN);         \
    block_copy(BLOCK, IN, INLEN);       \
    BLOCK[INLEN] = 0x01;                \
    BLOCK[BLOCKLEN - 1] |= 0x80;        \
} while(0)

/* inlen <= 40 */
static void block_copy(unsigned char *out, const unsigned char *in, const size_t inlen)
{
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
    ALIGN(64) unsigned char lastblock[40];
    __m128i A, B, C, D;
    const uint64_t N  = *(const uint64_t *)npub;
    const __m128i K   = LOADU(k +  0);

    *clen = mlen + NORX_A/8;

    /* Initialization */
    INITIALIZE(A, B, C, D, N, K);

    /* Process header, if exists */
    if( adlen > 0 )
    {
        while(adlen >= 40)
        {
            ABSORB_BLOCK(A, B, C, D, ad);
            ad += 40; adlen -= 40;
        }
        PAD(lastblock, sizeof lastblock, ad, adlen);
        ABSORB_BLOCK(A, B, C, D, lastblock);
    }

    /* Encrypt payload */
    if(mlen > 0)
    {
        while( mlen >= 40 )
        {
            ENCRYPT_BLOCK(A, B, C, D, m, c);
            mlen -= 40; m += 40; c += 40;
        }
        /* Handle last block */
        PAD(lastblock, sizeof lastblock, m, mlen);
        ENCRYPT_BLOCK(A, B, C, D, lastblock, lastblock);
        block_copy(c, lastblock, mlen);
        c += mlen;
    }

    /* No trailer in CAESAR API, ignore */

    /* Finalize, and output tag */
    FINALIZE(A, B, C, D);
    STOREU(c +  0, A);
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
    ALIGN(64) unsigned char lastblock[40];
    __m128i A, B, C, D;
    const uint64_t N  = *(const uint64_t *)npub;
    const __m128i  K  = LOADU(k +  0);

    if(clen < NORX_A/8)
        return -1;

    clen -= NORX_A/8;
    *mlen = clen;

    /* Initialization */
    INITIALIZE(A, B, C, D, N, K);

    /* Process header, if exists */
    if( adlen > 0 )
    {
        while(adlen >= 40)
        {
            ABSORB_BLOCK(A, B, C, D, ad);
            ad += 40;
            adlen -= 40;
        }
        PAD(lastblock, sizeof lastblock, ad, adlen);
        ABSORB_BLOCK(A, B, C, D, lastblock);
    }

    /* Decrypt payload */
    if(clen > 0)
    {
        while(clen >= 40)
        {
            DECRYPT_BLOCK(A, B, C, D, c, m);
            c += 40; m += 40; clen -= 40;
        }

        /* Final block */
        DECRYPT_LASTBLOCK(A, B, C, D, c, clen, m);
        c += clen;
    }

    /* No trailer in CAESAR API, ignore */

    /* Finalize, and output tag */
    FINALIZE(A, B, C, D);

    /* Verify tag */
    A = _mm_cmpeq_epi8(A, LOADU(c +  0));
    return _mm_movemask_epi8(A) == 0xFFFF ? 0 : -1;
}
