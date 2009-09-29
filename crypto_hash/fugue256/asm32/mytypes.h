#ifndef _MYTYPES_
#define _MYTYPES_

typedef short  crypto_uint8;
typedef  unsigned long crypto_uint32;
typedef  unsigned long long crypto_uint64;

int crypto_hash(
       unsigned char *out,
       const unsigned char *in,
       unsigned long long inlen
		);

#endif
