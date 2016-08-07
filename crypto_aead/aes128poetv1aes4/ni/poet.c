/*
// @author Eik List
// @last-modified 2015-04-17
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

// ---------------------------------------------------------------------
// AES-related
// ---------------------------------------------------------------------

static void aes_revert_key(const AES_KEY enc_key, AES_KEY dec_key)
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

static inline __m128i aes_keygen_assist(__m128i temp1, __m128i temp2)
{
    __m128i temp3;
    temp2 = _mm_shuffle_epi32(temp2, 0xff);
    temp3 = _mm_slli_si128(temp1, 0x4);
    temp1 = _mm_xor_si128(temp1, temp3);
    temp3 = _mm_slli_si128(temp3, 0x4);
    temp1 = _mm_xor_si128(temp1, temp3);
    temp3 = _mm_slli_si128(temp3, 0x4);
    temp1 = _mm_xor_si128(temp1, temp3);
    temp1 = _mm_xor_si128(temp1, temp2);
    return temp1;
}

// ---------------------------------------------------------------------

static void aes_expand_key(__m128i userkey, AES_KEY enc_key)
{
    __m128i temp1, temp2;
    __m128i *key = (__m128i*)enc_key;

    _mm_store_si128(&temp1, userkey);
    _mm_store_si128(&key[0], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x1);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[1], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x2);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[2], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x4);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[3], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x8);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[4], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x10);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[5], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x20);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[6], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x40);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[7], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x80);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[8], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x1b);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[9], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x36);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[10], temp1);
}
// ---------------------------------------------------------------------

static void aesfour_expand_key(__m128i userkey, AXU_KEY enc_key)
{
    __m128i temp1;
    __m128i temp2;
    __m128i *key = (__m128i*)enc_key;

    _mm_storeu_si128(&temp1, userkey);
    _mm_storeu_si128(&key[0], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x1);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[1], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x2);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[2], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x4);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[3], temp1);

    temp2 = _mm_aeskeygenassist_si128(temp1, 0x8);
    temp1 = aes_keygen_assist(temp1, temp2);
    _mm_store_si128(&key[4], temp1);
}

// ---------------------------------------------------------------------

static inline __m128i aes_encrypt(__m128i in, __m128i* k)
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

static inline __m128i aesfour_encrypt(__m128i in, __m128i* k)
{
    __m128i x = _mm_xor_si128(in, k[0]);
    x = _mm_aesenc_si128(x, k[1]);
    x = _mm_aesenc_si128(x, k[2]);
    x = _mm_aesenc_si128(x, k[3]);
    return _mm_aesenc_si128(x, k[4]);
}

// ---------------------------------------------------------------------
// Load + Store
// ---------------------------------------------------------------------

#define zero           _mm_setzero_si128()
#define one            _mm_insert_epi8(zero, 1, 15)
#define two            _mm_insert_epi8(zero, 2, 15)
#define three          _mm_insert_epi8(zero, 3, 15)
#define four           _mm_insert_epi8(zero, 4, 15)
#define vand(x,y)      _mm_and_si128(x,y)
#define vor(x,y)       _mm_or_si128(x,y)
#define vxor(x,y)      _mm_xor_si128(x,y)
#define vxor3(x,y,z)   _mm_xor_si128(_mm_xor_si128(x,y),z)

// ---------------------------------------------------------------------
// Load + Store
// ---------------------------------------------------------------------

static __m128i loadu(const void *p)
{
    return _mm_loadu_si128((__m128i*)p);
}

// ---------------------------------------------------------------------

static __m128i load(const void *p)
{
    return _mm_load_si128((__m128i*)p);
}

// ---------------------------------------------------------------------

static __m128i load_partial(const void *p, unsigned n)
{
    if (n == 0) {
        return zero;
    } else if (n % 16 == 0) {
        return _mm_loadu_si128((__m128i*)p);
    } else {
        __m128i tmp;
        unsigned i;

        for (i = 0; i < n; ++i) {
            ((char*)&tmp)[i] = ((char*)p)[i];
        }

        return tmp;
    }
}

// ---------------------------------------------------------------------

static void storeu(const void *p, __m128i x)
{
    _mm_storeu_si128((__m128i*)p, x);
}

// ---------------------------------------------------------------------

static void store(const void *p, __m128i x)
{
    _mm_store_si128((__m128i*)p, x);
}

// ---------------------------------------------------------------------

/**
 * Stores the rightmost n bytes of x in the leftmost n bytes of p.
 * @example:
 * x = [1f,1e,1d..13,12,11,10]
 * p = [01,02,03..0c,0d,0e,0f], n = 2 =>
 * p = [1f,1e,03..0c,0d,0e,0f]
 */
static void store_partial_left(const void *p, __m128i x, unsigned n)
{
    if (n == 0) {
        return;
    } else if (n >= BLOCKLEN) {
        storeu(p, x);
    } else {
        unsigned i;
        char* p_ = (char*)p;
        char* x_ = (char*)&x;

        for (i = 0; i < n; ++i) {
            p_[i] = x_[i];
        }
    }
}

// ---------------------------------------------------------------------

/**
 * Stores the rightmost n bytes of x in the leftmost n bytes of p.
 * @example:
 * x = [1f,1e,1d..13,12,11,10]
 * p = [01,02,03..0c,0d,0e,0f], n = 2 =>
 * p = [11,10,03..0c,0d,0e,0f]
 */
static void store_partial_right(const void *p, __m128i x, unsigned n)
{
    if (n == 0) {
        return;
    } else if (n >= BLOCKLEN) {
        storeu(p, x);
    } else {
        unsigned i;
        char* p_ = (char*)p;
        char* x_ = (char*)&x;

        for (i = 0; i < n; ++i) {
            p_[i] = x_[(BLOCKLEN - n) + i];
        }
    }
}

// ---------------------------------------------------------------------

/**
 * Stores the rightmost n bytes of x in the leftmost n bytes of p.
 * @example:
 * x = [1f,1e,1d..13,12,11,10]
 * p = [01,02,03..0c,0d,0e,0f], n = 2 =>
 * p = [01,02,03..0c,0d,1f,1e]
 */
static void store_partial_from_left_to_right(const void *p,
        __m128i x,
        unsigned n)
{
    if (n == 0) {
        return;
    } else if (n >= BLOCKLEN) {
        storeu(p, x);
    } else {
        unsigned i;
        char* p_ = (char*)p;
        char* x_ = (char*)&x;

        for (i = 0; i < n; ++i) {
            p_[(BLOCKLEN - n) + i] = x_[i];
        }
    }
}

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

static __m128i zero_pad(__m128i x, unsigned zero_bytes)
{
    return vand(x, loadu((__m128i*)(pad + zero_bytes)));
}

// ---------------------------------------------------------------------

static __m128i one_zero_pad(__m128i x, unsigned one_zero_bytes)
{
    __m128i *p = (__m128i*)(pad + one_zero_bytes);
    return vor(vand(x, loadu(p)), loadu(p + 1));
}

// ---------------------------------------------------------------------

static inline __m128i shift_right_in(__m128i a, unsigned num_bytes) {
    unsigned count = num_bytes * 8;
    __m128i result, tmp;
    result = _mm_srli_epi64(a, count);
    tmp = _mm_srli_si128(a, 8);
    tmp = _mm_slli_epi64(tmp, 64 - (count));
    result = _mm_or_si128(result, tmp);
    return result;
}

// ---------------------------------------------------------------------

static __m128i shift_right(__m128i a, unsigned num_bytes) {
    if (num_bytes == 0) {
        return a;
    } else if (num_bytes >= 16) {
        return zero;
    } else if (num_bytes < 8) {
        return shift_right_in(a, num_bytes);
    } else if (num_bytes == 8) {
        return _mm_srli_si128(a, 8);
    } else {
        a = _mm_srli_si128(a,  8);
        return _mm_srli_epi64(a, (num_bytes-8) * 8);
    }
}

// ---------------------------------------------------------------------

static inline __m128i shift_left_in(__m128i a, unsigned num_bytes) {
    unsigned count = num_bytes * 8;
    __m128i result, tmp;
    result = _mm_slli_epi64(a, count);
    tmp = _mm_slli_si128(a, 8);
    tmp = _mm_srli_epi64(tmp, 64 - (count));
    result = _mm_or_si128(result, tmp);
    return result;
}

// ---------------------------------------------------------------------

static __m128i shift_left(__m128i a, unsigned num_bytes) {
    if (num_bytes == 0) {
        return a;
    } else if (num_bytes >= 16) {
        return zero;
    } else if (num_bytes < 8) {
        return shift_left_in(a, num_bytes);
    } else if (num_bytes == 8) {
        return _mm_slli_si128(a, 8);
    } else {
        a = _mm_slli_si128(a,  8);
        return _mm_slli_epi64(a, (num_bytes-8) * 8);
    }
}

// ---------------------------------------------------------------------
// Doubling
// ---------------------------------------------------------------------

/**
 * Credits to Ted Krovetz.
 */
static inline __m128i double_block_in(__m128i block) {
    const __m128i mask = _mm_set_epi32(135, 1, 1, 1);
    __m128i tmp = _mm_srai_epi32(block, 31);
    tmp = _mm_and_si128(tmp, mask);
    tmp = _mm_shuffle_epi32(tmp, _MM_SHUFFLE(2, 1, 0, 3));
    block = _mm_slli_epi32(block, 1);
    return vxor(block, tmp);
}

static inline __m128i multiply_by_3_in(__m128i block) {
    return vxor(double_block_in(block), block);
}

static inline __m128i multiply_by_5_in(__m128i block) {
    return vxor(double_block_in(double_block_in(block)), block);
}

// ---------------------------------------------------------------------
// Only for testing. To be compatible with the inverted GF doubling of
// POET v1.
// ---------------------------------------------------------------------

static inline unsigned long long reverse_bits(unsigned long long x)
{
    x = ((x & UINT64_C(0x0f0f0f0f0f0f0f0f)) << 4)
        | ((x & UINT64_C(0xf0f0f0f0f0f0f0f0)) >> 4);
    x = ((x & UINT64_C(0x3333333333333333)) << 2)
        | ((x & UINT64_C(0xcccccccccccccccc)) >> 2);
    x = ((x & UINT64_C(0x5555555555555555)) << 1)
        | ((x & UINT64_C(0xaaaaaaaaaaaaaaaa)) >> 1);
    return x;
}

static inline __m128i bit_revert(__m128i block)
{
    unsigned long long bytes[2];
    store(bytes, block);
    bytes[0] = reverse_bits(bytes[0]);
    bytes[1] = reverse_bits(bytes[1]);
    return load(bytes);
}

static inline __m128i double_block(__m128i block)
{
    return bit_revert(double_block_in(bit_revert(block)));
}

static inline __m128i multiply_by_3(__m128i block)
{
    return bit_revert(multiply_by_3_in(bit_revert(block)));
}

static inline __m128i multiply_by_5(__m128i block)
{
    return bit_revert(multiply_by_5_in(bit_revert(block)));
}

// ---------------------------------------------------------------------
// The POET-specific logic
// ---------------------------------------------------------------------

void keysetup(poet_ctx_t *ctx, const unsigned char key[KEYLEN])
{
    AES_KEY expanded_key;
    __m128i sk = loadu(key);
    __m128i k;
    __m128i k_axu;

    aes_expand_key(sk, expanded_key);
    k = aes_encrypt(zero, expanded_key);

    aes_expand_key(k, ctx->aes_enc);
    aes_revert_key(ctx->aes_enc, ctx->aes_dec);

    ctx->l = aes_encrypt(one, expanded_key);

    k_axu = aes_encrypt(two, expanded_key);
    aesfour_expand_key(k_axu, ctx->aes_lt);

    k_axu = aes_encrypt(three, expanded_key);
    aesfour_expand_key(k_axu, ctx->aes_lb);

    ctx->tm = aes_encrypt(four, expanded_key);
}

// ---------------------------------------------------------------------

void process_header(poet_ctx_t *ctx,
                    const unsigned char *header,
                    unsigned long long header_len)
{
    __m128i sum = zero;
    __m128i l = ctx->l;

    while (header_len > 8 * BLOCKLEN) {
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

    if (header_len > 4 * BLOCKLEN) {
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

    if (header_len > 2 * BLOCKLEN) {
        sum = vxor(sum, aes_encrypt(vxor(load(header     ), l), ctx->aes_enc));
        l = double_block(l);
        sum = vxor(sum, aes_encrypt(vxor(load(header + 16), l), ctx->aes_enc));
        l = double_block(l);
        header_len -= 2 * BLOCKLEN;
        header += 2 * BLOCKLEN;
    }

    if (header_len > BLOCKLEN) {
        sum = vxor(aes_encrypt(vxor(load(header), l), ctx->aes_enc), sum);
        l = double_block(l);
        header_len -= BLOCKLEN;
        header += BLOCKLEN;
    }

    if (header_len == BLOCKLEN) {
        l = multiply_by_3(l);
        sum = vxor3(load(header), l, sum);
    } else {
        l = multiply_by_5(l);
        __m128i tmp = one_zero_pad(
            load_partial(header, header_len), BLOCKLEN - header_len
        );
        sum = vxor3(tmp, l, sum);
    }

    ctx->tau = aes_encrypt(sum, ctx->aes_enc);
    ctx->x = ctx->tau;
    ctx->y = ctx->tau;
}

// ---------------------------------------------------------------------

static inline __m128i encrypt_length(unsigned long long len, AES_KEY key)
{
    return aes_encrypt(_mm_insert_epi64(zero, 8 * len, 0), key);
}

// ---------------------------------------------------------------------

static inline __m128i encrypt_block(__m128i p, __m128i* x, __m128i* y, 
                                    __m128i* k, __m128i* lt, __m128i* lb)
{
    *x = vxor(*x, p);

     p = vxor(*x, k[0]);
    *x = vxor(*x, lt[0]);
    *y = vxor(*y, lb[0]);

    unsigned j;
    for (j = 1; j <= AXU_ROUNDS; ++j)
    {
         p = _mm_aesenc_si128( p, k[j]);
        *x = _mm_aesenc_si128(*x, lt[j]);
        *y = _mm_aesenc_si128(*y, lb[j]);
    }
    for (j = AXU_ROUNDS+1; j < ROUNDS; ++j)
    {
         p = _mm_aesenc_si128( p, k[j]);
    }

     p = _mm_aesenclast_si128( p, k[ROUNDS]);

     p = vxor( p, *y); // P = P xor Y
    *y = vxor(*y,  p); // Y = Y xor (P xor Y) = P
    return p;
}

// ---------------------------------------------------------------------

void encrypt_final(poet_ctx_t *ctx,
                   const unsigned char *plaintext,
                   unsigned long long plen,
                   unsigned char *ciphertext,
                   unsigned char tag[BLOCKLEN])
{
    __m128i s = encrypt_length(plen, ctx->aes_enc);
    __m128i p;
    __m128i x = ctx->x;
    __m128i y = ctx->y;

    x = aesfour_encrypt(x, ctx->aes_lt);

    while (plen > BLOCKLEN) // All blocks
    {
        p = encrypt_block(loadu(plaintext), &x, &y, ctx->aes_enc, ctx->aes_lt, ctx->aes_lb);
        storeu(ciphertext, p);

        plaintext += BLOCKLEN;
        ciphertext += BLOCKLEN;
        plen -= BLOCKLEN;
    }

    if (plen == 0) { // Empty message
        p = vxor(s, ctx->tau);
        p = encrypt_block(p, &x, &y, ctx->aes_enc, ctx->aes_lt, ctx->aes_lb);
        p = vxor(s, p);
        storeu(tag, p);
    } else if (plen == BLOCKLEN) { // No tag splitting
        p = vxor(s, loadu(plaintext));
        p = encrypt_block(p, &x, &y, ctx->aes_enc, ctx->aes_lt, ctx->aes_lb);
        p = vxor(s, p);
        storeu(ciphertext, p);

        // Generate tag
        p = vxor(ctx->tau, ctx->tm);
        p = encrypt_block(p, &x, &y, ctx->aes_enc, ctx->aes_lt, ctx->aes_lb);
        p = vxor(ctx->tm, p);
        storeu(tag, p);
    } else { // Tag splitting
        p = zero_pad(load_partial(plaintext, plen), BLOCKLEN - plen);
        p = vxor(s, vor(p, shift_left(ctx->tau, plen)));
        p = encrypt_block(p, &x, &y, ctx->aes_enc, ctx->aes_lt, ctx->aes_lb);
        p = vxor(s, p);
        
        store_partial_left(ciphertext, p, plen);
        store_partial_right(tag, p, BLOCKLEN - plen);

        // Generate tag
        p = vxor(ctx->tau, ctx->tm);
        p = encrypt_block(p, &x, &y, ctx->aes_enc, ctx->aes_lt, ctx->aes_lb);
        p = vxor(p, ctx->tm);
        store_partial_from_left_to_right(tag, p, plen);
    }
}

// ---------------------------------------------------------------------

static inline __m128i decrypt_block(__m128i p, __m128i* x, __m128i* y, 
                                    __m128i* k, __m128i* lt, __m128i* lb)
{
    *y = vxor(*y, p);

     p = vxor(*y, k[0]);
    *y = vxor(*y, lb[0]);
    *x = vxor(*x, lt[0]);

    unsigned j;
    for (j = 1; j <= AXU_ROUNDS; ++j)
    {
         p = _mm_aesdec_si128( p, k[j]);
        *x = _mm_aesenc_si128(*x, lt[j]);
        *y = _mm_aesenc_si128(*y, lb[j]);
    }
    for (j = AXU_ROUNDS+1; j < ROUNDS; ++j)
    {
         p = _mm_aesdec_si128( p, k[j]);
    }

     p = _mm_aesdeclast_si128( p, k[ROUNDS]);

     p = vxor( p, *x); 
    *x = vxor(*x,  p);
    return p;
}

// ---------------------------------------------------------------------

static inline __m128i encrypt_tag_block(__m128i p, __m128i* x, __m128i* y, 
                                        __m128i* k, __m128i* lt)
{
    *x = vxor(aesfour_encrypt(*x, lt), p);
     p = aes_encrypt(*x, k);

     p = vxor(p, *y);
    *y = vxor(p, *y);
    return p;
}

// ---------------------------------------------------------------------

int decrypt_final(poet_ctx_t *ctx,
                  const unsigned char *ciphertext,
                  unsigned long long clen,
                  const unsigned char tag[BLOCKLEN],
                  unsigned char *plaintext)
{
    __m128i s = encrypt_length(clen, ctx->aes_enc);
    __m128i p;
    __m128i x = ctx->x;
    __m128i y = ctx->y;

    y = aesfour_encrypt(y, ctx->aes_lb);

    while (clen > BLOCKLEN) // All blocks
    {
        p = decrypt_block(loadu(ciphertext), &x, &y, ctx->aes_dec, ctx->aes_lt, ctx->aes_lb);
        storeu(plaintext, p);

        plaintext += BLOCKLEN;
        ciphertext += BLOCKLEN;
        clen -= BLOCKLEN;
    }

    __m128i t = load(tag);

    if (clen == 0) { // Empty ciphertext
        p = vxor(s, ctx->tau);
        p = encrypt_tag_block(p, &x, &y, ctx->aes_enc, ctx->aes_lt);
        p = vxor(s, p);
        return _mm_testc_si128(t, p) - 1;
    } else if (clen == BLOCKLEN) { // No tag splitting
        // Process final message block
        p = vxor(s, loadu(ciphertext));
        p = decrypt_block(p, &x, &y, ctx->aes_dec, ctx->aes_lt, ctx->aes_lb);
        p = vxor(s, p);
        storeu(plaintext, p);

        // Generate tag
        p = vxor(ctx->tau, ctx->tm);
        p = encrypt_tag_block(p, &x, &y, ctx->aes_enc, ctx->aes_lt);
        p = vxor(ctx->tm, p);
        return _mm_testc_si128(t, p) - 1;
    } else { // Tag splitting
        // Process final message block
        p = zero_pad(load_partial(ciphertext, clen), BLOCKLEN - clen);
        p = vxor(s, vor(p, shift_left(t, clen)));
        p = decrypt_block(p, &x, &y, ctx->aes_dec, ctx->aes_lt, ctx->aes_lb);
        p = vxor(p, s);
        store_partial_left(plaintext, p, clen);

        // c = C_L || T^{alpha}
        // p = M_L || tau^{alpha}

        __m128i tmp = shift_right(p, clen);
        __m128i tau_alpha = zero_pad(ctx->tau, clen);

        int alpha = _mm_testc_si128(tau_alpha, tmp);

        p = vxor(ctx->tau, ctx->tm);
        p = encrypt_tag_block(p, &x, &y, ctx->aes_enc, ctx->aes_lt);
        p = vxor(ctx->tm, p);

        // t = T^{alpha} || T^{beta}
        // p = T^{beta}  || Z
        __m128i t_beta = shift_right(t, 16 - clen);
        tmp = zero_pad(p, 16 - clen);
        int beta = _mm_testc_si128(t_beta, tmp);

        return alpha + beta - 2;
    }
}

