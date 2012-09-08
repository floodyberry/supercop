#include "crypto_auth.h"
#include "crypto_uint64.h"
typedef crypto_uint64 uint64;

#define ROTATE(x,n) ({ \
     register uint64 __out; \
     register uint64 __in = x; \
     __asm__ ("shld %2,%0,%0" : "=r"(__out) : "0"(__in), "i"(n)); \
     x = __out; \
  })

#define ROUND \
  v0 += v1; v2 += v3; \
  ROTATE(v1,13); ROTATE(v3,16); \
  v1 ^= v0; v3 ^= v2; \
  ROTATE(v0,32); \
  v2 += v1; v0 += v3; \
  ROTATE(v1,17); ROTATE(v3,21); \
  v1 ^= v2; v3 ^= v0; \
  ROTATE(v2,32);

int crypto_auth(unsigned char *out,const unsigned char *in,unsigned long long inlen,const unsigned char *k)
{
  uint64 v0 = *(uint64 *) (k);
  uint64 v1 = *(uint64 *) (k + 8);
  uint64 lastblock = inlen << 56;
  uint64 v2 = v0;
  uint64 v3 = v1;
  int i;

  v0 ^= 0x736f6d6570736575;
  v1 ^= 0x646f72616e646f6d;
  v2 ^= 0x6c7967656e657261;
  v3 ^= 0x7465646279746573;

  while (inlen >= 8) { /* floor(inlen/8) normal loops */
    uint64 mi = *(uint64 *) in;
    in += 8;
    v3 ^= mi;
    ROUND
    ROUND
    v0 ^= mi;
    inlen -= 8;
  }
  /* now inlen <= 7; 1 extra loop; total loops: ceil((inlen+1)/8) */
  for (i = 0;i < inlen;++i) i[(char *) &lastblock] = i[in];
  v3 ^= lastblock;
  ROUND
  ROUND
  v0 ^= lastblock;

  v2 ^= 0xff;
  ROUND
  ROUND
  ROUND
  ROUND
  *(uint64 *) out = (v0 ^ v1) ^ (v2 ^ v3);

  return 0;
}
