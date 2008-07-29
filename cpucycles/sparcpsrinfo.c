#include <stdio.h>
#include <sys/types.h>

long long cpucycles_sparcpsrinfo(void)
{
  long long result;
  asm volatile("rd %%tick,%0" : "=r" (result));
  return result;
}

long long cpucycles_sparcpsrinfo_persecond(void)
{
  FILE *f;
  double result;
  int s;

  f = popen("/usr/sbin/psrinfo -v","r");
  if (!f) return 0;

  for (;;) {
    s = fscanf(f," The %*s processor operates at %lf MHz",&result);
    if (s > 0) break;
    if (s == 0) s = fscanf(f,"%*[^\n]\n");
    if (s < 0) { result = 0; break; }
  }

  pclose(f);
  return 1000000.0 * result;
}
