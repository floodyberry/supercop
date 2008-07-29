#include <stdio.h>
#include <sys/types.h>

long long cpucycles_sparc32psrinfo(void)
{
  long long result;
  asm volatile(
    ".word 0x93410000;.word 0x91327020;mov %%g0,%0" 
    : "=r" (result) 
    :
    : "%g0"
  );
  return result;
}

long long cpucycles_sparc32psrinfo_persecond(void)
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
