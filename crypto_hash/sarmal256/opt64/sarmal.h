/*
 *
 *
 *
 */

#ifndef _SARMAL_H_
#define _SARMAL_H_

typedef unsigned char BitSequence;

typedef unsigned long long DataLength;
typedef unsigned long long Bit64;

typedef enum { SUCCESS = 0, FAIL = 1, BAD_HASHBITLEN = 2 } HashReturn;

typedef struct {
	/* hashbitlen + algorithm specific parameters */

	Bit64 h[8];	/* chaining values */

	Bit64 c[2];	/* constant values */
	Bit64 s[4];	/* salt values */
	Bit64 t;	/* # of hashed bits so far */
	
	BitSequence messageblock[128];	/* 1024-bit message block */

	int remainingbitlen;	/* remaining data length */
	int hashbitlen;		/* hash size */

} hashState;

HashReturn Init(hashState *state, int hashbitlen);
HashReturn Update(hashState *state, const BitSequence *data, DataLength databitlen);
HashReturn Final(hashState *state, BitSequence *hashval);
HashReturn Hash(int hashbitlen, const BitSequence *data, DataLength databitlen, BitSequence *hashval);

#endif /* sarmal.h */

