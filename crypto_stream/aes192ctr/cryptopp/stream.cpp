#include <cryptopp/aes.h>
#include <cryptopp/modes.h>
#include "crypto_stream.h"

int crypto_stream(
unsigned char *out,
unsigned long long outlen,
const unsigned char *n,
const unsigned char *k
)
{
	CryptoPP::CTR_Mode<CryptoPP::AES>::Encryption s;
	s.SetKeyWithIV(k, 24, n);
	s.GenerateBlock(out, (size_t)outlen);
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
	CryptoPP::CTR_Mode<CryptoPP::AES>::Encryption s;
	s.SetKeyWithIV(k, 24, n);
	s.ProcessString(out, in, (size_t)inlen);
	return 0;
}
