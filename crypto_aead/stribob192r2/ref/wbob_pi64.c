// wbob_pi64.c
// 10-Sep-15  Markku-Juhani O. Saarinen <mjos@iki.fi>
// A version with large tables.

#include "stribob.h"
#include "wbob_tab64.h"

#if (__BYTE_ORDER__ != __ORDER_LITTLE_ENDIAN__)
// Big Endian
#define WBOB_SM(i, x) wbob_sm##i [((x) >> (56 - 8 * i)) & 0xFF]
#else
// Little Endian
#define WBOB_SM(i, x) wbob_sm##i [((x) >> (8 * i)) & 0xFF]
#endif

void wbob_pi(w512_t *s512)
{
    int i;
    uint64_t k[8], l[8];

    // load block
    for (i = 0; i < 8; i++)
        k[i] = s512->q[i];

    for (i = 0; i < 12; i++) {

        l[0] =  WBOB_SM(0, k[0]) ^  WBOB_SM(1, k[7]) ^
                WBOB_SM(2, k[6]) ^  WBOB_SM(3, k[5]) ^
                WBOB_SM(4, k[4]) ^  WBOB_SM(5, k[3]) ^
                WBOB_SM(6, k[2]) ^  WBOB_SM(7, k[1]) ^ wbob_rc[i];

        l[1] =  WBOB_SM(0, k[1]) ^  WBOB_SM(1, k[0]) ^
                WBOB_SM(2, k[7]) ^  WBOB_SM(3, k[6]) ^
                WBOB_SM(4, k[5]) ^  WBOB_SM(5, k[4]) ^
                WBOB_SM(6, k[3]) ^  WBOB_SM(7, k[2]);

        l[2] =  WBOB_SM(0, k[2]) ^  WBOB_SM(1, k[1]) ^
                WBOB_SM(2, k[0]) ^  WBOB_SM(3, k[7]) ^
                WBOB_SM(4, k[6]) ^  WBOB_SM(5, k[5]) ^
                WBOB_SM(6, k[4]) ^  WBOB_SM(7, k[3]);

        l[3] =  WBOB_SM(0, k[3]) ^  WBOB_SM(1, k[2]) ^
                WBOB_SM(2, k[1]) ^  WBOB_SM(3, k[0]) ^
                WBOB_SM(4, k[7]) ^  WBOB_SM(5, k[6]) ^
                WBOB_SM(6, k[5]) ^  WBOB_SM(7, k[4]);

        l[4] =  WBOB_SM(0, k[4]) ^  WBOB_SM(1, k[3]) ^
                WBOB_SM(2, k[2]) ^  WBOB_SM(3, k[1]) ^
                WBOB_SM(4, k[0]) ^  WBOB_SM(5, k[7]) ^
                WBOB_SM(6, k[6]) ^  WBOB_SM(7, k[5]);

        l[5] =  WBOB_SM(0, k[5]) ^  WBOB_SM(1, k[4]) ^
                WBOB_SM(2, k[3]) ^  WBOB_SM(3, k[2]) ^
                WBOB_SM(4, k[1]) ^  WBOB_SM(5, k[0]) ^
                WBOB_SM(6, k[7]) ^  WBOB_SM(7, k[6]);

        l[6] =  WBOB_SM(0, k[6]) ^  WBOB_SM(1, k[5]) ^
                WBOB_SM(2, k[4]) ^  WBOB_SM(3, k[3]) ^
                WBOB_SM(4, k[2]) ^  WBOB_SM(5, k[1]) ^
                WBOB_SM(6, k[0]) ^  WBOB_SM(7, k[7]);

        l[7] =  WBOB_SM(0, k[7]) ^  WBOB_SM(1, k[6]) ^
                WBOB_SM(2, k[5]) ^  WBOB_SM(3, k[4]) ^
                WBOB_SM(4, k[3]) ^  WBOB_SM(5, k[2]) ^
                WBOB_SM(6, k[1]) ^  WBOB_SM(7, k[0]);

        if (i < 11) {
            k[0] = l[0];
            k[1] = l[1];
            k[2] = l[2];
            k[3] = l[3];
            k[4] = l[4];
            k[5] = l[5];
            k[6] = l[6];
            k[7] = l[7];
        }
    }

    for (i = 0; i < 8; i++)
        s512->q[i] = l[i];
}

