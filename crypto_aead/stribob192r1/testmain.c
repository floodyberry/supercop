// testmain.c
// 07-Feb-14  Markku-Juhani O. Saarinen <mjos@cblnk.com>

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#include "stribob.h"
#include "api.h"
#include "crypto_aead.h"

// print byte vectors

void debug_vec(const void *p, size_t len)
{
    size_t i;

    for (i = 0; i < len; i++) {
        switch (i & 0xF) {
            case 0:
                if (i > 0)
                    printf("\n");
                printf("\t");
                break;

            case 4:
            case 8:
            case 12:
                printf("  ");
                break;

            default:
                printf(" ");
                break;
        }
        printf("%02X", ((const uint8_t *) p)[i]);
    }
    printf("\n");
}

// randomize a buffer in testing

void rand_fill(void *p, size_t l)
{
    size_t i;

    for (i = 0; i < l; i++)
        ((uint8_t *) p)[i] = rand() & 0xFF;
}

// quick known-answer and randomized self-test

int sbob_selftest()
{
    // test vector for the pi permutation
    const uint8_t pivec[64] = {
        0x16, 0x8A, 0x86, 0x7D, 0x30, 0xDB, 0x56, 0x6D,
        0x57, 0xD5, 0x30, 0xBE, 0xD9, 0x22, 0x08, 0x82,
        0x37, 0x0C, 0xE2, 0x79, 0xFB, 0xA4, 0xE5, 0x87,
        0xA3, 0x20, 0xE6, 0xED, 0xA2, 0xA3, 0xBA, 0x10,
        0x17, 0x34, 0x62, 0xB6, 0x23, 0x0E, 0xC5, 0x67,
        0x86, 0x7C, 0x34, 0x37, 0x5E, 0x2E, 0x46, 0xD9,
        0xA7, 0xFB, 0x06, 0x19, 0x27, 0xA3, 0xF5, 0x49,
        0x53, 0x19, 0xBD, 0xF9, 0xEC, 0x94, 0x1A, 0x95,
    };

    // Test vector for CAESAR parameters
    const uint8_t specvec[54] = {
        0x6D, 0x80, 0x1F, 0x8E, 0x3F, 0xCF, 0xA8, 0x25,
        0x9D, 0x48, 0x4A, 0xAF, 0xBB, 0x77, 0x82, 0xF2,
        0xEE, 0x0F, 0xC7, 0x61, 0x19, 0x67, 0xBF, 0x91,
        0xBB, 0x6F, 0x92, 0x9C, 0xB9, 0x57, 0x60, 0xBB,
        0xA8, 0x08, 0xDE, 0x29, 0x2F, 0x8B, 0x16, 0x5B,
        0xD9, 0xD6, 0x2B, 0x3C, 0x7B, 0x7D, 0x6D, 0xC4,
        0x23, 0x44, 0x6B, 0xE7, 0x60, 0x82
    };

    int i;
    unsigned long long mlen, clen, alen, xlen;

    uint8_t pt[0x100];
    uint8_t ad[0x100];
    uint8_t ct[0x100 + CRYPTO_ABYTES];
    uint8_t xt[0x100];
    uint8_t key[CRYPTO_KEYBYTES];
    uint8_t npub[CRYPTO_NPUBBYTES];

    sbob_t sb;

    // known plaintext test on the Pi
    sbob_clr(&sb);
    for (i = 0; i < 64; i++)
        sb.s.b[i] = i;
        
    sbob_pi(&sb.s);
    for (i = 0; i < 64; i++) {
        if (sb.s.b[i] != pivec[i])
            return SBOB_ERR;
    }

    // known plaintext vs. the paper

    if (crypto_aead_encrypt(ct, &clen,
                            //   0123456789012345678901234567890123456789
        (const unsigned char *) "This is a Test Vector for stribob192r1", 38,
        (const unsigned char *) "AAD Test Vector Exact Block 32 B", 32, NULL,
        (const unsigned char *) "Nonces Used Once",
        (const unsigned char *) "192-bit Secret Key value") != 0)
        return SBOB_ERR;

    if (clen != 54)
        return SBOB_ERR;

    for (i = 0; i < clen; i++) {
        if (ct[i] != specvec[i])
            return SBOB_ERR;
    }

    // now test encrypt and decrypt functions

    for (i = 0; i < 10000; i++) {

        mlen = rand() & 0xFF;
        rand_fill(pt, (size_t) mlen);
        alen = rand() & 0xFF;
        rand_fill(ad, (size_t) alen);
        rand_fill(key, CRYPTO_KEYBYTES);
        rand_fill(npub, CRYPTO_NPUBBYTES);

        if (crypto_aead_encrypt(ct, &clen, pt, mlen, ad, alen, NULL,
            npub, key) != 0)
            return SBOB_ERR;

        if (crypto_aead_decrypt(xt, &xlen, NULL, ct, clen, ad, alen,
            npub, key) != 0)
            return SBOB_ERR;

        // compare the plaintext
        if (xlen != mlen)
            return SBOB_ERR;
        if (memcmp(xt, pt, (size_t) mlen) != 0)
            return SBOB_ERR;

        // random change
        switch(rand() % 4) {
            case 0:
                if (clen > 0) {
                    ct[rand() % clen] ^= 0x01 << (rand() & 7);
                    break;
                }

            case 1:
                key[rand() % CRYPTO_KEYBYTES] ^= 0x01 << (rand() & 7);
                break;

            case 2:
                if (alen > 0) {
                    ad[rand() % alen] ^= 0x01 << (rand() & 7);
                    break;
                }

            case 3:
                npub[rand() % CRYPTO_NPUBBYTES] ^= 0x01 << (rand() & 7);
                break;
        }

        // fail if successful decryption
        if (crypto_aead_decrypt(xt, &xlen, NULL, ct, clen, ad, alen,
            npub, key) == 0)
            return SBOB_ERR;
    }

    return 0;
}

// speed test (just on the compression function)

void sbob_pi_speed()
{
    uint64_t i, n;
    sbob_t sb;
    clock_t clk;
    double kb, sec;

    n = 100000;

    do {
        sbob_clr(&sb);
        clk = clock();
        for (i = 0; i < n; i++) {
            sb.s.q[0] ^= i;
            sbob_pi(&sb.s);
        }
        clk = clock() - clk;
        sec = ((double) clk) / ((double) CLOCKS_PER_SEC);
        kb = ((double) SBOB_RATE) * ((double) n) / 1000.0;
        n <<= 1;
    } while (clk < CLOCKS_PER_SEC);

    printf("%.2f kB/s (%gkB/%gs)\n", kb / sec, kb, sec);
}

// stub main

int main(int argc, char **argv)
{
    int err;

    err = sbob_selftest();
    if (err != 0) {
        printf("sbob_selftest() = %d\n", err);
        return err;
    } else {
        printf("sbob_selftest() PASS\n");
    }

    sbob_pi_speed();

    return 0;
}

