// sbob_pi64.c
// 06-Feb-14  Markku-Juhani O. Saarinen <mjos@iki.fi>

// Reference 64-bit GCC version of the StriBob Pi permutation.
// Released under CC0: This software is in Public Domain. See LICENSE

#include "stribob.h"

// sbtab64.c
extern const uint64_t sbob_sl64[8][256];
extern const uint64_t sbob_rc64[12][8];

// 64-bit version
void sbob_pi(sbob_w512 *s512)
{
    int i, r;
    sbob_w512 t;                        // temporary

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
}

