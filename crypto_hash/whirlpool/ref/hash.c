#include "nessie.h"
#include "crypto_hash.h"

extern void NESSIEinit(struct NESSIEstruct *);
extern void NESSIEadd(const unsigned char *,unsigned long,struct NESSIEstruct *);
extern void NESSIEfinalize(struct NESSIEstruct *,unsigned char *);

int crypto_hash(unsigned char *out,const unsigned char *in,unsigned long long inlen)
{
  NESSIEstruct c;
  NESSIEinit(&c);
  while (inlen > 16777216) {
    NESSIEadd(in,8*16777216,&c);
    in += 16777216;
    inlen -= 16777216;
  }
  NESSIEadd(in,8*inlen,&c);
  NESSIEfinalize(&c,out);
  return 0;
}
