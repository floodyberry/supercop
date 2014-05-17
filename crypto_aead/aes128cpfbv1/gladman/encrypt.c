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
 * This version of CPFB uses Brian Gladman's implementation of AES.
 * It uses Gladman's endiannes detection for a small optimization
 * in storing 32 bit big endian integers.
 * For simplicity, it does not implement re-keying for long messages so the maximum
 * message length of this implementation is (2**32 - 1) 96-bit blocks 
 * (12 bytes short of 48 GB).
 */ 

#include "crypto_aead.h"
#include "api.h"
#include "aes.h"
#include "brg_endian.h"

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
#define PAYLOAD_LENGTH 12

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

#define AES_encrypt(src,dst,key) aes_encrypt(src->u8,dst->u8,key)
#define AES_KEY aes_encrypt_ctx
#if KEYBITS == 128
#define AES_set_key aes_encrypt_key128
#else
#define AES_set_key aes_encrypt_key256
#endif

#if __GNUC__
#define bswap32(x)  __builtin_bswap32(x)
#define bswap64(x)  __builtin_bswap64(x)
#define inline __inline
#elif _MSC_VER
#define bswap32(x)  _byteswap_ulong(x)
#define bswap64(x)  _byteswap_uint64(x)
#define inline __forceinline
#else
#define inline
#endif

/* Undefine this if data is not 32 bit aligned */
#define CPFB_IS_ALIGNED

#ifndef htobe32
#if PLATFORM_BYTE_ORDER == IS_LITTLE_ENDIAN
#define htobe32(x) bswap32((crypto_uint32)(x))
#elif PLATFORM_BYTE_ORDER == IS_BIG_ENDIAN 
#define htobe32(x) (crypto_uint32)(x)
#endif
#endif

#ifdef CPFB_IS_ALIGNED
#define store32(x,u) *((crypto_uint32*)(x)) = htobe32(u))
#else

static inline void store32(unsigned char *x, unsigned long long u)
{
    int i;
    for (i = 3; i >= 0; --i) {
	x[i] = (unsigned char)u;
	u >>= 8;
    }
}
#endif

#ifndef htobe32
static inline crypto_uint32 htobe32(crypto_uint32 u){
  crypto_uint32 x;
  store32((unsigned char*)&x,u);
  return x;
}
#endif


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
  struct {
    crypto_uint32 u32[3];
    crypto_uint32 counter;
  };
  crypto_uint64 u64[2];
} CPFB_BLOCK;



#ifdef CPFB_IS_ALIGNED
static inline void xor_128(const CPFB_BLOCK* a, const CPFB_BLOCK* b, CPFB_BLOCK* x){
  x->u64[0] = a->u64[0] ^ b->u64[0];
  x->u64[1] = a->u64[1] ^ b->u64[1];
}

static inline void load_96_ctr(CPFB_BLOCK* block, const unsigned char* b, unsigned long long counter){
  block->u32[0] = *((crypto_uint32*)b);
  block->u32[1] = *((crypto_uint32*)(b+4));
  block->u32[2] = *((crypto_uint32*)(b+8));
  block->counter = htobe32((crypto_uint32) counter); 
}


static inline void load_partial_ctr(CPFB_BLOCK* block, const unsigned char* b, unsigned long long len, unsigned long long counter){
  unsigned int i;
  block->u64[0] = block->u64[1] = 0;
  for (i = 0; i < len; i++)
    block->u8[i] = b[i];
  block->counter = htobe32((crypto_uint32)counter); 
}  

static inline void store_xor_96(unsigned char* c, const CPFB_BLOCK* a, const CPFB_BLOCK* b){
  *((crypto_uint32*)(c))   = a->u32[0] ^ b->u32[0];
  *((crypto_uint32*)(c+4)) = a->u32[1] ^ b->u32[1];
  *((crypto_uint32*)(c+8))   = a->u32[2] ^ b->u32[2];
}
#else
static inline void xor_128(const CPFB_BLOCK* a, const CPFB_BLOCK* b, CPFB_BLOCK* x){
  int i;
  for (i=0; i < BLOCK_LENGTH; i++)
    x->u8[i] = a->u8[i] ^ b->u8[i];
}

static inline void load_96_ctr(CPFB_BLOCK* block, const unsigned char* b, unsigned long long counter){
  int i;
  for (i = 0; i < PAYLOAD_LENGTH; i++)
    block->u8[i] = b[i];
  store32(block->u8+PAYLOAD_LENGTH,counter);
}


static inline void load_partial_ctr(CPFB_BLOCK* block, const unsigned char* b, unsigned long long len, unsigned long long counter){
  unsigned int i;
  for (i = 0; i < len; i++)
    block->u8[i] = b[i];
  for (; i < PAYLOAD_LENGTH; i ++)
    block->u8[i] = 0;
  store32(block->u8+PAYLOAD_LENGTH,counter);
}  

static inline void store_xor_96(unsigned char* c, const CPFB_BLOCK* a, const CPFB_BLOCK* b){
  int i;
  for (i = 0; i < PAYLOAD_LENGTH; i++)
    c[i] = a->u8[i] ^ b->u8[i];
}


#endif

static inline void store_xor_partial(unsigned char* c, const CPFB_BLOCK* a, const CPFB_BLOCK* b, unsigned long long len){
  unsigned int i;
  for (i = 0; i < len; i++)
    c[i] = a->u8[i] ^ b->u8[i];
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
  aes_encrypt(nonce,_kappa,key); /* This is the original gladman function */
#if KEYBITS == 256
  aes_encrypt(_kappa,_kappa+16,key);
#endif
  AES_set_key(_kappa,kappa);
}

static inline void gen_next_kappa(unsigned char* nonce, const AES_KEY kappa_0[1], AES_KEY kappa[1], const AES_KEY key[1]){
  int i;
  inc_nonce(nonce);
  gen_kappa(nonce,kappa,key);
  /* We make the xor with kappa 0 here, so we don't need to do it with every block*/
  for(i=0; i < 4; i++)
    kappa[0].ks[i] ^= kappa_0[0].ks[i];
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
    CPFB_BLOCK X[1];
    CPFB_BLOCK P[1];
    CPFB_BLOCK stream[1];
    unsigned long long i;
    unsigned long long counter;
    (void)nsec; /* avoid warning */

    *clen = mlen + TAG_LENGTH;
    /* Key schedule, nonce initialization and generation of first kappa */
    init(npub,k,kappa_0,key,nonce);

    /* Block encoding alen and mlen
     * In an online implementation, it would be done at the end, and X would be 0
     */
    store64(X->u8, mlen);
    X->u32[2] = htobe32((crypto_uint32)adlen);
    X->counter = 0;
    AES_encrypt(X, X, kappa_0);

    /* AD processing */
    counter = 0;
    while (adlen > PAYLOAD_LENGTH) {
        load_96_ctr(P,ad,++counter);
	AES_encrypt(P, stream, kappa_0);
	xor_128(X, stream, X);
	ad += PAYLOAD_LENGTH;
	adlen -= PAYLOAD_LENGTH;
    }
    if (adlen > 0) {
        load_partial_ctr(P,ad,adlen,++counter);
	AES_encrypt(P, stream, kappa_0);
	xor_128(X, stream, X);
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
	P->u64[0] = P->u64[1] = 0;
	AES_encrypt(P, stream, kappa_m);

	while (mlen > PAYLOAD_LENGTH) {
	    load_96_ctr(P,m,++counter);
	    store_xor_96(c,P,stream);
 	    AES_encrypt(P, stream, kappa_m);
	    xor_128(X, stream, X);
	    c += PAYLOAD_LENGTH;
	    m += PAYLOAD_LENGTH;
	    mlen -= PAYLOAD_LENGTH;
	}
	if (mlen > 0) {
	    load_partial_ctr(P,m,mlen,++counter);
	    store_xor_partial(c,P,stream,mlen);
 	    AES_encrypt(P, stream, kappa_m);
	    xor_128(X, stream, X);
	    c += mlen;
	}
    }
    AES_encrypt(X, X, kappa_0);
    for (i = 0; i < TAG_LENGTH; i++)
	c[i] = X->u8[i];
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
    CPFB_BLOCK X[1];
    CPFB_BLOCK P[1];
    CPFB_BLOCK stream[1];
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
    store64(X->u8, mlen);
    X->u32[2] = htobe32((crypto_uint32)adlen);
    X->counter = 0;
    AES_encrypt(X, X, kappa_0);

    /* AD processing */
    counter = 0;
    while (adlen > PAYLOAD_LENGTH) {
        load_96_ctr(P,ad,++counter);
	AES_encrypt(P, stream, kappa_0);
	xor_128(X, stream, X);
	ad += PAYLOAD_LENGTH;
	adlen -= PAYLOAD_LENGTH;
    }
    if (adlen > 0) {
        load_partial_ctr(P,ad,adlen,++counter);
	AES_encrypt(P, stream, kappa_0);
	xor_128(X, stream, X);
    }

    /* Plaintext processing */
    if (mlen > 0) {
	/* New kappa */
	gen_next_kappa(nonce,kappa_0,kappa_m,key);
	counter = 0;

	/* P_0 processing */
	P->u64[0] = P->u64[1] = 0;
	AES_encrypt(P, stream, kappa_m);

	while (mlen > PAYLOAD_LENGTH) {
	    store_xor_96(m,(CPFB_BLOCK*)c,stream);
	    load_96_ctr(P,m,++counter);
	    AES_encrypt(P, stream, kappa_m);
	    xor_128(X, stream, X);
	    c += PAYLOAD_LENGTH;
	    m += PAYLOAD_LENGTH;
	    mlen -= PAYLOAD_LENGTH;
	}
	if (mlen > 0) {
	    store_xor_partial(m,(CPFB_BLOCK*)c,stream,mlen);
	    load_partial_ctr(P,m,mlen,++counter);
	    AES_encrypt(P, stream, kappa_m);
	    xor_128(X, stream, X);
	    c += mlen;
	}
    }
    AES_encrypt(X, X, kappa_0);
    return verify_tag(c,X->u8);
}
