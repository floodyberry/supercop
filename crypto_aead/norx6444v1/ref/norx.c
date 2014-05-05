/*
   NORX reference source code package - reference C implementations

   Written in 2014 by Samuel Neves <sneves@dei.uc.pt> and Philipp Jovanovic
   <jovanovic@fim.uni-passau.de>

   To the extent possible under law, the author(s) have dedicated all copyright
   and related and neighboring rights to this software to the public domain
   worldwide. This software is distributed without any warranty.

   You should have received a copy of the CC0 Public Domain Dedication along with
   this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
*/
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#if defined(NORX_DEBUG)
#include <stdio.h>
#include <inttypes.h>
#endif

#include "norx_util.h"
#include "norx.h"

#define NORX_N (NORX_W *  2)   /* Nonce size */
#define NORX_K (NORX_W *  4)   /* Key size */
#define NORX_B (NORX_W * 16)   /* Permutation width */
#define NORX_C (NORX_W *  6)   /* Capacity */
#define RATE (NORX_B - NORX_C) /* To avoid clashing with rounds... */

#if   NORX_W == 64 /* NORX-64 specific */

    #define LOAD load64
    #define STORE store64

    /* Rotation constants */
    #define R0  8
    #define R1 19
    #define R2 40
    #define R3 63

    /* Initialization constants */
    static const norx_word_t norx_ui[4] =
    {
      0x243F6A8885A308D3, 0x13198A2E03707344,
      0xA4093822299F31D0, 0x082EFA98EC4E6C89,
    };

    #if defined(NORX_DEBUG)
        #define NORX_FMT "016" PRIX64
    #endif

#elif NORX_W == 32 /* NORX-32 specific */

    #define LOAD load32
    #define STORE store32

    /* Rotation constants */
    #define R0  8
    #define R1 11
    #define R2 16
    #define R3 31

    /* Initialization constants */
    static const norx_word_t norx_ui[4] =
    {
       0x243F6A88, 0x85A308D3,
       0x13198A2E, 0x03707344
    };

    #if defined(NORX_DEBUG)
        #define NORX_FMT "08" PRIX32
    #endif

#else
    #error "Invalid word size!"
#endif

#if defined(NORX_DEBUG)
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
#endif

typedef enum tag__
{
    HEADER_TAG  = 1 << 0,
    PAYLOAD_TAG = 1 << 1,
    TRAILER_TAG = 1 << 2,
    FINAL_TAG   = 1 << 3,
    BRANCH_TAG  = 1 << 4,
    MERGE_TAG   = 1 << 5
} tag_t;

/* The nonlinear primitive */
#define U(A, B) ( ( (A) ^ (B) ) ^ ( ( (A) & (B) ) << 1) )

/* The quarter-round */
#define G(A, B, C, D) \
do \
{ \
    (A) = U(A, B); (D) ^= (A); (D) = ROTR((D), R0); \
    (C) = U(C, D); (B) ^= (C); (B) = ROTR((B), R1); \
    (A) = U(A, B); (D) ^= (A); (D) = ROTR((D), R2); \
    (C) = U(C, D); (B) ^= (C); (B) = ROTR((B), R3); \
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
static NORX_INLINE void norx_permutation(norx_state_t state)
{
    norx_word_t * S = state->S;
    size_t i;

    for (i = 0; i < NORX_R; ++i)
        F(S);
}

static NORX_INLINE void norx_pad(uint8_t *out, const uint8_t *in, const size_t inlen)
{
    memset(out, 0, BYTES(RATE));
    memcpy(out, in, inlen);
    out[inlen] = 0x01;
    out[BYTES(RATE) - 1] |= 0x80;
}

static NORX_INLINE void norx_setup(norx_state_t state, const uint8_t *k, const uint8_t *n)
{
    norx_word_t * S = state->S;
    norx_word_t u[4];

    S[0] = u[0] = norx_ui[0];
    S[1] = LOAD(n + 0 * BYTES(NORX_W));
    S[2] = LOAD(n + 1 * BYTES(NORX_W));
    S[3] = u[1] = norx_ui[1];

    S[4] = LOAD(k + 0 * BYTES(NORX_W));
    S[5] = LOAD(k + 1 * BYTES(NORX_W));
    S[6] = LOAD(k + 2 * BYTES(NORX_W));
    S[7] = LOAD(k + 3 * BYTES(NORX_W));

    S[8] = u[2] = norx_ui[2];
    S[9] = u[3] = norx_ui[3];

    G(u[0], u[1], u[2], u[3]);

    S[10] = u[0];
    S[11] = u[1];
    S[12] = u[2];
    S[13] = u[3];

    G(u[0], u[1], u[2], u[3]);

    S[14] = u[0];
    S[15] = u[1];
}

static NORX_INLINE void norx_inject_tag(norx_state_t state, tag_t tag)
{
    norx_word_t * S = state->S;
    S[15] ^= tag;
}

#if NORX_D != 1 /* only required in parallel modes */
static NORX_INLINE void norx_inject_lane(norx_state_t state, uint64_t lane)
{
    norx_word_t * S = state->S;
#if   NORX_W == 32
    S[13] ^= (lane >>  0) & 0xFFFFFFFF;
    S[14] ^= (lane >> 32) & 0xFFFFFFFF;
#elif NORX_W == 64
    S[13] ^= lane;
#endif
}
#endif

static NORX_INLINE void norx_inject_params(norx_state_t state)
{
    norx_word_t * S = state->S;
    S[14] ^= (NORX_R << 26) | (NORX_D << 18) | (NORX_W << 10) | NORX_A;
    norx_permutation(state);
}

static NORX_INLINE void norx_absorb(norx_state_t state, const uint8_t * in, tag_t tag)
{
    norx_word_t * S = state->S;
    size_t i;

    norx_inject_tag(state, tag);
    norx_permutation(state);
#if defined(NORX_DEBUG)
    if (tag == HEADER_TAG)
    {
      printf("End of initialisation:\n");
      norx_print_state(state);
    }
#endif

    for (i = 0; i < WORDS(RATE); ++i)
        S[i] ^= LOAD(in + i * BYTES(NORX_W));
}

static NORX_INLINE void norx_finalize(norx_state_t state)
{
    norx_inject_tag(state, FINAL_TAG);
    norx_permutation(state);
    norx_permutation(state);
#if defined(NORX_DEBUG) && NORX_D == 1
    printf("End of payload processing\n");
    norx_print_state(state);
#endif
}

static NORX_INLINE void norx_encrypt_block(norx_state_t state, uint8_t *out, const uint8_t * in)
{
    norx_word_t * S = state->S;
    size_t i;

    norx_inject_tag(state, PAYLOAD_TAG);
    norx_permutation(state);

#if defined(NORX_DEBUG) && NORX_D == 1
    printf("End of header processing \n");
    norx_print_state(state);
#endif

    for (i = 0; i < WORDS(RATE); ++i)
    {
        S[i] ^= LOAD(in + i * BYTES(NORX_W));
        STORE(out + i * BYTES(NORX_W), S[i]);
    }
}


static NORX_INLINE void norx_encrypt_lastblock(norx_state_t state, uint8_t *out, const uint8_t * in, size_t inlen)
{
    uint8_t lastblock[BYTES(RATE)];
    norx_pad(lastblock, in, inlen);
    norx_encrypt_block(state, lastblock, lastblock);
    memcpy(out, lastblock, inlen);
}

static NORX_INLINE void norx_decrypt_block(norx_state_t state, uint8_t *out, const uint8_t * in)
{
    norx_word_t * S = state->S;
    size_t i;

    norx_inject_tag(state, PAYLOAD_TAG);
    norx_permutation(state);

    for (i = 0; i < WORDS(RATE); ++i)
    {
        const norx_word_t c = LOAD(in + i * BYTES(NORX_W));
        STORE(out + i * BYTES(NORX_W), S[i] ^ c);
        S[i] = c;
    }
}

static NORX_INLINE void norx_decrypt_lastblock(norx_state_t state, uint8_t *out, const uint8_t * in, size_t inlen)
{
    norx_word_t * S = state->S;
    uint8_t b[BYTES(NORX_W)];
    size_t i, j;

    norx_inject_tag(state, PAYLOAD_TAG);
    norx_permutation(state);

    /* Undo padding */
    S[inlen / BYTES(NORX_W)] ^= 0x01ULL << ((inlen % BYTES(NORX_W)) * 8);
    S[WORDS(RATE) - 1]  ^= 0x80ULL << (((BYTES(RATE) - 1) % BYTES(NORX_W)) * 8);

    for(i = 0; inlen >= BYTES(NORX_W); ++i)
    {
        norx_word_t c = LOAD(in);
        STORE(out, S[i] ^ c);
        S[i] = c;

        inlen -= BYTES(NORX_W);
        in    += BYTES(NORX_W);
        out   += BYTES(NORX_W);
    }

    STORE(b, S[i]);
    for(j = 0; j < inlen; ++j)
    {
        uint8_t c = in[j];
        out[j] = b[j] ^ c;
        b[j]   = c;
    }
    S[i] = LOAD(b);
}

#if NORX_D != 1 /* only required in parallel modes */
static NORX_INLINE void norx_branch(norx_state_t state, uint64_t lane)
{
    norx_inject_tag(state, BRANCH_TAG);
    norx_permutation(state);
#if defined(NORX_DEBUG)
    if (lane == 0)
    {
      printf("End of header processing:\n");
      norx_print_state(state);
    }
#endif
    norx_inject_lane(state, lane);
}

/* state = state xor state1 */
static NORX_INLINE void norx_merge(norx_state_t state, norx_state_t state1)
{
    norx_word_t * S = state->S;
    norx_word_t * S1 = state1->S;
    size_t i;

    norx_inject_tag(state1, MERGE_TAG);
    norx_permutation(state1);

    for(i = 0; i < 16; ++i)
        S[i] ^= S1[i];
}
#endif

void norx_init(norx_state_t state, const unsigned char *k, const unsigned char *n)
{
    norx_setup(state, k, n);
#if defined(NORX_DEBUG)
    printf("Basic setup:\n");
    norx_print_state(state);
#endif
    norx_inject_params(state);
}

void norx_process_header(norx_state_t state, const unsigned char * in, size_t inlen)
{
    if(inlen > 0)
    {
        uint8_t lastblock[BYTES(RATE)];

        while (inlen >= BYTES(RATE))
        {
            norx_absorb(state, in, HEADER_TAG);
            inlen -= BYTES(RATE);
            in += BYTES(RATE);
        }

        norx_pad(lastblock, in, inlen);
        norx_absorb(state, lastblock, HEADER_TAG);
    }
}

#if NORX_D > 1 /* Parallel encryption/decryption */

void norx_encrypt_msg(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen)
{
    if(inlen > 0)
    {
        norx_state_t lane[NORX_D];
        uint8_t emptyblock[BYTES(RATE)];
        size_t i, j;

        /* Initialize states + branch */
        for(i = 0; i < NORX_D; ++i)
        {
            memcpy(lane[i], state, sizeof lane[i]);
            norx_branch(lane[i], i);
        }

        /* parallel payload processing */
        for(i = 0; inlen >= BYTES(RATE); ++i)
        {
            norx_encrypt_block(lane[i%NORX_D], out, in);
            inlen -= BYTES(RATE);
            out   += BYTES(RATE);
            in    += BYTES(RATE);
        }
        norx_encrypt_lastblock(lane[i++%NORX_D], out, in, inlen);

        /* Pad remaining blocks */
        norx_pad(emptyblock, emptyblock, 0);
        for(j = 0; j < (NORX_D-1); ++j, ++i)
        {
            norx_absorb(lane[i%NORX_D], emptyblock, PAYLOAD_TAG);
        }

        /* Merge */
        memset(state, 0, sizeof(norx_state_t));
        for(i = 0; i < NORX_D; ++i)
        {
#if defined(NORX_DEBUG)
            printf("End of payload processing (lane %lu) \n", i);
            norx_print_state(lane[i]);
#endif
            norx_merge(state, lane[i]);
            burn(lane[i], 0, sizeof(norx_state_t));
        }

#if defined(NORX_DEBUG)
        printf("End of merging:\n");
        norx_print_state(state);
#endif
    }
}

void norx_decrypt_msg(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen)
{
    if(inlen > 0)
    {
        norx_state_t lane[NORX_D];
        uint8_t emptyblock[BYTES(RATE)];
        size_t i, j;

        /* Initialize states + branch */
        for(i = 0; i < NORX_D; ++i)
        {
            memcpy(lane[i], state, sizeof lane[i]);
            norx_branch(lane[i], i);
        }

        /* parallel payload processing */
        for(i = 0; inlen >= BYTES(RATE); ++i)
        {
            norx_decrypt_block(lane[i%NORX_D], out, in);
            inlen -= BYTES(RATE);
            out   += BYTES(RATE);
            in    += BYTES(RATE);
        }
        norx_decrypt_lastblock(lane[i++%NORX_D], out, in, inlen);

        /* Pad remaining blocks */
        norx_pad(emptyblock, emptyblock, 0);
        for(j = 0; j < NORX_D - 1; ++j, ++i)
        {
            norx_absorb(lane[i%NORX_D], emptyblock, PAYLOAD_TAG);
        }

        /* Merge */
        memset(state, 0, sizeof(norx_state_t));
        for(i = 0; i < NORX_D; ++i)
        {
            norx_merge(state, lane[i]);
            burn(lane[i], 0, sizeof(norx_state_t));
        }

    }
}

#elif NORX_D == 1 /* Sequential encryption/decryption */

void norx_encrypt_msg(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen)
{
    if(inlen > 0)
    {
        while (inlen >= BYTES(RATE))
        {
            norx_encrypt_block(state, out, in);
            inlen -= BYTES(RATE);
            in    += BYTES(RATE);
            out   += BYTES(RATE);
        }

        norx_encrypt_lastblock(state, out, in, inlen);
    }
}

void norx_decrypt_msg(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen)
{
    if(inlen > 0)
    {
        while (inlen >= BYTES(RATE))
        {
            norx_decrypt_block(state, out, in);
            inlen -= BYTES(RATE);
            in    += BYTES(RATE);
            out   += BYTES(RATE);
        }

        norx_decrypt_lastblock(state, out, in, inlen);
    }
}

#elif NORX_D == 0 /* Unlimited parallelism */

void norx_encrypt_msg(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen)
{
    if(inlen > 0)
    {
        uint8_t emptyblock[BYTES(RATE)];
        norx_state_t sum;
        norx_state_t state2;
        uint64_t lane = 0;

        norx_pad(emptyblock, emptyblock, 0);
        memset(sum, 0, sizeof(norx_state_t));

        while (inlen >= BYTES(RATE))
        {
            /* branch */
            memcpy(state2, state, sizeof(norx_state_t));
            norx_branch(state2, lane++);
            /* encrypt */
            norx_encrypt_block(state2, out, in);
            /* empty padding */
            norx_absorb(state2, emptyblock, PAYLOAD_TAG);
            /* merge */
            norx_merge(sum, state2);

            inlen -= BYTES(RATE);
            in    += BYTES(RATE);
            out   += BYTES(RATE);
        }
        /* last block, 0 < inlen < BYTES(RATE) */
        if(inlen > 0)
        {
            /* branch */
            memcpy(state2, state, sizeof(norx_state_t));
            norx_branch(state2, lane++);
            /* encrypt */
            norx_encrypt_lastblock(state2, out, in, inlen);
            /* merge */
            norx_merge(sum, state2);
        }
        memcpy(state, sum, sizeof(norx_state_t));
    }
}

void norx_decrypt_msg(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen)
{
    if(inlen > 0)
    {
        uint8_t emptyblock[BYTES(RATE)];
        norx_state_t sum;
        norx_state_t state2;
        size_t lane = 0;

        norx_pad(emptyblock, emptyblock, 0);
        memset(sum, 0, sizeof(norx_state_t));

        while (inlen >= BYTES(RATE))
        {
            /* branch */
            memcpy(state2, state, sizeof(norx_state_t));
            norx_branch(state2, lane++);
            /* decrypt */
            norx_decrypt_block(state2, out, in);
            /* empty padding */
            norx_absorb(state2, emptyblock, PAYLOAD_TAG);
            /* merge */
            norx_merge(sum, state2);

            inlen -= BYTES(RATE);
            in    += BYTES(RATE);
            out   += BYTES(RATE);
        }
        /* last block, 0 < inlen < BYTES(RATE) */
        if(inlen > 0)
        {
            /* branch */
            memcpy(state2, state, sizeof(norx_state_t));
            norx_branch(state2, lane++);
            /* decrypt */
            norx_decrypt_lastblock(state2, out, in, inlen);
            /* merge */
            norx_merge(sum, state2);
        }
        memcpy(state, sum, sizeof(norx_state_t));
    }
}
#else /* D < 0 */
    #error "NORX_D cannot be < 0"
#endif


void norx_process_trailer(norx_state_t state, const unsigned char * in, size_t inlen)
{
    if(inlen > 0)
    {
        uint8_t lastblock[BYTES(RATE)];

        while (inlen >= BYTES(RATE))
        {
            norx_absorb(state, in, TRAILER_TAG);
            inlen -= BYTES(RATE);
            in    += BYTES(RATE);
        }

        norx_pad(lastblock, in, inlen);
        norx_absorb(state, lastblock, TRAILER_TAG);
    }
}


void norx_output_tag(norx_state_t state, unsigned char * tag)
{
    norx_word_t * S = state->S;
    uint8_t lastblock[BYTES(RATE)];
    size_t i;

    norx_finalize(state);

    for (i = 0; i < WORDS(RATE); ++i)
        STORE(lastblock + i * BYTES(NORX_W), S[i]);

    memcpy(tag, lastblock, BYTES(NORX_A));
    burn(lastblock, 0, BYTES(RATE)); /* burn full state dump */
    burn(state, 0, sizeof(norx_state_t)); /* at this point we can also burn the state */
}

/* Verify tags in constant time: 0 for success, -1 for fail */
int norx_verify_tag(const unsigned char * tag1, const unsigned char * tag2)
{
    unsigned acc = 0;
    size_t i;

    for(i = 0; i < BYTES(NORX_A); ++i)
        acc |= tag1[i] ^ tag2[i];

    return (((acc - 1) >> 8) & 1) - 1;
}

void norx_aead_encrypt(
  unsigned char *c, size_t *clen,
  const unsigned char *h, size_t hlen,
  const unsigned char *p, size_t plen,
  const unsigned char *t, size_t tlen,
  const unsigned char *nonce,
  const unsigned char *key
)
{
    norx_state_t state;
#if defined(NORX_DEBUG)
    printf("ENCRYPTION\n");
#endif
    norx_init(state, key, nonce);
    norx_process_header(state, h, hlen);
    norx_encrypt_msg(state, c, p, plen);
    norx_process_trailer(state, t, tlen);
    norx_output_tag(state, c + plen); /* append tag to ciphertext */
    *clen = plen + BYTES(NORX_A);
    burn(state, 0, sizeof(norx_state_t));
}

int norx_aead_decrypt(
  unsigned char *p, size_t *plen,
  const unsigned char *h, size_t hlen,
  const unsigned char *c, size_t clen,
  const unsigned char *t, size_t tlen,
  const unsigned char *nonce,
  const unsigned char *key
)
{
    unsigned char tag[BYTES(NORX_A)];
    norx_state_t state;
    int result = -1;

    if (clen < BYTES(NORX_A))
        return -1;

#if defined(DEBUG)
    printf("DECRYPTION\n");
#endif
    norx_init(state, key, nonce);
    norx_process_header(state, h, hlen);
    norx_decrypt_msg(state, p, c, clen - BYTES(NORX_A));
    norx_process_trailer(state, t, tlen);
    norx_output_tag(state, tag);
    *plen = clen - BYTES(NORX_A);

    result = norx_verify_tag(c + clen - BYTES(NORX_A), tag);
    if(result != 0) /* burn decrypted plaintext on auth failure */
        burn(p, 0, clen - BYTES(NORX_A));
    burn(state, 0, sizeof(norx_state_t));
    return result;
}


