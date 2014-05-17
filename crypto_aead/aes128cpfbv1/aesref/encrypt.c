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
 * This version of CPFB uses the AES reference implementation by Rijmen, Bosselaers
 * and Barreto.
 * For simplicity, it does not implement re-keying for long messages so the maximum
 * message length of this implementation is (2**32 - 1) 96-bit blocks 
 * (12 bytes short of 48 GB).
 */ 

#include "crypto_aead.h"
#include "rijndael-alg-fst.h"
#include "api.h"
#define USE_CRYPTO_INT
#ifdef USE_CRYPTO_INT
#include "crypto_uint64.h"
#include "crypto_uint32.h"
#else
#include <stdint.h>
typedef uint64_t crypto_uint64;
typedef uint32_t crypto_uint32;
#endif


#define BLOCK_LENGTH 16

#if CRYPTO_KEYBYTES == 16
#define AES_ROUNDS 10
#define KEYBITS 128
#define KEY_LENGTH 16
#elif CRYPTO_KEYBYTES == 32
#define AES_ROUNDS 14
#define KEYBITS 256
#define KEY_LENGTH 32
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


#define AES_set_key(k,expanded_k) rijndaelKeySetupEnc((u32*)expanded_k , k, KEYBITS)
#define AES_encrypt(p,c,k) rijndaelEncrypt((u32*)k, AES_ROUNDS, p, c)
typedef struct {crypto_uint32 _u32[4*(AES_ROUNDS+1)];} AES_KEY;


#define inline __inline


static inline void store32(unsigned char *x, unsigned long long u)
{
    int i;
    for (i = 3; i >= 0; --i) {
	x[i] = (unsigned char)u;
	u >>= 8;
    }
}

static inline void store64(unsigned char *x, unsigned long long u)
{
    int i;
    for (i = 7; i >= 0; --i) {
	x[i] = (unsigned char)u;
	u >>= 8;
    }
}

typedef union {
  unsigned char u8[16];
  crypto_uint64 u64[2];
} u128;



static inline void xor_128(const void* a, const void* b, void* x){
  u128* aa = (u128*) a;
  u128* bb = (u128*) b;
  u128* xx = (u128*) x;
  xx->u64[0] = aa->u64[0] ^ bb->u64[0];
  xx->u64[1] = aa->u64[1] ^ bb->u64[1];
}


static inline int verify_tag(const unsigned char* a, const unsigned char* b){
  int i;
  unsigned char res = 0;
  for (i=0; i < TAG_LENGTH; i++)
    res |= a[i] ^ b[i];
  return res == 0 ? 0 : -1;
}
 


static inline void init_nonce(unsigned char* nonce, const unsigned char* npub){
    int i;
    for (i = 0; i < NONCE_LENGTH; ++i)
	nonce[i] = npub[i];
    for (i = NONCE_LENGTH; i < BLOCK_LENGTH -1; i++)
      nonce[i] = 0;
    nonce[BLOCK_LENGTH -1] = (unsigned char) NONCE_TYPE;
}

static inline void inc_nonce(unsigned char* nonce){
  int i;
  nonce[BLOCK_LENGTH -1] = (unsigned char)(nonce[BLOCK_LENGTH -1] + NONCE_INCREMENT);
  if (nonce[BLOCK_LENGTH-1] != NONCE_TYPE) return;
  for (i = BLOCK_LENGTH-2; i >= NONCE_LENGTH; i--)
    if (++nonce[i]) return;
}

static inline void gen_kappa(const unsigned char* nonce, AES_KEY kappa[1], const AES_KEY key[1]){
  unsigned char _kappa[KEY_LENGTH];
  AES_encrypt(nonce,_kappa,key);
#if KEYBITS == 256
  AES_encrypt(_kappa,_kappa+16,key);
#endif
  AES_set_key(_kappa,kappa);
}

static inline void gen_next_kappa(unsigned char* nonce, const AES_KEY kappa_0[1], AES_KEY kappa[1], const AES_KEY key[1]){
  inc_nonce(nonce);
  gen_kappa(nonce,kappa,key);
  xor_128(kappa,kappa_0, kappa);
}
 
static inline void
init (const unsigned char *npub, const unsigned char * userkey, AES_KEY kappa_0[1], AES_KEY key[1], unsigned char * nonce) {
  AES_set_key(userkey,key);
  init_nonce(nonce,npub);
  gen_kappa(nonce,kappa_0,key);
}
 

int crypto_aead_encrypt(unsigned char *c, unsigned long long *clen,
			const unsigned char *m, unsigned long long mlen,
			const unsigned char *ad, unsigned long long adlen,
			const unsigned char *nsec,
			const unsigned char *npub, const unsigned char *k)
{
    AES_KEY key[1];
    AES_KEY kappa_0[1];
    AES_KEY kappa_m[1];
    unsigned char nonce[BLOCK_LENGTH];
    unsigned char X[BLOCK_LENGTH];
    unsigned char P[BLOCK_LENGTH];
    unsigned char stream[BLOCK_LENGTH];
    unsigned long long i;
    unsigned long long counter;
    (void)nsec; /* avoid warning */

    *clen = mlen + TAG_LENGTH;
    /* Key schedule, nonce initialization and generation of first kappa */
    init(npub,k,kappa_0,key,nonce);

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
	xor_128(X, stream, X);
	ad += blocklen;
	adlen -= blocklen;
    }

    /* Plaintext processing */
    if (mlen > 0) {
	/* Increment nonce and generate new kappa
	 * First subkey of kappa_m is modified
	 * (xored with first subkey of kappa_0)
	 */ 
	gen_next_kappa(nonce,kappa_0, kappa_m,key);
	counter = 0;

	/* P_0 processing */
	for (i = 0; i < BLOCK_LENGTH; i++)
	    P[i] = 0;
	AES_encrypt(P, stream, kappa_m);

	while (mlen > 0) {
	    unsigned long long blocklen = 12;
	    if (mlen < blocklen)
		blocklen = mlen;
	    for (i = 0; i < blocklen; ++i) {
		P[i] = m[i];
		c[i] = P[i] ^ stream[i];
	    }
	    for (i = blocklen; i < 12; i++)
		P[i] = 0;
	    ++counter;
	    store32(P + 12, counter);
 	    AES_encrypt(P, stream, kappa_m);
	    xor_128(X, stream, X);
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
    AES_KEY key[1];
    AES_KEY kappa_0[1];
    AES_KEY kappa_m[1];
    unsigned char nonce[BLOCK_LENGTH];
    unsigned char X[BLOCK_LENGTH];
    unsigned char P[BLOCK_LENGTH];
    unsigned char stream[BLOCK_LENGTH];
    unsigned long long i;
    unsigned long long counter;
    unsigned long long mlen;
    (void)nsec; /* avoid warning */

    if (clen < TAG_LENGTH)
	return -1;
    *outputmlen = mlen = clen - TAG_LENGTH;


    init(npub,k,kappa_0,key,nonce);

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
	xor_128(X, stream, X);
	ad += blocklen;
	adlen -= blocklen;
    }

    /* Plaintext processing */
    if (mlen > 0) {
	/* New kappa */
	gen_next_kappa(nonce,kappa_0,kappa_m,key);
	counter = 0;

	/* P_0 processing */
	for (i = 0; i < BLOCK_LENGTH; i++)
	    P[i] = 0;
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
	    store32(P + 12, counter);
	    AES_encrypt(P, stream, kappa_m);
	    xor_128(X, stream, X);
	    c += blocklen;
	    m += blocklen;
	    mlen -= blocklen;
	}
    }
    AES_encrypt(X, X, kappa_0);
    return verify_tag(c,X);
}
