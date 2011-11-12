#include "crypto_hash.h"
#include "skein.h"

int crypto_hash
    (
    unsigned char *out,
    const unsigned char *in,
    unsigned long long inlen
    )

    {
	Skein_256_Ctxt_t ctx;

	Skein_256_Init  (&ctx,8*crypto_hash_BYTES);
	Skein_256_Update(&ctx,in,(size_t) inlen);
	Skein_256_Final (&ctx,out);

    return 0;
    }
