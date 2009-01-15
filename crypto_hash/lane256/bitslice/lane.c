#include <string.h>
#include "lane.h"

void lane256_compress(u64 h[16], const u8 m[64], const u64 ctr, const u64 ctrprev);

void finalize(u64 h[16]);

#define T8(x) ((x) & 0xff)
#ifdef LANE_BIG_ENDIAN
#define U64TO8_BIG(c, v) ((u64*)(c))[0]=v
#else
/* Make sure that the local variable names do not collide with */
/* variables of the calling code (i.e., those used in c, v) */
#define U64TO8_BIG(c, v)    do { \
		u64 tmp_portable_h_x = (v); \
		u8 *tmp_portable_h_d = (c); \
		tmp_portable_h_d[0] = T8(tmp_portable_h_x >> 56); \
		tmp_portable_h_d[1] = T8(tmp_portable_h_x >> 48); \
		tmp_portable_h_d[2] = T8(tmp_portable_h_x >> 40); \
		tmp_portable_h_d[3] = T8(tmp_portable_h_x >> 32); \
		tmp_portable_h_d[4] = T8(tmp_portable_h_x >> 24); \
		tmp_portable_h_d[5] = T8(tmp_portable_h_x >> 16); \
		tmp_portable_h_d[6] = T8(tmp_portable_h_x >> 8); \
		tmp_portable_h_d[7] = T8(tmp_portable_h_x); \
	} while (0)
#endif

HashReturn Init (hashState *state, int hashbitlen)
{
  if (hashbitlen != 256)
    return BAD_HASHBITLEN; /* XXX this implementation only supports Lane256 */

  state->hashbitlen = 256;
  state->ctr = 0;
  state->ctr_prev = 0;
  memset(state->h, 0, 128);
  memset(state->buffer, 0, BLOCKSIZE);
  state->buffer[0] = 0x02; /* flag byte 0x02: IV derivation without seed */
  state->buffer[1] = 0x00; /* digest length in big endian notation */
  state->buffer[2] = 0x00;
  state->buffer[3] = 0x01;
  state->buffer[4] = 0x00;

/* hardwire expanded bitsliced iv (before application of Q-lanes) into code */

state->h[0]=0x1010123102113312;
state->h[1]=0x2032302120322211;
state->h[2]=0x1110020023130310;
state->h[3]=0x1032210003002312;
state->h[4]=0x1311332010110122;
state->h[5]=0x2233213311102311;
state->h[6]=0x21132031210000;
state->h[7]=0x3203131233310133;
state->h[8]=0x2220312000302013;
state->h[9]=0x110020330012113;
state->h[10]=0x132113033101321;
state->h[11]=0x31313323303313;
state->h[12]=0x3223311033223203;
state->h[13]=0x130220222031331;
state->h[14]=0x3000200203212310;
state->h[15]=0x1233113231000220;



  return SUCCESS;
}

HashReturn Update (hashState *state, const BitSequence *data, DataLength databitlen)
{
  const u64 buffill = (state->ctr >> 3) & 0x3f;
  u64 bytes = databitlen >> 3;

  if (state->ctr & 0x7)
    return BAD_DATABITLEN; /* Only the last call to Update() may contain a fractional byte */
 
  /* Check if we have some stuff left in the buffer. If so, fill it, and process it */
  if (buffill) {
    const u64 n = buffill + bytes > BLOCKSIZE ? BLOCKSIZE-buffill : bytes; /* number of bytes to copy */
    memcpy(state->buffer + buffill, data, n);
    state->ctr += n << 3;
    if (buffill + n == BLOCKSIZE) /* full buffer now */
    lane256_compress(state->h, state->buffer, state->ctr, state->ctr_prev);
    data += n;
    bytes -= n;
/* new stuff */
    state->ctr_prev = state->ctr;
  }

  /* Now process as many full blocks as we can directly from the input message */
  while (bytes >= BLOCKSIZE) {
    state->ctr += BLOCKSIZE << 3;
    lane256_compress(state->h, data, state->ctr, state->ctr_prev);
    data += BLOCKSIZE;
    bytes -= BLOCKSIZE;
/* new stuff */
    state->ctr_prev = state->ctr;
  }

  /* And finally, save the last, incomplete message block */
  if (bytes || (databitlen & 0x7)) {
    memcpy(state->buffer, data, databitlen & 0x7 ? bytes+1 : bytes); /* also copy partial byte */
    state->ctr += (bytes << 3) + (databitlen & 0x7);
  }

  return SUCCESS;
}

HashReturn Final (hashState *state, BitSequence *hashval)
{
  /* do zero padding and compress last block, if there is some data in the buffer */
  if (state->ctr & 0x1ff) {
    const u64 n = (((state->ctr - 1) >> 3) + 1) & 0x3f; /* number of bytes in buffer that are (partially) filled */
    if (n < BLOCKSIZE)
      memset(state->buffer + n, 0, BLOCKSIZE-n);
    state->buffer[(state->ctr >> 3)&0x3f] &= ~(0xff >> (state->ctr & 0x7)); /* zero-pad partial byte */
    lane256_compress(state->h, state->buffer, state->ctr, state->ctr_prev);

/* new stuff */
    state->ctr_prev = state->ctr;
  }

  /* output transformation */
  memset(state->buffer, 0, BLOCKSIZE);
  state->buffer[0] = 0x00; /* flag byte 0x00: output transformation without seed */
  state->buffer[1] = T8(state->ctr >> 56); /* message length in big-endian */
  state->buffer[2] = T8(state->ctr >> 48);
  state->buffer[3] = T8(state->ctr >> 40);
  state->buffer[4] = T8(state->ctr >> 32);
  state->buffer[5] = T8(state->ctr >> 24);
  state->buffer[6] = T8(state->ctr >> 16);
  state->buffer[7] = T8(state->ctr >>  8);
  state->buffer[8] = T8(state->ctr >>  0);

/* zero counter */

    lane256_compress(state->h, state->buffer, 0, state->ctr_prev);

/* final Q-lanes hash */

finalize(state->h);

  /* write back result */

  U64TO8_BIG(hashval, state->h[0]); 
  U64TO8_BIG(hashval+8, state->h[1]);
  U64TO8_BIG(hashval+16, state->h[2]);
  U64TO8_BIG(hashval+24, state->h[3]);

  return SUCCESS;
}

HashReturn Hash (int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval)
{
  hashState state;
  HashReturn hashReturn;

  if ((hashReturn = Init(&state, hashbitlen)) != SUCCESS)
    return hashReturn;
  if ((hashReturn = Update(&state, data, databitlen)) != SUCCESS)
    return hashReturn;
  if ((hashReturn = Final(&state, hashval)) != SUCCESS)
    return hashReturn;
  return SUCCESS;
}
