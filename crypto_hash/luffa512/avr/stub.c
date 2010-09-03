#include "crypto_hash.h"
#include "luffa512_avr.h"

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
	luffa512(in, (uint16_t) inlen, out);  
	return 0;
}
