// sbob_pi64xmm.c
// 28-Apr-14  Markku-Juhani O. Saarinen <mjos@iki.fi>

// SSE4.1 XMM version of the StriBob Pi

#include "stribob.h"

// The optimized variant requires at least SSE 4.1 (Core 2, 2008 ->)
#ifndef __SSE4_1__
#error "This version requires __SSE4_1__"
#endif

// sbob_tab64.c
extern const uint64_t sbob_sl64[8][256];
extern const uint64_t sbob_rc64[12][8];

// SSE 4.1 version utilizing 128-bit xmm registers

#include <mmintrin.h>
#include <emmintrin.h>
#include <smmintrin.h>

#define SBOB_XMM_UMIX64(r) (        \
    sbob_sl64[0][_mm_extract_epi8(u0, r)] ^     \
    sbob_sl64[1][_mm_extract_epi8(u0, r + 8)] ^ \
    sbob_sl64[2][_mm_extract_epi8(u1, r)] ^     \
    sbob_sl64[3][_mm_extract_epi8(u1, r + 8)] ^ \
    sbob_sl64[4][_mm_extract_epi8(u2, r)] ^     \
    sbob_sl64[5][_mm_extract_epi8(u2, r + 8)] ^ \
    sbob_sl64[6][_mm_extract_epi8(u3, r)] ^     \
    sbob_sl64[7][_mm_extract_epi8(u3, r + 8)] )

#define SBOB_XMM_FIT64(w0, w1) \
    _mm_insert_epi64(_mm_cvtsi64_si128(w0), (w1), 1)

void sbob_pi(w512_t *s512)
{
    int i;
    register __m128i t0, t1, t2, t3;
    register __m128i u0, u1, u2, u3;

    // load the state
    t0 = _mm_loadu_si128(&((__m128i *) s512)[0]);
    t1 = _mm_loadu_si128(&((__m128i *) s512)[1]);
    t2 = _mm_loadu_si128(&((__m128i *) s512)[2]);
    t3 = _mm_loadu_si128(&((__m128i *) s512)[3]);

    // twelve rounds
    for (i = 0; i < 48;) {

        u0 = _mm_xor_si128(t0, _mm_load_si128(&((__m128i *) sbob_rc64)[i++]));
        u1 = _mm_xor_si128(t1, _mm_load_si128(&((__m128i *) sbob_rc64)[i++]));
        u2 = _mm_xor_si128(t2, _mm_load_si128(&((__m128i *) sbob_rc64)[i++]));
        u3 = _mm_xor_si128(t3, _mm_load_si128(&((__m128i *) sbob_rc64)[i++]));

        t0 = SBOB_XMM_FIT64(SBOB_XMM_UMIX64(0), SBOB_XMM_UMIX64(1));
        t1 = SBOB_XMM_FIT64(SBOB_XMM_UMIX64(2), SBOB_XMM_UMIX64(3));
        t2 = SBOB_XMM_FIT64(SBOB_XMM_UMIX64(4), SBOB_XMM_UMIX64(5));
        t3 = SBOB_XMM_FIT64(SBOB_XMM_UMIX64(6), SBOB_XMM_UMIX64(7));
    }

    // store
    _mm_store_si128(&((__m128i *) s512)[0], t0);
    _mm_store_si128(&((__m128i *) s512)[1], t1);
    _mm_store_si128(&((__m128i *) s512)[2], t2);
    _mm_store_si128(&((__m128i *) s512)[3], t3);
}

