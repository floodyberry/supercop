/**
 * Groestl implementation.
 *
 * @file     hash.c
 * @author   Martin Schlaeffer <martin.schlaeffer@iaik.tugraz.at>
 *           Peter Schwabe <peter@cryptojedi.org>
 *
 */

#include <stdio.h>
#include "hash.h"


extern void TF512(u64* h, u64* m);
extern void OF512(u64* h);
extern void INIT(u64* h);

/* digest up to msglen bytes of input (full blocks only) */
void loopcompress(u8 *ctx, const u8 *input, u32 nblocks)
{
  while(nblocks>0)
  {
    TF512((u64*)ctx, (u64*)input);
    nblocks --;
    input += STATEBYTES;
  }
}

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
  static __attribute__ ((aligned(32))) u8 ctx[STATEBYTES];
  static __attribute__ ((aligned(32))) u8 buffer[STATEBYTES*2];
  unsigned long long rlen = inlen;
  u32 nblocks;
  int i;

  for(i=0;i<STATEBYTES*2;i++)
    ctx[i] = 0;

  /* set IV */
  ctx[STATEBYTES - 2] = (CRYPTO_BYTES * 8) >> 8;
  ctx[STATEBYTES - 1] = (CRYPTO_BYTES * 8) & 0xff;

  /* transform IV to vperm form */
  INIT((u64*)ctx);

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
  OF512((u64*)ctx);

  /* store hash result in output */
  for (i=0;i<CRYPTO_BYTES;i++)
    out[i] = *(((unsigned char *)ctx) + STATEBYTES-CRYPTO_BYTES+i);

  return 0;
}
