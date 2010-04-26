
#include "crypto_hash.h"
#include "api.h"
#include "Atelopus.h"

#include <exception>

using namespace std;

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
	try
	{
		//Atelopus32 - 32 bytes output, input block size random between 65 and 128
		Atelopus at(CRYPTO_BYTES, 3, Atelopus::BlockSize128);
		at.Hash(in, out, inlen);
	}
	catch(exception const&)
	{
		return -1;
	}
	return 0;
}

