#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "params.h"
#include "prg.h"
#include "hash.h"


static void expand_seed(unsigned char outseeds[WOTS_L*HASH_BYTES], const unsigned char inseed[SEED_BYTES])
{
  prg(outseeds, WOTS_L*HASH_BYTES, inseed);
}


//XXX: optimize this one!
extern void genfullchain8x(unsigned char *, const unsigned char *);
static void gen_fullchains(unsigned char x[WOTS_L*HASH_BYTES], const unsigned char masks[(WOTS_W-1)*HASH_BYTES])
{
  int i, j;

  genfullchain8x(x, masks);
  genfullchain8x(x+ 8*HASH_BYTES, masks);
  genfullchain8x(x+16*HASH_BYTES, masks);
  genfullchain8x(x+24*HASH_BYTES, masks);

  genfullchain8x(x+32*HASH_BYTES, masks);
  genfullchain8x(x+40*HASH_BYTES, masks);
  genfullchain8x(x+48*HASH_BYTES, masks);
  genfullchain8x(x+56*HASH_BYTES, masks);

  for(i=64;i<WOTS_L;i++)
    for(j=0; j < WOTS_W-1; j++)
    {
      //vec_xor(x+i*HASH_BYTES, x+i*HASH_BYTES, masks+(j*HASH_BYTES), HASH_BYTES);

      hash_n_n_mask(x+i*HASH_BYTES, x+i*HASH_BYTES, masks+(j*HASH_BYTES));
    }
}

//XXX: optimize this one!
static void gen_partialchains(unsigned char out[WOTS_L*HASH_BYTES], const unsigned char in[WOTS_L*HASH_BYTES], const unsigned char *masks, int chainlens[WOTS_L])
{
  int i,j;

  for(i=0;i<WOTS_L;i++)
  {
    for(j=0;j<HASH_BYTES;j++)
      out[i*HASH_BYTES+j] = in[i*HASH_BYTES+j];
    for(j=0;j<chainlens[i];j++)
    {
      //vec_xor(out+i*HASH_BYTES,out+i*HASH_BYTES,masks+j*HASH_BYTES,HASH_BYTES);
      hash_n_n_mask(out+i*HASH_BYTES,out+i*HASH_BYTES,masks+j*HASH_BYTES);
    }
  }
}



void wots_pkgen(unsigned char pk[WOTS_L*HASH_BYTES], const unsigned char sk[SEED_BYTES], const unsigned char masks[(WOTS_W-1)*HASH_BYTES])
{
  expand_seed(pk, sk);
  gen_fullchains(pk, masks);
}


void wots_sign(unsigned char sig[WOTS_L*HASH_BYTES], const unsigned char msg[HASH_BYTES], const unsigned char sk[SEED_BYTES], const unsigned char masks[(WOTS_W-1)*HASH_BYTES])
{
  int basew[WOTS_L],i,c=0;

#if WOTS_W != 16
#error "Implementation specialized for WOTS_W == 16"
#endif

  for(i=0;i<WOTS_L1;i+=2)
  {
    basew[i]   = msg[i/2] & 0xf;
    basew[i+1] = msg[i/2] >> 4;
    c += WOTS_W - 1 - basew[i];
    c += WOTS_W - 1 - basew[i+1];
  }

  for( ;i<WOTS_L;i++)
  {
    basew[i] = c & 0xf;
    c >>= 4;
  }
  
  expand_seed(sig, sk);
  /*
  for(i=0;i<WOTS_L;i++)
    gen_chain(sig+i*HASH_BYTES, sig+i*HASH_BYTES, masks, basew[i]);
  */
  gen_partialchains(sig,sig,masks,basew);
}


//static void gen_chain(unsigned char out[HASH_BYTES], const unsigned char in[HASH_BYTES], const unsigned char *masks, int chainlen)
//{
//  int i;
//
//  memcpy(out, in, HASH_BYTES);
//
//  for(i=0;i<chainlen && i<WOTS_W;i++)
//    hash_n_n_mask(out,out,masks+(i*HASH_BYTES));
//}

void wots_verify(unsigned char pk[WOTS_L*HASH_BYTES], const unsigned char sig[WOTS_L*HASH_BYTES], const unsigned char msg[HASH_BYTES], const unsigned char masks[(WOTS_W-1)*HASH_BYTES])
{
  int basew[WOTS_L],i,c=0,j, k, l;

  unsigned char tmp[8*HASH_BYTES];

#if WOTS_W != 16
#error "Implementation specialized for WOTS_W == 16"
#endif

  for(i=0;i<WOTS_L1;i+=2)
  {
    basew[i]   = msg[i/2] & 0xf;
    basew[i+1] = msg[i/2] >> 4;
    c += WOTS_W - 1 - basew[i];
    c += WOTS_W - 1 - basew[i+1];
  }

  for( ;i<WOTS_L;i++)
  {
    basew[i] = c & 0xf;
    c >>= 4;
  }

  // as much as possible 8 times parallel
  for(i=0; (i+8) < WOTS_L; i+=8)
  {
    memcpy(tmp, sig+i*HASH_BYTES, 8*HASH_BYTES);

    int cnt = (1 << 8) - 1;

    // remove basew == 0 cases
    for (k = 0; k < 8; k++)
      if (0 == WOTS_W-1-basew[i+k])
      {
        memcpy(pk+(i+k)*HASH_BYTES, tmp+k*HASH_BYTES, HASH_BYTES);
        cnt ^= (1 << k);
      }

    for(j=0; (j < WOTS_W) & (cnt > 0); )
    {
      for (k = 0; k < 8; k++)
        for (l = 0; l < 32; l++)
          tmp[l + k*HASH_BYTES] ^= (masks+(basew[i+k]*HASH_BYTES)+(j*HASH_BYTES))[l];

      hash_n_n_8x(tmp, tmp);

      j++;

      for (k = 0; k < 8; k++)
        if (j == WOTS_W-1-basew[i+k])// | (j == WOTS_W))
        {
          memcpy(pk+(i+k)*HASH_BYTES, tmp+k*HASH_BYTES, HASH_BYTES);
          cnt ^= (1 << k);
        }
    }
  }

  // rest one by one...
  for(; (i) < WOTS_L; i+=1)
  {
    memcpy(tmp, sig+i*HASH_BYTES, HASH_BYTES);

    for(j=0; j < WOTS_W-1-basew[i]; j++)
      hash_n_n_mask(tmp, tmp, masks+(basew[i]*HASH_BYTES)+(j*HASH_BYTES));

    memcpy(pk+i*HASH_BYTES, tmp, HASH_BYTES);
  }

}

