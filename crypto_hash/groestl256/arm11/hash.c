#include "api.h"
#include "hash.h"

extern void loopcompress(u32 *ctx, const unsigned char *input, u32 nblocks);
extern void output_transform(u32 *ctx);

/* initialise context */
void Init(u32 *ctx) 
{
  int i;
  for(i=0;i<STATEWORDS;i++)
    ctx[i] = 0;

  /* set initial value */
  ctx[STATEWORDS-1] = U32BIG((u32)(CRYPTO_BYTES*8));
}

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
  u32 ctx[STATEWORDS];
  u32 nblocks;
  int i;
  unsigned long long rlen = inlen;
  unsigned char buffer[2*STATEBYTES];
  
  Init(ctx);

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

  output_transform(ctx);
  
  /* store hash result in output */
  for (i=0;i<CRYPTO_BYTES;i++) 
    out[i] = *(((unsigned char *)ctx) + STATEBYTES-CRYPTO_BYTES+i);

  return 0;
}
