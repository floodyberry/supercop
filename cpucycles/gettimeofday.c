#include <time.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/time.h>

static double cpufrequency = 0;

static void init(void)
{
  FILE *f;
  double result;
  int s;

  f = fopen("/proc/cpuinfo","r");
  if (!f) return;

  for (;;) {
    s = fscanf(f,"cpu MHz : %lf",&result);
    if (s > 0) break;
    if (s == 0) s = fscanf(f,"%*[^\n]\n");
    if (s < 0) { result = 0; break; }
  }
  fclose(f);

  cpufrequency = 1000000.0 * result;
}

long long cpucycles_gettimeofday(void)
{
  double result;
  struct timeval t;
  if (!cpufrequency) init();
  gettimeofday(&t,(struct timezone *) 0);
  result = t.tv_usec;
  result *= 0.000001;
  result += (double) t.tv_sec;
  result *= cpufrequency;
  return result;
}

long long cpucycles_gettimeofday_persecond(void)
{
  if (!cpufrequency) init();
  return cpufrequency;
}
