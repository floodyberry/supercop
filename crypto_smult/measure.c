#include <stdlib.h>
#include "randombytes.h"
#include "cpucycles.h"
#include "crypto_smult.h"

extern void printentry(long long,const char *,long long *,long long);
extern unsigned char *alignedcalloc(unsigned long long);
extern const char *primitiveimplementation;
extern const char *implementationversion;
extern const char *sizenames[];
extern const long long sizes[];
extern void allocate(void);
extern void measure(void);

const char *primitiveimplementation = crypto_smult_IMPLEMENTATION;
const char *implementationversion = crypto_smult_VERSION;
const char *sizenames[] = { "outputbytes", "scalarbytes", 0 };
const long long sizes[] = { crypto_smult_BYTES, crypto_smult_SCALARBYTES };

static unsigned char *m;
static unsigned char *n;
static unsigned char *p;
static unsigned char *q;

void allocate(void)
{
  m = alignedcalloc(crypto_smult_SCALARBYTES);
  n = alignedcalloc(crypto_smult_SCALARBYTES);
  p = alignedcalloc(crypto_smult_BYTES);
  q = alignedcalloc(crypto_smult_BYTES);
}

#define TIMINGS 63
static long long cycles[TIMINGS + 1];

void measure(void)
{
  int i;
  int loop;

  for (loop = 0;loop < 3;++loop) {
    randombytes(m,crypto_smult_SCALARBYTES);
    randombytes(n,crypto_smult_SCALARBYTES);
    for (i = 0;i <= TIMINGS;++i) {
      cycles[i] = cpucycles();
      crypto_smult_base(p,m);
    }
    for (i = 0;i < TIMINGS;++i) cycles[i] = cycles[i + 1] - cycles[i];
    printentry(-1,"base_cycles",cycles,TIMINGS);
    for (i = 0;i <= TIMINGS;++i) {
      cycles[i] = cpucycles();
      crypto_smult(q,n,p);
    }
    for (i = 0;i < TIMINGS;++i) cycles[i] = cycles[i + 1] - cycles[i];
    printentry(-1,"cycles",cycles,TIMINGS);
  }
}
