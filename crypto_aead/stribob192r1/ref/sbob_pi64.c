// sbob_pi64.c
// 28-Apr-14  Markku-Juhani O. Saarinen <mjos@iki.fi>

// Reference 64-bit GCC version

#include "stribob.h"

// sbob_tab64.c
extern const uint64_t sbob_sl64[8][256];
extern const uint64_t sbob_rc64[12][8];

// 64-bit ANSI C version

void sbob_pi(w512_t *s512)
{
    int i, r;
    w512_t t;                           // temporary

    for (r = 0; r < 12; r++) {          // 12 rounds

        for (i = 0; i < 8; i++)         // t = x ^ rc
            t.q[i] = s512->q[i] ^ sbob_rc64[r][i];

        for (i = 0; i < 8; i++) {       // s-box and linear op
            s512->q[i] = sbob_sl64[0][t.b[i]] ^
                        sbob_sl64[1][t.b[i + 8]] ^
                        sbob_sl64[2][t.b[i + 16]] ^
                        sbob_sl64[3][t.b[i + 24]] ^
                        sbob_sl64[4][t.b[i + 32]] ^
                        sbob_sl64[5][t.b[i + 40]] ^
                        sbob_sl64[6][t.b[i + 48]] ^
                        sbob_sl64[7][t.b[i + 56]];
        }
    }

    // clearing t deemed unnecessary
}


