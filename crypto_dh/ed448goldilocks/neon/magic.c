/* Copyright (c) 2014 Cryptography Research, Inc.
 * Released under the MIT License.  See LICENSE.txt for license information.
 */

#include "field.h"
#include "magic.h"
#include "barrett_field.h"

/* FUTURE: automatically generate this file. */

const word_t SCALARMUL_FIXED_WINDOW_ADJUSTMENT[2*SCALAR_WORDS] = {
    U64LE(0xebec9967f5d3f5c2),
    U64LE(0x0aa09b49b16c9a02),
    U64LE(0x7f6126aec172cd8e),
    U64LE(0x00000007b027e54d),
    U64LE(0x0000000000000000),
    U64LE(0x0000000000000000),
    U64LE(0x4000000000000000),
    
    U64LE(0xc873d6d54a7bb0cf),
    U64LE(0xe933d8d723a70aad),
    U64LE(0xbb124b65129c96fd),
    U64LE(0x00000008335dc163),
    U64LE(0x0000000000000000),
    U64LE(0x0000000000000000),
    U64LE(0x0000000000000000)
};

const struct affine_t goldilocks_base_point = {
    {{ U58LE(0xf0de840aed939f), U58LE(0xc170033f4ba0c7),
       U58LE(0xf3932d94c63d96), U58LE(0x9cecfa96147eaa),
       U58LE(0x5f065c3c59d070), U58LE(0x3a6a26adf73324),
       U58LE(0x1b4faff4609845), U58LE(0x297ea0ea2692ff)
    }},
    {{ 19 }}
};

static const word_t curve_prime_order_lo[(224+WORD_BITS-1)/WORD_BITS] = {
    U64LE(0xdc873d6d54a7bb0d),
    U64LE(0xde933d8d723a70aa),
    U64LE(0x3bb124b65129c96f),
    0x8335dc16
};
const struct barrett_prime_t curve_prime_order = {
    GOLDI_FIELD_WORDS,
    62 % WORD_BITS,
    sizeof(curve_prime_order_lo)/sizeof(curve_prime_order_lo[0]),
    curve_prime_order_lo
};

const struct field_t
sqrt_d_minus_1 = {{
    U58LE(0xd2e21836749f46),
    U58LE(0x888db42b4f0179),
    U58LE(0x5a189aabdeea38),
    U58LE(0x51e65ca6f14c06),
    U58LE(0xa49f7b424d9770),
    U58LE(0xdcac4628c5f656),
    U58LE(0x49443b8748734a),
    U58LE(0x12fec0c0b25b7a)
}};
