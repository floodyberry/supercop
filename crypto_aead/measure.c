#include <stdlib.h>
#include "randombytes.h"
#include "cpucycles.h"
#include "crypto_aead.h"

extern void printentry(long long,const char *,long long *,long long);
extern unsigned char *alignedcalloc(unsigned long long);
extern const char *primitiveimplementation;
extern const char *implementationversion;
extern const char *sizenames[];
extern const long long sizes[];
extern void allocate(void);
extern void measure(void);

const char *primitiveimplementation = crypto_aead_IMPLEMENTATION;
const char *implementationversion = crypto_aead_VERSION;
const char *sizenames[] = { "keybytes", "nsecbytes", "npubbytes", "abytes", 0 };
const long long sizes[] = { crypto_aead_KEYBYTES, crypto_aead_NSECBYTES, crypto_aead_NPUBBYTES, crypto_aead_ABYTES };

#define MAXTEST_BYTES 2048

static unsigned char *k;
static unsigned char *nsec;
static unsigned char *npub;
static unsigned char *m;
static unsigned char *ad;
static unsigned char *c;

void preallocate(void)
{
}

void allocate(void)
{
  k = alignedcalloc(crypto_aead_KEYBYTES);
  nsec = alignedcalloc(crypto_aead_NSECBYTES);
  npub = alignedcalloc(crypto_aead_NPUBBYTES);
  m = alignedcalloc(MAXTEST_BYTES);
  ad = alignedcalloc(MAXTEST_BYTES);
  c = alignedcalloc(MAXTEST_BYTES + crypto_aead_ABYTES);
}

#define TIMINGS 15
static long long cycles[TIMINGS + 1];

void measure(void)
{
  int i;
  int loop;
  int direction;
  unsigned long long mlen;
  unsigned long long adlen;
  unsigned long long clen;
  unsigned long long tlen;

  for (loop = 0;loop < LOOPS;++loop) {
    for (direction = 0;direction < 3;++direction) {
      mlen = 0;
      adlen = 0;
      for (;;) {
        if (direction != 1) ++mlen;
        if (direction != 0) ++adlen;
        if (mlen > MAXTEST_BYTES) break;
        if (adlen > MAXTEST_BYTES) break;
        randombytes(k,crypto_aead_KEYBYTES);
        randombytes(nsec,crypto_aead_NSECBYTES);
        randombytes(npub,crypto_aead_NPUBBYTES);
        randombytes(m,mlen);
        randombytes(ad,adlen);
        randombytes(c,mlen + crypto_aead_ABYTES);
        for (i = 0;i <= TIMINGS;++i) {
          cycles[i] = cpucycles();
          crypto_aead_encrypt(c,&clen,m,mlen,ad,adlen,nsec,npub,k);
        }
        for (i = 0;i < TIMINGS;++i) cycles[i] = cycles[i + 1] - cycles[i];
        printentry(1000000 * adlen + mlen,"encrypt_cycles",cycles,TIMINGS);
        for (i = 0;i <= TIMINGS;++i) {
          cycles[i] = cpucycles();
          crypto_aead_decrypt(m,&tlen,nsec,c,clen,ad,adlen,npub,k);
        }
        for (i = 0;i < TIMINGS;++i) cycles[i] = cycles[i + 1] - cycles[i];
        printentry(1000000 * adlen + mlen,"decrypt_cycles",cycles,TIMINGS);
        if (clen > 0) {
          ++c[clen - 1];
          for (i = 0;i <= TIMINGS;++i) {
            cycles[i] = cpucycles();
            crypto_aead_decrypt(m,&tlen,nsec,c,clen,ad,adlen,npub,k);
          }
          for (i = 0;i < TIMINGS;++i) cycles[i] = cycles[i + 1] - cycles[i];
          printentry(1000000 * adlen + mlen,"forgery_decrypt_cycles",cycles,TIMINGS);
        }
      }
    }
  }
}
