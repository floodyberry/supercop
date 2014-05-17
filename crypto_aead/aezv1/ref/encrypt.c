#include "crypto_aead.h"
#include "api.h"

/*
#define CRYPTO_KEYBYTES 16
#define CRYPTO_NSECBYTES 0
#define CRYPTO_NPUBBYTES 12
#define CRYPTO_ABYTES 16
*/

typedef unsigned char byte;

int Decrypt(byte *Key, unsigned kbytes, byte *N, unsigned nbytes, byte *AD,
        unsigned adbytes, byte *C, unsigned cbytes, unsigned abytes, byte *M);
void Encrypt(byte *Key, unsigned kbytes, byte *N, unsigned nbytes, byte *AD,
        unsigned adbytes, byte *M, unsigned mbytes, unsigned abytes, byte *C);

int crypto_aead_encrypt(
    unsigned char *c,unsigned long long *clen,
    const unsigned char *m,unsigned long long mlen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *nsec,
    const unsigned char *npub,
    const unsigned char *k
)
{
    (void)nsec;
    if (clen) *clen = mlen+CRYPTO_ABYTES;
    Encrypt((byte *)k, CRYPTO_KEYBYTES, (byte *)npub, CRYPTO_NPUBBYTES,
            (byte *)ad, (unsigned)adlen, (byte *)m, (unsigned)mlen,
            CRYPTO_ABYTES, (byte *)c);
    return 0;
}

int crypto_aead_decrypt(
    unsigned char *m,unsigned long long *mlen,
    unsigned char *nsec,
    const unsigned char *c,unsigned long long clen,
    const unsigned char *ad,unsigned long long adlen,
    const unsigned char *npub,
    const unsigned char *k
)
{
    (void)nsec;
    if (mlen) *mlen = clen-CRYPTO_ABYTES;
    return Decrypt((byte *)k, CRYPTO_KEYBYTES, (byte *)npub,
            CRYPTO_NPUBBYTES, (byte *)ad, (unsigned)adlen, (byte *)c,
            (unsigned)clen, CRYPTO_ABYTES, (byte *)m);
}
