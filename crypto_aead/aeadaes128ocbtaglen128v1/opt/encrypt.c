/* CAESAR redirection for use with ae.h API */

#include <stdlib.h>
#include "ae.h"
#include "api.h"
#include "crypto_aead.h"

int crypto_aead_encrypt(
unsigned char *c,unsigned long long *clen,
const unsigned char *m,unsigned long long mlen,
const unsigned char *ad,unsigned long long adlen,
const unsigned char *nsec,
const unsigned char *npub,
const unsigned char *k
)
{
    ae_ctx *ctx = ae_allocate(NULL);  
    (void)nsec;
    *clen = mlen + CRYPTO_ABYTES;
	ae_init(ctx,k,CRYPTO_KEYBYTES,CRYPTO_NPUBBYTES,CRYPTO_ABYTES);
	ae_encrypt(ctx,npub,m,mlen,ad,adlen,c,NULL,AE_FINALIZE);
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
    ae_ctx *ctx = ae_allocate(NULL);  
    (void)nsec;
    *mlen = clen - CRYPTO_ABYTES;
	ae_init(ctx,k,CRYPTO_KEYBYTES,CRYPTO_NPUBBYTES,CRYPTO_ABYTES);
	if (ae_decrypt(ctx,npub,c,clen,ad,adlen,m,NULL,AE_FINALIZE) < 0)
		return -1;
	else
		return 0;
}

