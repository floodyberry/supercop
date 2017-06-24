// wbob_pineon.c
// 04-Sep-14  Billy Brumley <first.last@tut.fi>

// Constant time mplementation of WhirlBob Pi for NEON

#include "stribob.h"
#include <arm_neon.h>

static const uint8_t wbob_sbox[256] __attribute__((aligned(0x10))) = {
    0x18, 0x23, 0xC6, 0xE8, 0x87, 0xB8, 0x01, 0x4F,
    0x36, 0xA6, 0xD2, 0xF5, 0x79, 0x6F, 0x91, 0x52,
    0x60, 0xBC, 0x9B, 0x8E, 0xA3, 0x0C, 0x7B, 0x35,
    0x1D, 0xE0, 0xD7, 0xC2, 0x2E, 0x4B, 0xFE, 0x57,
    0x15, 0x77, 0x37, 0xE5, 0x9F, 0xF0, 0x4A, 0xDA,
    0x58, 0xC9, 0x29, 0x0A, 0xB1, 0xA0, 0x6B, 0x85,
    0xBD, 0x5D, 0x10, 0xF4, 0xCB, 0x3E, 0x05, 0x67,
    0xE4, 0x27, 0x41, 0x8B, 0xA7, 0x7D, 0x95, 0xD8,
    0xFB, 0xEE, 0x7C, 0x66, 0xDD, 0x17, 0x47, 0x9E,
    0xCA, 0x2D, 0xBF, 0x07, 0xAD, 0x5A, 0x83, 0x33,
    0x63, 0x02, 0xAA, 0x71, 0xC8, 0x19, 0x49, 0xD9,
    0xF2, 0xE3, 0x5B, 0x88, 0x9A, 0x26, 0x32, 0xB0,
    0xE9, 0x0F, 0xD5, 0x80, 0xBE, 0xCD, 0x34, 0x48,
    0xFF, 0x7A, 0x90, 0x5F, 0x20, 0x68, 0x1A, 0xAE,
    0xB4, 0x54, 0x93, 0x22, 0x64, 0xF1, 0x73, 0x12,
    0x40, 0x08, 0xC3, 0xEC, 0xDB, 0xA1, 0x8D, 0x3D,
    0x97, 0x00, 0xCF, 0x2B, 0x76, 0x82, 0xD6, 0x1B,
    0xB5, 0xAF, 0x6A, 0x50, 0x45, 0xF3, 0x30, 0xEF,
    0x3F, 0x55, 0xA2, 0xEA, 0x65, 0xBA, 0x2F, 0xC0,
    0xDE, 0x1C, 0xFD, 0x4D, 0x92, 0x75, 0x06, 0x8A,
    0xB2, 0xE6, 0x0E, 0x1F, 0x62, 0xD4, 0xA8, 0x96,
    0xF9, 0xC5, 0x25, 0x59, 0x84, 0x72, 0x39, 0x4C,
    0x5E, 0x78, 0x38, 0x8C, 0xD1, 0xA5, 0xE2, 0x61,
    0xB3, 0x21, 0x9C, 0x1E, 0x43, 0xC7, 0xFC, 0x04,
    0x51, 0x99, 0x6D, 0x0D, 0xFA, 0xDF, 0x7E, 0x24,
    0x3B, 0xAB, 0xCE, 0x11, 0x8F, 0x4E, 0xB7, 0xEB,
    0x3C, 0x81, 0x94, 0xF7, 0xB9, 0x13, 0x2C, 0xD3,
    0xE7, 0x6E, 0xC4, 0x03, 0x56, 0x44, 0x7F, 0xA9,
    0x2A, 0xBB, 0xC1, 0x53, 0xDC, 0x0B, 0x9D, 0x6C,
    0x31, 0x74, 0xF6, 0x46, 0xAC, 0x89, 0x14, 0xE1,
    0x16, 0x3A, 0x69, 0x09, 0x70, 0xB6, 0xD0, 0xED,
    0xCC, 0x42, 0x98, 0xA4, 0x28, 0x5C, 0xF8, 0x86
};

/* mini S-Boxes */
static const uint8_t SBOXES[48] __attribute__((aligned(0x10))) = {
    0xF,0x0,0xD,0x7,0xB,0xE,0x5,0xA,0x9,0x2,0xC,0x1,0x3,0x4,0x8,0x6, // 1/E
    0x1,0xB,0x9,0xC,0xD,0x6,0xF,0x3,0xE,0x8,0x7,0x4,0xA,0x2,0x5,0x0, // E
    0x7,0xC,0xB,0xD,0xE,0x4,0x9,0xF,0x6,0x3,0x8,0xA,0x2,0x5,0x1,0x0  // R
};

static const uint8_t RCON[16*8*8] __attribute__((aligned(0x10))) = {
    0x18,0,0,0,0,0,0,0,
    0x23,0,0,0,0,0,0,0,
    0xc6,0,0,0,0,0,0,0,
    0xe8,0,0,0,0,0,0,0,
    0x87,0,0,0,0,0,0,0,
    0xb8,0,0,0,0,0,0,0,
    0x01,0,0,0,0,0,0,0,
    0x4f,0,0,0,0,0,0,0,
    0x36,0,0,0,0,0,0,0,
    0xa6,0,0,0,0,0,0,0,
    0xd2,0,0,0,0,0,0,0,
    0xf5,0,0,0,0,0,0,0,
    0x79,0,0,0,0,0,0,0,
    0x6f,0,0,0,0,0,0,0,
    0x91,0,0,0,0,0,0,0,
    0x52,0,0,0,0,0,0,0,
    0x60,0,0,0,0,0,0,0,
    0xbc,0,0,0,0,0,0,0,
    0x9b,0,0,0,0,0,0,0,
    0x8e,0,0,0,0,0,0,0,
    0xa3,0,0,0,0,0,0,0,
    0x0c,0,0,0,0,0,0,0,
    0x7b,0,0,0,0,0,0,0,
    0x35,0,0,0,0,0,0,0,
    0x1d,0,0,0,0,0,0,0,
    0xe0,0,0,0,0,0,0,0,
    0xd7,0,0,0,0,0,0,0,
    0xc2,0,0,0,0,0,0,0,
    0x2e,0,0,0,0,0,0,0,
    0x4b,0,0,0,0,0,0,0,
    0xfe,0,0,0,0,0,0,0,
    0x57,0,0,0,0,0,0,0,
    0x15,0,0,0,0,0,0,0,
    0x77,0,0,0,0,0,0,0,
    0x37,0,0,0,0,0,0,0,
    0xe5,0,0,0,0,0,0,0,
    0x9f,0,0,0,0,0,0,0,
    0xf0,0,0,0,0,0,0,0,
    0x4a,0,0,0,0,0,0,0,
    0xda,0,0,0,0,0,0,0,
    0x58,0,0,0,0,0,0,0,
    0xc9,0,0,0,0,0,0,0,
    0x29,0,0,0,0,0,0,0,
    0x0a,0,0,0,0,0,0,0,
    0xb1,0,0,0,0,0,0,0,
    0xa0,0,0,0,0,0,0,0,
    0x6b,0,0,0,0,0,0,0,
    0x85,0,0,0,0,0,0,0,
    0xbd,0,0,0,0,0,0,0,
    0x5d,0,0,0,0,0,0,0,
    0x10,0,0,0,0,0,0,0,
    0xf4,0,0,0,0,0,0,0,
    0xcb,0,0,0,0,0,0,0,
    0x3e,0,0,0,0,0,0,0,
    0x05,0,0,0,0,0,0,0,
    0x67,0,0,0,0,0,0,0,
    0xe4,0,0,0,0,0,0,0,
    0x27,0,0,0,0,0,0,0,
    0x41,0,0,0,0,0,0,0,
    0x8b,0,0,0,0,0,0,0,
    0xa7,0,0,0,0,0,0,0,
    0x7d,0,0,0,0,0,0,0,
    0x95,0,0,0,0,0,0,0,
    0xd8,0,0,0,0,0,0,0,
    0xfb,0,0,0,0,0,0,0,
    0xee,0,0,0,0,0,0,0,
    0x7c,0,0,0,0,0,0,0,
    0x66,0,0,0,0,0,0,0,
    0xdd,0,0,0,0,0,0,0,
    0x17,0,0,0,0,0,0,0,
    0x47,0,0,0,0,0,0,0,
    0x9e,0,0,0,0,0,0,0,
    0xca,0,0,0,0,0,0,0,
    0x2d,0,0,0,0,0,0,0,
    0xbf,0,0,0,0,0,0,0,
    0x07,0,0,0,0,0,0,0,
    0xad,0,0,0,0,0,0,0,
    0x5a,0,0,0,0,0,0,0,
    0x83,0,0,0,0,0,0,0,
    0x33,0,0,0,0,0,0,0,
    0x63,0,0,0,0,0,0,0,
    0x02,0,0,0,0,0,0,0,
    0xaa,0,0,0,0,0,0,0,
    0x71,0,0,0,0,0,0,0,
    0xc8,0,0,0,0,0,0,0,
    0x19,0,0,0,0,0,0,0,
    0x49,0,0,0,0,0,0,0,
    0xd9,0,0,0,0,0,0,0,
    0xf2,0,0,0,0,0,0,0,
    0xe3,0,0,0,0,0,0,0,
    0x5b,0,0,0,0,0,0,0,
    0x88,0,0,0,0,0,0,0,
    0x9a,0,0,0,0,0,0,0,
    0x26,0,0,0,0,0,0,0,
    0x32,0,0,0,0,0,0,0,
    0xb0,0,0,0,0,0,0,0,
    0xe9,0,0,0,0,0,0,0,
    0x0f,0,0,0,0,0,0,0,
    0xd5,0,0,0,0,0,0,0,
    0x80,0,0,0,0,0,0,0,
    0xbe,0,0,0,0,0,0,0,
    0xcd,0,0,0,0,0,0,0,
    0x34,0,0,0,0,0,0,0,
    0x48,0,0,0,0,0,0,0,
    0xff,0,0,0,0,0,0,0,
    0x7a,0,0,0,0,0,0,0,
    0x90,0,0,0,0,0,0,0,
    0x5f,0,0,0,0,0,0,0,
    0x20,0,0,0,0,0,0,0,
    0x68,0,0,0,0,0,0,0,
    0x1a,0,0,0,0,0,0,0,
    0xae,0,0,0,0,0,0,0,
    0xb4,0,0,0,0,0,0,0,
    0x54,0,0,0,0,0,0,0,
    0x93,0,0,0,0,0,0,0,
    0x22,0,0,0,0,0,0,0,
    0x64,0,0,0,0,0,0,0,
    0xf1,0,0,0,0,0,0,0,
    0x73,0,0,0,0,0,0,0,
    0x12,0,0,0,0,0,0,0,
    0x40,0,0,0,0,0,0,0,
    0x08,0,0,0,0,0,0,0,
    0xc3,0,0,0,0,0,0,0,
    0xec,0,0,0,0,0,0,0,
    0xdb,0,0,0,0,0,0,0,
    0xa1,0,0,0,0,0,0,0,
    0x8d,0,0,0,0,0,0,0,
    0x3d,0,0,0,0,0,0,0
};


#define GAMMA(b,a) do {                 \
    uint8x8_t q0,q1,q2;                 \
    q0 = vand_u8(a,mask);               \
    q1 = vshr_n_u8(a,4);                \
    q0 = vtbl2_u8(s0_box,q0);           \
    q1 = vtbl2_u8(s1_box,q1);           \
    q2 = veor_u8(q0,q1);                \
    q2 = vtbl2_u8(s2_box,q2);           \
    q0 = veor_u8(q0,q2);                \
    q1 = veor_u8(q1,q2);                \
    q0 = vtbl2_u8(s0_box,q0);           \
    q1 = vtbl2_u8(s1_box,q1);           \
    q1 = vshl_n_u8(q1,4);               \
    b  = vorr_u8(q0,q1);                \
} while(0)

#define MULX(b,a) do {                  \
    int8x8_t q0;                        \
    uint8x8_t q1;                       \
    q0 = vreinterpret_s8_u8(a);         \
    q0 = vshr_n_s8(q0,7);               \
    q1 = vreinterpret_u8_s8(q0);        \
    q1 = vand_u8(q1,poly);              \
    b  = vshl_n_u8(a,1);                \
    b  = veor_u8(b,q1);                 \
} while(0)

#define MIXSTEP(b0,a0,t0,a2,t1,t4) do { \
    MULX(b0,t4);                        \
    b0 = veor_u8(b0,t1);                \
    MULX(b0,b0);                        \
    b0 = veor_u8(b0,a2);                \
    MULX(b0,b0);                        \
    b0 = veor_u8(b0,t0);                \
    b0 = veor_u8(b0,a0);                \
} while(0)

// WhirlBob Pi

void wbob_pi(w512_t *s512)
{
    int r;

    uint8x8x2_t d0, s0_box, s1_box, s2_box;
    uint8x8x4_t d1;
    uint8x8_t x0,x1,x2,x3,x4,x5,x6,x7;
    uint8x8_t y0,y1,y2,y3,y4,y5,y6,y7;
    uint8x8_t mask, poly, *rcon;

    s0_box.val[0] = vld1_u8(SBOXES +  0);
    s0_box.val[1] = vld1_u8(SBOXES +  8);
    s1_box.val[0] = vld1_u8(SBOXES + 16);
    s1_box.val[1] = vld1_u8(SBOXES + 24);
    s2_box.val[0] = vld1_u8(SBOXES + 32);
    s2_box.val[1] = vld1_u8(SBOXES + 40);

    mask = vdup_n_u8(0x0F);
    poly = vdup_n_u8(0x1D);
    rcon = (uint8x8_t *)RCON;

    d1 = vld4_u8(&s512->b[ 0]);
    x0 = d1.val[0];
    x1 = d1.val[1];
    x2 = d1.val[2];
    x3 = d1.val[3];
    d1 = vld4_u8(&s512->b[32]);
    x4 = d1.val[0];
    x5 = d1.val[1];
    x6 = d1.val[2];
    x7 = d1.val[3];

    d0 = vuzp_u8(x0,x4);
    x0 = d0.val[0];
    x4 = d0.val[1];
    d0 = vuzp_u8(x1,x5);
    x1 = d0.val[0];
    x5 = d0.val[1];
    d0 = vuzp_u8(x2,x6);
    x2 = d0.val[0];
    x6 = d0.val[1];
    d0 = vuzp_u8(x3,x7);
    x3 = d0.val[0];
    x7 = d0.val[1];

    for (r = 0; r < 12; r++) {                      // 12 rounds

        /* SubBytes */
        GAMMA(x0,x0);
        GAMMA(y1,x1);
        GAMMA(y2,x2);
        GAMMA(y3,x3);
        GAMMA(y4,x4);
        GAMMA(y5,x5);
        GAMMA(y6,x6);
        GAMMA(y7,x7);

        /* ShiftColumns */
        x1 = vext_u8(y1,y1,7);
        x2 = vext_u8(y2,y2,6);
        x3 = vext_u8(y3,y3,5);
        x4 = vext_u8(y4,y4,4);
        x5 = vext_u8(y5,y5,3);
        x6 = vext_u8(y6,y6,2);
        x7 = vext_u8(y7,y7,1);

        /* MixRows */
        uint8x8_t v0,v1,v2,v3,v4;

        v0 = veor_u8(x1,x3);
        v0 = veor_u8(v0,x5);
        v0 = veor_u8(v0,x7);
        v1 = veor_u8(x3,x6);
        v2 = veor_u8(x5,x0);
        v3 = veor_u8(x7,x2);
        v4 = veor_u8(x1,x4);
        MIXSTEP(y0,x0,v0,x2,v1,v4);
        MIXSTEP(y2,x2,v0,x4,v2,v1);
        MIXSTEP(y4,x4,v0,x6,v3,v2);
        MIXSTEP(y6,x6,v0,x0,v4,v3);

        v0 = veor_u8(x0,x2);
        v0 = veor_u8(v0,x4);
        v0 = veor_u8(v0,x6);
        v1 = veor_u8(x4,x7);
        v2 = veor_u8(x6,x1);
        v3 = veor_u8(x0,x3);
        v4 = veor_u8(x2,x5);
        MIXSTEP(y1,x1,v0,x3,v1,v4);
        MIXSTEP(y3,x3,v0,x5,v2,v1);
        MIXSTEP(y5,x5,v0,x7,v3,v2);
        MIXSTEP(y7,x7,v0,x1,v4,v3);

        /* AddRoundKey */
        x0 = veor_u8(y0,rcon[0]);
        x1 = veor_u8(y1,rcon[1]);
        x2 = veor_u8(y2,rcon[2]);
        x3 = veor_u8(y3,rcon[3]);
        x4 = veor_u8(y4,rcon[4]);
        x5 = veor_u8(y5,rcon[5]);
        x6 = veor_u8(y6,rcon[6]);
        x7 = veor_u8(y7,rcon[7]);
        rcon += 8;

    }

    d0 = vzip_u8(x0,x4);
    x0 = d0.val[0];
    x4 = d0.val[1];
    d0 = vzip_u8(x1,x5);
    x1 = d0.val[0];
    x5 = d0.val[1];
    d0 = vzip_u8(x2,x6);
    x2 = d0.val[0];
    x6 = d0.val[1];
    d0 = vzip_u8(x3,x7);
    x3 = d0.val[0];
    x7 = d0.val[1];

    d1.val[0] = x0;
    d1.val[1] = x1;
    d1.val[2] = x2;
    d1.val[3] = x3;
    vst4_u8(&s512->b[0], d1);

    d1.val[0] = x4;
    d1.val[1] = x5;
    d1.val[2] = x6;
    d1.val[3] = x7;
    vst4_u8(&s512->b[32], d1);

}

