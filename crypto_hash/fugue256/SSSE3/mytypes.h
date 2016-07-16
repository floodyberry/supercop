#ifndef _MYTYPES_
#define _MYTYPES_

typedef  unsigned char  crypto_uint8;
typedef  unsigned int crypto_uint32;
typedef  unsigned long  crypto_uint64;

int crypto_hash(
       unsigned char *out,
       const unsigned char *in,
       unsigned long long inlen
		);

#endif
