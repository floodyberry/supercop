#include "bpoint.h"
#include "crypto_dh.h"

extern void nistp256(unsigned char*, unsigned char *, const unsigned char*, const unsigned char*, const unsigned char*);

int crypto_dh(
  unsigned char *s,
  const unsigned char *pk,
  const unsigned char *sk
)
{

  unsigned char t[32];
  memset(s,0,crypto_dh_BYTES);
  nistp256(s,t,pk,pk+32,sk);
  return 0;
}
