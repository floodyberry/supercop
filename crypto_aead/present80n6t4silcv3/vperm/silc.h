#include <stdint.h>
#include "present.h"
#include "common.h"

#ifndef __SILC_H_
#define __SILC_H_

typedef uint16_t            u16;
typedef unsigned int        u32;
typedef unsigned long long  u64;
typedef unsigned char       byte;

#define PARAM				0xc4	 // define the PARAM for (E = LED, ell_N = 12, tau = 8)
#define STATE_LEN           8       // length of state in byte
#define AD_ERROR            -2       // ERROR in associated data
#define KEY_ERROR           -1       // ERROR in key
#define SUCCESS             0        // SUCCESS
#define RETURN_SUCCESS      0
#define RETURN_TAG_NO_MATCH -1
#define RETURN_MEMORY_FAIL  -2
#define RETURN_KEYSIZE_ERR  -3


#if STATE_LEN==16
#elif STATE_LEN==8
#endif




typedef struct _ae_cxt {
	dqword es;//byte es[STATE_LEN];               // encryption state
	dqword ts;//byte ts[STATE_LEN];               // tag processing state
	byte *userkey;
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

void ae_clear(ae_cxt* cxt);
int ae_init(ae_cxt* cxt, const byte* userkey, int keylen);
int process_ad(ae_cxt* cxt, const byte* ad, unsigned long long adlen, const byte* nonce, unsigned long long nlen);
int ae_encrypt(ae_cxt* cxt, byte* pt, unsigned long long mlen, byte* ct, byte* tag, unsigned long long tlen);
int ae_decrypt(ae_cxt* cxt, byte* pt, unsigned long long mlen, byte* ct, byte* tag, unsigned long long tlen);

#endif /* end of __SILC_H_  */
