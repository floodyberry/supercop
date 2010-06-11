
/* hash.c
 *
 * wrapper for Groestl bitsliced implementation
 *
 */

#include "crypto_hash.h"
#include "hash.h"


int crypto_hash(unsigned char *out, 
		const unsigned char *in, 
		unsigned long long inlen)
{
  int ret;
  
  ret = crypto_hash_groestl256_bitsliced(out, in, inlen);
  
  return ret;
}

