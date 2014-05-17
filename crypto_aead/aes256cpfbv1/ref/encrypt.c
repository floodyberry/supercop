/*
 *  CPFB version 1.0
 * @author Miguel Montes
 * @author Daniel Penazzi
 * 
 * To the extent possible under law, the authors have waived all copyright
 * and related or neighboring rights to the source code in this file.
 * http://creativecommons.org/publicdomain/zero/1.0/
 */
/* Notes about this version
 * This is the reference version, and it uses AES as provided by
 * the crypto_core library. 
 */ 

#include "crypto_aead.h"
#include "api.h"
#include "crypto_uint32.h"

#define BLOCK_LENGTH 16

#if CRYPTO_KEYBYTES == 16
#define KEYBITS 128
#define KEY_LENGTH 16
#include "crypto_core_aes128encrypt.h" 
#define AES_encrypt(in,out,key) crypto_core_aes128encrypt(out,in,key,0)
#elif CRYPTO_KEYBYTES == 32
#define KEYBITS 256
#define KEY_LENGTH 32
#include "crypto_core_aes256encrypt.h" 
#define AES_encrypt(in,out,key) crypto_core_aes256encrypt(out,in,key,0)
#else
#error "Unknown Key Length"
#endif 

#if CRYPTO_ABYTES <= 16
#define TAG_LENGTH CRYPTO_ABYTES
#else
#error "BAD TAG LENGTH"
#endif


#if CRYPTO_NPUBBYTES >= 8 && CRYPTO_NPUBBYTES <= 15
#define NONCE_LENGTH CRYPTO_NPUBBYTES
#define NONCE_TYPE (CRYPTO_NPUBBYTES-8)
#define NONCE_INCREMENT 8
#else
#error "BAD NONCE LENGTH"
#endif


static void store32(unsigned char *x, unsigned long long u)
{
    int i;
    for (i = 3; i >= 0; --i) {
	x[i] = (unsigned char)u;
	u >>= 8;
    }
}

static void store64(unsigned char *x, unsigned long long u)
{
    int i;
    for (i = 7; i >= 0; --i) {
	x[i] = (unsigned char)u;
	u >>= 8;
    }
}


static int verify_tag(const unsigned char* a, const unsigned char* b){
  int i;
  unsigned char res = 0;
  for (i=0; i < TAG_LENGTH; i++)
    res |= a[i] ^ b[i];
  return res == 0 ? 0 : -1;
}
 


static void xor128(const unsigned char* a, const unsigned char* b, unsigned char* x){
  int i;
  for (i = 0; i < 16; i++)
    x[i] = a[i] ^ b[i];
}



static void init_nonce(unsigned char* nonce, const unsigned char* npub){
    int i;
    for (i = 0; i < NONCE_LENGTH; ++i)
	nonce[i] = npub[i];
    for (i = NONCE_LENGTH; i < BLOCK_LENGTH -1; i++)
      nonce[i] = 0;
    nonce[BLOCK_LENGTH -1] = (unsigned char) NONCE_TYPE;
}

static void inc_nonce(unsigned char* nonce){
  int i;
  nonce[BLOCK_LENGTH -1] = (unsigned char)(nonce[BLOCK_LENGTH -1] + NONCE_INCREMENT);
  if (nonce[BLOCK_LENGTH-1] != NONCE_TYPE) return;
  for (i = BLOCK_LENGTH-2; i >= NONCE_LENGTH; i--)
    if (++nonce[i]) return;
}


static void gen_kappa(const unsigned char* nonce, unsigned char* kappa, const unsigned char* key){
    AES_encrypt(nonce,kappa,key);
#if KEYBITS == 256
    AES_encrypt(kappa,kappa+16,key);
#endif
}


int crypto_aead_encrypt(unsigned char *c, unsigned long long *clen,
			const unsigned char *m, unsigned long long mlen,
			const unsigned char *ad, unsigned long long adlen,
			const unsigned char *nsec,
			const unsigned char *npub, const unsigned char *k)
{
    unsigned char kappa_0[KEY_LENGTH];
    unsigned char kappa_m[KEY_LENGTH];
    unsigned char nonce[BLOCK_LENGTH];
    unsigned char X[BLOCK_LENGTH];
    unsigned char P[BLOCK_LENGTH];
    unsigned char stream[BLOCK_LENGTH];
    unsigned long long i;
    crypto_uint32 counter;
    (void)nsec; /* avoid warning */

    *clen = mlen + TAG_LENGTH;


    /* Generation of the first kappa */ 
    init_nonce(nonce,npub);
    gen_kappa(nonce, kappa_0, k);

    /* Block encoding alen and mlen
     * In an online implementation, it would be done at the end, and X would be 0
     */    
    store64(X, mlen);
    store32(X + 8, adlen);
    store32(X + 12, 0);
    AES_encrypt(X, X, kappa_0);

    /* AD processing */
    counter = 0;
    while (adlen > 0) {
	unsigned long long blocklen = 12;
	if (adlen < blocklen)
	    blocklen = adlen;
	for (i = 0; i < blocklen; i++)
	    P[i] = ad[i];
	for (i = blocklen; i < 12; i++)
	    P[i] = 0;
	++counter;
	store32(P + 12, counter);
	AES_encrypt(P, stream, kappa_0);
	xor128(X, stream, X);
	ad += blocklen;
	adlen -= blocklen;
    }

    /* Plaintext processing */ 
    if (mlen > 0) {
	/* New kappa */
        inc_nonce(nonce);
	gen_kappa(nonce, kappa_m, k);

	counter = 0;

	/* P_0 processing */
	for (i = 0; i < BLOCK_LENGTH; i++)
	    P[i] = kappa_0[i]; /* This is P[i] = 0 ^ kappa_0[i] */
	AES_encrypt(P, stream, kappa_m);

	while (mlen > 0) {
	    unsigned long long blocklen = 12;
	    if (mlen < blocklen)
		blocklen = mlen;
	    for (i = 0; i < blocklen; ++i) {
		P[i] = m[i];
		c[i] = m[i] ^ stream[i];
	    }
	    for (i = blocklen; i < 12; i++)
		P[i] = 0;
	    ++counter;
	    if(counter == 0){
	      	/* If the counter is zero, we have processed 2**32 blocks
		 * We need to generate a new kappa */
		inc_nonce(nonce);
		gen_kappa(nonce, kappa_m, k);
	    }
	    store32(P + 12, counter);
 	    xor128(P, kappa_0, P);
	    AES_encrypt(P, stream, kappa_m);
	    xor128(X, stream, X);
	    c += blocklen;
	    m += blocklen;
	    mlen -= blocklen;
	}
    }
    AES_encrypt(X, X, kappa_0);
    for (i = 0; i < TAG_LENGTH; i++)
	c[i] = X[i];
    return 0;
}


int crypto_aead_decrypt(unsigned char *m, unsigned long long *outputmlen,
			unsigned char *nsec,
			const unsigned char *c, unsigned long long clen,
			const unsigned char *ad, unsigned long long adlen,
			const unsigned char *npub, const unsigned char *k)
{
    unsigned char kappa_0[KEY_LENGTH];
    unsigned char kappa_m[KEY_LENGTH];
    unsigned char nonce[BLOCK_LENGTH];
    unsigned char X[BLOCK_LENGTH];
    unsigned char P[BLOCK_LENGTH];
    unsigned char stream[BLOCK_LENGTH];
    unsigned long long i;
    crypto_uint32 counter;
    unsigned long long mlen;

    (void)nsec; /* avoid warning */

    if (clen < TAG_LENGTH)
	return -1;
    *outputmlen = mlen = clen - TAG_LENGTH;


    /* Generation of the first kappa */ 
    init_nonce(nonce,npub);
    gen_kappa(nonce, kappa_0, k);

    /* Block encoding alen and mlen
     * In an online implementation, it would be done at the end, and X would be 0
     */
    store64(X, mlen);
    store32(X + 8, adlen);
    store32(X + 12, 0);
    AES_encrypt(X, X, kappa_0);

    /* AD processing */
    counter = 0;
    while (adlen > 0) {
	unsigned long long blocklen = 12;
	if (adlen < blocklen)
	    blocklen = adlen;
	for (i = 0; i < blocklen; i++)
	    P[i] = ad[i];
	for (i = blocklen; i < 12; i++)
	    P[i] = 0;
	++counter;
	store32(P + 12, counter);
	AES_encrypt(P, stream, kappa_0);
	xor128(X, stream, X);
	ad += blocklen;
	adlen -= blocklen;
    }
    

    /* Plaintext processing */
    if (mlen > 0) {
	/* New kappa */
        inc_nonce(nonce);
	gen_kappa(nonce, kappa_m, k);

	counter = 0;

	/* P_0 processing */
	for (i = 0; i < BLOCK_LENGTH; i++)
	    P[i] = kappa_0[i];
	AES_encrypt(P, stream, kappa_m);

	while (mlen > 0) {
	    unsigned long long blocklen = 12;
	    if (mlen < blocklen)
		blocklen = mlen;
	    for (i = 0; i < blocklen; ++i) {
		m[i] = c[i] ^ stream[i];
		P[i] = m[i];
	    }
	    for (i = blocklen; i < 12; i++)
		P[i] = 0;
	    ++counter;
	    if(counter == 0){
		/* We need to generate a new kappa */
		inc_nonce(nonce);
		gen_kappa(nonce, kappa_m, k);
	    }
	    store32(P + 12, counter);
	    xor128(P, kappa_0, P);
	    AES_encrypt(P, stream, kappa_m);
	    xor128(X, stream, X);
	    c += blocklen;
	    m += blocklen;
	    mlen -= blocklen;
	}
    }
    AES_encrypt(X, X, kappa_0);
    return verify_tag(c,X);
}
