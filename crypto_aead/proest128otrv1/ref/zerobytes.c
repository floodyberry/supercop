#include "zerobytes.h"

unsigned char *zerobytes(unsigned char *r,unsigned long long n)
{ 
  volatile unsigned char *p=r; 
  while (n--) 
    *(p++) = 0; 
  return r; 
}
