#include <stdint.h>
#include "fep256.h"
#include "curve.h"
#include "randombytes.h"

int
crypto_dh_nistp256_wbl_keypair(unsigned char *pk, unsigned char *sk)
{
        point temp;
        randombytes(sk, 32);
        p256scalarmult_base(&temp, sk);
        p256pack(pk, &temp);
        return 0;
}

int
crypto_dh_nistp256_wbl(unsigned char *out, const unsigned char *p,
                                const unsigned char *n)
{
        point temp;
        p256unpack(&temp, p);
        if(!p256oncurvefinite(&temp)){ //we don't have a good point
                p256scalarmult_base(&temp, n); //use the basepoint instead
        } else {
                p256scalarmult(&temp, &temp, n);
	}
        p256pack(out, &temp);
        return 0;
}
