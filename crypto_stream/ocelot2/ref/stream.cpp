#include "crypto_stream.h"
#include "api.h"
#include "Ocelot2.h"

int crypto_stream(
	unsigned char *out,
	unsigned long long outlen,
	const unsigned char *n,
	const unsigned char *k
)
{
	Ocelot2 prng(k, crypto_stream_ocelot1_ref_KEYBYTES, Ocelot2::OCELOTSize32);
	unsigned char *p=out;
	for (unsigned long long l=0; l<outlen; l++,p++)
	{
		prng.GetNextByte(*p);
	}
	return 0;
}

int crypto_stream_xor(
	unsigned char *out,
	const unsigned char *in,
	unsigned long long inlen,
	const unsigned char *n,
	const unsigned char *k
)
{
	Ocelot2 prng(k, crypto_stream_ocelot1_ref_KEYBYTES, Ocelot2::OCELOTSize32);
	unsigned char rnd;
	const unsigned char *p1=in;
	unsigned char *p2=out;
	for (unsigned long long l=0; l<inlen; l++,p1++,p2++)
	{
		prng.GetNextByte(rnd);
		*p2 = *p1 ^ rnd;
	}
	return 0;
}

