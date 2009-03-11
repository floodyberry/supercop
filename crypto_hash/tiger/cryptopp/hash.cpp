#include <cryptopp/tiger.h>
#include "crypto_hash.h"

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
	CryptoPP::Tiger h;
	h.CalculateDigest(out, in, inlen);
	return 0;
}
