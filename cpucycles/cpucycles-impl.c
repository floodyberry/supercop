#include <stdio.h>
#include <sys/types.h>

long long cpucycles_x86cpuinfo(void)
{
  long long result;
  asm volatile(".byte 15;.byte 49" : "=A" (result));
  return result;
}

long long cpucycles_x86cpuinfo_persecond(void)
{
  FILE *f;
  double result;
  int s;

  f = fopen("/proc/cpuinfo","r");
  if (!f) return 0;

  for (;;) {
    s = fscanf(f,"cpu MHz : %lf",&result);
    if (s > 0) break;
    if (s == 0) s = fscanf(f,"%*[^\n]\n");
    if (s < 0) { result = 0; break; }
  }

  fclose(f);
  return 1000000.0 * result;
}
