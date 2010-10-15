#include "crypto_hash.h"
#include "SHA3api_ref.h"

int crypto_hash(unsigned char *out, const unsigned char *in, 
unsigned long long inlen)
{
Hash(crypto_hash_BYTES*8,in,inlen*8,out);
return 0;
}
