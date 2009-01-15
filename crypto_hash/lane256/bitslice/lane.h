/*
 * Lane 256
 */

#ifndef LANE_H
#define LANE_H

#define BLOCKSIZE 64

typedef unsigned char BitSequence;
typedef unsigned long long DataLength;

typedef enum { SUCCESS = 0, FAIL = 1, BAD_HASHBITLEN = 2, BAD_DATABITLEN = 3 } HashReturn;

#include "crypto_uint8.h"
#include "crypto_uint64.h"
typedef crypto_uint8 u8;
typedef crypto_uint64 u64;

typedef struct {
  int hashbitlen;
  u64 ctr;
/* keep the previous counter for the Q-lanes */
  u64 ctr_prev;
  u64 h[16];
  u8 buffer[BLOCKSIZE];
} hashState;

HashReturn Init (hashState *state, int hashbitlen);
HashReturn Update (hashState *state, const BitSequence *data, DataLength databitlen);
HashReturn Final (hashState *state, BitSequence *hashval);
HashReturn Hash (int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval);

#endif
