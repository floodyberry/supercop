/**
 * Groestl implementation.
 *
 * @file     hash.c
 * @author   Peter Schwabe <d.seywald@student.tugraz.at>
 *           Martin Schlaeffer <martin.schlaeffer@iaik.tugraz.at>
 *
 */

#include <stddef.h>
#include <string.h>
#include <stdio.h>

#include "hash.h"
#include "groestl_tables.h"
#include "groestl_asm_perm_p.h"
#include "groestl_asm_compress.h"

void loopcompress(u8 *ctx, const u8 *input, u32 nblocks);
void output_transform(u32 *ctx);

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
  __attribute__ ((aligned (64))) u8 ctx[STATEBYTES*2];
  u32 nblocks;
  int i;
  unsigned long long rlen = inlen;
  unsigned char buffer[2*STATEBYTES];
  
  for(i=0;i<STATEBYTES;i++)
    ctx[i] = 0;
  ctx[STATEBYTES-2] = (CRYPTO_BYTES*8)>>8;
  ctx[STATEBYTES-1] = (CRYPTO_BYTES*8)&0xff;

  while(rlen >= 0x3fffffffc0ULL) 
  {
    loopcompress(ctx, in, 0xffffffff);
    in += 0x3fffffffc0ULL;
    rlen -= 0x3fffffffc0ULL;
  }

  /* Remaining input */
  if(rlen >= STATEBYTES)
  {
    nblocks = (rlen >> 6);
    loopcompress(ctx, in, nblocks);
    in += (nblocks<<6);
    rlen -= (nblocks<<6);
  }
  
  /* Padding */
  if(rlen < STATEBYTES-8) /* one padding block */
  {
    inlen >>= 6;
    inlen += 1;           /* inlen now has total number of blocks */
    for(i=0;i<rlen;i++)
      buffer[i] = in[i];
    buffer[i++] = 0x80;
    for(;i<STATEBYTES-8;i++)
      buffer[i] = 0;
    for(i=0;i<8;i++)
      buffer[STATEBYTES-i-1] = (inlen >> 8*i) & 0xff;
    loopcompress(ctx, buffer,1);
  }
  else /* two padding blocks */
  {
    inlen >>= 6;
    inlen += 2;           /* inlen now has total number of blocks */
    for(i=0;i<rlen;i++)
      buffer[i] = in[i];
    buffer[i++] = 0x80;
    for(;i<2*STATEBYTES-8;i++)
      buffer[i] = 0;
    for(i=0;i<8;i++)
      buffer[2*STATEBYTES-i-1] = (inlen >> 8*i) & 0xff;
    loopcompress(ctx, buffer,2);
  }

  output_transform((u32*)ctx);
  
  /* store hash result in output */
  for (i=0;i<CRYPTO_BYTES;i++) 
    out[i] = *(((unsigned char *)ctx) + STATEBYTES-CRYPTO_BYTES+i);

  return 0;
}

/* digest up to msglen bytes of input (full blocks only) */
void loopcompress(u8 *ctx, const u8 *input, u32 nblocks) 
{
  while(nblocks>0)
  {
    COMPRESS(ctx, input);
    nblocks --;
    input += STATEBYTES;
  }
}

/* given state h, do h <- P(h)+h */
void output_transform(u32 *ctx) 
{
  int i;
  u32 p[STATEWORDS];

  for (i = 0; i < STATEWORDS; i++)
    p[i] = ctx[i];

  PERM_P(p);

  for (i = 0; i < STATEWORDS; i++)
    ctx[i] ^= p[i];
}
