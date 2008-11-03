#include "crypto_smult.h"

static const unsigned char basepoint[32] = {9};

int crypto_smult_base(unsigned char *q,const unsigned char *n)
{
  return crypto_smult(q, n, basepoint);
}
