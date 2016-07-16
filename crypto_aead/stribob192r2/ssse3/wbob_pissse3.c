// wbob_pissse3.c
// 09-Sep-14  Billy Brumley <first.last@tut.fi>

// Constant time implementation of WhirlBob Pi for chips with SSSE3 extension.

#include "stribob.h"
#include <tmmintrin.h>

/* sliced round constants */
static const uint8_t RCON[16*4*16] __attribute__((aligned(0x10))) = {
    0x18,0,0,0,0,0,0,0,0x23,0,0,0,0,0,0,0,
    0xc6,0,0,0,0,0,0,0,0xe8,0,0,0,0,0,0,0,
    0x87,0,0,0,0,0,0,0,0xb8,0,0,0,0,0,0,0,
    0x01,0,0,0,0,0,0,0,0x4f,0,0,0,0,0,0,0,
    0x36,0,0,0,0,0,0,0,0xa6,0,0,0,0,0,0,0,
    0xd2,0,0,0,0,0,0,0,0xf5,0,0,0,0,0,0,0,
    0x79,0,0,0,0,0,0,0,0x6f,0,0,0,0,0,0,0,
    0x91,0,0,0,0,0,0,0,0x52,0,0,0,0,0,0,0,
    0x60,0,0,0,0,0,0,0,0xbc,0,0,0,0,0,0,0,
    0x9b,0,0,0,0,0,0,0,0x8e,0,0,0,0,0,0,0,
    0xa3,0,0,0,0,0,0,0,0x0c,0,0,0,0,0,0,0,
    0x7b,0,0,0,0,0,0,0,0x35,0,0,0,0,0,0,0,
    0x1d,0,0,0,0,0,0,0,0xe0,0,0,0,0,0,0,0,
    0xd7,0,0,0,0,0,0,0,0xc2,0,0,0,0,0,0,0,
    0x2e,0,0,0,0,0,0,0,0x4b,0,0,0,0,0,0,0,
    0xfe,0,0,0,0,0,0,0,0x57,0,0,0,0,0,0,0,
    0x15,0,0,0,0,0,0,0,0x77,0,0,0,0,0,0,0,
    0x37,0,0,0,0,0,0,0,0xe5,0,0,0,0,0,0,0,
    0x9f,0,0,0,0,0,0,0,0xf0,0,0,0,0,0,0,0,
    0x4a,0,0,0,0,0,0,0,0xda,0,0,0,0,0,0,0,
    0x58,0,0,0,0,0,0,0,0xc9,0,0,0,0,0,0,0,
    0x29,0,0,0,0,0,0,0,0x0a,0,0,0,0,0,0,0,
    0xb1,0,0,0,0,0,0,0,0xa0,0,0,0,0,0,0,0,
    0x6b,0,0,0,0,0,0,0,0x85,0,0,0,0,0,0,0,
    0xbd,0,0,0,0,0,0,0,0x5d,0,0,0,0,0,0,0,
    0x10,0,0,0,0,0,0,0,0xf4,0,0,0,0,0,0,0,
    0xcb,0,0,0,0,0,0,0,0x3e,0,0,0,0,0,0,0,
    0x05,0,0,0,0,0,0,0,0x67,0,0,0,0,0,0,0,
    0xe4,0,0,0,0,0,0,0,0x27,0,0,0,0,0,0,0,
    0x41,0,0,0,0,0,0,0,0x8b,0,0,0,0,0,0,0,
    0xa7,0,0,0,0,0,0,0,0x7d,0,0,0,0,0,0,0,
    0x95,0,0,0,0,0,0,0,0xd8,0,0,0,0,0,0,0,
    0xfb,0,0,0,0,0,0,0,0xee,0,0,0,0,0,0,0,
    0x7c,0,0,0,0,0,0,0,0x66,0,0,0,0,0,0,0,
    0xdd,0,0,0,0,0,0,0,0x17,0,0,0,0,0,0,0,
    0x47,0,0,0,0,0,0,0,0x9e,0,0,0,0,0,0,0,
    0xca,0,0,0,0,0,0,0,0x2d,0,0,0,0,0,0,0,
    0xbf,0,0,0,0,0,0,0,0x07,0,0,0,0,0,0,0,
    0xad,0,0,0,0,0,0,0,0x5a,0,0,0,0,0,0,0,
    0x83,0,0,0,0,0,0,0,0x33,0,0,0,0,0,0,0,
    0x63,0,0,0,0,0,0,0,0x02,0,0,0,0,0,0,0,
    0xaa,0,0,0,0,0,0,0,0x71,0,0,0,0,0,0,0,
    0xc8,0,0,0,0,0,0,0,0x19,0,0,0,0,0,0,0,
    0x49,0,0,0,0,0,0,0,0xd9,0,0,0,0,0,0,0,
    0xf2,0,0,0,0,0,0,0,0xe3,0,0,0,0,0,0,0,
    0x5b,0,0,0,0,0,0,0,0x88,0,0,0,0,0,0,0,
    0x9a,0,0,0,0,0,0,0,0x26,0,0,0,0,0,0,0,
    0x32,0,0,0,0,0,0,0,0xb0,0,0,0,0,0,0,0,
    0xe9,0,0,0,0,0,0,0,0x0f,0,0,0,0,0,0,0,
    0xd5,0,0,0,0,0,0,0,0x80,0,0,0,0,0,0,0,
    0xbe,0,0,0,0,0,0,0,0xcd,0,0,0,0,0,0,0,
    0x34,0,0,0,0,0,0,0,0x48,0,0,0,0,0,0,0,
    0xff,0,0,0,0,0,0,0,0x7a,0,0,0,0,0,0,0,
    0x90,0,0,0,0,0,0,0,0x5f,0,0,0,0,0,0,0,
    0x20,0,0,0,0,0,0,0,0x68,0,0,0,0,0,0,0,
    0x1a,0,0,0,0,0,0,0,0xae,0,0,0,0,0,0,0,
    0xb4,0,0,0,0,0,0,0,0x54,0,0,0,0,0,0,0,
    0x93,0,0,0,0,0,0,0,0x22,0,0,0,0,0,0,0,
    0x64,0,0,0,0,0,0,0,0xf1,0,0,0,0,0,0,0,
    0x73,0,0,0,0,0,0,0,0x12,0,0,0,0,0,0,0,
    0x40,0,0,0,0,0,0,0,0x08,0,0,0,0,0,0,0,
    0xc3,0,0,0,0,0,0,0,0xec,0,0,0,0,0,0,0,
    0xdb,0,0,0,0,0,0,0,0xa1,0,0,0,0,0,0,0,
    0x8d,0,0,0,0,0,0,0,0x3d,0,0,0,0,0,0,0
};

/* mini S-Boxes */
static const uint8_t SBOXES[48] __attribute__((aligned(0x10))) = {
    0xF,0x0,0xD,0x7,0xB,0xE,0x5,0xA,0x9,0x2,0xC,0x1,0x3,0x4,0x8,0x6, // 1/E
    0x1,0xB,0x9,0xC,0xD,0x6,0xF,0x3,0xE,0x8,0x7,0x4,0xA,0x2,0x5,0x0, // E
    0x7,0xC,0xB,0xD,0xE,0x4,0x9,0xF,0x6,0x3,0x8,0xA,0x2,0x5,0x1,0x0  // R
};

static const uint8_t CONSTANTS[80] __attribute__((aligned(0x10))) = {
    /* rotations for ShiftColumns */
    0,1,2,3,4,5,6,7,15, 8, 9,10,11,12,13,14,
    6,7,0,1,2,3,4,5,13,14,15, 8, 9,10,11,12,
    4,5,6,7,0,1,2,3,11,12,13,14,15, 8, 9,10,
    2,3,4,5,6,7,0,1, 9,10,11,12,13,14,15, 8,
    /* interleave bytes within xmm */
    0,8,1,9,2,10,3,11,4,12,5,13,6,14,7,15
};

#define TRANSPOSE(y,x) do {                         \
    y##0 = _mm_shuffle_epi8(x##0,ileave);           \
    y##1 = _mm_shuffle_epi8(x##1,ileave);           \
    y##2 = _mm_shuffle_epi8(x##2,ileave);           \
    y##3 = _mm_shuffle_epi8(x##3,ileave);           \
                                                    \
    x##0 = _mm_unpacklo_epi16(y##0,y##1);           \
    x##1 = _mm_unpackhi_epi16(y##0,y##1);           \
    x##2 = _mm_unpacklo_epi16(y##2,y##3);           \
    x##3 = _mm_unpackhi_epi16(y##2,y##3);           \
                                                    \
    y##0 = _mm_unpacklo_epi32(x##0,x##2);           \
    y##1 = _mm_unpackhi_epi32(x##0,x##2);           \
    y##2 = _mm_unpacklo_epi32(x##1,x##3);           \
    y##3 = _mm_unpackhi_epi32(x##1,x##3);           \
} while(0)

#define GAMMA(b,a) do {                             \
    __m128i q0,q1,q2;                               \
    q0 = _mm_and_si128(a,mask);                     \
    q1 = _mm_and_si128(_mm_srli_epi64(a,4),mask);   \
    q0 = _mm_shuffle_epi8(s0_box,q0);               \
    q1 = _mm_shuffle_epi8(s1_box,q1);               \
    q2 = _mm_xor_si128(q0,q1);                      \
    q2 = _mm_shuffle_epi8(s2_box,q2);               \
    q0 = _mm_xor_si128(q0,q2);                      \
    q1 = _mm_xor_si128(q1,q2);                      \
    q0 = _mm_shuffle_epi8(s0_box,q0);               \
    q1 = _mm_shuffle_epi8(s1_box,q1);               \
    b  = _mm_or_si128(q0,_mm_slli_epi64(q1,4));     \
} while(0)

#define MULX(b,a) do {                              \
    __m128i cmp;                                    \
    cmp = _mm_cmplt_epi8(a,zero);                   \
    cmp = _mm_and_si128(cmp,poly);                  \
    b = _mm_add_epi8(a,a);                          \
    b = _mm_xor_si128(b,cmp);                       \
} while(0)

// WhirlBob Pi

void wbob_pi(w512_t *s512)
{
    int r;

    __m128i x0, x1, x2, x3;
    __m128i y0, y1, y2, y3;
    __m128i s0_box, s1_box, s2_box;
    __m128i rot0, rot1, rot2, rot3, ileave;
    __m128i mask, zero, poly, *rcon;

    rcon = (__m128i *)RCON;
    s0_box = _mm_load_si128((__m128i*)(SBOXES +  0));
    s1_box = _mm_load_si128((__m128i*)(SBOXES + 16));
    s2_box = _mm_load_si128((__m128i*)(SBOXES + 32));
    rot0 = _mm_load_si128((__m128i*)(CONSTANTS +  0));
    rot1 = _mm_load_si128((__m128i*)(CONSTANTS + 16));
    rot2 = _mm_load_si128((__m128i*)(CONSTANTS + 32));
    rot3 = _mm_load_si128((__m128i*)(CONSTANTS + 48));
    ileave = _mm_load_si128((__m128i*)(CONSTANTS + 64));

    mask = _mm_set1_epi8(0xF);
    poly = _mm_set1_epi8(0x1D);
    zero = _mm_xor_si128(mask,mask);

    y0 = _mm_loadu_si128((__m128i*)(&s512->b[ 0]));
    y1 = _mm_loadu_si128((__m128i*)(&s512->b[16]));
    y2 = _mm_loadu_si128((__m128i*)(&s512->b[32]));
    y3 = _mm_loadu_si128((__m128i*)(&s512->b[48]));

    /* slice going in -- packs two columns per xmm */
    TRANSPOSE(x,y);

    for (r = 0; r < 12; r++) {                      // 12 rounds

        /* SubBytes */
        GAMMA(y0,x0);
        GAMMA(y1,x1);
        GAMMA(y2,x2);
        GAMMA(y3,x3);

        /* ShiftColumns */
        x0 = _mm_shuffle_epi8(y0,rot0);
        x1 = _mm_shuffle_epi8(y1,rot1);
        x2 = _mm_shuffle_epi8(y2,rot2);
        x3 = _mm_shuffle_epi8(y3,rot3);

        /* MixRows */
        __m128i v0,v1,v2,v3,v4,v5,v6,v7;

        /* this basically compensates for the fact that
           we are packing two columns in each xmm but
           need complete diffusion across the rows */
        v4 = _mm_alignr_epi8(x2,x1,8); // 3 4 L H
        v5 = _mm_alignr_epi8(x3,x2,8); // 5 6
        v6 = _mm_alignr_epi8(x0,x3,8); // 7 0
        v7 = _mm_alignr_epi8(x1,x0,8); // 1 2

        v0 = _mm_xor_si128(v4,x3);
        v1 = _mm_xor_si128(v5,x0);
        v2 = _mm_xor_si128(v6,x1);
        v3 = _mm_xor_si128(v7,x2);

        MULX(y0,v3);
        MULX(y1,v0);
        MULX(y2,v1);
        MULX(y3,v2);

        y0 = _mm_xor_si128(y0,v0);
        y1 = _mm_xor_si128(y1,v1);
        y2 = _mm_xor_si128(y2,v2);
        y3 = _mm_xor_si128(y3,v3);

        MULX(y0,y0);
        MULX(y1,y1);
        MULX(y2,y2);
        MULX(y3,y3);

        y0 = _mm_xor_si128(y0,x1);
        y1 = _mm_xor_si128(y1,x2);
        y2 = _mm_xor_si128(y2,x3);
        y3 = _mm_xor_si128(y3,x0);

        MULX(y0,y0);
        MULX(y1,y1);
        MULX(y2,y2);
        MULX(y3,y3);

        y0 = _mm_xor_si128(y0,x0);
        y1 = _mm_xor_si128(y1,x1);
        y2 = _mm_xor_si128(y2,x2);
        y3 = _mm_xor_si128(y3,x3);

        v4 = _mm_xor_si128(v4,v5);
        v6 = _mm_xor_si128(v6,v7);
        v0 = _mm_xor_si128(v4,v6);

        y0 = _mm_xor_si128(y0,v0);
        y1 = _mm_xor_si128(y1,v0);
        y2 = _mm_xor_si128(y2,v0);
        y3 = _mm_xor_si128(y3,v0);

        /* AddRoundKey */
        x0 = _mm_xor_si128(y0,rcon[0]);
        x1 = _mm_xor_si128(y1,rcon[1]);
        x2 = _mm_xor_si128(y2,rcon[2]);
        x3 = _mm_xor_si128(y3,rcon[3]);
        rcon += 4;

        //PRINTSSE(x0,x1,x2,x3);
    }

    /* unslice going out */
    TRANSPOSE(y,x);

    _mm_storeu_si128((__m128i*)(&s512->b[ 0]),y0);
    _mm_storeu_si128((__m128i*)(&s512->b[16]),y1);
    _mm_storeu_si128((__m128i*)(&s512->b[32]),y2);
    _mm_storeu_si128((__m128i*)(&s512->b[48]),y3);
}

/* random crappy notes

__m128i _mm_alignr_epi8 (__m128i a, __m128i b, int n);
t[255:128] = a;
t[127:0] = b;
t[255:0] = t[255:0] >> (8 * n);
r[127:0] = t[127:0];

__m128i _mm_cmplt_epi8 (__m128i a, __m128i b);
r0 := (a0 < b0) ? 0xff : 0x0
r1 := (a1 < b1) ? 0xff : 0x0
...
r15 := (a15 < b15) ? 0xff : 0x0

__m128i _mm_andnot_si128 (__m128i a, __m128i b);
r := (~a) & b

1a + 9b + 2c + 5d + 8e + 1f + 4g + 1h
1a + 1b + 9c + 2d + 5e + 8f + 1g + 4h
4a + 1b + 1c + 9d + 2e + 5f + 8g + 1h
1a + 4b + 1c + 1d + 9e + 2f + 5g + 8h
8a + 1b + 4c + 1d + 1e + 9f + 2g + 5h
5a + 8b + 1c + 4d + 1e + 1f + 9g + 2h
2a + 5b + 8c + 1d + 4e + 1f + 1g + 9h
9a + 2b + 5c + 8d + 1e + 4f + 1g + 1h

1a + 1b +      1d +      1f +      1h + 2(1c + 2(1d + 1g + 2(1b + 1e)))
1a + 1b + 1c +      1e +      1g +      2(1d + 2(1e + 1h + 2(1c + 1f)))
     1b + 1c + 1d +      1f +      1h + 2(1e + 2(1f + 1a + 2(1d + 1g)))
1a +      1c + 1d + 1e +      1g +      2(1f + 2(1g + 1b + 2(1e + 1h)))
     1b +      1d + 1e + 1f +      1h + 2(1g + 2(1h + 1c + 2(1f + 1a)))
1a +      1c +      1e + 1f + 1g +      2(1h + 2(1a + 1d + 2(1g + 1b)))
     1b +      1d +      1f + 1g + 1h + 2(1a + 2(1b + 1e + 2(1h + 1c)))
1a +      1c +      1e +      1g + 1h + 2(1b + 2(1c + 1f + 2(1a + 1d)))

*/
