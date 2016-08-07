#ifndef _POET_H_
#define _POET_H_

#include <emmintrin.h>
#include <smmintrin.h>
#include <wmmintrin.h>
#include "api.h"

// ---------------------------------------------------------------------

#define BLOCKLEN      CRYPTO_NPUBBYTES
#define KEYLEN        CRYPTO_KEYBYTES
#define TAGLEN        CRYPTO_ABYTES
#define ROUNDS         10
#define AXU_ROUNDS      4
#define ROUND_KEYS     11
#define ROUND_KEYS_FOUR 5

typedef __m128i  AES_KEY[ROUND_KEYS];
typedef __m128i  AXU_KEY[ROUND_KEYS_FOUR];

// ---------------------------------------------------------------------

typedef struct {
    AES_KEY aes_enc;   // Expanded encryption key for the AES
    AES_KEY aes_dec;   // Expanded decryption key for the AES
    AXU_KEY aes_lt;    // Expanded key for the top AXU hash function
    AXU_KEY aes_lb;    // Expanded key for the bottom AXU hash function
    __m128i tm;        // Key for the tag block
    __m128i l;         // Masking key for the header-processing step
    __m128i x;         // Top-chaining value
    __m128i y;         // Bottom-chaining value
    __m128i tau;       // Result of the header-processing step
    unsigned long long mlen;     // Message length
} poet_ctx_t;

// ---------------------------------------------------------------------

void keysetup(poet_ctx_t *ctx, const unsigned char key[KEYLEN]);

void process_header(poet_ctx_t *ctx,
                    const unsigned char *header,
                    unsigned long long header_len);

void encrypt_final(poet_ctx_t *ctx,
                   const unsigned char *plaintext,
                   unsigned long long plen,
                   unsigned char *ciphertext,
                   unsigned char tag[BLOCKLEN]);

int decrypt_final(poet_ctx_t *ctx,
                  const unsigned char *ciphertext,
                  unsigned long long clen,
                  const unsigned char tag[BLOCKLEN],
                  unsigned char *plaintext);

#endif //  _POET_H_
