/*
cpucycles/sparc32.c version 20100803
D. J. Bernstein
Public domain.
*/

#include <time.h>
#include <unistd.h>
#include <sys/time.h>

static int prev[3];
static unsigned long long prevcycles = 0;
static int now[3];
static long long cyclespersec = 0;

static void readticks(unsigned int *result)
{
  struct timeval t;
  unsigned int cc;
  asm volatile(".word 0x93410000;.word 0x91327020;mov %%g0,%0" : "=r" (cc) : : "%g0");
  gettimeofday(&t,(struct timezone *) 0);
  result[0] = cc;
  result[1] = t.tv_usec;
  result[2] = t.tv_sec;
}

long long cpucycles_sparc32(void)
{
  unsigned long long delta4;
  int deltan;
  int deltas;
  unsigned long long guesscycles;
  
  readticks(now);
  delta4 = (unsigned int) (now[0] - prev[0]); /* unsigned change in number of cycles mod 2^32 */
  deltan = now[1] - prev[1]; /* signed change in number of nanoseconds mod 10^9 */
  deltas = now[2] - prev[2]; /* signed change in number of seconds */
  if ((deltas == 0 && deltan < 200000) || (deltas == 1 && deltan < -800000))
    return prevcycles + delta4;

  prev[0] = now[0];
  prev[1] = now[1];
  prev[2] = now[2];

  if ((deltas == 0 && deltan < 300000) || (deltas == 1 && deltan < -700000)) {
    // actual number of cycles cannot have increased by 2^32 in <0.3ms
    cyclespersec = 1000000 * (unsigned long long) delta4;
    cyclespersec /= deltan + 1000000 * (long long) deltas;
  } else {
    guesscycles = deltas * cyclespersec;
    guesscycles += (deltan * cyclespersec) / 1000000;
    while (delta4 + 2147483648ULL < guesscycles) delta4 += 4294967296ULL;
    /* XXX: could do longer-term extrapolation here */
  }

  prevcycles += delta4;
  return prevcycles;
}

long long cpucycles_sparc32_persecond(void)
{
  while (!cyclespersec) cpucycles_sparc32();
  return cyclespersec;
}
