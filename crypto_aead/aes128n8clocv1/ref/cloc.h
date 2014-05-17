#ifndef __CLOC_H_
#define __CLOC_H_

#include "aes.h"
typedef unsigned int        u32;
typedef unsigned long long  u64;
typedef unsigned char       byte;
typedef unsigned int        word;

#define STATE_LEN           16       // length of state in byte
#define AD_ERROR            -2       // ERROR in associated data
#define KEY_ERROR           -1       // ERROR in key
#define SUCCESS             0        // SUCCESS
#define ENC                 1        // ENCRYPTION
#define DEC                 2        // DECRYPTION
#define RETURN_SUCCESS      0
#define RETURN_TAG_NO_MATCH -1
#define RETURN_MEMORY_FAIL  -2
#define RETURN_KEYSIZE_ERR  -3

typedef struct { u64 l,r; } block;

/* G^8 */
#define f1(a,b,c,d)do{\
	a ^= c;		      \
	word t = b;       \
	b ^= d;		      \
	d = c^b;          \
	c = t^a;}while(0)


/* G^1 */
#define G(a,b,c,d) do{\
	word t = a^b;     \
	a = b;            \
	b = c;            \
	c = d;            \
	d = t;}while(0)


/* f2 = G^1 */
#define f2(a,b,c,d) G(a,b,c,d)


/* G^2 */
#define g1(a,b,c,d)do{\
	word t = a;       \
	a = c;            \
	c = t ^ b;        \
	t = b;            \
	b = d;            \
	d = a ^ t;}while(0)


/* G^1 */
#define g2(a,b,c,d) f2(a,b,c,d)


/* G^4 */
#define h(a,b,c,d)do{ \
	a ^= b;           \
	b ^= c;           \
	c ^= d;           \
	d ^= a;}while(0)

typedef struct _ae_cxt {
	byte es[STATE_LEN];               // encryption state
	byte ts[STATE_LEN];               // tag processing state
	AES_KEY ekey;                     // expanded keys
	AES_KEY* pt_ekey;
	byte* userkey;
	int klen;
	byte* ad;
	unsigned long long adlen;
	byte* nonce;
	unsigned long long nlen;
	byte* pt;
	unsigned long long ptlen;
	byte* ct;
	unsigned long long ctlen;
	byte* tag;
	int tlen;
} ae_cxt;

ae_cxt* ae_allocate();
int ae_init(ae_cxt* cxt, const byte* userkey, int keylen);
int process_ad(ae_cxt* cxt, const byte* ad, unsigned long long adlen, const byte* nonce, unsigned long long nlen);
int ae_encrypt(ae_cxt* cxt, byte* pt, unsigned long long mlen, byte* ct, byte* tag, unsigned long long tlen, int enc_dec);
void pstate(const unsigned char* st, int len);
void print_cxt(const ae_cxt* cxt);

void xor_block(block* x, block* y);
void xor_bytes(byte*x, const byte*y, int nb);
void xor_bytes2(byte* result, const byte* x, const byte* y, int nb);

#endif /* end of __CLOC_H_  */
