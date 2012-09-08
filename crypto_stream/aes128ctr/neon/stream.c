#include "crypto_stream.h"
#ifndef crypto_stream_BEFORENMBYTES
#define crypto_stream_BEFORENMBYTES 1408
#endif

#define crypto_stream_beforenm crypto_stream_aes128ctr_neon_beforenm
#define crypto_stream_afternm_constants crypto_stream_aes128ctr_neon_afternm_constants
#define crypto_stream_xor_afternm_constants crypto_stream_aes128ctr_neon_xor_afternm_constants

extern int crypto_stream_beforenm(
        unsigned char *d,
        const unsigned char *k
        );

extern int crypto_stream_afternm_constants(
        unsigned char *out,
        unsigned long long outlen,
        const unsigned char *n,
        const unsigned char *d,
	const unsigned int *constants
        );

extern int crypto_stream_xor_afternm_constants(
        unsigned char *out,
        const unsigned char *in,
        unsigned long long inlen,
        const unsigned char *n,
        const unsigned char *d,
	const unsigned int *constants
        );

static const unsigned int constants[8] = {
  0x00030201
, 0x05040706
, 0x02010003
, 0x07060504
, 0x00000000
, 0x00000000
, 0x00000000
, 0x00000001
} ;

int crypto_stream(
        unsigned char *out,
        unsigned long long outlen,
        const unsigned char *n,
        const unsigned char *k
        )
{
    unsigned char data[crypto_stream_BEFORENMBYTES + 128];
    unsigned char *d = data; d += 15 & (-(int) d);
    crypto_stream_beforenm(d, k);
    crypto_stream_afternm_constants(out, outlen, n, d, constants);
    return 0;
}

int crypto_stream_xor(
        unsigned char *out,
        const unsigned char *in,
        unsigned long long inlen,
        const unsigned char *n,
        const unsigned char *k
        )
{
    unsigned char data[crypto_stream_BEFORENMBYTES + 128];
    unsigned char *d = data; d += 15 & (-(int) d);
    crypto_stream_beforenm(d, k);
    crypto_stream_xor_afternm_constants(out, in, inlen, n, d, constants);
    return 0;
}

