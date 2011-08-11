#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include "nist.h"
#include "blake_iv.h"


/* 
 * Increase the counter.
 */
void IncreaseCounter(hashState *state, DataLength databitlen) {
#ifdef HAS_64
      state->count += databitlen;
#else
      u32 old_count = state->count_low;
      state->count_low += databitlen;
      if (state->count_low < old_count)
        state->count_high++;
#endif
}


/* 
 * Initialize the hashState with a given IV.
 * If the IV is NULL, initialize with zeros.
 */
HashReturn InitIV(hashState *state, int hashbitlen, const u32 *IV) {

  int w;
#ifndef MALLOC_BUFFER
  static unsigned char buffer[64*2 + 32*2 + 16];
#endif

  if (!SupportedLength(hashbitlen))
    return BAD_HASHBITLEN;

  w = (hashbitlen <= 256) ? 32 : 64;

  state->hashbitlen = hashbitlen;
  state->wordsize = w;
  state->blocksize = 512*(w/32);
  
#ifdef HAS_64
  state->count = 0;
#else
  state->count_low  = 0;
  state->count_high = 0;
#endif  

#ifdef MALLOC_BUFFER
  state->buffer = malloc(64*(w/32) + 16);
  state->H = malloc(32*(w/32)+16);

  /*
   * Align the buffers to a 128 bit boundary.
   */
  state->buffer += ((unsigned char*)NULL - state->buffer)&15;
  state->H += ((u32*)NULL - state->H)&3;
#else
  state->buffer=buffer;

  /*
   * Align the buffer to a 128 bit boundary.
   */
  state->buffer += ((unsigned char*)NULL - state->buffer)&15;

  state->H=(u32*) (buffer+64*2);
#endif

  if (IV)
    memcpy(state->H, IV, 32*(w/32));
  else
    memset(state->H, 0,  32*(w/32));

  return SUCCESS;
}

/* 
 * Initialize the hashState.
 */
HashReturn Init(hashState *state, int hashbitlen) {
  HashReturn r;

  if (hashbitlen == 224)
    r=InitIV(state, hashbitlen, IV_224);
  else if (hashbitlen == 256)
    r=InitIV(state, hashbitlen, IV_256);
  else if (hashbitlen == 384)
    r=InitIV(state, hashbitlen, (u32*) IV_384);
  else if (hashbitlen == 512)
    r=InitIV(state, hashbitlen, (u32*) IV_512);
  else
    r=FAIL;
  return r;
}



HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen) {
  unsigned current;
  unsigned int bs = state->blocksize;
  static int align = -1;

  if (align == -1)
    align = RequiredAlignment();

#ifdef HAS_64
  current = state->count & (bs - 1);
#else
  current = state->count_low & (bs - 1);
#endif
  
  if (current & 7) {
    /*
     * The number of hashed bits is not a multiple of 8.
     * Very painfull to implement and not required by the NIST API.
     */
    return FAIL;
  }

  while (databitlen > 0) {
    if (IS_ALIGNED(data,align) && current == 0 && databitlen >= bs) {
      /* 
       * We can hash the data directly from the input buffer.
       */
      IncreaseCounter(state, bs);
      Blake_Compress(state, data);
      databitlen -= bs;
      data += bs/8;
    } else {
      /* 
       * Copy a chunk of data to the buffer
       */
      unsigned int len = bs - current;
      if (databitlen < len) {
        memcpy(state->buffer+current/8, data, (databitlen+7)/8);
        IncreaseCounter(state, databitlen);        
        return SUCCESS;
      } else {
        memcpy(state->buffer+current/8, data, len/8);
        IncreaseCounter(state,len);
        databitlen -= len;
        data += len/8;
        current = 0;
        Blake_Compress(state, state->buffer);
      }
    }
  }
  return SUCCESS;
}

HashReturn Final(hashState *state, BitSequence *hashval) {
  u32 lh, ll;
#ifdef HAS_64
  int current = state->count & (state->blocksize - 1);
#else
  int current = state->count_low & (state->blocksize - 1);
#endif
  unsigned int i;
  BitSequence bs[64];
  enum {NONE, PARTIAL, FULL} onemore = FULL;

  /* 
   * If there is still some data in the buffer, pad it, and hash it
   */
  if (current) {
    /* 
     * We first need to pad and zero out the end of the buffer.
     */
    if (state->blocksize - current > 2*state->wordsize+1)
      onemore = NONE;
    else
      onemore = PARTIAL;

    if (current & 7) {
      BitSequence mask = 0xff >> (current&7);
      state->buffer[current/8] &= ~mask;
      state->buffer[current/8] |= 0x80 >> (current&7);

      current = current/8+1;
    } else {
      state->buffer[current/8] = 0x80;

      current = current/8+1;
    }

    memset(state->buffer+current, 0, state->blocksize/8 - current);
  }
  
  if (onemore == PARTIAL) {
    /* 
     * We need an extra padding block:
     *    compress the current block and clear next one
     */
    Blake_Compress(state, state->buffer);
    
    memset(state->buffer, 0, state->blocksize/8);
  }

  if (onemore == FULL) {
    /* 
     * Message size is a multiple of block size:
     *    there is no current block
     */
    memset(state->buffer, 0, state->blocksize/8);

    state->buffer[0] = 0x80;
  }
  
  state->buffer[state->blocksize/8 - ((state->wordsize/32)*8+1)] |= 1;
  
#ifdef HAS_64
  ll = state->count;
  lh = state->count >> 32;
#else
  ll = state->count_low;
  lh = state->count_high;
#endif
  for (i=0; i<4; i++) {
    state->buffer[state->blocksize/8 - 5 - i] = lh & 0xff;
    lh >>= 8;
  }
  for (i=0; i<4; i++) {
    state->buffer[state->blocksize/8 - 1 - i] = ll & 0xff;
    ll >>= 8;
  }
  
  if (onemore == FULL || onemore == PARTIAL) {
#ifdef HAS_64
    state->count = 0;
#else
    state->count_high = 0;
    state->count_low = 0;
#endif
  }
  Blake_Compress(state, state->buffer);

  if (state->wordsize == 32) {
    /*
     * Decode the 32-bit words into a BitSequence
     */
    for (i=0; i<8; i++) {
      u32 x = state->H[i];
      bs[4*i+3] = x&0xff;
      x >>= 8;
      bs[4*i+2] = x&0xff;
      x >>= 8;
      bs[4*i+1] = x&0xff;
      x >>= 8;
      bs[4*i+0] = x&0xff;
    }
  } else {
#ifdef HAS_64
    /*
     * Decode the 64-bit words into a BitSequence
     */
    for (i=0; i<8; i++) {
      u64 x = ((u64*) state->H)[i];
      bs[8*i+7] = x&0xff;
      x >>= 8;
      bs[8*i+6] = x&0xff;
      x >>= 8;
      bs[8*i+5] = x&0xff;
      x >>= 8;
      bs[8*i+4] = x&0xff;
      x >>= 8;
      bs[8*i+3] = x&0xff;
      x >>= 8;
      bs[8*i+2] = x&0xff;
      x >>= 8;
      bs[8*i+1] = x&0xff;
      x >>= 8;
      bs[8*i+0] = x&0xff;
    }
#else
    return FAIL;
#endif
  }
  
  memcpy(hashval, bs, state->hashbitlen/8);
  if (state->hashbitlen%8) {
    BitSequence mask = 0xff << (8 - (state->hashbitlen%8));
    hashval[state->hashbitlen/8 + 1] = bs[state->hashbitlen/8 + 1] & mask;
  }

  return SUCCESS;
}



HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen,
                BitSequence *hashval) {
  hashState s;
  HashReturn r;
  r = Init(&s, hashbitlen);
  if (r != SUCCESS)
    return r;
  r = Update(&s, data, databitlen);
  if (r != SUCCESS)
    return r;
  r = Final(&s, hashval);
  return r;
}
