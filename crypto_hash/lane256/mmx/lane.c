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
 * Lane 256 assembly implementation
 */

#include <string.h>
#include "lane.h"

void lane256_compress_mmx(const u8 m[64], u32 h[8], const u32 ctrh, const u32 ctrl);

void lane256_compress(const u8 m[64], u32 h[8], const u32 ctrh, const u32 ctrl)
{
  lane256_compress_mmx(m, h, ctrh, ctrl);
}

#define T8(x) ((x) & 0xff)
#define B0(x) (T8((x)      ))
#define B1(x) (T8((x) >>  8))
#define B2(x) (T8((x) >> 16))
#define B3(x) (T8((x) >> 24))
#define MSB32(x) ((u32)((((u64)(x))>>32) & 0xffffffff))
#define LSB32(x) ((u32)((((u64)(x))    ) & 0xffffffff))
#ifdef LANE_BIG_ENDIAN
#define U8TO32_BIG(c)  (((u32*)(c))[0])
#define U32TO8_BIG(c, v) ((u32*)(c))[0]=v
#else
#define U8TO32_BIG(c)  (((u32)T8(*((u8*)(c))) << 24) | \
			((u32)T8(*(((u8*)(c)) + 1)) << 16) | \
			((u32)T8(*(((u8*)(c)) + 2)) << 8) | \
			((u32)T8(*(((u8*)(c)) + 3))))
#define U32TO8_BIG(c, v)    do { \
		u32 tmp_portable_h_x = (v); \
		u8 *tmp_portable_h_d = (c); \
		tmp_portable_h_d[0] = T8(tmp_portable_h_x >> 24); \
		tmp_portable_h_d[1] = T8(tmp_portable_h_x >> 16); \
		tmp_portable_h_d[2] = T8(tmp_portable_h_x >> 8); \
		tmp_portable_h_d[3] = T8(tmp_portable_h_x); \
	} while (0)
#endif /* LANE_BIG_ENDIAN */

HashReturn Init (hashState *state, int hashbitlen)
{
  if (hashbitlen != 256)
    return BAD_HASHBITLEN; /* XXX this implementation only supports Lane256 */

  state->hashbitlen = 256;
  state->ctr = 0;
  memset(state->h, 0, 32);
  memset(state->buffer, 0, BLOCKSIZE);
  state->buffer[0] = 0x02; /* flag byte 0x02: IV derivation without seed */
  state->buffer[1] = 0x00; /* digest length in big endian notation */
  state->buffer[2] = 0x00;
  state->buffer[3] = 0x01;
  state->buffer[4] = 0x00;

  lane256_compress(state->buffer, state->h, 0, 0);

  return SUCCESS;
}

HashReturn Update (hashState *state, const BitSequence *data, DataLength databitlen)
{
  const u64 buffill = (state->ctr >> 3) & 0x3f;
  u64 bytes = databitlen >> 3;

  if (state->ctr & 0x7)
    return BAD_DATABITLEN; /* Only the last call to Update() may contain a fractional byte */
 
  /* Check if we have some stuff left in the buffer. If so, fill it, and process it */
  if (buffill) {
    const u64 n = buffill + bytes > BLOCKSIZE ? BLOCKSIZE-buffill : bytes; /* number of bytes to copy */
    memcpy(state->buffer + buffill, data, n);
    state->ctr += n << 3;
    if (buffill + n == BLOCKSIZE) /* full buffer now */
      lane256_compress(state->buffer, state->h, MSB32(state->ctr), LSB32(state->ctr));
    data += n;
    bytes -= n;
  }

  /* Now process as many full blocks as we can directly from the input message */
  while (bytes >= BLOCKSIZE) {
    state->ctr += BLOCKSIZE << 3;
    lane256_compress(data, state->h, MSB32(state->ctr), LSB32(state->ctr));
    data += BLOCKSIZE;
    bytes -= BLOCKSIZE;
  }

  /* And finally, save the last, incomplete message block */
  if (bytes || (databitlen & 0x7)) {
    memcpy(state->buffer, data, databitlen & 0x7 ? bytes+1 : bytes); /* also copy partial byte */
    state->ctr += (bytes << 3) + (databitlen & 0x7);
  }

  return SUCCESS;
}

HashReturn Final (hashState *state, BitSequence *hashval)
{
  /* do zero padding and compress last block, if there is some data in the buffer */
  if (state->ctr & 0x1ff) {
    const u64 n = (((state->ctr - 1) >> 3) + 1) & 0x3f; /* number of bytes in buffer that are (partially) filled */
    if (n < BLOCKSIZE)
      memset(state->buffer + n, 0, BLOCKSIZE-n);
    state->buffer[(state->ctr >> 3)&0x3f] &= ~(0xff >> (state->ctr & 0x7)); /* zero-pad partial byte */
    lane256_compress(state->buffer, state->h, MSB32(state->ctr), LSB32(state->ctr));
  }

  /* output transformation */
  memset(state->buffer, 0, BLOCKSIZE);
  state->buffer[0] = 0x00; /* flag byte 0x00: output transformation without seed */
  state->buffer[1] = T8(state->ctr >> 56); /* message length in big-endian */
  state->buffer[2] = T8(state->ctr >> 48);
  state->buffer[3] = T8(state->ctr >> 40);
  state->buffer[4] = T8(state->ctr >> 32);
  state->buffer[5] = T8(state->ctr >> 24);
  state->buffer[6] = T8(state->ctr >> 16);
  state->buffer[7] = T8(state->ctr >>  8);
  state->buffer[8] = T8(state->ctr >>  0);
  lane256_compress(state->buffer, state->h, 0, 0);

  /* write back result */
  U32TO8_BIG(hashval,    state->h[0]);
  U32TO8_BIG(hashval+4,  state->h[1]);
  U32TO8_BIG(hashval+8,  state->h[2]);
  U32TO8_BIG(hashval+12, state->h[3]);
  U32TO8_BIG(hashval+16, state->h[4]);
  U32TO8_BIG(hashval+20, state->h[5]);
  U32TO8_BIG(hashval+24, state->h[6]);
  U32TO8_BIG(hashval+28, state->h[7]);

  return SUCCESS;
}

HashReturn Hash (int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval)
{
  hashState state;
  HashReturn hashReturn;

  if ((hashReturn = Init(&state, hashbitlen)) != SUCCESS)
    return hashReturn;
  if ((hashReturn = Update(&state, data, databitlen)) != SUCCESS)
    return hashReturn;
  if ((hashReturn = Final(&state, hashval)) != SUCCESS)
    return hashReturn;
  return SUCCESS;
}
