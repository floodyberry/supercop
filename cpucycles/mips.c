/*
cpucycles/mips.c version 20100802
D. J. Bernstein
Public domain.
*/

#define SCALE 2
#include <time.h>
#include <unistd.h>
#include <sys/time.h>

static unsigned long long tod(void)
{
  struct timeval t;
  gettimeofday(&t,(struct timezone *) 0);
  return t.tv_sec * (long long) 1000 + t.tv_usec / 1000;
}

static unsigned int mfc(void)
{
  unsigned int cc;
  asm volatile(".byte 59; .byte 16; .byte 2; .byte 124; move %0,$2" : "=r"(cc) : : "$2");
  return cc;
}

static unsigned int firstmfc;
static unsigned long long firsttod;
static unsigned int lastmfc;
static unsigned long long lasttod;
static unsigned long long khz = 0;

static void init(void)
{
  firstmfc = mfc();
  firsttod = tod();

  do {
    lastmfc = mfc();
    lasttod = tod() - firsttod;
  } while (lasttod < 100);
  lastmfc -= firstmfc;

  khz = lastmfc / lasttod;
}

long long cpucycles_mips(void)
{
  long long x;
  long long y;

  if (!khz) init();

  lastmfc = mfc();
  lasttod = tod();

  lastmfc -= firstmfc;
  lasttod -= firsttod;

  x = lasttod * khz;

  y = x - lastmfc;
  y += 2147483648ULL;
  y >>= 32;
  y <<= 32;
  y += lastmfc;

  khz = y / lasttod;

  return (y + firstmfc) * SCALE;
}

long long cpucycles_mips_persecond(void)
{
  if (!khz) init();
  return SCALE * 1000 * khz;
}
