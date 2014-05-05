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

#define ROT(X, C)  \
( \
        (C) ==  8 ? _mm256_shuffle_epi8((X), _mm256_set_epi8(8,15,14,13,12,11,10,9, 0,7,6,5,4,3,2,1, 8,15,14,13,12,11,10,9, 0,7,6,5,4,3,2,1)) \
    :   (C) == 40 ? _mm256_shuffle_epi8((X), _mm256_set_epi8(12,11,10,9,8,15,14,13, 4,3,2,1,0,7,6,5, 12,11,10,9,8,15,14,13, 4,3,2,1,0,7,6,5)) \
    :   (C) == 63 ? _mm256_or_si256(_mm256_add_epi64((X), (X)), _mm256_srli_epi64((X), 63))           \
    :   /* else */  _mm256_or_si256(_mm256_srli_epi64((X), (C)), _mm256_slli_epi64((X), 64 - (C)))    \
)

#define XOR(A, B) _mm256_xor_si256((A), (B))
#define AND(A, B) _mm256_and_si256((A), (B))
#define ADD(A, B) _mm256_add_epi64((A), (B))

#define XOR128(A, B) _mm_xor_si128((A), (B))
#define AND128(A, B) _mm_and_si128((A), (B))
#define ADD128(A, B) _mm_add_epi64((A), (B))

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
    #define G(A, B, C, D)   \
    do                      \
    {                       \
        __m256i t0, t1;     \
                            \
        t0 = XOR( A,  B);   \
        t1 = AND( A,  B);   \
        t1 = ADD(t1, t1);   \
         A = XOR(t0, t1);   \
         D = XOR( D, t0);   \
         D = XOR( D, t1);   \
         D = ROT( D, R0);   \
                            \
        t0 = XOR( C,  D);   \
        t1 = AND( C,  D);   \
        t1 = ADD(t1, t1);   \
         C = XOR(t0, t1);   \
         B = XOR( B, t0);   \
         B = XOR( B, t1);   \
         B = ROT( B, R1);   \
                            \
        t0 = XOR( A,  B);   \
        t1 = AND( A,  B);   \
        t1 = ADD(t1, t1);   \
         A = XOR(t0, t1);   \
         D = XOR( D, t0);   \
         D = XOR( D, t1);   \
         D = ROT( D, R2);   \
                            \
        t0 = XOR( C,  D);   \
        t1 = AND( C,  D);   \
        t1 = ADD(t1, t1);   \
         C = XOR(t0, t1);   \
         B = XOR( B, t0);   \
         B = XOR( B, t1);   \
         B = ROT( B, R3);   \
    } while(0)
#else
	#define G(A, B, C, D)   \
	do                      \
	{                       \
	    __m256i t0, t1;     \
	                        \
	    t0 = XOR( A,  B);   \
	    t1 = AND( A,  B);   \
	    t1 = ADD(t1, t1);   \
	     A = XOR(t0, t1);   \
	     D = XOR( D,  A);   \
	     D = ROT( D, R0);   \
	                        \
	    t0 = XOR( C,  D);   \
	    t1 = AND( C,  D);   \
	    t1 = ADD(t1, t1);   \
	     C = XOR(t0, t1);   \
	     B = XOR( B,  C);   \
	     B = ROT( B, R1);   \
	                        \
	    t0 = XOR( A,  B);   \
	    t1 = AND( A,  B);   \
	    t1 = ADD(t1, t1);   \
	     A = XOR(t0, t1);   \
	     D = XOR( D,  A);   \
	     D = ROT( D, R2);   \
	                        \
	    t0 = XOR( C,  D);   \
	    t1 = AND( C,  D);   \
	    t1 = ADD(t1, t1);   \
	     C = XOR(t0, t1);   \
	     B = XOR( B,  C);   \
	     B = ROT( B, R3);   \
	} while(0)
#endif


#define DIAGONALIZE(A, B, C, D)                            \
do                                                         \
{                                                          \
    D = _mm256_permute4x64_epi64(D, _MM_SHUFFLE(2,1,0,3)); \
    C = _mm256_permute4x64_epi64(C, _MM_SHUFFLE(1,0,3,2)); \
    B = _mm256_permute4x64_epi64(B, _MM_SHUFFLE(0,3,2,1)); \
} while(0)

#define UNDIAGONALIZE(A, B, C, D)                          \
do                                                         \
{                                                          \
    D = _mm256_permute4x64_epi64(D, _MM_SHUFFLE(0,3,2,1)); \
    C = _mm256_permute4x64_epi64(C, _MM_SHUFFLE(1,0,3,2)); \
    B = _mm256_permute4x64_epi64(B, _MM_SHUFFLE(2,1,0,3)); \
} while(0)

#define F(A, B, C, D)         \
do                            \
{                             \
                              \
    G(A, B, C, D);            \
    DIAGONALIZE(A, B, C, D);  \
    G(A, B, C, D);            \
    UNDIAGONALIZE(A, B, C, D);\
                              \
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

#define INJECT_DOMAIN_CONSTANT(A, B, C, D, TAG)     \
do                                                  \
{                                                   \
    D = XOR(D, _mm256_set_epi64x(TAG, 0, 0, 0));    \
} while(0)


#define ABSORB_BLOCK(A, B, C, D, BLOCK)             \
do                                                  \
{                                                   \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, HEADER_TAG); \
    PERMUTE(A, B, C, D);                            \
    A = XOR(A, LOADU(BLOCK +  0));                  \
    B = XOR(B, LOADU(BLOCK + 32));                  \
    C = XOR(C, TO256(LOADU128(BLOCK + 64)));        \
} while(0)

#define ENCRYPT_BLOCK(A, B, C, D, IN, OUT)            \
do                                                    \
{                                                     \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, PAYLOAD_TAG);  \
    PERMUTE(A, B, C, D);                              \
    A = XOR(A, LOADU(IN +  0)); STOREU(OUT +  0, A);  \
    B = XOR(B, LOADU(IN + 32)); STOREU(OUT + 32, B);  \
    C = XOR(C, TO256(LOADU128(IN + 64)));             \
    STOREU128(OUT + 64, TO128(C));                    \
} while(0)

#define DECRYPT_BLOCK(A, B, C, D, IN, OUT)                        \
do                                                                \
{                                                                 \
    __m256i W0, W1, W2;                                           \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, PAYLOAD_TAG);              \
    PERMUTE(A, B, C, D);                                          \
    W0 = LOADU(IN +  0); STOREU(OUT +  0, XOR(A, W0)); A = W0;    \
    W1 = LOADU(IN + 32); STOREU(OUT + 32, XOR(B, W1)); B = W1;    \
    W2 = TO256(LOADU128(IN + 64));                                \
    STOREU128(OUT + 64, TO128(XOR(C, W2)));                       \
    C = _mm256_blend_epi32(C, W2, 0x0F);                          \
} while(0)

#define DECRYPT_LASTBLOCK(A, B, C, D, IN, INLEN, OUT)                          \
do                                                                             \
{                                                                              \
    __m256i W0, W1, W2;                                                        \
    INJECT_DOMAIN_CONSTANT(A, B, C, D, PAYLOAD_TAG);                           \
    PERMUTE(A, B, C, D);                                                       \
    STOREU(lastblock +   0, A);                                                \
    STOREU(lastblock +  32, B);                                                \
    STOREU128(lastblock +  64, TO128(C));                                      \
    block_copy(lastblock, IN, INLEN);                                          \
    lastblock[clen] ^= 0x01;                                                   \
    lastblock[80-1] ^= 0x80;                                                   \
    W0 = LOADU(lastblock +  0); STOREU(lastblock +  0, XOR(A, W0)); A = W0;    \
    W1 = LOADU(lastblock + 32); STOREU(lastblock + 32, XOR(B, W1)); B = W1;    \
    W2 = TO256(LOADU128(lastblock + 64));                                      \
    STOREU128(lastblock + 64, TO128(XOR(C, W2)));                              \
    C = _mm256_blend_epi32(C, W2, 0x0F);                                       \
    block_copy(OUT, lastblock, INLEN);                                         \
} while(0)

#define INITIALIZE(A, B, C, D, N, K)                                        \
do                                                                          \
{                                                                           \
    A = _mm256_castsi128_si256(N);                                          \
    A = _mm256_inserti128_si256(A, _mm_set_epi64x(U1, U0), 1);              \
    A = _mm256_permute4x64_epi64(A, _MM_SHUFFLE(3, 1, 0, 2));               \
    B = K;                                                                  \
    C = _mm256_set_epi64x(U5, U4, U3, U2);                                  \
    D = _mm256_set_epi64x(U9, U8, U7, U6);                                  \
    D = XOR(D, _mm256_set_epi64x(0, NORX_PARAMETER, 0, 0));                 \
    PERMUTE(A, B, C, D);                                                    \
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

/* inlen <= 80 */
static void block_copy(unsigned char *out, const unsigned char *in, const size_t inlen)
{
    if( inlen & 64 )
    {
        STOREU(out +  0, LOADU(in +  0));
        STOREU(out + 32, LOADU(in + 32));
        in += 64; out += 64;
    }
    if( inlen & 32 )
    {
        STOREU(out +  0, LOADU(in +  0));
        in += 32; out += 32;
    }
    if( inlen & 16 )
    {
        STOREU128(out +  0, LOADU128(in +  0));
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
    __m256i A, B, C, D;
    const __m128i N  = LOADU128(npub);
    const __m256i K  = LOADU(k + 0);

    *clen = mlen + NORX_A/8;

    /* Initialization */
    INITIALIZE(A, B, C, D, N, K);

    /* Process header, if exists */
    if( adlen > 0 )
    {
        while(adlen >= 80)
        {
            ABSORB_BLOCK(A, B, C, D, ad);
            ad += 80; adlen -= 80;
        }
        PAD(lastblock, sizeof lastblock, ad, adlen);
        ABSORB_BLOCK(A, B, C, D, lastblock);
    }

    /* Encrypt payload */
    if(mlen > 0)
    {
        while( mlen >= 80 )
        {
            ENCRYPT_BLOCK(A, B, C, D, m, c);
            mlen -= 80; m += 80; c += 80;
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
    STOREU(c + 0, A);
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
    __m256i A, B, C, D;
    const __m128i N  = LOADU128(npub);
    const __m256i K  = LOADU(k + 0);

    if(clen < NORX_A/8)
        return -1;

    clen -= NORX_A/8;
    *mlen = clen;

    /* Initialization */
    INITIALIZE(A, B, C, D, N, K);

    /* Process header, if exists */
    if( adlen > 0 )
    {
        while(adlen >= 80)
        {
            ABSORB_BLOCK(A, B, C, D, ad);
            ad += 80;
            adlen -= 80;
        }
        PAD(lastblock, sizeof lastblock, ad, adlen);
        ABSORB_BLOCK(A, B, C, D, lastblock);
    }

    /* Decrypt payload */
    if(clen > 0)
    {
        while(clen >= 80)
        {
            DECRYPT_BLOCK(A, B, C, D, c, m);
            c += 80; m += 80; clen -= 80;
        }

        /* Final block */
        DECRYPT_LASTBLOCK(A, B, C, D, c, clen, m);
        c += clen;
    }

    /* No trailer in CAESAR API, ignore */

    /* Finalize, and output tag */
    FINALIZE(A, B, C, D);

    /* Verify tag */
    A = _mm256_cmpeq_epi8(A, LOADU(c +  0));
    return _mm256_movemask_epi8(A) == 0xFFFFFFFF ? 0 : -1;
}



