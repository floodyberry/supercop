#include "crypto_hash.h"
#include "skein.h"

int crypto_hash
    (
    unsigned char *out,
    const unsigned char *in,
    unsigned long long inlen
    )

    {
	Skein1024_Ctxt_t ctx;

	Skein1024_Init  (&ctx,8*crypto_hash_BYTES);
	Skein1024_Update(&ctx,in,(size_t) inlen);
	Skein1024_Final (&ctx,out);

    return 0;
    }
