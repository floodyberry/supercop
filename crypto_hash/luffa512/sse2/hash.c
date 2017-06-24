#include "crypto_hash.h"
#include "luffa_for_sse2.h"

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
	if (Hash(crypto_hash_BYTES * 8,in,inlen * 8,out) == SUCCESS) return 0;
	return -1;
}

