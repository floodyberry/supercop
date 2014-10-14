#include "randombytes.h"
#include "crypto_scalarmult_nistp256.h"
#include "crypto_dh.h"

int crypto_dh_keypair(unsigned char *pk, unsigned char *sk) {

    randombytes(sk, 32);
    return crypto_scalarmult_nistp256_base(pk, sk);
}

int crypto_dh(unsigned char *k, const unsigned char *pk, const unsigned char *sk) {

    return crypto_scalarmult_nistp256(k, sk, pk);
}
