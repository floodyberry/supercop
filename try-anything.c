/*
 * try-anything.c version 20080912
 * D. J. Bernstein
 * Public domain.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include "cpucycles.h"

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
#define ALARM 300

extern void allocate(void);
extern void predoit(void);
extern void doit(void);
extern char checksum[];
extern const char *checksum_compute(void);
extern const char *primitiveimplementation;

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
  fprintf(stderr,"try: fatal: implementation compiles but %s\n",why);
  exit(111);
}

unsigned char *alignedcalloc(unsigned long long len)
{
  unsigned char *x = (unsigned char *) calloc(1,len + 256);
  long long i;
  if (!x) fail("out of memory");
  /* will never deallocate so shifting is ok */
  for (i = 0;i < len + 256;++i) x[i] = random();
  x += 64;
  x += 63 & (-(unsigned long) x);
  for (i = 0;i < len;++i) x[i] = 0;
  return x;
}

static char *benchmarkversion;
static char *hostname;
static char *abi;
static char *operation;
static char *primitive;
static char startdate[100];
static char *expectedchecksum = 0;

static void printcontext(void)
{
  printword(benchmarkversion);
  printword(hostname);
  printword(abi);
  printword(startdate);
  printword(operation);
  printword(primitive);
}

static long long bestmedian = -1;

static void bestmedian_get(void)
{
  FILE *fi;
  fi = fopen("../bestmedian","r");
  if (fi) {
    if (fscanf(fi,"%lld",&bestmedian) != 1) bestmedian = -1;
    fclose(fi);
  }
}

static void bestmedian_put(void)
{
  FILE *fi;
  fi = fopen("../bestmedian","w");
  if (fi) {
    fprintf(fi,"%lld",bestmedian);
    fclose(fi);
  }
}

#define TIMINGS 63
static long long cycles[TIMINGS + 1];

int main(int argc,char **argv)
{
  time_t now;
  struct tm *tm;
  long long i;
  long long j;
  long long abovej;
  long long belowj;
  long long checksumcycles;
  const char *problem;

  if (!*argv++) return 100;
  benchmarkversion = *argv; if (!*argv++) return 100;
  hostname = *argv; if (!*argv++) return 100;
  abi = *argv; if (!*argv++) return 100;
  operation = *argv; if (!*argv++) return 100;
  primitive = *argv; if (!*argv++) return 100;
  if (*argv) expectedchecksum = *argv;

  time(&now);
  tm = gmtime(&now);
  sprintf(startdate,"%d%02d%02d",1900 + tm->tm_year,tm->tm_mon + 1,tm->tm_mday);

  bestmedian_get();
  allocate();
  alarm(ALARM);
  srandom(getpid());

  cycles[0] = cpucycles();
  problem = checksum_compute(); if (problem) fail(problem);
  cycles[1] = cpucycles();
  checksumcycles = cycles[1] - cycles[0];

  predoit();
  for (i = 0;i <= TIMINGS;++i) {
    cycles[i] = cpucycles();
  }
  for (i = 0;i <= TIMINGS;++i) {
    cycles[i] = cpucycles();
    doit();
  }
  for (i = 0;i < TIMINGS;++i) cycles[i] = cycles[i + 1] - cycles[i];
  for (j = 0;j < TIMINGS;++j) {
    belowj = 0;
    for (i = 0;i < TIMINGS;++i) if (cycles[i] < cycles[j]) ++belowj;
    abovej = 0;
    for (i = 0;i < TIMINGS;++i) if (cycles[i] > cycles[j]) ++abovej;
    if (belowj * 2 < TIMINGS && abovej * 2 < TIMINGS) break;
  }

  printcontext();
  printword("try");
  printword(checksum);
  if (expectedchecksum && *expectedchecksum)
    if (strcmp(checksum,expectedchecksum))
      printword("fails");
    else
      printword("ok");
  else
    printword("unknown");
  printnum(cycles[j]);
  printnum(checksumcycles);
  printnum(cpucycles_persecond());
  printword(primitiveimplementation);
  printword(COMPILER);
  printf("\n"); fflush(stdout);

  if (expectedchecksum && *expectedchecksum && strcmp(checksum,expectedchecksum)) return 100;
  if ((bestmedian >= 0) && (cycles[j] >= bestmedian)) return 111;

  bestmedian = cycles[j];
  bestmedian_put();
  return 0;
}
