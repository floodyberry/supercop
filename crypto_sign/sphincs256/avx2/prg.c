#include "crypto_stream_chacha12.h"
#include "params.h"
#include "prg.h"

static unsigned char nonce[crypto_stream_chacha12_NONCEBYTES] = {0};

#if crypto_stream_chacha12_KEYBYTES != SEED_BYTES
  #error "SEED_BYTES needs to match CRYPTO_STREAM_KEYBYTES for this implementation"
#endif

void prg(unsigned char *r, unsigned long long rlen, const unsigned char key[SEED_BYTES])
{
  crypto_stream_chacha12(r,rlen,nonce,key);
}
