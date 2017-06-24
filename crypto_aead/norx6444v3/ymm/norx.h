/*
   NORX reference source code package - reference C implementations

   Written 2014-2016 by:

        - Samuel Neves <sneves@dei.uc.pt>
        - Philipp Jovanovic <philipp@jovanovic.io>

   To the extent possible under law, the author(s) have dedicated all copyright
   and related and neighboring rights to this software to the public domain
   worldwide. This software is distributed without any warranty.

   You should have received a copy of the CC0 Public Domain Dedication along with
   this software. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.
*/
#ifndef NORX_NORX_H
#define NORX_NORX_H

#include <stddef.h>
#include <stdint.h>

/* High-level operations */
void norx_aead_encrypt(
        unsigned char *c, size_t *clen,
        const unsigned char *a, size_t alen,
        const unsigned char *m, size_t mlen,
        const unsigned char *z, size_t zlen,
        const unsigned char *nonce, const unsigned char *key);

int norx_aead_decrypt(
        unsigned char *m, size_t *mlen,
        const unsigned char *a, size_t alen,
        const unsigned char *c, size_t clen,
        const unsigned char *z, size_t zlen,
        const unsigned char *nonce, const unsigned char *key);
#endif
