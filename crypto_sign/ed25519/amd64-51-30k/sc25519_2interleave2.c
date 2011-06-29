#include "sc25519.h"

void sc25519_2interleave2(unsigned char r[127], const sc25519 *s1, const sc25519 *s2)
{
  int i;
  for(i=0;i<32;i++)
    r[i] = ((s1->v[0] >> 2*i) & 3) ^ (((s2->v[0] >> 2*i) & 3) << 2);
  for(i=0;i<32;i++)
    r[i+32] = ((s1->v[1] >> 2*i) & 3) ^ (((s2->v[1] >> 2*i) & 3) << 2);
  for(i=0;i<32;i++)
    r[i+64] = ((s1->v[2] >> 2*i) & 3) ^ (((s2->v[2] >> 2*i) & 3) << 2);
  for(i=0;i<31;i++)
    r[i+96] = ((s1->v[3] >> 2*i) & 3) ^ (((s2->v[3] >> 2*i) & 3) << 2);
}
