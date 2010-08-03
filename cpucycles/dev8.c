#include <sys/types.h>
#include <fcntl.h>
#include <time.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/time.h>

static int fddev = -1;

static long long cycles(void)
{
  unsigned long long result;
  if (read(fddev,&result,8) == 8) return result;
  return 0;
}

long long cpucycles_dev8(void)
{
  if (fddev == -1) fddev = open("/dev/cpucycles8",O_RDONLY);
  return cycles();
}

static long long tod(void)
{
  struct timeval t;
  gettimeofday(&t,(struct timezone *) 0);
  return t.tv_sec * (long long) 1000000 + t.tv_usec;
}

static long long persecond = 0;
static long long firstcycles;
static long long lastcycles;
static long long firsttod;
static long long lasttod;

static void init(void)
{
  if (fddev == -1) fddev = open("/dev/cpucycles8",O_RDONLY);

  firstcycles = cycles();
  firsttod = tod();

  do {
    lastcycles = cycles();
    lasttod = tod();
  } while (lasttod - firsttod < 100000);

  lastcycles -= firstcycles;
  lasttod -= firsttod;

  persecond = (1000000 * lastcycles) / lasttod;
}

long long cpucycles_dev8_persecond(void)
{
  if (!persecond) init();
  return persecond;
}
