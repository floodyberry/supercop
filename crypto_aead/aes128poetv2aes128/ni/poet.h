/*
// @author Eik List
// @last-modified 2015-09-01
// This is free and unencumbered software released into the public domain.
//
// Anyone is free to copy, modify, publish, use, compile, sell, or
// distribute this software, either in source code form or as a compiled
// binary, for any purpose, commercial or non-commercial, and by any
// means.
//
// In jurisdictions that recognize copyright laws, the author or authors
// of this software dedicate any and all copyright interest in the
// software to the public domain. We make this dedication for the benefit
// of the public at large and to the detriment of our heirs and
// successors. We intend this dedication to be an overt act of
// relinquishment in perpetuity of all present and future rights to this
// software under copyright law.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
// IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
// OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
// OTHER DEALINGS IN THE SOFTWARE.
//
// For more information, please refer to <http://unlicense.org/>
*/
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
#define ROUND_KEYS     11

#define NUM_BLOCKS_PER_PART     0
#define INTERMEDIATE_TAGLEN     0

typedef __m128i  AES_KEY[ROUND_KEYS];
typedef __m128i  AXU_KEY[ROUND_KEYS];

// ---------------------------------------------------------------------

typedef struct {
    AES_KEY aes_enc;   // Expanded encryption key for the AES
    AES_KEY aes_dec;   // Expanded decryption key for the AES
    AXU_KEY aes_axu;   // Expanded key for the AXU hash function (top and bottom)
    __m128i l;         // Masking key for the header-processing step
    __m128i x;         // Top-chaining value
    __m128i y;         // Bottom-chaining value
    __m128i tau;       // Result of the header-processing step
    unsigned long long mlen;     // Message length
} poet_ctx_t;

// ---------------------------------------------------------------------

void keysetup_encrypt_only(poet_ctx_t *ctx, 
                           const unsigned char key[KEYLEN]);

void keysetup(poet_ctx_t *ctx, 
              const unsigned char key[KEYLEN]);

void process_header(poet_ctx_t *ctx,
                    const unsigned char *header,
                    unsigned long long header_len);

void encrypt_final(poet_ctx_t *ctx,
                   const unsigned char *plaintext,
                   unsigned long long plen,
                   unsigned char *ciphertext,
                   unsigned long long* clen, 
                   unsigned char tag[TAGLEN]);

int decrypt_final(poet_ctx_t *ctx,
                  const unsigned char *ciphertext,
                  unsigned long long clen,
                  const unsigned char tag[TAGLEN],
                  unsigned char *plaintext,
                  unsigned long long* plen);

#endif //  _POET_H_
