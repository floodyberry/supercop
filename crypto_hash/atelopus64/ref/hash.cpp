
#include "crypto_hash.h"
#include "api.h"
#include "Atelopus.h"

#include <exception>

using namespace std;

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
	try
	{
		//Atelopus64 - 64 bytes output, input block size random between 129 and 256
		Atelopus at(CRYPTO_BYTES, 3, Atelopus::BlockSize256);
		at.Hash(in, out, inlen);
	}
	catch(exception const&)
	{
		return -1;
	}
	return 0;
}

