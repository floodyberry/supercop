#include "hash.h"

extern const u32 groestl_tables[4*512];

extern void qloop(u32 *x, const u32 *tables);
extern void ploop(u32 *x, const u32 *tables);

static void compress(u32 *ctx, const u32 *m) 
{
  __attribute__ ((aligned (8))) u32 p[STATEWORDS];
  __attribute__ ((aligned (8))) u32 q[STATEWORDS];

  int i;

  for (i = 0; i < STATEWORDS; i++)
    q[i] = m[i];
  qloop(q, groestl_tables);
  
  for (i = 0; i < STATEWORDS; i++)
    p[i] = ctx[i] ^ m[i];
  ploop(p, groestl_tables);
	
  /* h' == h + Q(m) + P(h+m) */
  for (i = 0; i < STATEWORDS; i++) {
    ctx[i] ^= q[i] ^ p[i];
  }
}


/* digest up to msglen bytes of input (full blocks only) */
void loopcompress(u32 *ctx, const unsigned char *input, u32 nblocks) 
{
  while(nblocks>0)
  {
    compress(ctx,(u32*)input);

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
  ploop(p, groestl_tables);

  for (i = 0; i < STATEWORDS; i++)
    ctx[i] ^= p[i];
}
