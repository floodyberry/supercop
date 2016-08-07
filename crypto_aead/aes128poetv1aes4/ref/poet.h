#ifndef _POET_H_
#define _POET_H_

#include <stdint.h>
#include "aes.h"
#include "api.h"

// ---------------------------------------------------------------------

#define BLOCKLEN      CRYPTO_NPUBBYTES
#define BLOCKLEN_BITS CRYPTO_NPUBBYTES*8
#define KEYLEN        CRYPTO_KEYBYTES
#define KEYLEN_BITS   KEYLEN*8
#define TAGLEN        CRYPTO_ABYTES

#define SUCCESS 0
#define FAIL    1

// ---------------------------------------------------------------------

typedef unsigned char block[BLOCKLEN];
typedef int boolean;

// ---------------------------------------------------------------------

typedef struct {
  AES_KEY aes_enc;   // Expanded encryption key for the AES
  AES_KEY aes_dec;   // Expanded decryption key for the AES
  AES_KEY aes_lt;    // Expanded key for the top AXU hash function
  AES_KEY aes_lb;    // Expanded key for the bottom AXU hash function
  block k;           // Block-cipher key
  block tm;          // Key for the tag block
  block l;           // PMAC key
  block lt;          // Key for the top AXU hash function
  block lb;          // Key for the bottom AXU hash function
  block x;           // Top-chaining value
  block y;           // Bottom-chaining value
  block tau;         // Result of the header-processing step
  uint64_t mlen;     // Message length
} poet_ctx_t;

// ---------------------------------------------------------------------

void keysetup(poet_ctx_t *ctx, 
              const uint8_t key[KEYLEN]);

void process_header(poet_ctx_t *ctx, 
                    const uint8_t *header, 
                    uint64_t header_len);

void encrypt_final(poet_ctx_t *ctx, 
                   const uint8_t *plaintext, 
                   uint64_t plen, 
                   uint8_t *ciphertext, 
                   uint8_t tag[BLOCKLEN]);

int decrypt_final(poet_ctx_t *ctx, 
                  const uint8_t *ciphertext, 
                  uint64_t clen, 
                  const uint8_t tag[BLOCKLEN], 
                  uint8_t *plaintext);

// ---------------------------------------------------------------------

#endif //  _POET_H_
