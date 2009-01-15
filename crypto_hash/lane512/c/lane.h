/*
 * Copyright (c) 2008 Sebastiaan Indesteege
 *                              <sebastiaan.indesteege@esat.kuleuven.be>
 *
 * Permission to use, copy, modify, and distribute this software for any
 * purpose with or without fee is hereby granted, provided that the above
 * copyright notice and this permission notice appear in all copies.
 *
 * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
 * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
 * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
 * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
 * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
 * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
 */

/*
 * Optimised ANSI-C implementation of LANE
 */

#ifndef LANE_H
#define LANE_H

#include <string.h>

typedef unsigned char BitSequence;
typedef unsigned long long DataLength;

typedef enum { SUCCESS = 0, FAIL = 1, BAD_HASHBITLEN = 2, BAD_DATABITLEN = 3 } HashReturn;

#include "crypto_uint8.h"
#include "crypto_uint32.h"
#include "crypto_uint64.h"
typedef crypto_uint8 u8;
typedef crypto_uint32 u32;
typedef crypto_uint64 u64;

typedef struct {
  int hashbitlen;
  u64 ctr;
  u32 h[16];
  u8 buffer[128];
} hashState;

HashReturn Init (hashState *state, int hashbitlen);
HashReturn Update (hashState *state, const BitSequence *data, DataLength databitlen);
HashReturn Final (hashState *state, BitSequence *hashval);
HashReturn Hash (int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval);

#endif /* LANE_H */
