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

#include <stdint.h>
#include "aes.h"
#include "api.h"

// ---------------------------------------------------------------------

#define BLOCKLEN      CRYPTO_NPUBBYTES
#define BLOCKLEN_BITS CRYPTO_NPUBBYTES*8
#define KEYLEN        CRYPTO_KEYBYTES
#define KEYLEN_BITS   KEYLEN*8
#define TAGLEN        CRYPTO_ABYTES

#define NUM_BLOCKS_PER_PART     0
#define INTERMEDIATE_TAGLEN     0

#define SUCCESS 0
#define FAIL    1

// ---------------------------------------------------------------------

typedef unsigned char block[BLOCKLEN];
typedef int boolean;

// ---------------------------------------------------------------------

typedef struct {
  AES_KEY aes_enc;   // Expanded encryption key for the AES
  AES_KEY aes_dec;   // Expanded decryption key for the AES
  AES_KEY aes_axu;   // Expanded key for the AXU hash function (top and bottom)
  block k;           // Block-cipher key
  block l;           // PMAC key
  block k_axu;       // Key for the AXU hash function (top and bottom)
  block x;           // Top-chaining value
  block y;           // Bottom-chaining value
  block tau;         // Result of the header-processing step
  uint64_t mlen;     // Message length
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

// ---------------------------------------------------------------------

#endif //  _POET_H_
