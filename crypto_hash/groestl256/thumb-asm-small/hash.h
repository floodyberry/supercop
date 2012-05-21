#ifndef __hash_h
#define __hash_h

#include "crypto_uint8.h"
#include "crypto_uint32.h"
#include "crypto_uint64.h"
#include "crypto_hash.h"

typedef crypto_uint8 uint8_t; 
typedef crypto_uint32 uint32_t; 
typedef crypto_uint64 uint64_t; 


/* some sizes (number of bytes) */
#define ROWS 8
#define COLS512 8

#define SIZE512 (ROWS*COLS512)

#define HASH_BIT_LEN 256


typedef unsigned char BitSequence;
typedef unsigned long long DataLength;

/*
int crypto_hash(unsigned char *out,
		const unsigned char *in,
		unsigned long long len);
*/

#endif /* __hash_h */
