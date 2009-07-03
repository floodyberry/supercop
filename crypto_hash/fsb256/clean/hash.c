/* Author: Peter Schwabe, based on the ebash reference implementation
 * 2009-06-02
 */

#include "crypto_hash.h"

#include "fsb.h"


int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  if (Hash(crypto_hash_BYTES * 8,in,inlen * 8,out) == SUCCESS) return 0;
  return -1;                                     
}
