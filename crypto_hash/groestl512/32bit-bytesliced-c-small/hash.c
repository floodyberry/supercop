/* hash.c   April 2012
 * Groestl ANSI C code optimized for size on 32-bit architectures
 * Authors: Martin Schlaeffer
 *
 */

#include "hash.h"
#include "tables.h"

#define COLWORDS     (STATEWORDS/8)
#define BYTESLICE(i) (((i)%8)*STATECOLS+(i)/8)

#if CRYPTO_BYTES<=32
static const u32 columnconstant[2] = { 0x30201000, 0x70605040 };
static const u8 shiftvalues[2][8] = { {0, 1, 2, 3, 4, 5, 6, 7}, {1, 3, 5, 7, 0, 2, 4, 6} };
#else
static const u32 columnconstant[4] = { 0x30201000, 0x70605040, 0xb0a09080, 0xf0e0d0c0 };
static const u8 shiftvalues[2][8] = { {0, 1, 2, 3, 4, 5, 6, 11}, {1, 3, 5, 11, 0, 2, 4, 6} };
#endif

#define mul2(x,t) \
{\
  t = x & 0x80808080;\
  x ^= t;\
  x <<= 1;\
  t = t >> 7;\
  t ^= (t << 1);\
  x ^= t;\
  x ^= (t << 3);\
}

void mixbytes(u32 a[8][COLWORDS], u32 b[8], int s)
{
  int i;
  u32 t0, t1, t2;

  for (i=0; i<8; i++)
    b[i] = a[i][s];

  /* y_i = a_{i+6} */
  for (i=0; i<8; i++)
    a[i][s] = b[(i+2)%8];

  /* t_i = a_i + a_{i+1} */
  for (i=0; i<7; i++)
    b[i] ^= b[(i+1)%8];
  b[7] ^= a[6][s];

  /* y_i = a_{i+6} + t_i */
  for (i=0; i<8; i++)
    a[i][s] ^= b[(i+4)%8];

  /* y_i = y_i + t_{i+2} */
  for (i=0; i<8; i++)
    a[i][s] ^= b[(i+6)%8];

  /* x_i = t_i + t_{i+3} */
  t0 = b[0];
  t1 = b[1];
  t2 = b[2];
  for (i=0; i<5; i++)
    b[i] ^= b[(i+3)%8];
  b[5] ^= t0;
  b[6] ^= t1;
  b[7] ^= t2;

  /* z_i = 02 * x_i */
  for (i=0; i<8; i++)
    mul2(b[i],t0);

  /* w_i = z_i + y_{i+4} */
  for (i=0; i<8; i++)
    b[i] ^= a[i][s];

  /* v_i = 02 * w_i */
  for (i=0; i<8; i++)
    mul2(b[i],t0);

  /* b_i = v_{i+3} + y_{i+4} */
  for (i=0; i<8; i++)
    a[i][s] ^= b[(i+3)%8];
}

void permutation(u32 *x, int q)
{
  __attribute__ ((aligned (8))) u32 tmp[8];
  u32 constant;
  int i, j;
  for(constant=0; constant<(0x01010101*ROUNDS); constant+=0x01010101)
  {
    if (q==0)
    {
      for (j=0; j<COLWORDS; j++)
        x[j] ^= columnconstant[j]^constant;
    }
    else
    {
      for(i=0;i<STATEWORDS;i++)
        x[i] = ~x[i];
      for (j=0; j<COLWORDS; j++)
        x[STATEWORDS-COLWORDS+j] ^= columnconstant[j]^constant;
    }
    for (i=0; i<8; i++)
    {
      for (j=0; j<COLWORDS; j++)
        tmp[j] = x[i*COLWORDS+j];
      for (j=0; j<STATECOLS; j++)
        ((u8*)x)[i*STATECOLS+j] = S[((u8*)tmp)[(j+shiftvalues[q][i])%STATECOLS]];
    }

    for (j=0; j<COLWORDS; j++)
      mixbytes((u32(*)[COLWORDS])x, tmp, j);
  }
}

void memxor(u32* dest, const u32* src, u32 n)
{
  while(n--)
  {
    *dest ^= *src;
    dest++;
    src++;
  }
}

struct state {
  u8 bytes_in_block;
  u8 first_padding_block;
  u8 last_padding_block;
};

void setmessage(u8* buffer, const u8* in, struct state s, unsigned long long inlen)
{
  int i;
  for (i = 0; i < s.bytes_in_block; i++)
    buffer[BYTESLICE(i)] = in[i];

  if (s.bytes_in_block != STATEBYTES)
  {
    if (s.first_padding_block)
    {
      buffer[BYTESLICE(i)] = 0x80;
      i++;
    }

    for(;i<STATEBYTES;i++)
      buffer[BYTESLICE(i)] = 0;

    if (s.last_padding_block)
    {
      inlen /= STATEBYTES;
      inlen += (s.first_padding_block==s.last_padding_block) ? 1 : 2;
      for(i=STATEBYTES-8;i<STATEBYTES;i++)
        buffer[BYTESLICE(i)] = (inlen >> 8*(STATEBYTES-i-1)) & 0xff;
    }
  }
}

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
  __attribute__ ((aligned (8))) u32 ctx[STATEWORDS];
  __attribute__ ((aligned (8))) u32 buffer[STATEWORDS];
  unsigned long long rlen = inlen;
  struct state s = { STATEBYTES, 0, 0 };
  u8 i;

  /* set inital value */
  for(i=0;i<STATEWORDS;i++)
    ctx[i] = 0;
  ((u8*)ctx)[BYTESLICE(STATEBYTES-2)] = ((CRYPTO_BYTES*8)>>8)&0xff;
  ((u8*)ctx)[BYTESLICE(STATEBYTES-1)] = (CRYPTO_BYTES*8)&0xff;

  /* iterate compression function */
  while(s.last_padding_block == 0)
  {
    if (rlen<STATEBYTES)
    {
      if (s.first_padding_block == 0)
      {
        s.bytes_in_block = rlen;
        s.first_padding_block = 1;
        s.last_padding_block = (s.bytes_in_block < STATEBYTES-8) ? 1 : 0;
      }
      else
      {
        s.bytes_in_block = 0;
        s.first_padding_block = 0;
        s.last_padding_block = 1;
      }
    }
    else
      rlen-=STATEBYTES;

    /* compression function */
    setmessage((u8*)buffer, in, s, inlen);
    memxor(buffer, ctx, STATEWORDS);
    permutation(buffer, 0);
    memxor(ctx, buffer, STATEWORDS);
    setmessage((u8*)buffer, in, s, inlen);
    permutation(buffer, 1);
    memxor(ctx, buffer, STATEWORDS);

    /* increase message pointer */
    in += STATEBYTES;
  }

  /* output transformation */
  for (i=0; i<STATEWORDS; i++)
    buffer[i] = ctx[i];
  permutation(buffer, 0);
  memxor(ctx, buffer, STATEWORDS);

  /* return truncated hash value */
  for (i = STATEBYTES-CRYPTO_BYTES; i < STATEBYTES; i++)
    out[i-(STATEBYTES-CRYPTO_BYTES)] = ((u8*)ctx)[BYTESLICE(i)];

  return 0;
}
