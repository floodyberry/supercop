/*
// @author Eik List
// @last-modified 2015-09-01
// Re-uses some functions/macros from the AEZv3 implementation. 
// Credits for these to Ted Krovetz.
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
#include <emmintrin.h>
#include <smmintrin.h>
#include <wmmintrin.h>
#include <stdint.h>
#include "poet.h"
#include "api.h"

#ifdef DEBUG
    #include <stdio.h>
#endif

// ---------------------------------------------------------------------
// Load + Store
// ---------------------------------------------------------------------

#define zero           _mm_setzero_si128()
#define one            _mm_insert_epi8(zero, 1, 15)
#define two            _mm_insert_epi8(zero, 2, 15)
#define vand(x,y)      _mm_and_si128(x,y)
#define vor(x,y)       _mm_or_si128(x,y)
#define vxor(x,y)      _mm_xor_si128(x,y)
#define vxor3(x,y,z)   _mm_xor_si128(_mm_xor_si128(x,y),z)

// ---------------------------------------------------------------------
// Load + Store
// ---------------------------------------------------------------------

static __m128i loadu(const void* p) { return _mm_loadu_si128((__m128i*)p); }
static __m128i load(const void* p)  { return _mm_load_si128((__m128i*)p);  }
static void storeu(const void* p, __m128i x) { _mm_storeu_si128((__m128i*)p, x); }
static void store(const void* p, __m128i x)  { _mm_store_si128((__m128i*)p, x);  }

// ---------------------------------------------------------------------

/**
 * Returns a new __m128i value with its leftmost n bytes initialized with the
 * leftmost n bytes of p.
 */
static __m128i load_n_bytes(const uint8_t* p, const size_t num_bytes)
{
    if (num_bytes == 0) {
        return zero;
    } else if (num_bytes % 16 == 0) {
        return _mm_loadu_si128((__m128i*)p);
    } else {
        __m128i tmp;
        unsigned i;

        for (i = 0; i < num_bytes; ++i) {
            ((char*)&tmp)[i] = ((char*)p)[i];
        }

        return tmp;
    }
}

// ---------------------------------------------------------------------

/**
 * Stores the rightmost n bytes of x in the leftmost n bytes of p.
 * @example:
 * x = [1f,1e,1d..13,12,11,10], 
 * p = [01,02,03..0c,0d,0e,0f], and
 * n = 2 yields
 * p = [1f,1e,03..0c,0d,0e,0f]
 */
static void store_partial_left(const uint8_t* p, 
                               __m128i x, 
                               const size_t num_bytes)
{
    if (num_bytes == 0) {
        return;
    } else if (num_bytes >= 16) {
        storeu(p, x);
    } else {
        size_t i;
        char* p_ = (char*)p;
        char* x_ = (char*)&x;

        for (i = 0; i < num_bytes; ++i) {
            p_[i] = x_[i];
        }
    }
}

// ---------------------------------------------------------------------

/**
 * Stores the rightmost n bytes of x in the leftmost n bytes of p.
 * @example:
 * x = [1f,1e,1d..13,12,11,10], 
 * p = [01,02,03..0c,0d,0e,0f], and
 * n = 2 yields
 * p = [11,10,03..0c,0d,0e,0f]
 */
static void store_partial_right(const uint8_t* p, 
                                __m128i x, 
                                const size_t num_bytes)
{
    if (num_bytes == 0) {
        return;
    } else if (num_bytes >= 16) {
        storeu(p, x);
    } else {
        size_t i;
        char* p_ = (char*)p;
        char* x_ = (char*)&x;

        for (i = 0; i < num_bytes; ++i) {
            p_[i] = x_[(16 - num_bytes) + i];
        }
    }
}

// ---------------------------------------------------------------------

/**
 * Stores the rightmost n bytes of x in the leftmost n bytes of p.
 * @example:
 * x = [1f,1e,1d..13,12,11,10], 
 * p = [01,02,03..0c,0d,0e,0f], and
 * n = 2 yields
 * p = [01,02,03..0c,0d,1f,1e]
 */
static void store_partial_from_left_to_right(const uint8_t* p,
        __m128i x,
        const size_t num_bytes)
{
    if (num_bytes == 0) {
        return;
    } else if (num_bytes >= 16) {
        storeu(p, x);
    } else {
        size_t i;
        char* p_ = (char*)p;
        char* x_ = (char*)&x;

        for (i = 0; i < num_bytes; ++i) {
            p_[(16 - num_bytes) + i] = x_[i];
        }
    }
}

// ---------------------------------------------------------------------

#ifdef DEBUG
static void print128(char* label, __m128i var)
{
    uint8_t val[BLOCKLEN];
    store(val, var);
    printf("%s\n", label);
    size_t i;

    for (i = 0; i < BLOCKLEN; ++i) {
        printf("%02x ", val[i]);
    }

    puts("\n");
}
#endif

// ---------------------------------------------------------------------
// Pad + Shift
// ---------------------------------------------------------------------

static const unsigned char pad[] = {
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x80, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
};

// ---------------------------------------------------------------------

static __m128i zero_pad(__m128i x, unsigned num_zero_bytes)
{
    return vand(x, loadu((__m128i*)(pad + num_zero_bytes)));
}

// ---------------------------------------------------------------------

static __m128i one_zero_pad(__m128i x, size_t num_padding_bytes)
{
    __m128i *p = (__m128i*)(pad + num_padding_bytes);
    return vor(vand(x, loadu(p)), loadu(p + 1));
}

// ---------------------------------------------------------------------

static __m128i shift_right_in(__m128i a, const size_t num_bytes) {
    size_t count = num_bytes * 8;
    __m128i result, tmp;
    result = _mm_srli_epi64(a, count);
    tmp = _mm_srli_si128(a, 8);
    tmp = _mm_slli_epi64(tmp, 64 - (count));
    result = _mm_or_si128(result, tmp);
    return result;
}

// ---------------------------------------------------------------------

static __m128i shift_right(__m128i a, const size_t num_bytes) {
    if (num_bytes == 0) {
        return a;
    } else if (num_bytes >= 16) {
        return zero;
    } else if (num_bytes < 8) {
        return shift_right_in(a, num_bytes);
    } else if (num_bytes == 8) { 
        return _mm_srli_si128(a,  8); 
    } else {
        a = _mm_srli_si128(a,  8);
        return _mm_srli_epi64(a, (num_bytes-8) * 8);
    }
}

// ---------------------------------------------------------------------

static __m128i shift_left_in(__m128i a, const size_t num_bytes) {
    size_t count = num_bytes * 8;
    __m128i result, tmp;
    result = _mm_slli_epi64(a, count);
    tmp = _mm_slli_si128(a, 8);
    tmp = _mm_srli_epi64(tmp, 64 - (count));
    result = _mm_or_si128(result, tmp);
    return result;
}

// ---------------------------------------------------------------------

static __m128i shift_left(__m128i a, const size_t num_bytes) {
    if (num_bytes == 0) {
        return a;
    } else if (num_bytes >= 16) {
        return zero;
    } else if (num_bytes < 8) {
        return shift_left_in(a, num_bytes);
    } else if (num_bytes == 8) { 
        return _mm_slli_si128(a,  8); 
    } else {
        a = _mm_slli_si128(a,  8);
        return _mm_slli_epi64(a, (num_bytes-8) * 8);
    }
}

// ---------------------------------------------------------------------
// AES-related
// ---------------------------------------------------------------------

static void aes_create_decryption_key(const AES_KEY enc_key, AES_KEY dec_key)
{
    dec_key[10] = enc_key[0];
    dec_key[9] = _mm_aesimc_si128(enc_key[1]);
    dec_key[8] = _mm_aesimc_si128(enc_key[2]);
    dec_key[7] = _mm_aesimc_si128(enc_key[3]);
    dec_key[6] = _mm_aesimc_si128(enc_key[4]);
    dec_key[5] = _mm_aesimc_si128(enc_key[5]);
    dec_key[4] = _mm_aesimc_si128(enc_key[6]);
    dec_key[3] = _mm_aesimc_si128(enc_key[7]);
    dec_key[2] = _mm_aesimc_si128(enc_key[8]);
    dec_key[1] = _mm_aesimc_si128(enc_key[9]);
    dec_key[0] = enc_key[10];
}

// ---------------------------------------------------------------------

static __m128i aes_keygen_assist(__m128i temp1, __m128i temp2)
{
    __m128i temp3;
    temp2 = _mm_shuffle_epi32(temp2, 0xff);
    temp3 = _mm_slli_si128(temp1, 0x4);
    temp1 = _mm_xor_si128(temp1, temp3);
    temp3 = _mm_slli_si128(temp3, 0x4);
    temp1 = _mm_xor_si128(temp1, temp3);
    temp3 = _mm_slli_si128(temp3, 0x4);
    temp1 = _mm_xor_si128(temp1, temp3);
    return _mm_xor_si128(temp1, temp2);
}

// ---------------------------------------------------------------------

#define aes_create_round_key(temp1, temp2, rcon, k) \
    temp2 = _mm_aeskeygenassist_si128(temp1, rcon); \
    temp1 = aes_keygen_assist(temp1, temp2); \
    _mm_store_si128(k, temp1)

// ---------------------------------------------------------------------

static void aes_expand_key(__m128i userkey, AES_KEY enc_key)
{
    __m128i temp1, temp2;
    __m128i *key = (__m128i*)enc_key;

    _mm_store_si128(&temp1, userkey);
    _mm_store_si128(&key[0], temp1);

    aes_create_round_key(temp1, temp2, 0x01, &key[1]);
    aes_create_round_key(temp1, temp2, 0x02, &key[2]);
    aes_create_round_key(temp1, temp2, 0x04, &key[3]);
    aes_create_round_key(temp1, temp2, 0x08, &key[4]);
    aes_create_round_key(temp1, temp2, 0x10, &key[5]);
    aes_create_round_key(temp1, temp2, 0x20, &key[6]);
    aes_create_round_key(temp1, temp2, 0x40, &key[7]);
    aes_create_round_key(temp1, temp2, 0x80, &key[8]);
    aes_create_round_key(temp1, temp2, 0x1b, &key[9]);
    aes_create_round_key(temp1, temp2, 0x36, &key[10]);
}

// ---------------------------------------------------------------------

static __m128i aes_encrypt(__m128i in, __m128i* k)
{
    __m128i x = _mm_xor_si128(in, k[0]);
    x = _mm_aesenc_si128(x, k[1]);
    x = _mm_aesenc_si128(x, k[2]);
    x = _mm_aesenc_si128(x, k[3]);
    x = _mm_aesenc_si128(x, k[4]);
    x = _mm_aesenc_si128(x, k[5]);
    x = _mm_aesenc_si128(x, k[6]);
    x = _mm_aesenc_si128(x, k[7]);
    x = _mm_aesenc_si128(x, k[8]);
    x = _mm_aesenc_si128(x, k[9]);
    return _mm_aesenclast_si128(x, k[10]);
}

// ---------------------------------------------------------------------
// Doubling
// ---------------------------------------------------------------------

static __m128i double_block_in(__m128i block) {
    const __m128i mask = _mm_set_epi32(135, 1, 1, 1);
    __m128i tmp = _mm_srai_epi32(block, 31);
    tmp = _mm_and_si128(tmp, mask);
    tmp = _mm_shuffle_epi32(tmp, _MM_SHUFFLE(2, 1, 0, 3));
    block = _mm_slli_epi32(block, 1);
    return vxor(block, tmp);
}

// ---------------------------------------------------------------------
// Only for testing. To be compatible with the inverted GF doubling of
// POET v1.
// ---------------------------------------------------------------------

static unsigned long long reverse_bits(unsigned long long x)
{
    x = ((x & UINT64_C(0x0f0f0f0f0f0f0f0f)) << 4)
        | ((x & UINT64_C(0xf0f0f0f0f0f0f0f0)) >> 4);
    x = ((x & UINT64_C(0x3333333333333333)) << 2)
        | ((x & UINT64_C(0xcccccccccccccccc)) >> 2);
    x = ((x & UINT64_C(0x5555555555555555)) << 1)
        | ((x & UINT64_C(0xaaaaaaaaaaaaaaaa)) >> 1);
    return x;
}

// ---------------------------------------------------------------------

static __m128i bit_revert(__m128i block)
{
    uint64_t bytes[2];
    store(bytes, block);
    bytes[0] = reverse_bits(bytes[0]);
    bytes[1] = reverse_bits(bytes[1]);
    return load(bytes);
}

// ---------------------------------------------------------------------

static __m128i double_block(__m128i block)
{
    return bit_revert(double_block_in(bit_revert(block)));
}

// ---------------------------------------------------------------------
// POET-specific functions
// ---------------------------------------------------------------------

static __m128i encode_length(const uint64_t len)
{
    return _mm_insert_epi64(zero, 8 * len, 0);
}

// ---------------------------------------------------------------------

static __m128i encode_parameters(const uint64_t num_blocks_per_part, 
                                 const uint64_t intermediate_taglen)
{
    __m128i params = _mm_insert_epi64(zero, num_blocks_per_part, 0);
    return _mm_insert_epi64(params, intermediate_taglen, 1);
}

// ---------------------------------------------------------------------

void process_header(poet_ctx_t *ctx,
                    const unsigned char *header,
                    unsigned long long header_len)
{
    __m128i l = ctx->l;
    __m128i sum = encode_parameters(NUM_BLOCKS_PER_PART, INTERMEDIATE_TAGLEN);
    sum = aes_encrypt(vxor(sum, l), ctx->aes_enc);
    l = double_block(l);

    while (header_len >= 8 * BLOCKLEN) {
        sum = vxor(sum, aes_encrypt(vxor(load(header     ), l), ctx->aes_enc));
        l = double_block(l);
        sum = vxor(sum, aes_encrypt(vxor(load(header + 16), l), ctx->aes_enc));
        l = double_block(l);
        sum = vxor(sum, aes_encrypt(vxor(load(header + 32), l), ctx->aes_enc));
        l = double_block(l);
        sum = vxor(sum, aes_encrypt(vxor(load(header + 48), l), ctx->aes_enc));
        l = double_block(l);
        sum = vxor(sum, aes_encrypt(vxor(load(header + 64), l), ctx->aes_enc));
        l = double_block(l);
        sum = vxor(sum, aes_encrypt(vxor(load(header + 80), l), ctx->aes_enc));
        l = double_block(l);
        sum = vxor(sum, aes_encrypt(vxor(load(header + 96), l), ctx->aes_enc));
        l = double_block(l);
        sum = vxor(sum, aes_encrypt(vxor(load(header + 112), l), ctx->aes_enc));
        l = double_block(l);
        header_len -= 8 * BLOCKLEN;
        header += 8 * BLOCKLEN;
    }

    if (header_len >= 4 * BLOCKLEN) {
        sum = vxor(sum, aes_encrypt(vxor(load(header     ), l), ctx->aes_enc));
        l = double_block(l);
        sum = vxor(sum, aes_encrypt(vxor(load(header + 16), l), ctx->aes_enc));
        l = double_block(l);
        sum = vxor(sum, aes_encrypt(vxor(load(header + 32), l), ctx->aes_enc));
        l = double_block(l);
        sum = vxor(sum, aes_encrypt(vxor(load(header + 48), l), ctx->aes_enc));
        l = double_block(l);
        header_len -= 4 * BLOCKLEN;
        header += 4 * BLOCKLEN;
    }

    if (header_len >= 2 * BLOCKLEN) {
        sum = vxor(sum, aes_encrypt(vxor(load(header     ), l), ctx->aes_enc));
        l = double_block(l);
        sum = vxor(sum, aes_encrypt(vxor(load(header + 16), l), ctx->aes_enc));
        l = double_block(l);
        header_len -= 2 * BLOCKLEN;
        header += 2 * BLOCKLEN;
    }

    if (header_len >= BLOCKLEN) {
        sum = vxor(aes_encrypt(vxor(load(header), l), ctx->aes_enc), sum);
        l = double_block(l);
        header_len -= BLOCKLEN;
        header += BLOCKLEN;
    }

    __m128i tmp = one_zero_pad(
        load_n_bytes(header, header_len), BLOCKLEN - header_len
    );
    sum = vxor(aes_encrypt(vxor(l, tmp), ctx->aes_enc), sum);

    ctx->tau = aes_encrypt(sum, ctx->aes_enc);
    ctx->x = ctx->tau;
    ctx->y = vxor(ctx->tau, one);
}

// ---------------------------------------------------------------------

#define xor_2blocks(x, y, kx, ky) \
    x = vxor(x, kx); \
    y = vxor(y, ky)

// ---------------------------------------------------------------------

#define aes_encrypt_round_2blocks(x, y, kx, ky) \
    x = _mm_aesenc_si128(x, kx); \
    y = _mm_aesenc_si128(y, ky)

// ---------------------------------------------------------------------

#define aes_encrypt_last_round_2blocks(x, y, kx, ky) \
    x = _mm_aesenclast_si128(x, kx); \
    y = _mm_aesenclast_si128(y, ky)

// ---------------------------------------------------------------------

#define aes_encrypt_2blocks(x, y, kx, ky) \
    xor_2blocks(x, y, kx[0], ky[0]); \
    aes_encrypt_round_2blocks(x, y, kx[1], ky[1]); \
    aes_encrypt_round_2blocks(x, y, kx[2], ky[2]); \
    aes_encrypt_round_2blocks(x, y, kx[3], ky[3]); \
    aes_encrypt_round_2blocks(x, y, kx[4], ky[4]); \
    aes_encrypt_round_2blocks(x, y, kx[5], ky[5]); \
    aes_encrypt_round_2blocks(x, y, kx[6], ky[6]); \
    aes_encrypt_round_2blocks(x, y, kx[7], ky[7]); \
    aes_encrypt_round_2blocks(x, y, kx[8], ky[8]); \
    aes_encrypt_round_2blocks(x, y, kx[9], ky[9]); \
    aes_encrypt_last_round_2blocks(x, y, kx[10], ky[10])

// ---------------------------------------------------------------------

#define xor_3blocks(x, y, z, kx, ky, kz) \
    x = vxor(x, kx); \
    y = vxor(y, ky); \
    z = vxor(z, kz)

// ---------------------------------------------------------------------

#define aes_encrypt_round_3blocks(x, y, z, kx, ky, kz) \
    x = _mm_aesenc_si128(x, kx); \
    y = _mm_aesenc_si128(y, ky); \
    z = _mm_aesenc_si128(z, kz)

// ---------------------------------------------------------------------

#define aes_encrypt_last_round_3blocks(x, y, z, kx, ky, kz) \
    x = _mm_aesenclast_si128(x, kx); \
    y = _mm_aesenclast_si128(y, ky); \
    z = _mm_aesenclast_si128(z, kz)

// ---------------------------------------------------------------------

#define aes_encrypt_3blocks(x, y, z, k, hk, p, c, tmp_x, tmp_y, tmp_z) \
    aes_encrypt_round_3blocks(x, y, z, hk[1], hk[1], k[1]); \
    aes_encrypt_round_3blocks(x, y, z, hk[2], hk[2], k[2]); \
    aes_encrypt_round_3blocks(x, y, z, hk[3], hk[3], k[3]); \
    aes_encrypt_round_3blocks(x, y, z, hk[4], hk[4], k[4]); \
    aes_encrypt_round_3blocks(x, y, z, hk[5], hk[5], k[5]); \
    aes_encrypt_round_3blocks(x, y, z, hk[6], hk[6], k[6]); \
    aes_encrypt_round_3blocks(x, y, z, hk[7], hk[7], k[7]); \
    aes_encrypt_round_3blocks(x, y, z, hk[8], hk[8], k[8]); \
    tmp_x = vxor3(hk[10], hk[0], loadu(p)); \
    tmp_z = vxor(k[10], hk[0]); \
    tmp_y = vxor(hk[10], hk[0]); \
    aes_encrypt_round_3blocks(x, y, z, hk[9], hk[9], k[9]); \
    aes_encrypt_last_round_3blocks(x, y, z, tmp_x, tmp_y, tmp_z); \
    storeu(c, vxor(y, z)); \
    y = z; \
    z = vxor3(x, k[0], hk[0])

// ---------------------------------------------------------------------

#define aes_encrypt_3blocks_no_whitening(x, y, z, k, hk) \
    aes_encrypt_round_3blocks(x, y, z, hk[1], hk[1], k[1]); \
    aes_encrypt_round_3blocks(x, y, z, hk[2], hk[2], k[2]); \
    aes_encrypt_round_3blocks(x, y, z, hk[3], hk[3], k[3]); \
    aes_encrypt_round_3blocks(x, y, z, hk[4], hk[4], k[4]); \
    aes_encrypt_round_3blocks(x, y, z, hk[5], hk[5], k[5]); \
    aes_encrypt_round_3blocks(x, y, z, hk[6], hk[6], k[6]); \
    aes_encrypt_round_3blocks(x, y, z, hk[7], hk[7], k[7]); \
    aes_encrypt_round_3blocks(x, y, z, hk[8], hk[8], k[8]); \
    aes_encrypt_round_3blocks(x, y, z, hk[9], hk[9], k[9]); \
    aes_encrypt_last_round_3blocks(x, y, z, hk[10], hk[10], k[10])

// ---------------------------------------------------------------------

#define aes_encrypt_3blocks_single_key(x, y, z, k) \
    xor_3blocks(x, y, z, k[0], k[0], k[0]); \
    aes_encrypt_round_3blocks(x, y, z, k[1], k[1], k[1]); \
    aes_encrypt_round_3blocks(x, y, z, k[2], k[2], k[2]); \
    aes_encrypt_round_3blocks(x, y, z, k[3], k[3], k[3]); \
    aes_encrypt_round_3blocks(x, y, z, k[4], k[4], k[4]); \
    aes_encrypt_round_3blocks(x, y, z, k[5], k[5], k[5]); \
    aes_encrypt_round_3blocks(x, y, z, k[6], k[6], k[6]); \
    aes_encrypt_round_3blocks(x, y, z, k[7], k[7], k[7]); \
    aes_encrypt_round_3blocks(x, y, z, k[8], k[8], k[8]); \
    aes_encrypt_round_3blocks(x, y, z, k[9], k[9], k[9]); \
    aes_encrypt_last_round_3blocks(x, y, z, k[10], k[10], k[10])

// ---------------------------------------------------------------------

void keysetup_encrypt_only(poet_ctx_t *ctx, const unsigned char key[KEYLEN])
{
    AES_KEY expanded_key;
    __m128i sk = loadu(key);
    __m128i k = zero;
    ctx->l = one;
    __m128i k_axu = two;

    aes_expand_key(sk, expanded_key);
    aes_encrypt_3blocks_single_key(k, ctx->l, k_axu, expanded_key);

    aes_expand_key(k, ctx->aes_enc);
    aes_expand_key(k_axu, ctx->aes_axu);
}

// ---------------------------------------------------------------------

void keysetup(poet_ctx_t *ctx, const unsigned char key[KEYLEN])
{
    keysetup_encrypt_only(ctx, key);
    aes_create_decryption_key(ctx->aes_enc, ctx->aes_dec);
}

// ---------------------------------------------------------------------

void encrypt_final(poet_ctx_t *ctx,
                   const unsigned char *plaintext,
                   unsigned long long plen,
                   unsigned char *ciphertext,
                   unsigned long long* clen, 
                   unsigned char tag[TAGLEN])
{   
    __m128i x = aes_encrypt(ctx->x, ctx->aes_axu);
    __m128i y = ctx->y;
    __m128i z;
    const uint64_t plaintext_len = plen;

    if (clen) {
        *clen = plen;
    }
    
    if (plen >= BLOCKLEN) {
        z = loadu(plaintext);
        x = vxor(x, z);
        z = x;
        xor_3blocks(x, y, z, ctx->aes_axu[0], ctx->aes_axu[0], ctx->aes_enc[0]);
        plaintext += BLOCKLEN;
    }

    __m128i tmp_x;
    __m128i tmp_z;
    __m128i tmp_y;

    while (plen > 2*BLOCKLEN) {
        aes_encrypt_3blocks(x, y, z, ctx->aes_enc, ctx->aes_axu, plaintext, ciphertext, tmp_x, tmp_y, tmp_z);
        plaintext += BLOCKLEN;
        ciphertext += BLOCKLEN;
        plen -= BLOCKLEN;
    }

    const __m128i s = aes_encrypt(encode_length(plaintext_len), ctx->aes_enc);

    if (plen == 0) { // Empty message
        z = vxor3(x, s, ctx->tau);
        aes_encrypt_2blocks(y, z, ctx->aes_axu, ctx->aes_enc);
        z = vxor(z, y);

        z = vxor(z, s); 
        storeu(tag, z);
    } else if (plen % BLOCKLEN == 0) { // No tag splitting
        if (plen == 2*BLOCKLEN) {
            aes_encrypt_3blocks(x, y, z, ctx->aes_enc, ctx->aes_axu, plaintext, ciphertext, tmp_x, tmp_y, tmp_z);
            plaintext += BLOCKLEN;
            ciphertext += BLOCKLEN;
            plen -= BLOCKLEN;
        }
        
        z = vxor(z, s);
        x = vxor(x, s);
        aes_encrypt_3blocks_no_whitening(x, y, z, ctx->aes_enc, ctx->aes_axu);
        storeu(ciphertext, vxor3(z, y, s));

        // Generate tag
        y = z;
        z = vxor(x, ctx->tau);
        aes_encrypt_2blocks(y, z, ctx->aes_axu, ctx->aes_enc);
        z = vxor3(z, y, ctx->tau);
        storeu(tag, z);
    } else { // Tag splitting
        if (plen > BLOCKLEN) {
            aes_encrypt_3blocks_no_whitening(x, y, z, ctx->aes_enc, ctx->aes_axu);
            storeu(ciphertext, vxor(z, y));
            ciphertext += BLOCKLEN;
            y = z; 
        }

        plen = plen % BLOCKLEN;
        z = zero_pad(load_n_bytes(plaintext, plen), BLOCKLEN - plen);
        z = vxor3(x, s, vor(z, shift_left(ctx->tau, plen)));
        x = z;

        xor_3blocks(x, y, z, ctx->aes_axu[0], ctx->aes_axu[0], ctx->aes_enc[0]);
        aes_encrypt_3blocks_no_whitening(x, y, z, ctx->aes_enc, ctx->aes_axu);

        tmp_z = vxor3(z, s, y);
        store_partial_left(ciphertext, tmp_z, plen);
        store_partial_right(tag, tmp_z, BLOCKLEN - plen);

        // Generate tag
        y = z; 
        z = vxor(x, ctx->tau);
        xor_3blocks(x, y, z, ctx->aes_axu[0], ctx->aes_axu[0], ctx->aes_enc[0]);
        aes_encrypt_3blocks_no_whitening(x, y, z, ctx->aes_enc, ctx->aes_axu);

        z = vxor3(z, ctx->tau, y);
        store_partial_from_left_to_right(tag, z, plen);
    }
}

// ---------------------------------------------------------------------

#define aes_decrypt_round_2blocks(x, y, kx, ky) \
    x = _mm_aesenc_si128(x, kx); \
    y = _mm_aesdec_si128(y, ky)

// ---------------------------------------------------------------------

#define aes_decrypt_last_round_2blocks(x, y, kx, ky) \
    x = _mm_aesenclast_si128(x, kx); \
    y = _mm_aesdeclast_si128(y, ky)

// ---------------------------------------------------------------------

#define aes_decrypt_round_3blocks(x, y, z, kx, ky, kz) \
    x = _mm_aesenc_si128(x, kx); \
    y = _mm_aesenc_si128(y, ky); \
    z = _mm_aesdec_si128(z, kz)

// ---------------------------------------------------------------------

#define aes_decrypt_last_round_3blocks(x, y, z, kx, ky, kz) \
    x = _mm_aesenclast_si128(x, kx); \
    y = _mm_aesenclast_si128(y, ky); \
    z = _mm_aesdeclast_si128(z, kz)

// ---------------------------------------------------------------------

#define aes_decrypt_2blocks(x, y, kx, ky) \
    xor_2blocks(x, y, kx[0], ky[0]); \
    aes_decrypt_round_2blocks(x, y, kx[1], ky[1]); \
    aes_decrypt_round_2blocks(x, y, kx[2], ky[2]); \
    aes_decrypt_round_2blocks(x, y, kx[3], ky[3]); \
    aes_decrypt_round_2blocks(x, y, kx[4], ky[4]); \
    aes_decrypt_round_2blocks(x, y, kx[5], ky[5]); \
    aes_decrypt_round_2blocks(x, y, kx[6], ky[6]); \
    aes_decrypt_round_2blocks(x, y, kx[7], ky[7]); \
    aes_decrypt_round_2blocks(x, y, kx[8], ky[8]); \
    aes_decrypt_round_2blocks(x, y, kx[9], ky[9]); \
    aes_decrypt_last_round_2blocks(x, y, kx[10], ky[10])

// ---------------------------------------------------------------------

#define aes_decrypt_3blocks(x, y, z, k, hk, p, c, tmp_x, tmp_y, tmp_z) \
    aes_decrypt_round_3blocks(x, y, z, hk[1], hk[1], k[1]); \
    aes_decrypt_round_3blocks(x, y, z, hk[2], hk[2], k[2]); \
    aes_decrypt_round_3blocks(x, y, z, hk[3], hk[3], k[3]); \
    aes_decrypt_round_3blocks(x, y, z, hk[4], hk[4], k[4]); \
    aes_decrypt_round_3blocks(x, y, z, hk[5], hk[5], k[5]); \
    aes_decrypt_round_3blocks(x, y, z, hk[6], hk[6], k[6]); \
    aes_decrypt_round_3blocks(x, y, z, hk[7], hk[7], k[7]); \
    aes_decrypt_round_3blocks(x, y, z, hk[8], hk[8], k[8]); \
    tmp_y = vxor3(hk[10], hk[0], loadu(c)); \
    tmp_z = vxor(k[10], hk[0]); \
    tmp_x = vxor(hk[10], hk[0]); \
    aes_decrypt_round_3blocks(x, y, z, hk[9], hk[9], k[9]); \
    aes_decrypt_last_round_3blocks(x, y, z, tmp_x, tmp_y, tmp_z); \
    storeu(p, vxor(x, z)); \
    x = z; \
    z = vxor3(y, k[0], hk[0])

// ---------------------------------------------------------------------

#define aes_decrypt_3blocks_no_whitening(x, y, z, k, hk) \
    aes_decrypt_round_3blocks(x, y, z, hk[1], hk[1], k[1]); \
    aes_decrypt_round_3blocks(x, y, z, hk[2], hk[2], k[2]); \
    aes_decrypt_round_3blocks(x, y, z, hk[3], hk[3], k[3]); \
    aes_decrypt_round_3blocks(x, y, z, hk[4], hk[4], k[4]); \
    aes_decrypt_round_3blocks(x, y, z, hk[5], hk[5], k[5]); \
    aes_decrypt_round_3blocks(x, y, z, hk[6], hk[6], k[6]); \
    aes_decrypt_round_3blocks(x, y, z, hk[7], hk[7], k[7]); \
    aes_decrypt_round_3blocks(x, y, z, hk[8], hk[8], k[8]); \
    aes_decrypt_round_3blocks(x, y, z, hk[9], hk[9], k[9]); \
    aes_decrypt_last_round_3blocks(x, y, z, hk[10], hk[10], k[10]); \

// ---------------------------------------------------------------------

#define encrypt_tag_block(x, y, z, k, hk) \
    x = aes_encrypt(x, hk); \
    z = vxor(z, x); \
    z = aes_encrypt(z, k)

// ---------------------------------------------------------------------

int decrypt_final(poet_ctx_t *ctx,
                  const unsigned char *ciphertext,
                  unsigned long long clen,
                  const unsigned char tag[TAGLEN],
                  unsigned char *plaintext, 
                  unsigned long long* plen)
{
    __m128i x = ctx->x;
    __m128i y = aes_encrypt(ctx->y, ctx->aes_axu);
    __m128i z;
    const uint64_t plaintext_len = clen;

    if (plen) {
        *plen = clen;
    }
    
    if (clen >= BLOCKLEN) {
        z = loadu(ciphertext);
        y = vxor(y, z);
        z = y;
        xor_3blocks(x, y, z, ctx->aes_axu[0], ctx->aes_axu[0], ctx->aes_dec[0]);
        ciphertext += BLOCKLEN;
    }

    __m128i tmp_x;
    __m128i tmp_z;
    __m128i tmp_y;

    while (clen > 2*BLOCKLEN) {
        aes_decrypt_3blocks(x, y, z, ctx->aes_dec, ctx->aes_axu, plaintext, ciphertext, tmp_x, tmp_y, tmp_z);
        plaintext += BLOCKLEN;
        ciphertext += BLOCKLEN;
        clen -= BLOCKLEN;
    }
    
    __m128i s = aes_encrypt(encode_length(plaintext_len), ctx->aes_enc);
    const __m128i t = loadu(tag);
    
    if (clen == 0) { // Empty ciphertext
        z = vxor(y, t);
        z = vxor(z, s);
        aes_decrypt_2blocks(x, z, ctx->aes_axu, ctx->aes_dec);
        x = vxor(x, s);
        z = vxor(z, ctx->tau);
        return _mm_testc_si128(z, x) - 1;
    } else if (clen == BLOCKLEN) { // No tag splitting
        z = vxor(z, s);
        y = vxor(y, s);
        aes_decrypt_3blocks_no_whitening(x, y, z, ctx->aes_dec, ctx->aes_axu);
        storeu(plaintext, vxor3(z, x, s));

        // Generate tag
        x = z;
        z = vxor3(y, ctx->tau, t);
        aes_decrypt_2blocks(x, z, ctx->aes_axu, ctx->aes_dec);
        z = vxor(z, ctx->tau);
        return _mm_testc_si128(z, x) - 1;
    } else { // Tag splitting
        if (clen > BLOCKLEN) {
            aes_decrypt_3blocks_no_whitening(x, y, z, ctx->aes_dec, ctx->aes_axu);

            storeu(plaintext, vxor(z, x));
            plaintext += BLOCKLEN;
            clen -= BLOCKLEN;
            x = z;
        }

        z = zero_pad(load_n_bytes(ciphertext, clen), BLOCKLEN - clen);
        z = vxor3(y, s, vor(z, shift_left(t, clen)));
        y = z;

        xor_3blocks(x, y, z, ctx->aes_axu[0], ctx->aes_axu[0], ctx->aes_dec[0]);
        aes_decrypt_3blocks_no_whitening(x, y, z, ctx->aes_dec, ctx->aes_axu);

        tmp_z = vxor3(z, s, x);
        store_partial_left(plaintext, tmp_z, clen);

        // p = P_L || T^{alpha}
        // z = M_L || tau^{alpha}
        __m128i tmp = shift_right(tmp_z, clen);
        __m128i tau_alpha = zero_pad(ctx->tau, clen);
        int alpha = _mm_testc_si128(tau_alpha, tmp);

        // Generate tag
        x = z; 
        z = ctx->tau;
        encrypt_tag_block(x, y, z, ctx->aes_enc, ctx->aes_axu);
        z = vxor3(z, y, ctx->tau);

        // t = T^{alpha} || T^{beta}
        // z = T^{beta}  || Z
        __m128i t_beta = shift_right(t, BLOCKLEN - clen);
        tmp = zero_pad(z, BLOCKLEN - clen);
        int beta = _mm_testc_si128(t_beta, tmp);

        return alpha + beta - 2;
    }
}
