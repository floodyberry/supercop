/*
   NORX reference source code package - reference C implementations

   Written in 2014 by Samuel Neves <sneves@dei.uc.pt> and Philipp Jovanovic
   <jovanovic@fim.uni-passau.de>

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
#include "norx_config.h"

#if   NORX_W == 64
	typedef uint64_t norx_word_t;
#elif NORX_W == 32
	typedef uint32_t norx_word_t;
#else
	#error "Invalid word size!"
#endif

typedef struct norx_state__
{
    norx_word_t S[16];
} norx_state_t[1];

/* low-level operations */
void norx_init(norx_state_t state, const unsigned char *k, const unsigned char *n);
void norx_process_header(norx_state_t state, const unsigned char * in, size_t inlen);
void norx_encrypt_msg(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen);
void norx_decrypt_msg(norx_state_t state, unsigned char *out, const unsigned char * in, size_t inlen);
void norx_process_trailer(norx_state_t state, const unsigned char * in, size_t inlen);
void norx_output_tag(norx_state_t state, unsigned char * tag);
int  norx_verify_tag(const unsigned char * tag1, const unsigned char * tag2);

/* high-level operations */
void norx_aead_encrypt(unsigned char *c, size_t *clen, const unsigned char *h,
                       size_t hlen, const unsigned char *p, size_t plen,
                       const unsigned char *t, size_t tlen,
                       const unsigned char *nonce, const unsigned char *key);

int norx_aead_decrypt(unsigned char *p, size_t *plen, const unsigned char *h,
                      size_t hlen, const unsigned char *c, size_t clen,
                      const unsigned char *t, size_t tlen,
                      const unsigned char *nonce, const unsigned char *key);

#endif

