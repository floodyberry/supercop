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
#ifdef DEBUG
    #include <stdio.h>
#endif
#include <string.h>
#include "poet.h"

// ---------------------------------------------------------------------

static const unsigned char POLYNOMIAL = 0xE1;
static const unsigned char MSB_MASK = 0x01;

// ---------------------------------------------------------------------

#define TOP_HASH     aes_encrypt(ctx->x, ctx->x, &(ctx->aes_axu))
#define BOTTOM_HASH  aes_encrypt(ctx->y, ctx->y, &(ctx->aes_axu))

// ---------------------------------------------------------------------

#ifdef DEBUG
static void print_block(const char *label, const uint8_t *c)
{
    printf("%s: \n", label);
    int i;

    for (i = 0; i < BLOCKLEN; i++) {
        printf("%02x ", c[i]);
    }

    puts("\n");
}
#endif

// ---------------------------------------------------------------------

static int compare_blocks(const unsigned char* a, 
                          const unsigned char* b, 
                          const size_t num_bytes)
{
    unsigned char result = 0;
    size_t i;
    
    for (i = 0; i < num_bytes; i++) {
        result |= a[i] ^ b[i];
    }
    
    return result;
}

// ---------------------------------------------------------------------

static inline void xor_block(block c, const block a, const block b)
{
    size_t i;
    for (i = 0; i < BLOCKLEN; i++) {
        c[i] = a[i] ^ b[i];
    }
}

// ---------------------------------------------------------------------

static inline void to_array(unsigned char* dst, 
                            const uint64_t* src, 
                            const size_t n)
{
    size_t i;
    size_t j;
    for (i = 0; i < n; i++) {
        for (j = 0; j < 8; ++j) {
            dst[i*8+j] = (unsigned char)((src[i] >> (8*j)) & 0xFF);
        }
    }
}

// ---------------------------------------------------------------------

static void encode_length(block s, const uint64_t len) 
{
    memset(s, 0x00, BLOCKLEN);
    to_array(s, &len, 1);
}

// ---------------------------------------------------------------------

static void shift_right(block h)
{
    size_t i;
    for (i = BLOCKLEN-1; i > 0; --i) {
        h[i] = (h[i] >> 1) | (h[i-1] << 7);
    }

    h[0] = h[0] >> 1;
}

// ---------------------------------------------------------------------

static void gf128_double(block h)
{
    const unsigned char msb = (h[BLOCKLEN-1] & MSB_MASK);
    shift_right(h);
    h[0] ^= msb * POLYNOMIAL;
}

// ---------------------------------------------------------------------

void keysetup_encrypt_only(poet_ctx_t *ctx, const unsigned char key[KEYLEN_BITS])
{
    block ctr;
    AES_KEY aes_enc;

    memset(ctx->tau, 0, BLOCKLEN);
    memset(ctr, 0, BLOCKLEN);

    //  Generate block cipher key 
    aes_expand_enc_key(key, KEYLEN_BITS, &aes_enc);
    aes_encrypt(ctr, ctx->k, &aes_enc);

    aes_expand_enc_key(ctx->k, KEYLEN_BITS, &(ctx->aes_enc));

    //  Generate header key 
    ctr[BLOCKLEN - 1] = 1; 
    aes_encrypt(ctr, ctx->l, &aes_enc);

    //  Generate e-AXU hash-function keys 
    ctr[BLOCKLEN - 1] = 2; 
    aes_encrypt(ctr, ctx->k_axu, &aes_enc);
    aes_expand_enc_key(ctx->k_axu, KEYLEN_BITS, &(ctx->aes_axu));
}

// ---------------------------------------------------------------------

void keysetup(poet_ctx_t *ctx, const unsigned char key[KEYLEN_BITS])
{
    keysetup_encrypt_only(ctx, key);
    aes_expand_dec_key(ctx->k, KEYLEN_BITS, &(ctx->aes_dec));
}

// ---------------------------------------------------------------------

static void encode_parameters(block s, 
                              const unsigned long long num_blocks_per_part, 
                              const unsigned long long intermediate_taglen) 
{
    size_t j;
    memset(s, 0x00, BLOCKLEN);
    
    for (j = 0; j < 8; ++j) {
        s[j] = (unsigned char)((num_blocks_per_part >> (8*j)) & 0xFF);
        s[8+j] = (unsigned char)((intermediate_taglen >> (8*j)) & 0xFF);
    }
}

// ---------------------------------------------------------------------

void process_header(poet_ctx_t *ctx,
                    const unsigned char *header,
                    unsigned long long header_len)
{
    block mask;
    block in;
    block out;
    uint64_t offset = 0;

    ctx->mlen = 0;
    memset(ctx->tau, 0, BLOCKLEN);
    memcpy(mask, ctx->l, BLOCKLEN);

    // Process parameters
    encode_parameters(in, NUM_BLOCKS_PER_PART, INTERMEDIATE_TAGLEN);

    xor_block(in, in, mask);

    aes_encrypt(in, out, &(ctx->aes_enc));
    xor_block(ctx->tau, out, ctx->tau);
    gf128_double(mask);

    while (header_len >= BLOCKLEN) {
        xor_block(in, header + offset, mask);
        aes_encrypt(in, out, &(ctx->aes_enc));
        xor_block(ctx->tau, out, ctx->tau);

        offset += BLOCKLEN;
        header_len -= BLOCKLEN;

        gf128_double(mask);
    }

    //  Final block 
    memset(in, 0, BLOCKLEN);
    memcpy(in, header + offset, header_len);
    in[header_len] = 0x80;
    xor_block(in, mask, in);
    aes_encrypt(in, out, &(ctx->aes_enc));

    xor_block(ctx->tau, out, ctx->tau);
    aes_encrypt(ctx->tau, ctx->tau, &(ctx->aes_enc));

    memcpy(ctx->x, ctx->tau, BLOCKLEN);
    memcpy(ctx->y, ctx->tau, BLOCKLEN);
    ctx->y[BLOCKLEN - 1] ^= 1;
}

// ---------------------------------------------------------------------

static void encrypt_block(poet_ctx_t *ctx, 
                          const block in, 
                          block out)
{
    block tmp;
    TOP_HASH;
    xor_block(ctx->x, in, ctx->x);

    aes_encrypt(ctx->x, tmp, &(ctx->aes_enc)); // in, out, key

    BOTTOM_HASH;
    xor_block(out, tmp, ctx->y); // result, a, b

    memcpy(ctx->y, tmp, BLOCKLEN);
    ctx->mlen += BLOCKLEN_BITS;
}

// ---------------------------------------------------------------------

void encrypt_final(poet_ctx_t *ctx,
                   const unsigned char *plaintext,
                   unsigned long long plen,
                   unsigned char *ciphertext,
                   unsigned long long* clen, 
                   unsigned char tag[TAGLEN])
{
    uint64_t offset = 0;
    block s;
    block tmp;
    block tmp2;

    if (clen) {
        *clen = plen;
    }

    while (plen > BLOCKLEN) {
        encrypt_block(ctx, (plaintext + offset), (ciphertext + offset));
        plen -= BLOCKLEN;
        offset += BLOCKLEN;
    }

    // Encrypt the message length
    ctx->mlen += plen * 8;
    encode_length(s, ctx->mlen);
    aes_encrypt(s, s, &(ctx->aes_enc));

    // Last message block must be padded if necessary
    memcpy(tmp, plaintext + offset, plen);
    memcpy(tmp + plen, ctx->tau, BLOCKLEN - plen);

    // Process last block + generate the tag
    TOP_HASH;

    xor_block(tmp, s, tmp);
    xor_block(ctx->x, tmp, ctx->x);

    aes_encrypt(ctx->x, tmp, &(ctx->aes_enc));

    BOTTOM_HASH;
    
    xor_block(tmp2, tmp, ctx->y);
    memcpy(ctx->y, tmp, BLOCKLEN);
    xor_block(tmp, s, tmp2);

    // Perform tag splitting if needed
    memcpy(ciphertext + offset, tmp, plen);
    memcpy(tag, tmp + plen, BLOCKLEN - plen);

    // Generate tag
    TOP_HASH;
    xor_block(ctx->x, ctx->tau, ctx->x);
    aes_encrypt(ctx->x, tmp, &(ctx->aes_enc));

    BOTTOM_HASH;
    xor_block(tmp, ctx->y, tmp);
    xor_block(tmp, ctx->tau, tmp);
    
    memcpy(tag + (BLOCKLEN - plen), tmp, plen);
}

// ---------------------------------------------------------------------

static void decrypt_block(poet_ctx_t *ctx,
                          const block in,
                          block out)
{
    block tmp;
    BOTTOM_HASH;
    
    xor_block(ctx->y, in, ctx->y);
    aes_decrypt(ctx->y, tmp, &(ctx->aes_dec));

    TOP_HASH;
    
    xor_block(out, tmp, ctx->x);
    memcpy(ctx->x, tmp, BLOCKLEN);
    ctx->mlen += BLOCKLEN_BITS;
}

// ---------------------------------------------------------------------

int decrypt_final(poet_ctx_t *ctx,
                  const unsigned char *ciphertext,
                  unsigned long long clen,
                  const unsigned char tag[TAGLEN],
                  unsigned char *plaintext,
                  unsigned long long* plen)
{
    uint64_t offset = 0;
    block s;
    block tmp;
    block tmp2;
    int alpha;
    int beta;

    if (plen) {
        *plen = clen;
    }

    while (clen > BLOCKLEN) {
        decrypt_block(ctx, ciphertext + offset, plaintext + offset);
        clen -= BLOCKLEN;
        offset += BLOCKLEN;
    }

    // Encrypt the message length
    ctx->mlen += clen * 8;
    encode_length(s, ctx->mlen);
    aes_encrypt(s, s, &(ctx->aes_enc));

    // Pad the final ciphertext block if necessary
    memcpy(tmp, ciphertext + offset, clen);
    memcpy(tmp + clen, tag, BLOCKLEN - clen);

    // Process last block and generate the tag
    BOTTOM_HASH;
    xor_block(tmp, s, tmp);
    
    xor_block(ctx->y, tmp, ctx->y);
    aes_decrypt(ctx->y, tmp, &(ctx->aes_dec));

    TOP_HASH;
    xor_block(tmp2, tmp, ctx->x);
    xor_block(tmp2, s, tmp2);
    memcpy(ctx->x, tmp, BLOCKLEN);

    // Perform tag splitting if needed
    memcpy(plaintext + offset, tmp2, clen);
    alpha = compare_blocks(tmp2 + clen, ctx->tau, BLOCKLEN - clen);

    // Generate tag
    TOP_HASH;
    xor_block(ctx->x, ctx->tau , ctx->x);
    aes_encrypt(ctx->x, tmp, &(ctx->aes_enc));

    BOTTOM_HASH;
    xor_block(tmp, ctx->y, tmp);
    xor_block(tmp, ctx->tau, tmp);

    beta = compare_blocks(tmp, tag + (BLOCKLEN - clen), clen);
    return alpha | beta;
}

