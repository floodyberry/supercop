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
 * This version of CPFB has been implemented using the EVP interface of OpenSSL.
 * It uses AES-NI when available.
 * It assumes that EVP_EncryptUpdate, in ECB mode, returns as many blocks as it
 * has been given as input, at least when the number of blocks is 1, 4 or 8.
 * For simplicity, it does not implement re-keying for long messages so the maximum
 * message length of this implementation is (2**32 - 1) 96-bit blocks 
 * (12 bytes short of 48 GB).
 */ 

#include "crypto_aead.h"
#include "api.h"
#include <openssl/evp.h>
#include <string.h>

#define USE_CRYPTO_INT
#ifdef USE_CRYPTO_INT
#include "crypto_uint64.h"
#include "crypto_uint32.h"
#else
#include <stdint.h>
typedef uint64_t crypto_uint64;
typedef uint32_t crypto_uint32;
#endif

/* Set to zero if data is not 32 bit aligned */
#ifndef CPFB_IS_ALIGNED
#define CPFB_IS_ALIGNED 1
#endif

#if CRYPTO_KEYBYTES == 16
#define AES_ROUNDS 10
#define KEYBITS 128
#define KEY_LENGTH 16
#define AES_set_key(userkey,key) EVP_CIPHER_CTX_init(key); EVP_EncryptInit_ex(key, EVP_aes_128_ecb( ), NULL, userkey, NULL)
#elif CRYPTO_KEYBYTES == 32
#define AES_ROUNDS 14
#define KEYBITS 256
#define KEY_LENGTH 32
#define AES_set_key(userkey,key) EVP_CIPHER_CTX_init(key); EVP_EncryptInit_ex(key, EVP_aes_256_ecb( ), NULL, userkey, NULL)
#else
#error "Unknown Key Length"
#endif 

#define AES_encrypt(in,out,ctx) {int outl; EVP_EncryptUpdate(ctx, out, &outl , in, 16);}


#define TAG_LENGTH CRYPTO_ABYTES
#define NONCE_LENGTH CRYPTO_NPUBBYTES
#define BLOCK_LENGTH 16



#define NONCE_TYPE (CRYPTO_NPUBBYTES-8)
#define NONCE_INCREMENT 8
#define PAYLOAD_SIZE 12
#define BPI 8

#if __GNUC__
#define bswap32(x) __builtin_bswap32(x)
#define inline __inline
#elif _MSC_VER
#define bswap32(x) _byteswap_ulong(x)
#define inline __forceinline
#endif


#if (defined(__i386__) || defined(__x86_64__)) && defined(bswap32)
#define store32(x,u) { *((crypto_uint32*)(x)) = bswap32((crypto_uint32)(u)); }
#else

static void store32(unsigned char *x, unsigned long long u)
{
    int i;
    for (i = 3; i >= 0; --i) {
	x[i] = (unsigned char)u;
	u >>= 8;
    }
}

#endif

static void store64(unsigned char *x, unsigned long long u)
{
    int i;
    for (i = 7; i >= 0; --i) {
	x[i] = (unsigned char)u;
	u >>= 8;
    }
}



typedef union {
  unsigned char u8[16];
  crypto_uint32 u32[4];
  crypto_uint64 u64[2];
} u128;


#if CPFB_IS_ALIGNED == 1
static inline void xor128(const unsigned char* a, const unsigned char* b, unsigned char* x){
  u128* aa = (u128*) a;
  u128* bb = (u128*) b;
  u128* xx = (u128*) x;
  xx->u64[0] = aa->u64[0] ^ bb->u64[0];
  xx->u64[1] = aa->u64[1] ^ bb->u64[1];
}

static inline void xor96(const unsigned char* a, const unsigned char* b, unsigned char* x){
  u128* aa = (u128*) a;
  u128* bb = (u128*) b;
  u128* xx = (u128*) x;
  xx->u32[0] = aa->u32[0] ^ bb->u32[0];
  xx->u32[1] = aa->u32[1] ^ bb->u32[1];
  xx->u32[2] = aa->u32[2] ^ bb->u32[2];
}
#else
static inline void xor128(const unsigned char* a, const unsigned char* b, unsigned char* x){
  int i;
  for(i=0; i < 16; i++)
    x[i] = a[i]^b[i];
}

static inline void xor96(const unsigned char* a, const unsigned char* b, unsigned char* x){
  int i;
  for(i=0; i < 12; i++)
    x[i] = a[i]^b[i];
}

#endif


static inline int verify_tag(const unsigned char* a, const unsigned char* b){
  int i;
  unsigned char res = 0;
  for (i=0; i < TAG_LENGTH; i++)
    res |= a[i] ^ b[i];
  return res == 0 ? 0 : -1;
}
 


static void set_nonce(unsigned char* nonce, const unsigned char* npub){
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
  for (i = BLOCK_LENGTH-2; i > NONCE_LENGTH; i++)
    if (++nonce[i]) return;
}

static void gen_kappa(unsigned char* nonce, unsigned char* kappa, EVP_CIPHER_CTX ctx_key[1]){
  AES_encrypt(nonce,kappa,ctx_key);
#if KEYBITS == 256
  AES_encrypt(kappa,kappa+16,ctx_key);
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
    EVP_CIPHER_CTX ctx_k[1];
    EVP_CIPHER_CTX ctx_kappa_0[1];
    EVP_CIPHER_CTX ctx_kappa_m[1];
    unsigned char nonce[BLOCK_LENGTH];
    unsigned char X[BLOCK_LENGTH];
    unsigned char P[BLOCK_LENGTH*BPI];
    unsigned char stream[BLOCK_LENGTH*(BPI+1)];
    unsigned long long i;
    unsigned long long counter;
    (void)nsec; /* avoid warning */
    
    *clen = mlen + TAG_LENGTH;
    AES_set_key(k, ctx_k);

    /* Generation of the first kappa */
    set_nonce(nonce,npub);
    gen_kappa(nonce, kappa_0, ctx_k);
    AES_set_key(kappa_0, ctx_kappa_0);

    /* Block encoding alen and mlen
     * In an online implementation, it would be done at the end, and X would be 0    
     */
    store64(X , mlen);
    store32(X + 8, adlen);
    store32(X + 12, 0);
    AES_encrypt(X, X, ctx_kappa_0);

    /* AD processing */
    counter = 0;
    while (adlen >= PAYLOAD_SIZE*BPI){
      unsigned char* p = P;
      int outl;
      for(i = 0; i < BPI; i++){
        memcpy(p,ad,PAYLOAD_SIZE);
        store32(p+PAYLOAD_SIZE,++counter);
        p+=BLOCK_LENGTH;
        ad+=PAYLOAD_SIZE;
      }
      EVP_EncryptUpdate(ctx_kappa_0,stream,&outl,P,BPI*BLOCK_LENGTH);
      for(i = 0; i < BPI; i++)
	xor128(X,stream+(i*BLOCK_LENGTH),X);
      adlen -= BPI*PAYLOAD_SIZE;
    }
    while (adlen >= PAYLOAD_SIZE*4){
      unsigned char* p = P;
      int outl;
      for(i = 0; i < 4; i++){
        memcpy(p,ad,PAYLOAD_SIZE);
        store32(p+PAYLOAD_SIZE,++counter);
        p+=BLOCK_LENGTH;
        ad+=PAYLOAD_SIZE;
      }
      EVP_EncryptUpdate(ctx_kappa_0,stream,&outl,P,4*BLOCK_LENGTH);
      for(i = 0; i < 4; i++)
	xor128(X,stream+(i*BLOCK_LENGTH),X);
      adlen -= 4*PAYLOAD_SIZE;
    }
    while (adlen > 0) {
	unsigned long long blocklen = PAYLOAD_SIZE;
	if (adlen < blocklen)
	    blocklen = adlen;
	for (i = 0; i < blocklen; i++)
	    P[i] = ad[i];
	for (i = blocklen; i < PAYLOAD_SIZE; i++)
	    P[i] = 0;
	++counter;
	store32(P + PAYLOAD_SIZE, counter);
	AES_encrypt(P, stream, ctx_kappa_0);
	xor128(X, stream, X);
	ad += blocklen;
	adlen -= blocklen;
    }

    /* Plaintext processing */
    if (mlen > 0) {
	/* New kappa */
        inc_nonce(nonce);
	gen_kappa(nonce, kappa_m, ctx_k);
	AES_set_key(kappa_m, ctx_kappa_m);

	counter = 0;

	/* P_0 processing */
	for (i = 0; i < BLOCK_LENGTH; i++)
	    P[i] = kappa_0[i];
	AES_encrypt(P, stream, ctx_kappa_m);
	while (mlen >= PAYLOAD_SIZE*BPI){
	  unsigned char* p = P;
	  unsigned char* s = stream;
	  int outl;
	  for(i = 0; i < BPI; i++){
	    memcpy(p,m+(i*PAYLOAD_SIZE),PAYLOAD_SIZE);
	    store32(p+PAYLOAD_SIZE,++counter);
	    xor128(p,kappa_0,p);
	    p+=BLOCK_LENGTH;
	  }
	  EVP_EncryptUpdate(ctx_kappa_m,stream+BLOCK_LENGTH,&outl,P,BLOCK_LENGTH*BPI);
	  for(i =0; i < BPI; i++){
	    xor96(m,s,c);
	    s+=BLOCK_LENGTH;
	    xor128(X,s,X);
	    m+=PAYLOAD_SIZE;
	    c+=PAYLOAD_SIZE;
	  }
	  memcpy(stream,s,BLOCK_LENGTH);
	  mlen -= PAYLOAD_SIZE*BPI;
	}
	while (mlen > 0) {
	    unsigned long long blocklen = PAYLOAD_SIZE;
	    if (mlen < blocklen)
		blocklen = mlen;
	    for (i = 0; i < blocklen; ++i) {
		P[i] = m[i];
		c[i] = m[i] ^ stream[i];
	    }
	    for (i = blocklen; i < PAYLOAD_SIZE; i++)
		P[i] = 0;
	    ++counter;
	    store32(P + PAYLOAD_SIZE, counter);
 	    xor128(P, kappa_0, P);
	    AES_encrypt(P, stream, ctx_kappa_m);
	    xor128(X, stream, X);
	    c += blocklen;
	    m += blocklen;
	    mlen -= blocklen;
	}
    }
    AES_encrypt(X, X, ctx_kappa_0);
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
    EVP_CIPHER_CTX ctx_k[1];
    EVP_CIPHER_CTX ctx_kappa_0[1];
    EVP_CIPHER_CTX ctx_kappa_m[1];
    unsigned char nonce[BLOCK_LENGTH];
    unsigned char X[BLOCK_LENGTH];
    unsigned char P[BLOCK_LENGTH*BPI];
    unsigned char stream[BLOCK_LENGTH*BPI];
    unsigned long long i;
    unsigned long long counter;
    unsigned long long mlen;
    (void)nsec; /* avoid warning */

    if (clen < TAG_LENGTH)
	return -1;
    *outputmlen = mlen = clen - TAG_LENGTH;


    AES_set_key(k, ctx_k);

    /* Generation of the first kappa */
    set_nonce(nonce,npub);
    gen_kappa(nonce, kappa_0, ctx_k);
    AES_set_key(kappa_0, ctx_kappa_0);

    /* Block encoding alen and mlen
     * In an online implementation, it would be done at the end, and X would be 0
     */
    store64(X, mlen);
    store32(X + 8, adlen);
    store32(X + 12, 0);
    AES_encrypt(X, X, ctx_kappa_0);

    /* AD processing */
    counter = 0;
    while (adlen >= PAYLOAD_SIZE*BPI){
      unsigned char* p = P;
      int outl;
      for(i = 0; i < BPI; i++){
        memcpy(p,ad,PAYLOAD_SIZE);
        store32(p+PAYLOAD_SIZE,++counter);
        p+=BLOCK_LENGTH;
        ad+=PAYLOAD_SIZE;
      }
      EVP_EncryptUpdate(ctx_kappa_0,stream,&outl,P,BPI*BLOCK_LENGTH);
      for(i = 0; i < BPI; i++)
	xor128(X,stream+(i*BLOCK_LENGTH),X);
      adlen -= BPI*PAYLOAD_SIZE;
    }
    while (adlen >= PAYLOAD_SIZE*4){
      unsigned char* p = P;
      int outl;
      for(i = 0; i < 4; i++){
        memcpy(p,ad,PAYLOAD_SIZE);
        store32(p+PAYLOAD_SIZE,++counter);
        p+=BLOCK_LENGTH;
        ad+=PAYLOAD_SIZE;
      }
      EVP_EncryptUpdate(ctx_kappa_0,stream,&outl,P,4*BLOCK_LENGTH);
      for(i = 0; i < 4; i++)
	xor128(X,stream+(i*BLOCK_LENGTH),X);
      adlen -= 4*PAYLOAD_SIZE;
    }
    while (adlen > 0) {
	unsigned long long blocklen = PAYLOAD_SIZE;
	if (adlen < blocklen)
	    blocklen = adlen;
	for (i = 0; i < blocklen; i++)
	    P[i] = ad[i];
	for (i = blocklen; i < PAYLOAD_SIZE; i++)
	    P[i] = 0;
	++counter;
	store32(P + PAYLOAD_SIZE, counter);
	AES_encrypt(P, stream, ctx_kappa_0);
	xor128(X, stream, X);
	ad += blocklen;
	adlen -= blocklen;
    }

    /* Plaintext processing */
    if (mlen > 0) {
	/* New kappa */
        inc_nonce(nonce);
	gen_kappa(nonce, kappa_m, ctx_k);
	AES_set_key(kappa_m, ctx_kappa_m);

	counter = 0;

	/* P_0 processing */
	for (i = 0; i < BLOCK_LENGTH; i++)
	    P[i] = kappa_0[i];
	AES_encrypt(P, stream, ctx_kappa_m);

	while (mlen > PAYLOAD_SIZE) {
	    for (i = 0; i < PAYLOAD_SIZE; ++i) {
		m[i] = c[i] ^ stream[i];
		P[i] = m[i];
	    }
	    ++counter;
	    store32(P + PAYLOAD_SIZE, counter);
	    xor128(P, kappa_0, P);
	    AES_encrypt(P, stream, ctx_kappa_m);
	    xor128(X, stream, X);
	    c += PAYLOAD_SIZE;
	    m += PAYLOAD_SIZE;
	    mlen -= PAYLOAD_SIZE;
	}
	if (mlen > 0) {
	    for (i = 0; i < mlen; ++i) {
		m[i] = c[i] ^ stream[i];
		P[i] = m[i];
	    }
	    for (i = mlen; i < PAYLOAD_SIZE; i++)
		P[i] = 0;
	    ++counter;
	    store32(P + PAYLOAD_SIZE, counter);
	    xor128(P, kappa_0, P);
	    AES_encrypt(P, stream, ctx_kappa_m);
	    xor128(X, stream, X);
	    c += mlen;
	}
    }
    AES_encrypt(X, X, ctx_kappa_0);
    return verify_tag(c,X);
}
