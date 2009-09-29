#include "crypto_hash.h"
#include "KeccakNISTInterface.h"

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
    hashState state;
    Init(&state, 0);
    Update(&state, in, inlen*8);
    Final(&state, 0);
    Squeeze(&state, out, crypto_hash_BYTES*8);
    return 0;
}
