#include "params.h"
#include "prg.h"
#include "hash.h"


static void expand_seed(unsigned char outseeds[WOTS_L*HASH_BYTES], const unsigned char inseed[SEED_BYTES])
{
  prg(outseeds, WOTS_L*HASH_BYTES, inseed);
}


static void gen_chain(unsigned char out[HASH_BYTES], const unsigned char seed[HASH_BYTES], const unsigned char *masks, int chainlen)
{
  int i,j;
  for(j=0;j<HASH_BYTES;j++) 
    out[j] = seed[j];

  for(i=0;i<chainlen && i<WOTS_W;i++)
    hash_n_n_mask(out,out,masks+(i*HASH_BYTES));
}


void wots_pkgen(unsigned char pk[WOTS_L*HASH_BYTES], const unsigned char sk[SEED_BYTES], const unsigned char masks[(WOTS_W-1)*HASH_BYTES])
{
  int i;
  expand_seed(pk, sk);
  for(i=0;i<WOTS_L;i++)
    gen_chain(pk+i*HASH_BYTES, pk+i*HASH_BYTES, masks, WOTS_W-1);
}


void wots_sign(unsigned char sig[WOTS_L*HASH_BYTES], const unsigned char msg[HASH_BYTES], const unsigned char sk[SEED_BYTES], const unsigned char masks[(WOTS_W-1)*HASH_BYTES])
{
  int basew[WOTS_L],i,c=0;

#if WOTS_W == 16
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
  for(i=0;i<WOTS_L;i++)
    gen_chain(sig+i*HASH_BYTES, sig+i*HASH_BYTES, masks, basew[i]);
  
#elif WOTS_W == 4
  for(i=0;i<WOTS_L1;i+=4)
  {
    basew[i]   = msg[i/4] & 0x3;
    basew[i+1] = (msg[i/4] >> 2) & 0x3;
    basew[i+2] = (msg[i/4] >> 4) & 0x3;
    basew[i+3] = (msg[i/4] >> 6) & 0x3;
    c += WOTS_W - 1 - basew[i];
    c += WOTS_W - 1 - basew[i+1];
    c += WOTS_W - 1 - basew[i+2];
    c += WOTS_W - 1 - basew[i+3];
  }

  for( ;i<WOTS_L;i++)
  {
    basew[i] = c & 0x3;
    c >>= 2;
  }
  
  expand_seed(sig, sk);
  for(i=0;i<WOTS_L;i++)
    gen_chain(sig+i*HASH_BYTES, sig+i*HASH_BYTES, masks, basew[i]);
  
#else
#error "not yet implemented"
#endif
}

void wots_verify(unsigned char pk[WOTS_L*HASH_BYTES], const unsigned char sig[WOTS_L*HASH_BYTES], const unsigned char msg[HASH_BYTES], const unsigned char masks[(WOTS_W-1)*HASH_BYTES])
{
  int basew[WOTS_L],i,c=0;

#if WOTS_W == 16
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
  
  for(i=0;i<WOTS_L;i++)
    gen_chain(pk+i*HASH_BYTES, sig+i*HASH_BYTES, masks+(basew[i]*HASH_BYTES), WOTS_W-1-basew[i]);
 
#elif WOTS_W == 4
  for(i=0;i<WOTS_L1;i+=4)
  {
    basew[i]   = msg[i/4] & 0x3;
    basew[i+1] = (msg[i/4] >> 2) & 0x3;
    basew[i+2] = (msg[i/4] >> 4) & 0x3;
    basew[i+3] = (msg[i/4] >> 6) & 0x3;
    c += WOTS_W - 1 - basew[i];
    c += WOTS_W - 1 - basew[i+1];
    c += WOTS_W - 1 - basew[i+2];
    c += WOTS_W - 1 - basew[i+3];
  }

  for( ;i<WOTS_L;i++)
  {
    basew[i] = c & 0x3;
    c >>= 2;
  }
   
  for(i=0;i<WOTS_L;i++)
    gen_chain(pk+i*HASH_BYTES, sig+i*HASH_BYTES, masks+(basew[i]*HASH_BYTES), WOTS_W-1-basew[i]);
 
#else
#error "not yet implemented"
#endif
}
