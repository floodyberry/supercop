#include <time.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/time.h>
#include "cpucycles-impl.h"

static long long tod(void)
{
  struct timeval t;
  gettimeofday(&t,(struct timezone *) 0);
  return t.tv_sec * (long long) 1000000 + t.tv_usec;
}

long long todstart;
long long todend;
long long cpustart;
long long cpuend;

long long t[1001];

int main()
{
  int j;
  int i;

  for (i = 0;i <= 1000;++i) t[i] = cpucycles();
  for (i = 0;i < 1000;++i) if (t[i] > t[i + 1]) {
    fprintf(stderr,"t[%d] = %lld\n",i,t[i]);
    fprintf(stderr,"t[%d] = %lld\n",i + 1,t[i + 1]);
    fprintf(stderr,"cpucycles_persecond() = %lld\n",cpucycles_persecond());
    return 100;
  }
  if (t[0] == t[1000]) {
    fprintf(stderr,"t[%d] = %lld\n",0,t[0]);
    fprintf(stderr,"t[%d] = %lld\n",1000,t[1000]);
    fprintf(stderr,"cpucycles_persecond() = %lld\n",cpucycles_persecond());
    return 100;
  } 
  if (cpucycles_persecond() <= 0) {
    fprintf(stderr,"cpucycles_persecond() = %lld\n",cpucycles_persecond());
    return 100;
  }

  todstart = tod();
  cpustart = cpucycles();
  for (j = 0;j < 1000;++j) for (i = 0;i <= 1000;++i) t[i] = t[i] + i + j;
  todend = tod();
  cpuend = cpucycles();

  todend -= todstart;
  cpuend -= cpustart;

  for (i = 0;i <= 1000;++i) t[i] = cpucycles();
  printf("%s",cpucycles_implementation);
  printf(" %lld",cpucycles_persecond());
  printf(" %lld",(long long) (((double) cpuend) * 1000000.0 / (double) todend));
  for (i = 0;i < 64;++i) printf(" %lld",t[i + 1] - t[i]);
  printf("\n");
  return 0;
}
