/*
// HS1-SIV v2 optimized reference code.
//
// Written by Ted Krovetz (ted@krovetz.net). Last modified 28 July 2016
//
// To the extent possible under law, the author has dedicated all copyright
// and related and neighboring rights to this software to the public
// domain worldwide. This software is distributed without any warranty.
//
// You should have received a copy of the CC0 Public Domain Dedication
// along with this software. If not, see
// <http://creativecommons.org/publicdomain/zero/1.0/>
//
// The author knows of no intellectual property claims relevant to this work.
*/

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *     S h a r e d   d e f i n i t i o n s
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
#include <stdint.h>
#include "hs1.h"
#include "crypto_aead.h"

#if __SSE2__
#include <immintrin.h>
#endif
#if __ARM_NEON
#include <arm_neon.h>
#endif

/* Conditional byte reversal. Only done on big-endian machines */
static uint32_t swap32be(uint32_t w) {
    const union { int x; char e; } l = { 1 };
    if (l.e) return w;
    return (((w & 0x000000ffu) << 24) | ((w & 0x0000ff00u) << 8)  |
            ((w & 0x00ff0000u) >> 8)  | ((w & 0xff000000u) >> 24));
}

static uint64_t swap64be(uint64_t w) {
    const union { int x; char e; } l = { 1 };
    if (l.e) return w;
    return ((w & 0x00000000000000ffull) << 56) |
		   ((w & 0x000000000000ff00ull) << 40) |
		   ((w & 0x0000000000ff0000ull) << 24) |
		   ((w & 0x00000000ff000000ull) <<  8) |
	       ((w & 0x000000ff00000000ull) >>  8) |
		   ((w & 0x0000ff0000000000ull) >> 24) |
		   ((w & 0x00ff000000000000ull) >> 40) |
		   ((w & 0xff00000000000000ull) >> 56);
}

/* 16 and 32 byte copy/xor. Assumes 16 byte alignment, if CPU needs it */
#if __ARM_NEON || __SSE2__ || __ALTIVEC__
typedef unsigned T __attribute__ ((vector_size (16)));
static void copy16(void *d, const void *s) { *(T *)d  = *(T *)s; }
static void xor16 (void *d, const void *s) { *(T *)d ^= *(T *)s; }
static void zero16(void *d) { T s={0,0,0,0}; *(T *)d  = s;       }
#else
static void copy16(void *d, const void *s) {
    ((uint64_t *)d)[0] = ((uint64_t *)s)[0];
    ((uint64_t *)d)[1] = ((uint64_t *)s)[1];
}
static void xor16(void *d, const void *s) {
    ((uint64_t *)d)[0] ^= ((uint64_t *)s)[0];
    ((uint64_t *)d)[1] ^= ((uint64_t *)s)[1];
}
static void zero16(void *d) { ((uint64_t *)d)[0] = ((uint64_t *)d)[1] = 0; }
#endif
#if __AVX__
static void copy32(void *d, const void *s) {
    _mm256_storeu_si256((__m256i *)d,_mm256_loadu_si256((__m256i *)s));
}
static void xor32(void *d, const void *s) {
    _mm256_storeu_si256((__m256i *)d,
        _mm256_xor_si256(_mm256_loadu_si256((__m256i *)s),
                         _mm256_loadu_si256((__m256i *)d)));
}
static void zero32(void *d) {
    _mm256_storeu_si256((__m256i *)d,_mm256_setzero_si256());
}
#else
static void copy32(void *d, const void *s) {
    copy16(d,s); copy16((char *)d+16, (char *)s+16);
}
static void xor32(void *d, const void *s) {
    xor16(d,s); xor16((char *)d+16, (char *)s+16);
}
static void zero32(void *d) {zero16(d); zero16((char *)d+16);}
#endif

static void copy12(void *d, const void *s) {
    ((uint64_t *)d)[0] = ((uint64_t *)s)[0];
    ((uint32_t *)d)[2] = ((uint32_t *)s)[2];
}

void hs1_memcpy(void *d, const void *s, unsigned n) {
    unsigned i;
    unsigned char *dp = (unsigned char *)d;
    const unsigned char *sp = (const unsigned char *)s;
    while (n>=32) { copy32(dp,sp); dp+=32; sp+=32; n-=32; }
    while (n>=8) { *(uint64_t *)dp = *(uint64_t *)sp; dp+=8; sp+=8; n-=8; }
    for (i=0; i<n; i++) dp[i] = sp[i];
}

void hs1_bzero(void *d, unsigned n) {
    unsigned i;
    unsigned char *dp = (unsigned char *)d;
    while (n>=32) { zero32(dp); dp+=32; n-=32; }
    while (n>=8) { *(uint64_t *)dp = 0; dp+=8; n-=8; }
    for (i=0; i<n; i++) dp[i] = 0;
}

static const uint64_t m60 = ((uint64_t)1 << 60) - 1;
static const uint64_t m61 = ((uint64_t)1 << 61) - 1;

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *     C h a c h a
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

#if (__aarch64__)  /* For now use Andy Polyakov's OpenSSL implementation */

void ChaCha20_ctr32(unsigned char *out, const unsigned char *inp,
                    size_t len, const unsigned int key[8],
                    const unsigned int counter[4], size_t rounds);

void chacha_blocks(
	chacha_state_t *chacha_state,
	const void *in,          /* gets xor'd with chacha output */
	void *out,               /* out may equal in              */
	size_t len
) {
    ChaCha20_ctr32(out, in, len, (void *)chacha_state->key,
        (void *)&chacha_state->counter, chacha_state->rounds);
}

#elif !(__arm__ || __amd64__ || __i386__)

#define QROUND(a,b,c,d) \
  x##a += x##b; x##d ^= x##a; x##d = x##d << 16 | x##d >> 16; \
  x##c += x##d; x##b ^= x##c; x##b = x##b << 12 | x##b >> 20; \
  x##a += x##b; x##d ^= x##a; x##d = x##d <<  8 | x##d >> 24; \
  x##c += x##d; x##b ^= x##c; x##b = x##b <<  7 | x##b >> 25

#define w(n,m)  dp[n] = sp[n]^swap32be(x##m+b##m)

void chacha_blocks(
	chacha_state_t *chacha_state,
	const void *in,          /* gets xor'd with chacha output */
	void *out,               /* out may equal in              */
	size_t len
) {
    uint32_t *dp=(uint32_t *)out;
    const uint32_t *sp=(uint32_t *)in, *ip=(uint32_t *)chacha_state->nonce, *kp=(uint32_t *)chacha_state->key;
    uint32_t b0 = 0x61707865, b1 = 0x3320646e, b2 = 0x79622d32, b3 = 0x6b206574;
    uint32_t b4 = swap32be(kp[0]), b5 = swap32be(kp[1]), b6 = swap32be(kp[2]);
    uint32_t b7 = swap32be(kp[3]), b8 = swap32be(kp[4]), b9 = swap32be(kp[5]);
    uint32_t b10 = swap32be(kp[6]), b11 = swap32be(kp[7]), b12 = chacha_state->counter;
    uint32_t b13 = swap32be(ip[0]), b14 = swap32be(ip[1]), b15 = swap32be(ip[2]);

    while (len >= 64) {
        uint32_t i,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15;
        x0=b0; x4=b4;  x8=b8; x12=b12; QROUND( 0, 4, 8,12);
        x1=b1; x5=b5;  x9=b9; x13=b13; QROUND( 1, 5, 9,13);
        x2=b2; x6=b6; x10=b10; x14=b14; QROUND( 2, 6,10,14);
        x3=b3; x7=b7; x11=b11; x15=b15; QROUND( 3, 7,11,15);
        for (i=HS1_CHACHA_RNDS-2; i!=0; i-=2) {
            QROUND( 0, 5,10,15); QROUND( 1, 6,11,12);
            QROUND( 2, 7, 8,13); QROUND( 3, 4, 9,14);
            QROUND( 0, 4, 8,12); QROUND( 1, 5, 9,13);
            QROUND( 2, 6,10,14); QROUND( 3, 7,11,15);
        }
        QROUND( 0, 5,10,15); w(0,0); w(5,5); w(10,10); w(15,15);
        QROUND( 1, 6,11,12); w(1,1); w(6,6); w(11,11); w(12,12);
        QROUND( 2, 7, 8,13); w(2,2); w(7,7); w(8,8); w(13,13);
        QROUND( 3, 4, 9,14); w(3,3); w(4,4); w(9,9); w(14,14);
        b12 += 1; len -= 64; sp += 16; dp += 16;
    }
    if (len) {
        uint32_t i,x0,x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,buf[16];
        x0=b0; x4=b4;  x8=b8; x12=b12; QROUND( 0, 4, 8,12);
        x1=b1; x5=b5;  x9=b9; x13=b13; QROUND( 1, 5, 9,13);
        x2=b2; x6=b6; x10=b10; x14=b14; QROUND( 2, 6,10,14);
        x3=b3; x7=b7; x11=b11; x15=b15; QROUND( 3, 7,11,15);
        for (i=HS1_CHACHA_RNDS-2; i!=0; i-=2) {
            QROUND( 0, 5,10,15); QROUND( 1, 6,11,12);
            QROUND( 2, 7, 8,13); QROUND( 3, 4, 9,14);
            QROUND( 0, 4, 8,12); QROUND( 1, 5, 9,13);
            QROUND( 2, 6,10,14); QROUND( 3, 7,11,15);
        }
        QROUND( 0, 5,10,15); QROUND( 1, 6,11,12);
        QROUND( 2, 7, 8,13); QROUND( 3, 4, 9,14);
        if (len >= 16) {
            w(0,0); w(1,1); w(2,2); w(3,3);
            dp += 4; sp += 4; len -= 16;
            if (len >= 16) {
                w(0,4); w(1,5); w(2,6); w(3,7);
                dp += 4; sp += 4; len -= 16;
                if (len >= 16) {
                    w(0,8); w(1,9); w(2,10); w(3,11);
                    dp += 4; sp += 4; len -= 16;
                    buf[0] = swap32be(x12+b12); buf[1] = swap32be(x13+b13);
                    buf[2] = swap32be(x14+b14); buf[3] = swap32be(x15+b15);
                } else {
                    buf[0] = swap32be(x8+b8);   buf[1] = swap32be(x9+b9);
                    buf[2] = swap32be(x10+b10); buf[3] = swap32be(x11+b11);
                }
            } else {
                buf[0] = swap32be(x4+b4); buf[1] = swap32be(x5+b5);
                buf[2] = swap32be(x6+b6); buf[3] = swap32be(x7+b7);
            }
        } else {
            buf[0] = swap32be(x0+b0); buf[1] = swap32be(x1+b1);
            buf[2] = swap32be(x2+b2); buf[3] = swap32be(x3+b3);
        }
        for (i=0; i<len; i++)
            ((char *)dp)[i] = ((char *)sp)[i] ^ ((char *)buf)[i];
    }
}

#endif

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *     H S 1 - H a s h
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

/* ------------------------------------------------------------------------- */
#if __AVX2__
/* ------------------------------------------------------------------------- */

/* Return 63 bits congruent to ak+b mod (2^61-1). Assume 60-bit k,b 63-bit a */
static uint64_t poly_step(uint64_t a, uint64_t b, uint64_t k) {
    #if (__SIZEOF_INT128__)  /* 128-bit type available */
        unsigned __int128 tmp = (unsigned __int128)a * (unsigned __int128)k;
        return ((uint64_t)tmp & m61) + (uint64_t)(tmp >> 61) + b;
    #elif 0
        uint64_t m = (uint64_t)(uint32_t)(a>>32) * (uint64_t)(uint32_t)k
                   + (uint64_t)(uint32_t)(k>>32) * (uint64_t)(uint32_t)a;
        uint64_t h = (uint64_t)(uint32_t)(a>>32) * (uint64_t)(uint32_t)(k>>32);
        uint64_t l = (uint64_t)(uint32_t)a * (uint64_t)(uint32_t)k;
        h += (m >> 32); l += (m << 32);  /* h:l += (m>>32):(m<<32)      */
        /* CAUTION: Potential timing leak. Good compiler will eliminate */
        if (l < (m << 32)) h += 1;       /* Check for carry from l to h */
        return (l & m61) + ((h << 3) | (l >> 61)) + b;
    #else
        uint64_t m = (uint64_t)(uint32_t)(a>>32) * (uint64_t)(uint32_t)k
                   + (uint64_t)(uint32_t)(k>>32) * (uint64_t)(uint32_t)a;
        uint64_t h = (uint64_t)(uint32_t)(a>>32) * (uint64_t)(uint32_t)(k>>32);
        uint64_t l = (uint64_t)(uint32_t)a * (uint64_t)(uint32_t)k;
        l = (l & m61) + (h << 3) + (l >> 61) + b + (m >> 29) + ((m << 32) & m61);
        return l;
    #endif
}

/* Computes a%m61 without division or conditional. */
 uint64_t poly_finalize(uint64_t a) {
    a = (a & m61) + (a >> 61);
    a = (a & m61) + (a >> 61);
    return (a==m61?0:a);
    /* Create a mask of all ones if a >= m61, all zeros otherwise. */
    uint64_t mask = (uint64_t)((int64_t)((m61 - 1) - a) >> 63);
    /* Use the mask to conditionally subtract m61                  */
    return a - (mask & m61);
}

#if HS1_ASU
static uint32_t asu_hash(uint64_t x, const uint64_t *k) {
    uint64_t t = k[0] + k[1] * (uint32_t)x + k[2] * (uint32_t)(x >> 32);
    return (uint32_t)(t >> 32);
}
#endif

void hash_step(
    const hs1_hash_ctx_t *ctx,
    const void *in,
    unsigned inbytes,              /* Must be a multiple of HS1_NH_LEN */
    uint64_t accum[HS1_HASH_RNDS]
) {
    const uint32_t *mp = (const uint32_t *)in;
    while (inbytes) {
        __m256i s0,s1,s2,s3,s4,s5;
        unsigned i;
        __m128i m60_mask = _mm_set1_epi64x(m60);
        const uint32_t *kp = ctx->nh_key;
        s0 = s1 = s2 = s3 = s4 = s5 = _mm256_setzero_si256();
        for (i=0; i<HS1_NH_LEN/32; i++) {
            __m256i t0 = _mm256_add_epi32(_mm256_loadu_si256((__m256i *)(mp)),_mm256_loadu_si256((__m256i *)(kp+0)));
            __m256i t1 = _mm256_add_epi32(_mm256_loadu_si256((__m256i *)(mp)),_mm256_loadu_si256((__m256i *)(kp+4)));
            s0 = _mm256_add_epi64(s0, _mm256_mul_epu32( _mm256_shuffle_epi32(t0,0x05),  _mm256_shuffle_epi32(t0,0xaf) ));
            s1 = _mm256_add_epi64(s1, _mm256_mul_epu32( _mm256_shuffle_epi32(t1,0x05),  _mm256_shuffle_epi32(t1,0xaf) ));
            #if (HS1_HASH_RNDS > 2)
            t0 = _mm256_add_epi32(_mm256_loadu_si256((__m256i *)(mp)),_mm256_loadu_si256((__m256i *)(kp+8)));
            t1 = _mm256_add_epi32(_mm256_loadu_si256((__m256i *)(mp)),_mm256_loadu_si256((__m256i *)(kp+12)));
            s2 = _mm256_add_epi64(s2, _mm256_mul_epu32( _mm256_shuffle_epi32(t0,0x05),  _mm256_shuffle_epi32(t0,0xaf) ));
            s3 = _mm256_add_epi64(s3, _mm256_mul_epu32( _mm256_shuffle_epi32(t1,0x05),  _mm256_shuffle_epi32(t1,0xaf) ));
            #endif
            #if (HS1_HASH_RNDS > 4)
            t0 = _mm256_add_epi32(_mm256_loadu_si256((__m256i *)(mp)),_mm256_loadu_si256((__m256i *)(kp+16)));
            t1 = _mm256_add_epi32(_mm256_loadu_si256((__m256i *)(mp)),_mm256_loadu_si256((__m256i *)(kp+20)));
            s4 = _mm256_add_epi64(s4, _mm256_mul_epu32( _mm256_shuffle_epi32(t0,0x05),  _mm256_shuffle_epi32(t0,0xaf) ));
            s5 = _mm256_add_epi64(s5, _mm256_mul_epu32( _mm256_shuffle_epi32(t1,0x05),  _mm256_shuffle_epi32(t1,0xaf) ));
            #endif
            kp+=8; mp+=8;
        }
        __m128i s0_128 = _mm_add_epi64(_mm256_extracti128_si256(s0,1), _mm256_castsi256_si128(s0));
        __m128i s1_128 = _mm_add_epi64(_mm256_extracti128_si256(s1,1), _mm256_castsi256_si128(s1));
        s0_128 = _mm_add_epi64(s0_128, _mm_srli_si128(s0_128,8)) & m60_mask;
        s1_128 = _mm_add_epi64(s1_128, _mm_srli_si128(s1_128,8)) & m60_mask;
        accum[0] = poly_step(accum[0], _mm_cvtsi128_si64(s0_128), ctx->poly_key[0]);
        accum[1] = poly_step(accum[1], _mm_cvtsi128_si64(s1_128), ctx->poly_key[1]);
        #if (HS1_HASH_RNDS > 2)
        __m128i s2_128 = _mm_add_epi64(_mm256_extracti128_si256(s2,1), _mm256_castsi256_si128(s2));
        __m128i s3_128 = _mm_add_epi64(_mm256_extracti128_si256(s3,1), _mm256_castsi256_si128(s3));
        s2_128 = _mm_add_epi64(s2_128, _mm_srli_si128(s2_128,8)) & m60_mask;
        s3_128 = _mm_add_epi64(s3_128, _mm_srli_si128(s3_128,8)) & m60_mask;
        accum[2] = poly_step(accum[2], _mm_cvtsi128_si64(s2_128), ctx->poly_key[2]);
        accum[3] = poly_step(accum[3], _mm_cvtsi128_si64(s3_128), ctx->poly_key[3]);
        #endif
        #if (HS1_HASH_RNDS > 4)
        __m128i s4_128 = _mm_add_epi64(_mm256_extracti128_si256(s4,1), _mm256_castsi256_si128(s4));
        __m128i s5_128 = _mm_add_epi64(_mm256_extracti128_si256(s5,1), _mm256_castsi256_si128(s5));
        s4_128 = _mm_add_epi64(s4_128, _mm_srli_si128(s4_128,8)) & m60_mask;
        s5_128 = _mm_add_epi64(s5_128, _mm_srli_si128(s5_128,8)) & m60_mask;
        accum[4] = poly_step(accum[4], _mm_cvtsi128_si64(s4_128), ctx->poly_key[4]);
        accum[5] = poly_step(accum[5], _mm_cvtsi128_si64(s5_128), ctx->poly_key[5]);
        #endif
        inbytes -= HS1_NH_LEN;
    }
}

void hash_finalize(
    const hs1_hash_ctx_t *ctx,
    const void *in,
    unsigned inbytes,              /* Must be <= HS1_NH_LEN */
    uint64_t accum[HS1_HASH_RNDS],
    void *result
) {
    unsigned i;
    if (inbytes) {
        __m128i buf[HS1_NH_LEN/16];
        __m128i s0,s1,s2,s3,s4,s5;
        __m128i m60_mask = _mm_set1_epi64x(m60);
        const uint32_t *mp, *kp = ctx->nh_key;
        s0 = s1 = s2 = s3 = s4 = s5 = _mm_set_epi64x(0,inbytes%16);
        if (inbytes%16 != 0) {
            buf[inbytes/16] = _mm_setzero_si128();
            hs1_memcpy(buf,in,inbytes);
            mp = (const uint32_t *)buf;
        } else
            mp = (const uint32_t *)in;
        for (i=0; i < (inbytes+15)/16; i++) {
            __m128i t0 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+0)));
            __m128i t1 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+4)));
            s0 = _mm_add_epi64(s0, _mm_mul_epu32( _mm_shuffle_epi32(t0,0x05),  _mm_shuffle_epi32(t0,0xaf) ));
            s1 = _mm_add_epi64(s1, _mm_mul_epu32( _mm_shuffle_epi32(t1,0x05),  _mm_shuffle_epi32(t1,0xaf) ));
            #if (HS1_HASH_RNDS > 2)
            t0 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+8)));
            t1 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+12)));
            s2 = _mm_add_epi64(s2, _mm_mul_epu32( _mm_shuffle_epi32(t0,0x05),  _mm_shuffle_epi32(t0,0xaf) ));
            s3 = _mm_add_epi64(s3, _mm_mul_epu32( _mm_shuffle_epi32(t1,0x05),  _mm_shuffle_epi32(t1,0xaf) ));
            #endif
            #if (HS1_HASH_RNDS > 4)
            t0 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+16)));
            t1 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+20)));
            s4 = _mm_add_epi64(s4, _mm_mul_epu32( _mm_shuffle_epi32(t0,0x05),  _mm_shuffle_epi32(t0,0xaf) ));
            s5 = _mm_add_epi64(s5, _mm_mul_epu32( _mm_shuffle_epi32(t1,0x05),  _mm_shuffle_epi32(t1,0xaf) ));
            #endif
            kp+=4; mp+=4;
        }
        s0 = _mm_add_epi64(s0, _mm_srli_si128(s0,8)) & m60_mask;
        s1 = _mm_add_epi64(s1, _mm_srli_si128(s1,8)) & m60_mask;
        accum[0] = poly_step(accum[0], _mm_cvtsi128_si64(s0), ctx->poly_key[0]);
        accum[1] = poly_step(accum[1], _mm_cvtsi128_si64(s1), ctx->poly_key[1]);
        #if (HS1_HASH_RNDS > 2)
        s2 = _mm_add_epi64(s2, _mm_srli_si128(s2,8)) & m60_mask;
        s3 = _mm_add_epi64(s3, _mm_srli_si128(s3,8)) & m60_mask;
        accum[2] = poly_step(accum[2], _mm_cvtsi128_si64(s2), ctx->poly_key[2]);
        accum[3] = poly_step(accum[3], _mm_cvtsi128_si64(s3), ctx->poly_key[3]);
        #endif
        #if (HS1_HASH_RNDS > 4)
        s4 = _mm_add_epi64(s4, _mm_srli_si128(s4,8)) & m60_mask;
        s5 = _mm_add_epi64(s5, _mm_srli_si128(s5,8)) & m60_mask;
        accum[4] = poly_step(accum[4], _mm_cvtsi128_si64(s4), ctx->poly_key[4]);
        accum[5] = poly_step(accum[5], _mm_cvtsi128_si64(s5), ctx->poly_key[5]);
        #endif
    }
    #if HS1_ASU
    for (i=0; i<HS1_HASH_RNDS; i+=2) {
        uint32_t s0 = asu_hash(poly_finalize(accum[i]), ctx->asu_key+3*i);
        uint32_t s1 = asu_hash(poly_finalize(accum[i+1]), ctx->asu_key+3*i+3);
        ((uint32_t *)result)[i] = swap32be(s0);
        ((uint32_t *)result)[i+1] = swap32be(s1);
    }
    #else
    (void)ctx;
    for (i=0; i<HS1_HASH_RNDS; i++)
        ((uint64_t *)result)[i] = swap64be(poly_finalize(accum[i]));
    #endif
}


/* ------------------------------------------------------------------------- */
#elif __SSE2__
/* ------------------------------------------------------------------------- */

static const __m128i m61_mask = {((uint64_t)1<<61)-1,((uint64_t)1<<61)-1};

#if HS1_ASU
uint32_t asu_hash(uint64_t x, const uint64_t *k) {
    uint64_t t = k[0] + k[1] * (uint32_t)x + k[2] * (uint32_t)(x >> 32);
    return (uint32_t)(t >> 32);
}
#endif

void asu_hash_sse(__m128i *a, __m128i *k, uint64_t *r) {
    __m128i k1 = (__m128i)_mm_shuffle_pd(_mm_loadu_pd((double *)(k+0)), _mm_loadu_pd((double *)(k+1)), 1);
    __m128i k2 = (__m128i)_mm_shuffle_pd(_mm_loadu_pd((double *)(k+0)), _mm_loadu_pd((double *)(k+2)), 2);
    __m128i k3 = (__m128i)_mm_shuffle_pd(_mm_loadu_pd((double *)(k+1)), _mm_loadu_pd((double *)(k+2)), 1);
    __m128i lolo = _mm_mul_epu32(a[0],k1);
    __m128i lohi = _mm_mul_epu32(a[0],_mm_srli_epi64(k1,32));
    __m128i res = _mm_add_epi64(lolo, _mm_slli_epi64(lohi,32));
    lolo = _mm_mul_epu32(_mm_srli_epi64(a[0],32),k2);
    lohi = _mm_mul_epu32(_mm_srli_epi64(a[0],32),_mm_srli_epi64(k2,32));
    res = _mm_add_epi64(res, _mm_add_epi64(lolo, _mm_slli_epi64(lohi,32)));
    res = _mm_add_epi64(res, k3);
    _mm_storel_epi64((__m128i *)r,_mm_shuffle_epi32(res, 0b00001101));
}

__m128i poly_step(__m128i a, __m128i b, __m128i k) {
    __m128i h,l,m;
    /* SSE2 has only 32-bit multiply, so assemble 64-bit multiplication */
    l = _mm_mul_epu32(a,k);
    h = _mm_mul_epu32(_mm_srli_epi64(a,32),_mm_srli_epi64(k,32));
    m = _mm_add_epi64(_mm_mul_epu32(_mm_srli_epi64(a,32),k),
                      _mm_mul_epu32(a,_mm_srli_epi64(k,32)));
    h = _mm_slli_epi64(h,3);
    b = _mm_add_epi64(b, _mm_srli_epi64(l,61));
    h = _mm_add_epi64(h, _mm_srli_epi64(m,29));
    l = _mm_and_si128(l,m61_mask);
    m = _mm_and_si128(_mm_slli_epi64(m,32),m61_mask);
    h = _mm_add_epi64(h, b);
    l = _mm_add_epi64(l, m);
    l = _mm_add_epi64(l, h);
    return l;
}

#if __SSE4_1__
__m128i poly_finalize(__m128i a) {
    __m128i t = _mm_and_si128(a,m61_mask);
    a = _mm_add_epi64(t, _mm_srli_epi64(a,61));
    t = _mm_and_si128(a,m61_mask);
    a = _mm_add_epi64(t, _mm_srli_epi64(a,61));
    t = _mm_cmpeq_epi64(a, m61_mask);  /* SSE4.1. Only instruction > SSE2 */
    return _mm_sub_epi64(a, _mm_and_si128(t, m61_mask));
}
#else
__m128i poly_finalize(__m128i a) {
    __attribute__ ((aligned(16))) uint64_t t[2];
    *(__m128i *)t = a;
    t[0] = (t[0] & m61) + (t[0] >> 61);
    t[0] = (t[0] & m61) + (t[0] >> 61);
    t[1] = (t[1] & m61) + (t[1] >> 61);
    t[1] = (t[1] & m61) + (t[1] >> 61);
    t[0] = (t[0]==m61?0:t[0]);
    t[1] = (t[1]==m61?0:t[1]);
    return *(__m128i *)t;
}
#endif

void hash_step(
    const hs1_hash_ctx_t *ctx,
    const void *in,
    unsigned inbytes,              /* Must be a multiple of HS1_NH_LEN */
    uint64_t accum[HS1_HASH_RNDS]
) {
    const uint32_t *mp = (const uint32_t *)in;
    while (inbytes) {
        __m128i s0,s1,s2,s3,s4,s5,t;
        unsigned i;
        __m128i m60_mask = _mm_set1_epi64x(m60);
        const uint32_t *kp = ctx->nh_key;
        s0 = s1 = s2 = s3 = s4 = s5 = _mm_setzero_si128();
        for (i=0; i<HS1_NH_LEN/16; i++) {
            __m128i t0 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+0)));
            __m128i t1 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+4)));
            s0 = _mm_add_epi64(s0, _mm_mul_epu32( _mm_shuffle_epi32(t0,0x05),  _mm_shuffle_epi32(t0,0xaf) ));
            s1 = _mm_add_epi64(s1, _mm_mul_epu32( _mm_shuffle_epi32(t1,0x05),  _mm_shuffle_epi32(t1,0xaf) ));
            #if (HS1_HASH_RNDS > 2)
            t0 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+8)));
            t1 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+12)));
            s2 = _mm_add_epi64(s2, _mm_mul_epu32( _mm_shuffle_epi32(t0,0x05),  _mm_shuffle_epi32(t0,0xaf) ));
            s3 = _mm_add_epi64(s3, _mm_mul_epu32( _mm_shuffle_epi32(t1,0x05),  _mm_shuffle_epi32(t1,0xaf) ));
            #endif
            #if (HS1_HASH_RNDS > 4)
            t0 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+16)));
            t1 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+20)));
            s4 = _mm_add_epi64(s4, _mm_mul_epu32( _mm_shuffle_epi32(t0,0x05),  _mm_shuffle_epi32(t0,0xaf) ));
            s5 = _mm_add_epi64(s5, _mm_mul_epu32( _mm_shuffle_epi32(t1,0x05),  _mm_shuffle_epi32(t1,0xaf) ));
            #endif
            kp+=4; mp+=4;
        }
        s0 = _mm_add_epi64(s0, _mm_srli_si128(s0,8));
        s1 = _mm_add_epi64(s1, _mm_srli_si128(s1,8));
        t = _mm_unpacklo_epi64(s0,s1) & m60_mask;
        ((__m128i *)accum)[0] = poly_step(((__m128i *)accum)[0], t, ((__m128i *)ctx->poly_key)[0]);
        #if (HS1_HASH_RNDS > 2)
        s2 = _mm_add_epi64(s2, _mm_srli_si128(s2,8));
        s3 = _mm_add_epi64(s3, _mm_srli_si128(s3,8));
        t = _mm_unpacklo_epi64(s2,s3) & m60_mask;
        ((__m128i *)accum)[1] = poly_step(((__m128i *)accum)[1], t, ((__m128i *)ctx->poly_key)[1]);
        #endif
        #if (HS1_HASH_RNDS > 4)
        s4 = _mm_add_epi64(s4, _mm_srli_si128(s4,8));
        s5 = _mm_add_epi64(s5, _mm_srli_si128(s5,8));
        t = _mm_unpacklo_epi64(s4,s5) & m60_mask;
        ((__m128i *)accum)[2] = poly_step(((__m128i *)accum)[2], t, ((__m128i *)ctx->poly_key)[2]);
        #endif
        inbytes -= HS1_NH_LEN;
    }
}

void hash_finalize(
    const hs1_hash_ctx_t *ctx,
    const void *in,
    unsigned inbytes,              /* Must be <= HS1_NH_LEN */
    uint64_t accum[HS1_HASH_RNDS],
    void *result
) {
    unsigned i;
    if (inbytes) {
        __m128i buf[HS1_NH_LEN/16];
        __m128i s0,s1,s2,s3,s4,s5,t;
        __m128i m60_mask = _mm_set1_epi64x(m60);
        const uint32_t *mp, *kp = ctx->nh_key;
        s0 = s1 = s2 = s3 = s4 = s5 = _mm_set_epi64x(0,inbytes%16);
        if (inbytes%16 != 0) {
            buf[inbytes/16] = _mm_setzero_si128();
            hs1_memcpy(buf,in,inbytes);
            mp = (const uint32_t *)buf;
        } else
            mp = (const uint32_t *)in;
        for (i=0; i < (inbytes+15)/16; i++) {
            __m128i t0 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+0)));
            __m128i t1 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+4)));
            s0 = _mm_add_epi64(s0, _mm_mul_epu32( _mm_shuffle_epi32(t0,0x05),  _mm_shuffle_epi32(t0,0xaf) ));
            s1 = _mm_add_epi64(s1, _mm_mul_epu32( _mm_shuffle_epi32(t1,0x05),  _mm_shuffle_epi32(t1,0xaf) ));
            #if (HS1_HASH_RNDS > 2)
            t0 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+8)));
            t1 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+12)));
            s2 = _mm_add_epi64(s2, _mm_mul_epu32( _mm_shuffle_epi32(t0,0x05),  _mm_shuffle_epi32(t0,0xaf) ));
            s3 = _mm_add_epi64(s3, _mm_mul_epu32( _mm_shuffle_epi32(t1,0x05),  _mm_shuffle_epi32(t1,0xaf) ));
            #endif
            #if (HS1_HASH_RNDS > 4)
            t0 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+16)));
            t1 = _mm_add_epi32(_mm_loadu_si128((__m128i *)(mp)),_mm_loadu_si128((__m128i *)(kp+20)));
            s4 = _mm_add_epi64(s4, _mm_mul_epu32( _mm_shuffle_epi32(t0,0x05),  _mm_shuffle_epi32(t0,0xaf) ));
            s5 = _mm_add_epi64(s5, _mm_mul_epu32( _mm_shuffle_epi32(t1,0x05),  _mm_shuffle_epi32(t1,0xaf) ));
            #endif
            kp+=4; mp+=4;
        }
        s0 = _mm_add_epi64(s0, _mm_srli_si128(s0,8));
        s1 = _mm_add_epi64(s1, _mm_srli_si128(s1,8));
        t = _mm_unpacklo_epi64(s0,s1) & m60_mask;
        ((__m128i *)accum)[0] = poly_step(((__m128i *)accum)[0], t, ((__m128i *)ctx->poly_key)[0]);
        #if (HS1_HASH_RNDS > 2)
        s2 = _mm_add_epi64(s2, _mm_srli_si128(s2,8));
        s3 = _mm_add_epi64(s3, _mm_srli_si128(s3,8));
        t = _mm_unpacklo_epi64(s2,s3) & m60_mask;
        ((__m128i *)accum)[1] = poly_step(((__m128i *)accum)[1], t, ((__m128i *)ctx->poly_key)[1]);
        #endif
        #if (HS1_HASH_RNDS > 4)
        s4 = _mm_add_epi64(s4, _mm_srli_si128(s4,8));
        s5 = _mm_add_epi64(s5, _mm_srli_si128(s5,8));
        t = _mm_unpacklo_epi64(s4,s5) & m60_mask;
        ((__m128i *)accum)[2] = poly_step(((__m128i *)accum)[2], t, ((__m128i *)ctx->poly_key)[2]);
        #endif
    }
    #if HS1_ASU
    for (i=0; i<HS1_HASH_RNDS; i+=2) {
        ((__m128i *)accum)[i/2] = poly_finalize(((__m128i *)accum)[i/2]);
        uint32_t s0 = asu_hash(accum[i], ctx->asu_key+3*i);
        uint32_t s1 = asu_hash(accum[i+1], ctx->asu_key+3*i+3);
        ((uint32_t *)result)[i] = swap32be(s0);
        ((uint32_t *)result)[i+1] = swap32be(s1);
    }
    #else
    (void)ctx;
    for (i=0; i<HS1_HASH_RNDS/2; i++)
        ((__m128i *)result)[i] = poly_finalize(((__m128i *)accum)[i]);
    #endif
}


/* ------------------------------------------------------------------------- */
#elif __ARM_NEON && !__aarch64__
/* ------------------------------------------------------------------------- */

static const uint64x2_t m32x2 = {0xffffffffu,0xffffffffu};
static const uint64x2_t m61x2 = {((uint64_t)1 << 61) - 1, ((uint64_t)1 << 61) - 1};
static const uint64x1_t m60x1 = {((uint64_t)1 << 60) - 1};
static const uint64x2_t m61minus1 = {((uint64_t)1 << 61) - 2, ((uint64_t)1 << 61) - 2};

/* Polyhashes HS1_HASH_RNDS elements found at mp, accumulates them into ap */
void poly61(uint64_t *ap, const uint64_t *mp, const uint64_t *kp) {
    uint32x2_t *a = (uint32x2_t *)ap;
    uint64x2_t *m = (uint64x2_t *)mp;
    uint32x2_t *k = (uint32x2_t *)kp;
    unsigned i;
    for (i=0; i<HS1_HASH_RNDS/2; i++) {
        uint64x2_t lm1 = vmull_lane_u32(a[2*i+1],k[2*i+1],0);
        uint64x2_t mh1 = vmull_lane_u32(a[2*i+1],k[2*i+1],1);
        uint64x2_t lm0 = vmull_lane_u32(a[2*i+0],k[2*i+0],0);
        uint64x2_t mh0 = vmull_lane_u32(a[2*i+0],k[2*i+0],1);

        uint64x2_t h = vcombine_u64(vget_high_u64(mh0), vget_high_u64(mh1));
        uint64x2_t l = vcombine_u64(vget_low_u64(lm0), vget_low_u64(lm1));
        uint64x2_t mid = vcombine_u64(vget_high_u64(lm0) + vget_low_u64(mh0),
                                      vget_high_u64(lm1) + vget_low_u64(mh1));
        h += vshrq_n_u64(mid, 32);
        h = vshlq_n_u64(h,3) + vshrq_n_u64(mid & m32x2,29) + vshrq_n_u64(l,61);
        l &= m61x2;
        mid = vshlq_n_u64(mid,32) & m61x2;
        l = l+mid+h+m[i];
        ((uint64x2_t *)a)[i] = (l & m61x2) + vshrq_n_u64(l, 61);
    }
}

#if HS1_ASU
static uint32_t asu_hash(uint64_t x, const uint64_t *k) {
    uint64_t t = k[0] + k[1] * (uint32_t)x + k[2] * (uint32_t)(x >> 32);
    return (uint32_t)(t >> 32);
}
#endif

/* Computes a%m61 without division or "if". Assumes a is <= 62 bits.          */
void poly61finalize(uint64_t *h, const uint64_t *a, const uint64_t *asu_key) {
    unsigned i;
    uint64x2_t *ap = (uint64x2_t *)a;
    uint64x2_t tmp;
    for (i=0; i<HS1_HASH_RNDS/2; i+=1) {
        ap[i] = (ap[i] & m61x2) + vshrq_n_u64(ap[i], 61);
        ap[i] = (ap[i] & m61x2) + vshrq_n_u64(ap[i], 61);
        uint64x2_t mask = (uint64x2_t)vshrq_n_s64((int64x2_t)(m61minus1 - ap[i]), 63);
        #if (HS1_HASH_RNDS <= 4)
        ((uint64x2_t *)h)[i] = ap[i] - (mask & m61x2);
        #else
        tmp = ap[i] - (mask & m61x2);
        ((uint32_t *)h)[2*i] = asu_hash(vgetq_lane_u64(tmp,0), asu_key+2*3*i);
        ((uint32_t *)h)[2*i+1] = asu_hash(vgetq_lane_u64(tmp,1), asu_key+2*3*i+3);
        #endif
    }
}


/* Hash mbytes at mp HS1_HASH_RNDS times, place results at hp */
/* Assumes mp has been zeroed to nearest multiple of 16.      */
void nh(uint64_t *hp, const uint32_t *kp, const uint32_t *mp, unsigned mbytes) {
    unsigned i,j;
    uint64x2_t a0={0,0},a1,a2,a3,a4,a5;
    a1=a2=a3=a4=a5=a0;
    for (i=0; i<(mbytes+15)/16; i++) {
        uint32x4_t t = *(uint32x4_t *)(kp+0) + *(uint32x4_t *)(mp+0);
        a0 = vmlal_u32(a0, vget_high_u32(t), vget_low_u32(t));
        t = *(uint32x4_t *)(kp+4) + *(uint32x4_t *)(mp+0);
        a1 = vmlal_u32(a1, vget_high_u32(t), vget_low_u32(t));
        #if (HS1_HASH_RNDS > 2)
        t = *(uint32x4_t *)(kp+8) + *(uint32x4_t *)(mp+0);
        a2 = vmlal_u32(a2, vget_high_u32(t), vget_low_u32(t));
        t = *(uint32x4_t *)(kp+12) + *(uint32x4_t *)(mp+0);
        a3 = vmlal_u32(a3, vget_high_u32(t), vget_low_u32(t));
        #endif
        #if (HS1_HASH_RNDS > 4)
        t = *(uint32x4_t *)(kp+16) + *(uint32x4_t *)(mp+0);
        a4 = vmlal_u32(a4, vget_high_u32(t), vget_low_u32(t));
        t = *(uint32x4_t *)(kp+20) + *(uint32x4_t *)(mp+0);
        a5 = vmlal_u32(a5, vget_high_u32(t), vget_low_u32(t));
        #endif
        kp += 4;
        mp += 4;
    }
    ((uint64x1_t *)hp)[0] = (vget_high_u64(a0) + vget_low_u64(a0)) & m60x1;
    ((uint64x1_t *)hp)[1] = (vget_high_u64(a1) + vget_low_u64(a1)) & m60x1;
    #if (HS1_HASH_RNDS > 2)
    ((uint64x1_t *)hp)[2] = (vget_high_u64(a2) + vget_low_u64(a2)) & m60x1;
    ((uint64x1_t *)hp)[3] = (vget_high_u64(a3) + vget_low_u64(a3)) & m60x1;
    #endif
    #if (HS1_HASH_RNDS > 4)
    ((uint64x1_t *)hp)[4] = (vget_high_u64(a4) + vget_low_u64(a4)) & m60x1;
    ((uint64x1_t *)hp)[5] = (vget_high_u64(a5) + vget_low_u64(a5)) & m60x1;
    #endif
}

void hash_step(const hs1_hash_ctx_t *ctx, const void *in, unsigned inbytes, uint64_t *accum) {
    __attribute__ ((aligned (16))) uint64_t nhres[HS1_HASH_RNDS];
    uint32_t *ip = (uint32_t *)in;
    while (inbytes) {
        nh(nhres, ctx->nh_key, ip, HS1_NH_LEN);
        poly61(accum, nhres, ctx->poly_key);
        inbytes -= HS1_NH_LEN;
        ip+= HS1_NH_LEN/4;
    }
}

void hash_finalize(
    const hs1_hash_ctx_t *ctx,
    const void *in,
    unsigned inbytes,              /* Must be <= HS1_NH_LEN */
    uint64_t accum[HS1_HASH_RNDS],
    void *result
) {
    if (inbytes) {
        unsigned i;
        uint32_t buf[HS1_NH_LEN/4];
        uint64_t nh_res[HS1_HASH_RNDS];
        const uint32_t *mp, *kp = (const uint32_t *)(ctx->nh_key);
        if (inbytes%16 != 0) {
            zero16(buf + (inbytes/16*4));
            hs1_memcpy(buf,in,inbytes);
            mp = buf;
            for (i=0; i<HS1_HASH_RNDS; i++) nh_res[i] = inbytes%16;
        } else {
            mp = (const uint32_t *)in;
            for (i=0; i<HS1_HASH_RNDS; i++) nh_res[i] = 0;
        }
        nh(nh_res, ctx->nh_key, (uint32_t *)mp, inbytes);
        poly61(accum, nh_res, ctx->poly_key);
    }
    poly61finalize(result, accum, ctx->asu_key);
}

/* ------------------------------------------------------------------------- */
#else                                  /* Not AVX2/SSE/Neon. Use ANSI types. */
/* ------------------------------------------------------------------------- */

/* Return 63 bits congruent to ak+b mod (2^61-1). Assume 60-bit k,b 63-bit a */
static uint64_t poly_step(uint64_t a, uint64_t b, uint64_t k) {
    #if (__SIZEOF_INT128__)  /* 128-bit type available */
        unsigned __int128 tmp = (unsigned __int128)a * (unsigned __int128)k;
        return ((uint64_t)tmp & m61) + (uint64_t)(tmp >> 61) + b;
    #elif 0
        uint64_t m = (uint64_t)(uint32_t)(a>>32) * (uint64_t)(uint32_t)k
                   + (uint64_t)(uint32_t)(k>>32) * (uint64_t)(uint32_t)a;
        uint64_t h = (uint64_t)(uint32_t)(a>>32) * (uint64_t)(uint32_t)(k>>32);
        uint64_t l = (uint64_t)(uint32_t)a * (uint64_t)(uint32_t)k;
        h += (m >> 32); l += (m << 32);  /* h:l += (m>>32):(m<<32)      */
        /* CAUTION: Potential timing leak. Good compiler will eliminate */
        if (l < (m << 32)) h += 1;       /* Check for carry from l to h */
        return (l & m61) + ((h << 3) | (l >> 61)) + b;
    #else
        uint64_t m = (uint64_t)(uint32_t)(a>>32) * (uint64_t)(uint32_t)k
                   + (uint64_t)(uint32_t)(k>>32) * (uint64_t)(uint32_t)a;
        uint64_t h = (uint64_t)(uint32_t)(a>>32) * (uint64_t)(uint32_t)(k>>32);
        uint64_t l = (uint64_t)(uint32_t)a * (uint64_t)(uint32_t)k;
        l = (l & m61) + (h << 3) + (l >> 61) + b + (m >> 29) + ((m << 32) & m61);
        return l;
    #endif
}

/* Computes a%m61 without division or conditional. */
 uint64_t poly_finalize(uint64_t a) {
    a = (a & m61) + (a >> 61);
    a = (a & m61) + (a >> 61);
    return (a==m61?0:a);
    /* Create a mask of all ones if a >= m61, all zeros otherwise. */
    uint64_t mask = (uint64_t)((int64_t)((m61 - 1) - a) >> 63);
    /* Use the mask to conditionally subtract m61                  */
    return a - (mask & m61);
}

#if HS1_ASU
static uint32_t asu_hash(uint64_t x, const uint64_t *k) {
    uint64_t t = k[0] + k[1] * (uint32_t)x + k[2] * (uint32_t)(x >> 32);
    return (uint32_t)(t >> 32);
}
#endif

void hash_step(
    const hs1_hash_ctx_t *ctx,
    const void *in,
    unsigned inbytes,              /* Must be a multiple of HS1_NH_LEN */
    uint64_t accum[HS1_HASH_RNDS]
) {
    const uint32_t *mp = (const uint32_t *)in;
    const uint32_t *kp = (const uint32_t *)(ctx->nh_key);
    while (inbytes) {
        unsigned i,j;
        uint64_t nh_res[HS1_HASH_RNDS] = {0};
        for (i=0; 4*i<HS1_NH_LEN; i+=4) {
            for (j=0; j<HS1_HASH_RNDS; j+=2) {
                nh_res[j+0] += (uint64_t)(swap32be(mp[i+0]) + kp[i+j*4+0]) *
                                         (swap32be(mp[i+2]) + kp[i+j*4+2]);
                nh_res[j+1] += (uint64_t)(swap32be(mp[i+0]) + kp[i+j*4+4]) *
                                         (swap32be(mp[i+2]) + kp[i+j*4+6]);
                nh_res[j+0] += (uint64_t)(swap32be(mp[i+1]) + kp[i+j*4+1]) *
                                         (swap32be(mp[i+3]) + kp[i+j*4+3]);
                nh_res[j+1] += (uint64_t)(swap32be(mp[i+1]) + kp[i+j*4+5]) *
                                         (swap32be(mp[i+3]) + kp[i+j*4+7]);
            }
        }
        for (j=0; j<HS1_HASH_RNDS; j+=2) {
            accum[j] = poly_step(accum[j], nh_res[j] & m60, ctx->poly_key[j]);
            accum[j+1] = poly_step(accum[j+1], nh_res[j+1] & m60, ctx->poly_key[j+1]);
        }
        inbytes -= HS1_NH_LEN;
        mp += HS1_NH_LEN/4;
    }
}

void hash_finalize(
    const hs1_hash_ctx_t *ctx,
    const void *in,
    unsigned inbytes,              /* Must be <= HS1_NH_LEN */
    uint64_t accum[HS1_HASH_RNDS],
    void *result
) {
    unsigned i,j;
    if (inbytes) {
        uint32_t buf[HS1_NH_LEN/4];
        uint64_t nh_res[HS1_HASH_RNDS];
        const uint32_t *mp, *kp = (const uint32_t *)(ctx->nh_key);
        if (inbytes%16 != 0) {
            zero16(buf + (inbytes/16*4));
            hs1_memcpy(buf,in,inbytes);
            mp = buf;
            for (i=0; i<HS1_HASH_RNDS; i++) nh_res[i] = inbytes%16;
        } else {
            mp = (const uint32_t *)in;
            for (i=0; i<HS1_HASH_RNDS; i++) nh_res[i] = 0;
        }
        for (i=0; 4*i<inbytes; i+=4) {
            for (j=0; j<HS1_HASH_RNDS; j+=2) {
                nh_res[j+0] += (uint64_t)(swap32be(mp[i+0]) + kp[i+j*4+0]) *
                                         (swap32be(mp[i+2]) + kp[i+j*4+2]);
                nh_res[j+1] += (uint64_t)(swap32be(mp[i+0]) + kp[i+j*4+4]) *
                                         (swap32be(mp[i+2]) + kp[i+j*4+6]);
                nh_res[j+0] += (uint64_t)(swap32be(mp[i+1]) + kp[i+j*4+1]) *
                                         (swap32be(mp[i+3]) + kp[i+j*4+3]);
                nh_res[j+1] += (uint64_t)(swap32be(mp[i+1]) + kp[i+j*4+5]) *
                                         (swap32be(mp[i+3]) + kp[i+j*4+7]);
            }
        }
        for (j=0; j<HS1_HASH_RNDS; j+=2) {
            accum[j] = poly_step(accum[j], nh_res[j] & m60, ctx->poly_key[j]);
            accum[j+1] = poly_step(accum[j+1], nh_res[j+1] & m60, ctx->poly_key[j+1]);
        }
    }
    #if HS1_ASU
    for (j=0; j<HS1_HASH_RNDS; j+=2) {
        uint32_t s0 = asu_hash(poly_finalize(accum[j]), ctx->asu_key+3*j);
        uint32_t s1 = asu_hash(poly_finalize(accum[j+1]), ctx->asu_key+3*j+3);
        ((uint32_t *)result)[j] = swap32be(s0);
        ((uint32_t *)result)[j+1] = swap32be(s1);
    }
    #else
    (void)ctx;
    for (j=0; j<HS1_HASH_RNDS; j++)
        ((uint64_t *)result)[j] = swap64be(poly_finalize(accum[j]));
    #endif
}

/* ------------------------------------------------------------------------- */
#endif
/* ------------------------------------------------------------------------- */

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *
 *     H S 1 / H S 1 - S I V
 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

__attribute__ ((aligned(32))) static const unsigned char settings[16] =
{0,0,0,0,0,0,HS1_SIV_LEN,0,HS1_CHACHA_RNDS,HS1_HASH_RNDS,HS1_NH_LEN,0,0,0,0,0};  /* NH key > 255 ? */

/* ------------------------------------------------------------------------- */

/* Xor first n bytes of src into dst, then copy the next 32-n bytes          */
static void xor_copy_chacha_key(void *dst, const void *src) {
    if (HS1_HASH_RNDS==4 || HS1_HASH_RNDS==8) {
        xor32(dst,src);                                 /* n == 32 */
    } else {
        xor16(dst,src);                                 /* n == 16 or 24 */
        if (HS1_HASH_RNDS==2) {
            copy16((char *)dst+16, (char *)src+16);
        } else {
            ((uint64_t *)dst)[2] ^= ((uint64_t *)src)[2];
            ((uint64_t *)dst)[3] = ((uint64_t *)src)[3];
        }
    }
}

/* ------------------------------------------------------------------------- */

void hs1_setup(hs1_ctx_t *ctx,
               const void *user_key,
               unsigned key_bytes)
{
    __attribute__ ((aligned(32))) chacha_state_t chacha_state;
    __attribute__ ((aligned(32))) char zero[sizeof(hs1_ctx_t)] = {0};
    unsigned i,j,nbytes;

    /* Copy user_key as many times as needed to fill 32 byte chacha key */
    for (i=0; i<32; i+= nbytes) {
        nbytes = (32-i < key_bytes ? 32-i : key_bytes);
        for (j=0; j<nbytes; j++)
            chacha_state.key[i+j] = ((unsigned char *)user_key)[j];
    }
    copy16(&chacha_state.counter,settings);
    chacha_state.nonce[0] = (unsigned char)key_bytes;
    chacha_state.rounds = HS1_CHACHA_RNDS;
    chacha_blocks(&chacha_state, zero, ctx, sizeof(hs1_ctx_t));

    /* Pre-process internal keys: endian-correct future reads, mod poly key */
    for (i=0; i<sizeof(ctx->hash_key.nh_key)/4; i++)
        ctx->hash_key.nh_key[i] = swap32be(ctx->hash_key.nh_key[i]);
    for (i=0; i<sizeof(ctx->hash_key.poly_key)/8; i++)
        ctx->hash_key.poly_key[i] = swap64be(ctx->hash_key.poly_key[i]) & m60;
    #if HS1_ASU
    for (i=0; i<sizeof(ctx->hash_key.asu_key)/8; i++)
        ctx->hash_key.asu_key[i] = swap64be(ctx->hash_key.asu_key[i]);
    #endif
}

/* ------------------------------------------------------------------------- */

void hs1_gen_siv(const hs1_ctx_t *ctx,
                 const void *m, unsigned mbytes,
                 const void *a, unsigned abytes,
                 const void *n,
                 void *siv)
{
    __attribute__ ((aligned(32))) chacha_state_t chacha_state;
    __attribute__ ((aligned(32))) unsigned char buf[HS1_NH_LEN];
    __attribute__ ((aligned(32))) char zero[HS1_SIV_LEN] = {0};
    __attribute__ ((aligned(16))) uint64_t accum[HS1_HASH_RNDS];
    __attribute__ ((aligned(16))) uint64_t len[2];
    unsigned i, mbytes_with_padding, nh_multiple;

    /* Init: set up lengths, chacha key, accumulator  */
    len[0] = swap64be(abytes); len[1] = swap64be(mbytes);
    for (i=0; i<HS1_HASH_RNDS; i++) accum[i] = 1;

    /* Hash associated data */
    nh_multiple = abytes & ~(HS1_NH_LEN-1);
    hash_step(&ctx->hash_key, a, nh_multiple, accum);
    if (abytes % HS1_NH_LEN) {
        abytes = abytes % HS1_NH_LEN;
        hs1_bzero(buf+(abytes&~15),HS1_NH_LEN-(abytes&~15));
        hs1_memcpy(buf, (unsigned char *)a+nh_multiple, abytes);
        hash_step(&ctx->hash_key, buf, HS1_NH_LEN, accum);
    }
    /* Hash message data */
    nh_multiple = mbytes & ~(HS1_NH_LEN-1);
    hash_step(&ctx->hash_key, m, nh_multiple, accum);
    mbytes = mbytes % HS1_NH_LEN;
    mbytes_with_padding = (mbytes + 15) & ~15;
    if (mbytes_with_padding == HS1_NH_LEN) {
        zero16(buf+HS1_NH_LEN-16);
        hs1_memcpy(buf,(unsigned char *)m+nh_multiple,mbytes);
        hash_step(&ctx->hash_key, buf, HS1_NH_LEN, accum);
        hash_finalize(&ctx->hash_key, len, 16, accum, chacha_state.key);
    } else {
        zero16(buf+mbytes_with_padding-16);  /* BUG: buf-16 if mbytes==0 */
        hs1_memcpy(buf,(unsigned char *)m+nh_multiple,mbytes);
        copy16(buf+mbytes_with_padding, len);
        hash_finalize(&ctx->hash_key, buf, mbytes_with_padding+16, accum, chacha_state.key);
    }

    xor_copy_chacha_key(chacha_state.key,ctx->chacha_key);
    chacha_state.counter=0;
    copy12(chacha_state.nonce,n);
    chacha_state.rounds=HS1_CHACHA_RNDS;
    chacha_blocks(&chacha_state, zero, siv, HS1_SIV_LEN);
}

/* ------------------------------------------------------------------------- */

void hs1siv_encrypt(const hs1_ctx_t *ctx,
                    const void *m, unsigned mbytes,
                    const void *a, unsigned abytes,
                    const void *n,
                    void *c)
{
    __attribute__ ((aligned(32))) chacha_state_t chacha_state;
    __attribute__ ((aligned(32))) unsigned char siv[HS1_SIV_LEN];
    __attribute__ ((aligned(16))) uint64_t accum[HS1_HASH_RNDS];
    unsigned i;

    for (i=0; i<HS1_HASH_RNDS; i++) accum[i] = 1;
    hs1_gen_siv(ctx, m, mbytes, a, abytes, n, siv);
    hash_finalize(&ctx->hash_key, siv, HS1_SIV_LEN, accum, chacha_state.key);
    xor_copy_chacha_key(chacha_state.key,ctx->chacha_key);
    chacha_state.counter=1;
    copy12(chacha_state.nonce,n);
    chacha_state.rounds=HS1_CHACHA_RNDS;
    chacha_blocks(&chacha_state, m, c, mbytes);
    for (i=0; i<HS1_SIV_LEN; i++) ((unsigned char *)c)[mbytes+i] = siv[i];
}

/* (cbytes - HS1_SIV_LEN) bytes written to m if no error encountered.    */
/* A negative return value indicates invalid ctx,c,a,n combination.      */
int hs1siv_decrypt(const hs1_ctx_t *ctx,
                    const void *c, unsigned cbytes,
                    const void *a, unsigned abytes,
                    const void *n, void *m)
{
    __attribute__ ((aligned(32))) chacha_state_t chacha_state;
    __attribute__ ((aligned(32))) unsigned char siv[HS1_SIV_LEN];
    __attribute__ ((aligned(32))) unsigned char maybe_siv[HS1_SIV_LEN];
    __attribute__ ((aligned(16))) uint64_t accum[HS1_HASH_RNDS];
    unsigned i;

    if (cbytes < HS1_SIV_LEN)
        return -1;
    for (i=0; i<HS1_SIV_LEN; i++)
        siv[i]=((unsigned char *)c)[cbytes-HS1_SIV_LEN+i];
    for (i=0; i<HS1_HASH_RNDS; i++) accum[i] = 1;
    hash_finalize(&ctx->hash_key, siv, HS1_SIV_LEN, accum, chacha_state.key);
    xor_copy_chacha_key(chacha_state.key,ctx->chacha_key);
    chacha_state.counter=1;
    copy12(chacha_state.nonce,n);
    chacha_state.rounds=HS1_CHACHA_RNDS;
    if (n==m) {
        __attribute__ ((aligned(16))) unsigned char tmp[12];
        for (i=0; i<12; i++) tmp[i] = ((unsigned char *)n)[i];
        chacha_blocks(&chacha_state, c, m, cbytes-HS1_SIV_LEN);
        hs1_gen_siv(ctx, m, cbytes-HS1_SIV_LEN, a, abytes, tmp, maybe_siv);
    } else if (a==m) {
        unsigned char *tmp = malloc(abytes);
        for (i=0; i<abytes; i++) tmp[i] = ((unsigned char *)a)[i];
        chacha_blocks(&chacha_state, c, m, cbytes-HS1_SIV_LEN);
        hs1_gen_siv(ctx, m, cbytes-HS1_SIV_LEN, tmp, abytes, n, maybe_siv);
        free(tmp);
    } else {
        chacha_blocks(&chacha_state, c, m, cbytes-HS1_SIV_LEN);
        hs1_gen_siv(ctx, m, cbytes-HS1_SIV_LEN, a, abytes, n, maybe_siv);
    }
    uint64_t t = ((uint64_t *)siv)[0] ^ ((uint64_t *)maybe_siv)[0];
    for (i=1; i<HS1_SIV_LEN/8; i++)
        t |= ((uint64_t *)siv)[i] ^ ((uint64_t *)maybe_siv)[i];
    return (t?-1:0);
}
    
void hs1(const hs1_ctx_t *ctx, const void *n,
         const void *in, unsigned inbytes,
         void *out, unsigned outbytes,
         void *xor_buf)  /* If non-null, xor with output */
{
    __attribute__ ((aligned(32))) chacha_state_t chacha_state;
    __attribute__ ((aligned(32))) uint64_t accum[HS1_HASH_RNDS];
    unsigned i;
    const unsigned char *inp = (unsigned char *)in;

    for (i=0; i<HS1_HASH_RNDS; i++) accum[i] = 1;
    hash_step(&ctx->hash_key, inp, inbytes&~(HS1_NH_LEN-1), accum);
    inp += inbytes&~(HS1_NH_LEN-1);
    hash_finalize(&ctx->hash_key, inp, inbytes%HS1_NH_LEN, accum, chacha_state.key);
    xor_copy_chacha_key(chacha_state.key,ctx->chacha_key);
    chacha_state.counter=0;
    copy12(chacha_state.nonce,n);
    chacha_state.rounds=HS1_CHACHA_RNDS;
    chacha_blocks(&chacha_state,xor_buf,out,outbytes);
}

#include "api.h"

int crypto_aead_encrypt(
    unsigned char *c,unsigned long long *clen,
    const unsigned char *m,unsigned long long mlen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *nsec,
    const unsigned char *npub,
    const unsigned char *k
)
{
    __attribute__ ((aligned(32))) hs1_ctx_t ctx;
    (void)nsec;
    hs1_setup(&ctx,k,CRYPTO_KEYBYTES);
    hs1siv_encrypt(&ctx,m,(unsigned)mlen,ad,(unsigned)adlen,npub,c);
    if (clen) *clen = mlen+CRYPTO_ABYTES;
    return 0;
}

int crypto_aead_decrypt(
    unsigned char *m,unsigned long long *mlen,
    unsigned char *nsec,
    const unsigned char *c,unsigned long long clen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k
)
{
    __attribute__ ((aligned(32))) hs1_ctx_t ctx;
    (void)nsec;
    if (mlen) *mlen = clen-CRYPTO_ABYTES;
    hs1_setup(&ctx,k,CRYPTO_KEYBYTES);

    return hs1siv_decrypt(&ctx, (void *)c, clen,
    	(void *)ad, (unsigned)adlen, (void *)npub, m);
}
