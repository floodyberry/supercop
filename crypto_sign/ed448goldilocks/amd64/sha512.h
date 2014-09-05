/* Copyright (c) 2014 Cryptography Research, Inc.
 * Released under the MIT License.  See LICENSE.txt for license information.
 */
#ifndef __GOLDI_SHA512_H__
#define __GOLDI_SHA512_H__ 1

#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

#define SHA512_OUTPUT_BYTES 64

/**
 * SHA512 hashing context.
 *
 * This structure is opaque.
 */
struct sha512_ctx_t {
    /** @privatesection */
    uint64_t chain[8];
    uint8_t block[128];
    uint64_t nbytes;
};

void
sha512_init (
    struct sha512_ctx_t *ctx
);

void
sha512_update (
    struct sha512_ctx_t *ctx,
    const unsigned char *data,
    uint64_t bytes
);
    
void
sha512_final (
    struct sha512_ctx_t *ctx,
    uint8_t result[SHA512_OUTPUT_BYTES]
);
    
#ifdef __cplusplus
}; /* extern "C" */
#endif
    
#endif /* __GOLDI_SHA512_H__ */
