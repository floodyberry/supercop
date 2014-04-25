#include <string.h>

void gf_mul(unsigned char *a, const unsigned char *x,
	    const unsigned char *y)
{
  int i;
  int j;
  unsigned int xlen = 16;
  unsigned char abits[128];
  unsigned char ybits[128];
  unsigned char prodbits[256];
  memcpy(a,x,xlen);
  for (i = 0;i < 128;++i) abits[i] = (a[i / 8] >> (7 - (i % 8))) & 1;
  for (i = 0;i < 128;++i) ybits[i] = (y[i / 8] >> (7 - (i % 8))) & 1;
  for (i = 0;i < 256;++i) prodbits[i] = 0;
  for (i = 0;i < 128;++i)
    for (j = 0;j < 128;++j)
      prodbits[i + j] ^= abits[i] & ybits[j];
  for (i = 127;i >= 0;--i) {
    prodbits[i] ^= prodbits[i + 128];
    prodbits[i + 1] ^= prodbits[i + 128];
    prodbits[i + 2] ^= prodbits[i + 128];
    prodbits[i + 7] ^= prodbits[i + 128];
    prodbits[i + 128] ^= prodbits[i + 128];
  }
  for (i = 0;i < 16;++i) a[i] = 0;
  for (i = 0;i < 128;++i) a[i / 8] |= (prodbits[i] << (7 - (i % 8)));
}

