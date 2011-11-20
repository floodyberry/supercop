#include "api.h"
#include "crypto_hash.h"
#include "crypto_uint32.h"

typedef crypto_uint32 u32;
 
extern u32 TrH0_256[32];
extern u32 cst[6+42*8];
const u32 *seq=cst+4;

extern void loopcompress(u32 *in, u32 nblocks, u32 *ctx, const u32 *seq);

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  u32 ctx[8][4];
  int i;
  unsigned char buffer[128];
  unsigned long long bitlen = inlen<<3;

  // Init
  /*
  for (i = 0; i < 32; i++)  
    ctx[i] = ((u32*) h0)[i];
    */
  
  for (i=0; i<32; i++) 
    ctx[i>>2][i&3] = TrH0_256[i];

  // Update
  /*
  while(inlen>=64)
  {
    //compress(ctx,in);
    inlen -= 64;
    in += 64;
  }
  */
  //XXX Handle long messages!
  loopcompress((u32 *)in, inlen>>6, &ctx[0][0], seq);
  in += (inlen & ~0x3f);
  inlen &= 0x3f;
  /* padding */
  if(!inlen)
  {
    buffer[0] =0x80;
    for(i=1;i<56;i++) 
      buffer[i] = 0;
    for(i=56;i<64;i++)
      buffer[i] = (bitlen >> 8*(63-i)) & 0xff;
//    compress(ctx, buffer);
    loopcompress((u32 *)buffer, 1, &ctx[0][0], seq);
  }
  else
  {
    for(i=0;i<inlen;i++)
      buffer[i] = in[i];
    buffer[inlen] = 0x80;
    for(i=inlen+1;i<120;i++)
      buffer[i] = 0;
    for(i=120;i<128;i++)
      buffer[i] = (bitlen >> 8*(127-i)) & 0xff;
    //compress(ctx, buffer);
    //compress(ctx, buffer+64);
    loopcompress((u32 *)buffer, 2, &ctx[0][0], seq);
  }

  //Final
//  for(i=0;i<crypto_hash_BYTES;i++)
//    out[i] = ((unsigned char *) ctx)[96+i];
	
	u32 *X = (u32 *) &ctx[0][0];
	u32 *H = (u32 *) out;
  for (i=24; i<32; i++) H[i-24] = X[((i&3)<<3)+(i>>3)+(i&4)];

  return 0;
}
