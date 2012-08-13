#include "crypto_auth.h"
#include "crypto_uint64.h"
#define uint64 crypto_uint64
#include "crypto_int64.h"
#define int64 crypto_int64

/* definition from Python-3.2.3/Include/pyport.h */
#define _PyHASH_MULTIPLIER 1000003

int crypto_auth(unsigned char *out,const unsigned char *in,unsigned long long inlen,const unsigned char *k)
{
  register int64 len;
  register const unsigned char *p;
  register uint64 x;
  register uint64 prefix;
  register uint64 suffix;

  /* section 1: load prefix and suffix */
  prefix = *(uint64 *) (k + 0);
  suffix = *(uint64 *) (k + 8);

  /* section 2:
  bytes_hash() in Python-3.2.3/Objects/bytesobject.c
  with the following changes:
  remove assert(_Py_HashSecret_Initialized)
  remove storage of computed hash inside PyBytesObject
  remove test for hash having already been computed
  change a->ob_sval to in
  change Py_SIZE(a) to inlen
  change Py_ssize_t to int64 (test at top of loop forces signed)
  change Py_hash_t to uint64
  change _Py_HashSecret.prefix to prefix
  change _Py_HashSecret.suffix to suffix
  */

  len = inlen;
  if (len == 0) {
    x = 0;
    goto done;
  }
  p = in;
  x = prefix;
  x ^= *p << 7;
  while (--len >= 0)
    x = (_PyHASH_MULTIPLIER*x) ^ *p++;
  x ^= inlen;
  x ^= suffix;
  if (x == -1)
    x = -2;

  /* section 3: store result */
  done:
  *(uint64 *) out = x;

  return 0;
}
