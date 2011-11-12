#include <string.h>
#include <stdio.h>

#include "crypto_hash.h"
#include "crypto_uint64.h"
#include "crypto_uint32.h"
#include "crypto_uint8.h"

typedef crypto_uint64 u64;
typedef crypto_uint32 u32;
typedef crypto_uint8 u8; 

typedef struct  { 
  u32 h[8], s[4], t[2];
} state;

const u32 cst[16] = {
  0x243F6A88,0x85A308D3,0x13198A2E,0x03707344,
  0xA4093822,0x299F31D0,0x082EFA98,0xEC4E6C89,
  0x452821E6,0x38D01377,0xBE5466CF,0x34E90C6C,
  0xC0AC29B7,0xC97C50DD,0x3F84D5B5,0xB5470917};

extern void compress(state *S, const u8 *block, u32 nblocks, const u32 *cst);

int crypto_hash( unsigned char *out, const unsigned char *in, unsigned long long inlen ) {

  state S;  
  u8 buf[128];
  int i;
  u32 nblocks;
  unsigned long long rlen = inlen;
  inlen <<= 3; //required later in padding
  
  /* Init */
  S.h[0] = 0x6A09E667;
  S.h[1] = 0xBB67AE85;
  S.h[2] = 0x3C6EF372;
  S.h[3] = 0xA54FF53A;
  S.h[4] = 0x510E527F;
  S.h[5] = 0x9B05688C;
  S.h[6] = 0x1F83D9AB;
  S.h[7] = 0x5BE0CD19;
  S.s[0] = 0;
  S.s[1] = 0;
  S.s[2] = 0;
  S.s[3] = 0;
  S.t[0] = 0;
  S.t[1] = 0;

  /* Hashing full blocks */
  /* Input larger than 2^32 blocks */
  while(rlen >= 0x3fffffffc0ULL) {
    compress(&S, in, 0xffffffff, cst);
    in += 0x3fffffffc0ULL;
    rlen -= 0x3fffffffc0ULL;
  }

  /* Remaining input */
  if(rlen >= 64)
  {
    nblocks = (rlen >> 6);
    compress(&S, in, nblocks, cst);
    in += (nblocks<<6);
    rlen -= (nblocks<<6);
  }

  /* Padding and hashing final blocks */
  /* Just one block required */
  if(rlen <= 55)
  {
    for(i=0;i<rlen;i++)
      buf[i] = in[i];
    buf[i] = 0x80;
    i++;
    for(;i<56;i++)
      buf[i] = 0;
    buf[55] ^= 0x01;
    for(i=0;i<8;i++)
      buf[56+i] = (u8) ((inlen >> (56-8*i)) & 0xff);
    if(rlen == 0)
    {
      S.t[0] = -512;
      S.t[1] = -1;
    }
    else
    {
      if (S.t[0] < (512 - (rlen<<3))) S.t[1]--;
      S.t[0] -= (512 - (rlen<<3));
    }
    compress(&S, buf, 1, cst);
  }
  /* Two blocks required */
  else
  {
    for(i=0;i<rlen;i++)
      buf[i] = in[i];
    buf[i] = 0x80;
    i++;
    for(;i<119;i++)
      buf[i] = 0;
    buf[119] = 0x01;
    for(i=0;i<8;i++)
      buf[120+i] = (u8) ((inlen >> (56-8*i)) & 0xff);

    if (S.t[0] < (512 - (rlen<<3))) S.t[1]--;
    S.t[0] -= (512 - (rlen<<3));
    compress(&S, buf, 1, cst);

    S.t[0] = -512;
    S.t[1] = -1;
    compress(&S, buf+64, 1, cst);
  }

  /* Finalize */
  for(i=0;i<8;i++)
  {
    out[4*i  ] =  S.h[i] >> 24;
    out[4*i+1] = (S.h[i] >> 16) & 0xff;
    out[4*i+2] = (S.h[i] >>  8) & 0xff;
    out[4*i+3] =  S.h[i]        & 0xff;
  }

  return 0;
}
