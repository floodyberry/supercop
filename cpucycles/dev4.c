#include <sys/types.h>
#include <fcntl.h>
#include <time.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/time.h>

static int fddev = -1;

static long long tod(void)
{
  struct timeval t;
  gettimeofday(&t,(struct timezone *) 0);
  return t.tv_sec * (long long) 1000000 + t.tv_usec;
}

static long long cycles32(void)
{
  unsigned int result;
  if (read(fddev,&result,4) == 4) return 0xffffffff & (unsigned long long) result;
  return 0;
}

static long long firstcycles32;
static long long firsttod;
static long long lastcycles32;
static long long lasttod;
static double mhz = 0;

static void init(void)
{
  if (fddev == -1) fddev = open("/dev/cpucycles4",O_RDONLY);

  firstcycles32 = cycles32();
  firsttod = tod();

  do {
    lastcycles32 = cycles32();
    lasttod = tod();
  } while (lasttod - firsttod < 10000);

  lastcycles32 -= firstcycles32; lastcycles32 &= 0xffffffff;
  lasttod -= firsttod;

  mhz = (double) lastcycles32 / (double) lasttod;
}

long long cpucycles_dev4(void)
{
  double x;
  long long y;

  if (!mhz) init();

  lastcycles32 = cycles32();
  lasttod = tod();

  lastcycles32 -= firstcycles32; lastcycles32 &= 0xffffffff;
  lasttod -= firsttod;

  /* Number of cycles since firstcycles32 is lastcycles32 + 2^32 y for unknown y. */
  /* Number of microseconds since firsttod is lasttod. */

  x = (lasttod * mhz - lastcycles32) * 0.00000000023283064365386962890625;
  y = x;
  while (x > y + 0.5) y += 1;
  while (x < y - 0.5) y -= 1;

  y *= 4294967296ULL;
  lastcycles32 += y;

  mhz = (double) lastcycles32 / (double) lasttod;

  return firstcycles32 + lastcycles32;
}

long long cpucycles_dev4_persecond(void)
{
  if (!mhz) init();
  return 1000000.0 * mhz;
}
