/*
// @author Eik List
// @last-modified 2015-08-07
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
#include <stdlib.h>
#include <errno.h>
#include <string.h>

#include "crypto_aead.h"
#include "poet.h"
#include "api.h"

// ---------------------------------------------------------------------

int crypto_aead_encrypt(unsigned char *c, unsigned long long *clen,
                        const unsigned char *m, unsigned long long mlen,
                        const unsigned char *ad, unsigned long long adlen,
                        const unsigned char *nsec,
                        const unsigned char *npub,
                        const unsigned char *k)
{
    poet_ctx_t ctx;
    (void)nsec;
    
    if (clen) {
        *clen = mlen + CRYPTO_ABYTES;
    }
    
    keysetup(&ctx, k);
    
    if (npub) {
        unsigned char *header = malloc((size_t)(adlen + CRYPTO_NPUBBYTES));
        memcpy(header, ad, adlen);
        memcpy(header + adlen, npub, CRYPTO_NPUBBYTES);
        process_header(&ctx, header, adlen + CRYPTO_NPUBBYTES);
        free(header);
    } else {
        process_header(&ctx, ad, adlen);
    }
    
    unsigned char *tag = c + mlen;
    encrypt_final(&ctx, m, mlen, c, tag);
    return 0;
}

// ---------------------------------------------------------------------

int crypto_aead_decrypt(unsigned char *m, unsigned long long *mlen,
                        unsigned char *nsec,
                        const unsigned char *c, unsigned long long clen,
                        const unsigned char *ad, unsigned long long adlen,
                        const unsigned char *npub,
                        const unsigned char *k)
{
    poet_ctx_t ctx;
    (void)nsec;
    
    if (clen < CRYPTO_ABYTES) {
        return -1;
    }

    if (mlen) {
        *mlen = clen - CRYPTO_ABYTES;
    }

    keysetup(&ctx, k);
    
    if (npub) {
        unsigned char *header = malloc((size_t)(adlen + CRYPTO_NPUBBYTES));
        memcpy(header, ad, adlen);
        memcpy(header + adlen, npub, CRYPTO_NPUBBYTES);
        process_header(&ctx, header, adlen + CRYPTO_NPUBBYTES);
        free(header);
    } else {
        process_header(&ctx, ad, adlen);
    }
    
    unsigned char tag[CRYPTO_ABYTES];
    memcpy(tag, c + (clen - CRYPTO_ABYTES), CRYPTO_ABYTES);
    return decrypt_final(&ctx, c, *mlen, tag, m);
}
