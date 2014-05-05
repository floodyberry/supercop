// stribob.c
// 06-Feb-14    Markku-Juhani O. Saarinen <mjos@iki.fi>
//              See LICENSE for Licensing and Warranty information.

#include "stribob.h"

// initialization

void sbob_clr(sbob_t *sb)
{
    int i;

    for (i = 0; i < 8; i++)
        sb->s.q[i] = 0;
    sb->l = 0;
}

// end a data element (compulsory between different types)

void sbob_fin(sbob_t *sb, sbob_pad_t pad)
{
    // pad
    sb->s.b[sb->l] ^= BLNK_END;
    sb->s.b[SBOB_RATE] ^= pad | BLNK_FIN;

    // compress and zero the buffer
    sbob_pi(&sb->s);
    sb->l = 0;
}

// put data in

void sbob_put(sbob_t *sb, sbob_pad_t pad, const void *in, size_t len)
{
    int j;
    size_t i;

    j = sb->l;
    for (i = 0; i < len; i++) {
        if (j == SBOB_RATE) {
            sb->s.b[SBOB_RATE] ^= pad;
            sbob_pi(&sb->s);
            j = 0;
        }
        sb->s.b[j++] ^= ((const uint8_t *) in)[i];
    }
    sb->l = j;
}

// get data out

void sbob_get(sbob_t *sb, sbob_pad_t pad, void *out, size_t len)
{
    int j;
    size_t i;

    j = sb->l;
    for (i = 0; i < len; i++) {
        if (j == SBOB_RATE) {
            sb->s.b[SBOB_RATE] ^= pad;
            sbob_pi(&sb->s);
            j = 0;
        }
        ((uint8_t *) out)[i] = sb->s.b[j++];
    }
    sb->l = j;
}

// compare (0 == equal)

int sbob_cmp(sbob_t *sb, sbob_pad_t pad, const void *in, size_t len)
{
    int j, d;
    size_t i;

    j = sb->l;
    d = 0;
    for (i = 0; i < len; i++) {
        if (j == SBOB_RATE) {
            sb->s.b[SBOB_RATE] ^= pad;
            sbob_pi(&sb->s);
            j = 0;
        }
        if (d == 0)
            d = ((int) ((const uint8_t *) in)[i]) - ((int) sb->s.b[j]);
        j++;
    }
    sb->l = j;

    return d;
}

// encrypt data

void sbob_enc(sbob_t *sb, sbob_pad_t pad,
    void *out, const void *in, size_t len)
{
    int j;
    size_t i;

    j = sb->l;
    for (i = 0; i < len; i++) {
        if (j == SBOB_RATE) {
            sb->s.b[SBOB_RATE] ^= pad;
            sbob_pi(&sb->s);
            j = 0;
        }
        sb->s.b[j] ^= ((const uint8_t *) in)[i];
        ((uint8_t *) out)[i] = sb->s.b[j++];
    }
    sb->l = j;
}

// decrypt data

void sbob_dec(sbob_t *sb, sbob_pad_t pad,
    void *out, const void *in, size_t len)
{
    int j;
    size_t i;
    uint8_t t;

    j = sb->l;
    for (i = 0; i < len; i++) {
        if (j == SBOB_RATE) {
            sb->s.b[SBOB_RATE] ^= pad;
            sbob_pi(&sb->s);
            j = 0;
        }
        t = ((const uint8_t *) in)[i];
        ((uint8_t *) out)[i] = sb->s.b[j] ^ t;
        sb->s.b[j++] = t;
    }
    sb->l = j;
}

