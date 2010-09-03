#include "crypto_hash.h"
#include "luffa384_avr.h"

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
	luffa384(in, (uint16_t) inlen, out);  
	return 0;
}
