/*
 * measure-anything.c version 20081103
 * D. J. Bernstein
 * Public domain.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "cpucycles.h"
#include "cpuid.h"

typedef int uint32;

static uint32 seed[32] = { 3,1,4,1,5,9,2,6,5,3,5,8,9,7,9,3,2,3,8,4,6,2,6,4,3,3,8,3,2,7,9,5 } ;
static uint32 in[12];
static uint32 out[8];
static int outleft = 0;

#define ROTATE(x,b) (((x) << (b)) | ((x) >> (32 - (b))))
#define MUSH(i,b) x = t[i] += (((x ^ seed[i]) + sum) ^ ROTATE(x,b));

static void surf(void)
{
  uint32 t[12]; uint32 x; uint32 sum = 0;
  int r; int i; int loop;

  for (i = 0;i < 12;++i) t[i] = in[i] ^ seed[12 + i];
  for (i = 0;i < 8;++i) out[i] = seed[24 + i];
  x = t[11];
  for (loop = 0;loop < 2;++loop) {
    for (r = 0;r < 16;++r) {
      sum += 0x9e3779b9;
      MUSH(0,5) MUSH(1,7) MUSH(2,9) MUSH(3,13)
      MUSH(4,5) MUSH(5,7) MUSH(6,9) MUSH(7,13)
      MUSH(8,5) MUSH(9,7) MUSH(10,9) MUSH(11,13)
    }
    for (i = 0;i < 8;++i) out[i] ^= t[i + 4];
  }
}

void randombytes(unsigned char *x,unsigned long long xlen)
{
  while (xlen > 0) {
    if (!outleft) {
      if (!++in[0]) if (!++in[1]) if (!++in[2]) ++in[3];
      surf();
      outleft = 8;
    }
    *x = out[--outleft];
    ++x;
    --xlen;
  }
}

extern const char *primitiveimplementation;
extern const char *implementationversion;
extern const char *sizenames[];
extern const long long sizes[];
extern void allocate(void);
extern void measure(void);

static void printword(const char *s)
{
  if (!*s) putchar('-');
  while (*s) {
    if (*s == ' ') putchar('_');
    else if (*s == '\t') putchar('_');
    else if (*s == '\r') putchar('_');
    else if (*s == '\n') putchar('_');
    else putchar(*s);
    ++s;
  }
  putchar(' ');
}

static void printnum(long long x)
{
  printf("%lld ",x);
}

static void fail(const char *why)
{
  fprintf(stderr,"measure: fatal: %s\n",why);
  exit(111);
}

unsigned char *alignedcalloc(unsigned long long len)
{
  unsigned char *x = (unsigned char *) calloc(1,len + 128);
  if (!x) fail("out of memory");
  /* will never deallocate so shifting is ok */
  x += 63 & (-(unsigned long) x);
  return x;
}

static char *benchmarkversion;
static char *hostname;
static char *abi;
static char *operation;
static char *primitive;
static char startdate[100];

static void printcontext(void)
{
  printword(benchmarkversion);
  printword(hostname);
  printword(abi);
  printword(startdate);
  printword(operation);
  printword(primitive);
}

static void printimplementations(void)
{
  int i;

  printcontext();
  printword("implementation");
  printword(primitiveimplementation);
  printword(implementationversion);
  printf("\n"); fflush(stdout);

  for (i = 0;sizenames[i];++i) {
    printcontext();
    printword(sizenames[i]);
    printnum(sizes[i]);
    printf("\n"); fflush(stdout);
  }

  printcontext();
  printword("cpuid");
  printword(cpuid);
  printf("\n"); fflush(stdout);

  printcontext();
  printword("cpucycles_persecond");
  printnum(cpucycles_persecond());
  printf("\n"); fflush(stdout);

  printcontext();
  printword("cpucycles_implementation");
  printword(cpucycles_implementation);
  printf("\n"); fflush(stdout);

  printcontext();
  printword("compiler");
  printword(COMPILER);
#ifdef __VERSION__
  printword(__VERSION__);
#else
  printword("unknown compiler version");
#endif
  printf("\n"); fflush(stdout);
}

void printentry(long long mbytes,const char *measuring,long long *m,long long mlen)
{
  long long i;
  long long j;
  long long belowj;
  long long abovej;

  printcontext();
  printword(measuring);
  if (mbytes >= 0) printnum(mbytes); else printword("");
  if (mlen > 0) { 
    for (j = 0;j + 1 < mlen;++j) { 
      belowj = 0;
      for (i = 0;i < mlen;++i) if (m[i] < m[j]) ++belowj;
      abovej = 0;
      for (i = 0;i < mlen;++i) if (m[i] > m[j]) ++abovej;
      if (belowj * 2 < mlen && abovej * 2 < mlen) break;
    } 
    printnum(m[j]);
    if (mlen > 1) { 
      for (i = 0;i < mlen;++i) printnum(m[i]);
    } 
  } 
  printf("\n"); fflush(stdout);
}

int main(int argc,char **argv)
{
  time_t now;
  struct tm *tm;

  if (!*argv++) return 100;
  benchmarkversion = *argv; if (!*argv++) return 100;
  hostname = *argv; if (!*argv++) return 100;
  abi = *argv; if (!*argv++) return 100;
  operation = *argv; if (!*argv++) return 100;
  primitive = *argv; if (!*argv++) return 100;

  time(&now);
  tm = gmtime(&now);
  sprintf(startdate,"%d%02d%02d",1900 + tm->tm_year,tm->tm_mon + 1,tm->tm_mday);

  printimplementations();
  allocate();
  measure();

  return 0;
}
