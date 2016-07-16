#include <stdint.h>
#include "aes.h"

#ifndef __SILC_H_
#define __SILC_H_

typedef uint16_t            u16;
typedef unsigned int        u32;
typedef unsigned long long  u64;
typedef unsigned char       byte;

#define PARAM				0xc0	 // define the PARAM for (E = AES, ell_N = 12, tau=8)
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

#if STATE_LEN==16
typedef u32 word;
#elif STATE_LEN==8
typedef u16 word;
#endif

#define g(st) do{                           \
	int gi;									\
	byte gtemp = st[0] ^ st[1];				\
	for(gi = 0; gi < STATE_LEN-1; gi++)		\
		st[gi] = st[gi+1];					\
	st[gi] = gtemp;							\
}while(0);

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

int ae_init(ae_cxt* cxt, const byte* userkey, int keylen);
int process_ad(ae_cxt* cxt, const byte* ad, unsigned long long adlen, const byte* nonce, unsigned long long nlen);
int ae_encrypt(ae_cxt* cxt, byte* pt, unsigned long long mlen, byte* ct, byte* tag, unsigned long long tlen, int enc_dec);
void pstate(const unsigned char* st, int len);
void pstate2(const char *str, const byte* state);
void print_cxt(const ae_cxt* cxt);

void xor_bytes(byte*x, const byte*y, int nb);
void xor_bytes2(byte* result, const byte* x, const byte* y, int nb);

#endif /* end of __SILC_H_  */
