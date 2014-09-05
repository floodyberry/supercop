#include <stdint.h>
#include "fep256.h"
#include "curve.h"
#include "randombytes.h"

void
crypto_dh_nistp256_wbl_keypair(unsigned char *pk, const unsigned char *sk)
{
        point temp;
        randombytes(sk, 32);
        p256scalarmult_base(&temp, sk);
        p256pack(pk, &temp);
        return;
}

void
crypto_dh_nistp256_wbl(unsigned char *out, const unsigned char *n,
                                const unsigned char *p)
{
        point temp;
        p256unpack(&temp, p);
        if(!p256oncurvefinite(&temp)){ //we don't have a good point
                crypto_scalarmult_nistp256_base(q, n); //use the basepoint instead
                return;
        }
  p256scalarmult(&temp, &temp, n);
  p256pack(q, &temp);
  return;
}
