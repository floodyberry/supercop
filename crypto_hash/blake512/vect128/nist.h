#ifndef __NIST_H__
#define __NIST_H__

#include "compat.h"

/*
 * NIST API Specific types.
 */

typedef unsigned char BitSequence;

#ifdef HAS_64
  typedef u64 DataLength;
#else
  typedef unsigned long DataLength;
#endif

typedef enum { SUCCESS = 0, FAIL = 1, BAD_HASHBITLEN = 2} HashReturn;

typedef struct {
  unsigned int hashbitlen;
  unsigned int blocksize;
  unsigned int wordsize;

#ifdef HAS_64
  u64 count;
#else
  u32 count_low;
  u32 count_high;
#endif

  u32 *H;
  unsigned char* buffer;
} hashState;

/* 
 * NIST API
 */

HashReturn Init(hashState *state, int hashbitlen);
HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen);
HashReturn Final(hashState *state, BitSequence *hashval);
HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen,
                BitSequence *hashval);

/* 
 * Internal API
 */
char* VERSION(void);
int SupportedLength(int hashbitlen);
int RequiredAlignment(void);
void Blake_Compress(hashState * state, const unsigned char *M);

void fft128_natural(fft_t *a, unsigned char *x);
void fft256_natural(fft_t *a, unsigned char *x);

#endif
