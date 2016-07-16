#include "crypto_hash.h"
#include "KeccakSponge.h"

int crypto_hash(unsigned char *out, const unsigned char *in, unsigned long long inlen)
{
    spongeState state;
    InitSponge(&state, 576, 1024);
    Absorb(&state, in, inlen*8);
    Squeeze(&state, out, crypto_hash_BYTES*8);
    return 0;
}
