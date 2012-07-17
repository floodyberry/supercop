/**
 * Groestl implementation.
 *
 * @file     hash.c
 * @author   Peter Schwabe <peter@cryptojedi.org>
 *           Martin Schlaeffer <martin.schlaeffer@iaik.tugraz.at>
 *
 */

#include <stddef.h>
#include <string.h>
#include <stdio.h>

#include "hash.h"
#include "groestl_tables.h"
#include "groestl_asm_outputtrans.h"
#include "groestl_asm_compress.h"

/* digest up to msglen bytes of input (full blocks only) */
void loopcompress(u8 *ctx, const u8 *input, u32 nblocks)
{
  while(nblocks > 0)
  {
    COMPRESS(ctx, ctx + STATEBYTES, input);
    nblocks--;
    input += STATEBYTES;
  }
}

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
  static __attribute__ ((aligned(16))) u8 ctx[STATEBYTES * 2];
  static __attribute__ ((aligned(16))) u8 buffer[STATEBYTES * 2];
  unsigned long long rlen = inlen;
  u32 nblocks;
  int i;
  
  for(i = 0; i < STATEBYTES; ++i)
    ctx[i] = 0;
  ctx[STATEBYTES - 2] = (CRYPTO_BYTES * 8) >> 8;
  ctx[STATEBYTES - 1] = (CRYPTO_BYTES * 8) & 0xff;

  while(rlen >= 0x3fffffffc0ULL) 
  {
    loopcompress(ctx, in, 0xffffffff);
    in += 0x3fffffffc0ULL;
    rlen -= 0x3fffffffc0ULL;
  }

  /* remaining input */
  if(rlen >= STATEBYTES)
  {
    nblocks = (rlen / STATEBYTES);
    loopcompress(ctx, in, nblocks);
    in += (nblocks * STATEBYTES);
    rlen -= (nblocks * STATEBYTES);
  }
  
  /* padding */
  int npad = (rlen < STATEBYTES - 8) ? 1 : 2;
  inlen /= STATEBYTES;
  inlen += npad;
  for(i = 0; i < rlen; ++i)
    buffer[i] = in[i];
  buffer[i++] = 0x80;
  for(; i < npad * STATEBYTES - 8; ++i)
    buffer[i] = 0;
  for(i = 0; i < 8; ++i)
    buffer[npad * STATEBYTES - i - 1] = (inlen >> 8 * i) & 0xff;
  loopcompress(ctx, buffer, npad);

  /* output transformation */
  OUTPUTTRANS(ctx);
  for (i = 0; i < CRYPTO_BYTES; ++i)
    out[i] = *(((unsigned char*) ctx) + STATEBYTES - CRYPTO_BYTES + i);

  return 0;
}
