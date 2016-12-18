/*
 * NORX reference source code package - reference C implementations
 *
 * Written 2014-2016 by:
 *
 *      - Samuel Neves <sneves@dei.uc.pt>
 *      - Philipp Jovanovic <philipp@jovanovic.io>
 *
 * To the extent possible under law, the author(s) have dedicated all copyright
 * and related and neighboring rights to this software to the public domain
 * worldwide. This software is distributed without any warranty.
 *
 * You should have received a copy of the CC0 Public Domain Dedication along with
 * this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
 */
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "norx_util.h"
#include "norx.h"

const char * norx_version = "3.0";

#define NORX_N (NORX_W *  4)     /* Nonce size */
#define NORX_K (NORX_W *  4)     /* Key size */
#define NORX_B (NORX_W * 16)     /* Permutation width */
#define NORX_C (NORX_W *  4)     /* Capacity */
#define NORX_R (NORX_B - NORX_C) /* Rate */

#if NORX_W == 32 /* NORX32 specific */

    #define LOAD load32
    #define STORE store32

    /* Rotation constants */
    #define R0  8
    #define R1 11
    #define R2 16
    #define R3 31

#elif NORX_W == 64 /* NORX64 specific */

    #define LOAD load64
    #define STORE store64

    /* Rotation constants */
    #define R0  8
    #define R1 19
    #define R2 40
    #define R3 63

#else
    #error "Invalid word size!"
#endif

#if defined(NORX_DEBUG)

#include <stdio.h>
#include <inttypes.h>

#if   NORX_W == 32
    #define NORX_FMT "08" PRIX32
#elif NORX_W == 64
    #define NORX_FMT "016" PRIX64
#endif

static void norx_print_state(norx_state_t state)
{
    static const char fmt[] = "%" NORX_FMT " "
                              "%" NORX_FMT " "
                              "%" NORX_FMT " "
                              "%" NORX_FMT "\n";
    const norx_word_t * S = state->S;
    printf(fmt, S[ 0],S[ 1],S[ 2],S[ 3]);
    printf(fmt, S[ 4],S[ 5],S[ 6],S[ 7]);
    printf(fmt, S[ 8],S[ 9],S[10],S[11]);
    printf(fmt, S[12],S[13],S[14],S[15]);
    printf("\n");
}

static void print_bytes(const uint8_t *in, size_t inlen)
{
    size_t i;
    for (i = 0; i < inlen; ++i) {
        printf("%02X%c", in[i], i%16 == 15 ? '\n' : ' ');
    }
    if (inlen%16 != 0) {
        printf("\n");
    }
}

static void norx_debug(norx_state_t state, const uint8_t *in, size_t inlen, const uint8_t *out, size_t outlen)
{
    if (in != NULL && inlen > 0) {
        printf("In:\n");
        print_bytes(in, inlen);
    }
    if (out != NULL && outlen > 0) {
        printf("Out:\n");
        print_bytes(out, outlen);
    }
    printf("State:\n");
    norx_print_state(state);
}

#endif

/* The nonlinear primitive */
#define H(A, B) ( ( (A) ^ (B) ) ^ ( ( (A) & (B) ) << 1) )

/* The quarter-round */
#define G(A, B, C, D)                               \
do                                                  \
{                                                   \
    (A) = H(A, B); (D) ^= (A); (D) = ROTR((D), R0); \
    (C) = H(C, D); (B) ^= (C); (B) = ROTR((B), R1); \
    (A) = H(A, B); (D) ^= (A); (D) = ROTR((D), R2); \
    (C) = H(C, D); (B) ^= (C); (B) = ROTR((B), R3); \
} while (0)

/* The full round */
static NORX_INLINE void F(norx_word_t S[16])
{
    /* Column step */
    G(S[ 0], S[ 4], S[ 8], S[12]);
    G(S[ 1], S[ 5], S[ 9], S[13]);
    G(S[ 2], S[ 6], S[10], S[14]);
    G(S[ 3], S[ 7], S[11], S[15]);
    /* Diagonal step */
    G(S[ 0], S[ 5], S[10], S[15]);
    G(S[ 1], S[ 6], S[11], S[12]);
    G(S[ 2], S[ 7], S[ 8], S[13]);
    G(S[ 3], S[ 4], S[ 9], S[14]);
}

/* The core permutation */
static NORX_INLINE void norx_permute(norx_state_t state)
{
    size_t i;
    norx_word_t * S = state->S;

    for (i = 0; i < NORX_L; ++i) {
        F(S);
    }
}

static NORX_INLINE void norx_pad(uint8_t *out, const uint8_t *in, const size_t inlen)
{
    memset(out, 0, BYTES(NORX_R));
    memcpy(out, in, inlen);
    out[inlen] = 0x01;
    out[BYTES(NORX_R) - 1] |= 0x80;
}

static NORX_INLINE void norx_absorb_block(norx_state_t state, const uint8_t * in, tag_t tag)
{
    size_t i;
    norx_word_t * S = state->S;

    S[15] ^= tag;
    norx_permute(state);

    for (i = 0; i < WORDS(NORX_R); ++i) {
        S[i] ^= LOAD(in + i * BYTES(NORX_W));
    }
}

static NORX_INLINE void norx_absorb_lastblock(norx_state_t state, const uint8_t * in, size_t inlen, tag_t tag)
{
    uint8_t lastblock[BYTES(NORX_R)];
    norx_pad(lastblock, in, inlen);
    norx_absorb_block(state, lastblock, tag);
}

static NORX_INLINE void norx_encrypt_block(norx_state_t state, uint8_t *out, const uint8_t * in)
{
    size_t i;
    norx_word_t * S = state->S;

    S[15] ^= PAYLOAD_TAG;
    norx_permute(state);

    for (i = 0; i < WORDS(NORX_R); ++i) {
        S[i] ^= LOAD(in + i * BYTES(NORX_W));
        STORE(out + i * BYTES(NORX_W), S[i]);
    }
}

static NORX_INLINE void norx_encrypt_lastblock(norx_state_t state, uint8_t *out, const uint8_t * in, size_t inlen)
{
    uint8_t lastblock[BYTES(NORX_R)];
    norx_pad(lastblock, in, inlen);
    norx_encrypt_block(state, lastblock, lastblock);
    memcpy(out, lastblock, inlen);
}

static NORX_INLINE void norx_decrypt_block(norx_state_t state, uint8_t *out, const uint8_t * in)
{
    size_t i;
    norx_word_t * S = state->S;

    S[15] ^= PAYLOAD_TAG;
    norx_permute(state);

    for (i = 0; i < WORDS(NORX_R); ++i) {
        const norx_word_t c = LOAD(in + i * BYTES(NORX_W));
        STORE(out + i * BYTES(NORX_W), S[i] ^ c);
        S[i] = c;
    }
}

static NORX_INLINE void norx_decrypt_lastblock(norx_state_t state, uint8_t *out, const uint8_t * in, size_t inlen)
{
    norx_word_t * S = state->S;
    uint8_t lastblock[BYTES(NORX_R)];
    size_t i;

    S[15] ^= PAYLOAD_TAG;
    norx_permute(state);

    for(i = 0; i < WORDS(NORX_R); ++i) {
        STORE(lastblock + i * BYTES(NORX_W), S[i]);
    }

    memcpy(lastblock, in, inlen);
    lastblock[inlen] ^= 0x01;
    lastblock[BYTES(NORX_R) - 1] ^= 0x80;

    for (i = 0; i < WORDS(NORX_R); ++i) {
        const norx_word_t c = LOAD(lastblock + i * BYTES(NORX_W));
        STORE(lastblock + i * BYTES(NORX_W), S[i] ^ c);
        S[i] = c;
    }

    memcpy(out, lastblock, inlen);
    burn(lastblock, 0, sizeof lastblock);
}

/* Low-level operations */
static NORX_INLINE void norx_init(norx_state_t state, const unsigned char *k, const unsigned char *n)
{
    norx_word_t * S = state->S;
    size_t i;

    for(i = 0; i < 16; ++i) {
        S[i] = i;
    }

    F(S);
    F(S);

    S[ 0] = LOAD(n + 0 * BYTES(NORX_W));
    S[ 1] = LOAD(n + 1 * BYTES(NORX_W));
    S[ 2] = LOAD(n + 2 * BYTES(NORX_W));
    S[ 3] = LOAD(n + 3 * BYTES(NORX_W));

    S[ 4] = LOAD(k + 0 * BYTES(NORX_W));
    S[ 5] = LOAD(k + 1 * BYTES(NORX_W));
    S[ 6] = LOAD(k + 2 * BYTES(NORX_W));
    S[ 7] = LOAD(k + 3 * BYTES(NORX_W));

    S[12] ^= NORX_W;
    S[13] ^= NORX_L;
    S[14] ^= NORX_P;
    S[15] ^= NORX_T;

    norx_permute(state);

    S[12] ^= LOAD(k + 0 * BYTES(NORX_W));
    S[13] ^= LOAD(k + 1 * BYTES(NORX_W));
    S[14] ^= LOAD(k + 2 * BYTES(NORX_W));
    S[15] ^= LOAD(k + 3 * BYTES(NORX_W));

#if defined(NORX_DEBUG)
    printf("Initialise\n");
    norx_debug(state, NULL, 0, NULL, 0);
#endif
}

void norx_absorb_data(norx_state_t state, const unsigned char * in, size_t inlen, tag_t tag)
{
    if (inlen > 0)
    {
        while (inlen >= BYTES(NORX_R))
        {
            norx_absorb_block(state, in, tag);
            #if defined(NORX_DEBUG)
            printf("Absorb block\n");
            norx_debug(state, in, BYTES(NORX_R), NULL, 0);
            #endif
            inlen -= BYTES(NORX_R);
            in += BYTES(NORX_R);
        }
        norx_absorb_lastblock(state, in, inlen, tag);
        #if defined(NORX_DEBUG)
        printf("Absorb lastblock\n");
        norx_debug(state, in, inlen, NULL, 0);
        #endif
    }
}

#if NORX_P != 1 /* only required in parallel modes */
static NORX_INLINE void norx_branch(norx_state_t state, uint64_t lane)
{
    size_t i;
    norx_word_t * S = state->S;

    S[15] ^= BRANCH_TAG;
    norx_permute(state);

    /* Inject lane ID */
    for (i = 0; i < WORDS(NORX_R); ++i) {
        S[i] ^= lane;
    }
}

/* state = state xor state1 */
static NORX_INLINE void norx_merge(norx_state_t state, norx_state_t state1)
{
    size_t i;
    norx_word_t * S = state->S;
    norx_word_t * S1 = state1->S;

    S1[15] ^= MERGE_TAG;
    norx_permute(state1);

    for (i = 0; i < 16; ++i) {
        S[i] ^= S1[i];
    }
}
#endif

#if NORX_P == 1 /* Sequential encryption/decryption */
void norx_encrypt_data(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen)
{
    if (inlen > 0)
    {
        while (inlen >= BYTES(NORX_R))
        {
            norx_encrypt_block(state, out, in);
            #if defined(NORX_DEBUG)
            printf("Encrypt block\n");
            norx_debug(state, in, BYTES(NORX_R), out, BYTES(NORX_R));
            #endif
            inlen -= BYTES(NORX_R);
            in    += BYTES(NORX_R);
            out   += BYTES(NORX_R);
        }
        norx_encrypt_lastblock(state, out, in, inlen);
        #if defined(NORX_DEBUG)
        printf("Encrypt lastblock\n");
        norx_debug(state, in, inlen, out, inlen);
        #endif
    }
}

void norx_decrypt_data(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen)
{
    if (inlen > 0)
    {
        while (inlen >= BYTES(NORX_R))
        {
            norx_decrypt_block(state, out, in);
            #if defined(NORX_DEBUG)
            printf("Decrypt block\n");
            norx_debug(state, in, BYTES(NORX_R), out, BYTES(NORX_R));
            #endif
            inlen -= BYTES(NORX_R);
            in    += BYTES(NORX_R);
            out   += BYTES(NORX_R);
        }
        norx_decrypt_lastblock(state, out, in, inlen);
        #if defined(NORX_DEBUG)
        printf("Decrypt lastblock\n");
        norx_debug(state, in, inlen, out, inlen);
        #endif
    }
}

#elif NORX_P > 1 /* Parallel encryption/decryption */
void norx_encrypt_data(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen)
{
    if (inlen > 0)
    {
        size_t i;
        norx_state_t lane[NORX_P];

        /* Initialize states + branch */
        for (i = 0; i < NORX_P; ++i) {
            memcpy(lane[i], state, sizeof lane[i]);
            norx_branch(lane[i], i);
        }

        /* Parallel payload processing */
        for (i = 0; inlen >= BYTES(NORX_R); ++i) {
            norx_encrypt_block(lane[i%NORX_P], out, in);
            #if defined(NORX_DEBUG)
            printf("Encrypt block (lane: %lu)\n", i%NORX_P);
            norx_debug(lane[i%NORX_P], in, BYTES(NORX_R), out, BYTES(NORX_R));
            #endif
            inlen -= BYTES(NORX_R);
            out   += BYTES(NORX_R);
            in    += BYTES(NORX_R);
        }
        norx_encrypt_lastblock(lane[i%NORX_P], out, in, inlen);
        #if defined(NORX_DEBUG)
        printf("Encrypt lastblock (lane: %lu)\n", i%NORX_P);
        norx_debug(lane[i%NORX_P], in, inlen, out, inlen);
        #endif

        /* Merge */
        memset(state, 0, sizeof(norx_state_t));
        for (i = 0; i < NORX_P; ++i) {
            norx_merge(state, lane[i]);
            burn(lane[i], 0, sizeof(norx_state_t));
        }

        #if defined(NORX_DEBUG)
        printf("Encryption finalised\n");
        norx_debug(state, NULL, 0, NULL, 0);
        #endif
    }
}

void norx_decrypt_data(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen)
{
    if (inlen > 0)
    {
        size_t i;
        norx_state_t lane[NORX_P];

        /* Initialize states + branch */
        for (i = 0; i < NORX_P; ++i) {
            memcpy(lane[i], state, sizeof lane[i]);
            norx_branch(lane[i], i);
        }

        /* Parallel payload processing */
        for (i = 0; inlen >= BYTES(NORX_R); ++i) {
            norx_decrypt_block(lane[i%NORX_P], out, in);
            #if defined(NORX_DEBUG)
            printf("Decrypt block (lane: %lu)\n", i%NORX_P);
            norx_debug(lane[i%NORX_P], in, BYTES(NORX_R), out, BYTES(NORX_R));
            #endif
            inlen -= BYTES(NORX_R);
            out   += BYTES(NORX_R);
            in    += BYTES(NORX_R);
        }
        norx_decrypt_lastblock(lane[i%NORX_P], out, in, inlen);
        #if defined(NORX_DEBUG)
        printf("Decrypt lastblock (lane: %lu)\n", i%NORX_P);
        norx_debug(lane[i%NORX_P], in, inlen, out, inlen);
        #endif

        /* Merge */
        memset(state, 0, sizeof(norx_state_t));
        for (i = 0; i < NORX_P; ++i) {
            norx_merge(state, lane[i]);
            burn(lane[i], 0, sizeof(norx_state_t));
        }

        #if defined(NORX_DEBUG)
        printf("Decryption finalised\n");
        norx_debug(state, NULL, 0, NULL, 0);
        #endif
    }
}

#elif NORX_P == 0 /* Unlimited parallelism */
void norx_encrypt_data(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen)
{
    if (inlen > 0)
    {
        size_t lane = 0;
        norx_state_t sum;
        norx_state_t state2;

        memset(sum, 0, sizeof(norx_state_t));

        while (inlen >= BYTES(NORX_R))
        {
            /* branch */
            memcpy(state2, state, sizeof(norx_state_t));
            norx_branch(state2, lane++);
            /* encrypt */
            norx_encrypt_block(state2, out, in);

            #if defined(NORX_DEBUG)
            printf("Encrypt block (lane: %lu)\n", lane - 1);
            norx_debug(state2, in, BYTES(NORX_R), out, BYTES(NORX_R));
            #endif

            /* merge */
            norx_merge(sum, state2);

            inlen -= BYTES(NORX_R);
            in    += BYTES(NORX_R);
            out   += BYTES(NORX_R);
        }

        /* last block, 0 <= inlen < BYTES(NORX_R) */

        /* branch */
        memcpy(state2, state, sizeof(norx_state_t));
        norx_branch(state2, lane++);

        /* encrypt */
        norx_encrypt_lastblock(state2, out, in, inlen);

        #if defined(NORX_DEBUG)
        printf("Encrypt lastblock (lane: %lu)\n", lane - 1);
        norx_debug(state2, in, inlen, out, inlen);
        #endif

        /* merge */
        norx_merge(sum, state2);

        memcpy(state, sum, sizeof(norx_state_t));
        burn(state2, 0, sizeof(norx_state_t));
        burn(sum, 0, sizeof(norx_state_t));

        #if defined(NORX_DEBUG)
        printf("Encryption finalised\n");
        norx_debug(state, NULL, 0, NULL, 0);
        #endif
    }
}

void norx_decrypt_data(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen)
{
    if (inlen > 0)
    {
        size_t lane = 0;
        norx_state_t sum;
        norx_state_t state2;

        memset(sum, 0, sizeof(norx_state_t));

        while (inlen >= BYTES(NORX_R))
        {
            /* branch */
            memcpy(state2, state, sizeof(norx_state_t));
            norx_branch(state2, lane++);
            /* decrypt */
            norx_decrypt_block(state2, out, in);

            #if defined(NORX_DEBUG)
            printf("Decrypt block (lane: %lu)\n", lane - 1);
            norx_debug(state2, in, BYTES(NORX_R), out, BYTES(NORX_R));
            #endif

            /* merge */
            norx_merge(sum, state2);

            inlen -= BYTES(NORX_R);
            in    += BYTES(NORX_R);
            out   += BYTES(NORX_R);
        }

        /* last block, 0 <= inlen < BYTES(NORX_R) */

        /* branch */
        memcpy(state2, state, sizeof(norx_state_t));
        norx_branch(state2, lane++);

        /* decrypt */
        norx_decrypt_lastblock(state2, out, in, inlen);

        #if defined(NORX_DEBUG)
        printf("Decrypt lastblock (lane: %lu)\n", lane - 1);
        norx_debug(state2, in, inlen, out, inlen);
        #endif

        /* merge */
        norx_merge(sum, state2);

        memcpy(state, sum, sizeof(norx_state_t));
        burn(state2, 0, sizeof(norx_state_t));
        burn(sum, 0, sizeof(norx_state_t));

        #if defined(NORX_DEBUG)
        printf("Decryption finalised\n");
        norx_debug(state, NULL, 0, NULL, 0);
        #endif
    }
}
#else /* D < 0 */
    #error "NORX_P cannot be < 0"
#endif

static NORX_INLINE void norx_finalise(norx_state_t state, unsigned char * tag, const unsigned char * k)
{
    norx_word_t * S = state->S;
    uint8_t lastblock[BYTES(NORX_C)];

    S[15] ^= FINAL_TAG;

    norx_permute(state);

    S[12] ^= LOAD(k + 0 * BYTES(NORX_W));
    S[13] ^= LOAD(k + 1 * BYTES(NORX_W));
    S[14] ^= LOAD(k + 2 * BYTES(NORX_W));
    S[15] ^= LOAD(k + 3 * BYTES(NORX_W));

    norx_permute(state);

    S[12] ^= LOAD(k + 0 * BYTES(NORX_W));
    S[13] ^= LOAD(k + 1 * BYTES(NORX_W));
    S[14] ^= LOAD(k + 2 * BYTES(NORX_W));
    S[15] ^= LOAD(k + 3 * BYTES(NORX_W));

    STORE(lastblock + 0 * BYTES(NORX_W), S[12]);
    STORE(lastblock + 1 * BYTES(NORX_W), S[13]);
    STORE(lastblock + 2 * BYTES(NORX_W), S[14]);
    STORE(lastblock + 3 * BYTES(NORX_W), S[15]);

    memcpy(tag, lastblock, BYTES(NORX_T));

    #if defined(NORX_DEBUG)
    printf("Finalise\n");
    norx_debug(state, NULL, 0, NULL, 0);
    #endif

    burn(lastblock, 0, BYTES(NORX_C)); /* burn buffer */
    burn(state, 0, sizeof(norx_state_t)); /* at this point we can also burn the state */
}

/* Verify tags in constant time: 0 for success, -1 for fail */
int norx_verify_tag(const unsigned char * tag1, const unsigned char * tag2)
{
    size_t i;
    unsigned acc = 0;

    for (i = 0; i < BYTES(NORX_T); ++i) {
        acc |= tag1[i] ^ tag2[i];
    }

    return (((acc - 1) >> 8) & 1) - 1;
}

/* High-level operations */
void norx_aead_encrypt(
  unsigned char *c, size_t *clen,
  const unsigned char *a, size_t alen,
  const unsigned char *m, size_t mlen,
  const unsigned char *z, size_t zlen,
  const unsigned char *nonce,
  const unsigned char *key
)
{
    unsigned char k[BYTES(NORX_K)];
    norx_state_t state;

    memcpy(k, key, sizeof(k));
    norx_init(state, k, nonce);
    norx_absorb_data(state, a, alen, HEADER_TAG);
    norx_encrypt_data(state, c, m, mlen);
    norx_absorb_data(state, z, zlen, TRAILER_TAG);
    norx_finalise(state, c + mlen, k);
    *clen = mlen + BYTES(NORX_T);

    burn(state, 0, sizeof(norx_state_t));
    burn(k, 0, sizeof(k));
}

int norx_aead_decrypt(
  unsigned char *m, size_t *mlen,
  const unsigned char *a, size_t alen,
  const unsigned char *c, size_t clen,
  const unsigned char *z, size_t zlen,
  const unsigned char *nonce,
  const unsigned char *key
)
{
    unsigned char k[BYTES(NORX_K)];
    unsigned char tag[BYTES(NORX_T)];
    norx_state_t state;
    int result = -1;

    if (clen < BYTES(NORX_T)) {
        return -1;
    }

    memcpy(k, key, sizeof(k));
    norx_init(state, k, nonce);
    norx_absorb_data(state, a, alen, HEADER_TAG);
    norx_decrypt_data(state, m, c, clen - BYTES(NORX_T));
    norx_absorb_data(state, z, zlen, TRAILER_TAG);
    norx_finalise(state, tag, k);
    *mlen = clen - BYTES(NORX_T);

    result = norx_verify_tag(c + clen - BYTES(NORX_T), tag);
    if (result != 0) { /* burn decrypted plaintext on auth failure */
        burn(m, 0, clen - BYTES(NORX_T));
    }
    burn(state, 0, sizeof(norx_state_t));
    burn(k, 0, sizeof(k));
    return result;
}
