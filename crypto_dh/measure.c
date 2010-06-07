#include <stdlib.h>
#include "randombytes.h"
#include "cpucycles.h"
#include "crypto_dh.h"

extern void printentry(long long,const char *,long long *,long long);
extern unsigned char *alignedcalloc(unsigned long long);
extern const char *primitiveimplementation;
extern const char *implementationversion;
extern const char *sizenames[];
extern const long long sizes[];
extern void allocate(void);
extern void measure(void);

const char *primitiveimplementation = crypto_dh_IMPLEMENTATION;
const char *implementationversion = crypto_dh_VERSION;
const char *sizenames[] = { "outputbytes", "publickeybytes", "secretkeybytes", 0 };
const long long sizes[] = { crypto_dh_BYTES, crypto_dh_PUBLICKEYBYTES, crypto_dh_SECRETKEYBYTES };

static unsigned char *pk1;
static unsigned char *sk1;
static unsigned char *pk2;
static unsigned char *sk2;
static unsigned char *s1;
static unsigned char *s2;

void preallocate(void)
{
#ifdef RAND_R_PRNG_NOT_SEEDED
  RAND_status();
#endif
}

void allocate(void)
{
  pk1 = alignedcalloc(crypto_dh_PUBLICKEYBYTES);
  pk2 = alignedcalloc(crypto_dh_PUBLICKEYBYTES);
  sk1 = alignedcalloc(crypto_dh_SECRETKEYBYTES);
  sk2 = alignedcalloc(crypto_dh_SECRETKEYBYTES);
  s1 = alignedcalloc(crypto_dh_BYTES);
  s2 = alignedcalloc(crypto_dh_BYTES);
}

#define TIMINGS 63
static long long cycles[TIMINGS + 1];

void measure(void)
{
  int i;
  int loop;

  for (loop = 0;loop < LOOPS;++loop) {
    for (i = 0;i <= TIMINGS;++i) {
      cycles[i] = cpucycles();
      crypto_dh_keypair(pk1,sk1);
    }
    for (i = 0;i < TIMINGS;++i) cycles[i] = cycles[i + 1] - cycles[i];
    printentry(-1,"keypair_cycles",cycles,TIMINGS);
    crypto_dh_keypair(pk2,sk2);
    for (i = 0;i <= TIMINGS;++i) {
      cycles[i] = cpucycles();
      crypto_dh(s1,pk2,sk1);
    }
    for (i = 0;i < TIMINGS;++i) cycles[i] = cycles[i + 1] - cycles[i];
    printentry(-1,"cycles",cycles,TIMINGS);
  }
}
