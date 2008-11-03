/*
version 20081011
Matthew Dempsky
Public domain.
Derived from public domain code by D. J. Bernstein.
*/

#include "crypto_smult.h"

const unsigned char base[32] = {9};

int crypto_smult_base(unsigned char *q,
  const unsigned char *n)
{
  return crypto_smult(q,n,base);
}
