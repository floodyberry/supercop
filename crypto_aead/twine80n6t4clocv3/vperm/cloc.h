#include <stdint.h>
#include "common.h"

#ifndef __CLOC_H_
#define __CLOC_H_


typedef uint16_t            u16;
typedef unsigned int        u32;
typedef unsigned long long  u64;
typedef unsigned char       byte;

#define PARAM				0xcc	 // define the PARAM for (E = TWINE, ell_N = 6, tau = 4)
#define STATE_LEN           8        // length of state in byte
#define AD_ERROR            -2       // ERROR in associated data
#define KEY_ERROR           -1       // ERROR in key
#define SUCCESS             0        // SUCCESS
#define ENC                 1        // ENCRYPTION
#define DEC                 2        // DECRYPTION
#define RETURN_SUCCESS      0
#define RETURN_TAG_NO_MATCH -1
#define RETURN_MEMORY_FAIL  -2


#define CLOC_BDCB _mm_set_epi8(0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 3, 2, 7, 6, 5, 4, 3, 2)	
#define CLOC_CADC _mm_set_epi8(0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 5, 4, 1, 0, 7, 6, 5, 4)
#define CLOC_BB00 _mm_set_epi8(0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 3, 2, 3, 2, 0xFF, 0xFF, 0xFF, 0xFF)
#define CLOC_A000 _mm_set_epi8(0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 1, 0, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF)


typedef struct _ae_cxt {
	dqword es;               // encryption state
	dqword ts;               // tag processing state
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

void ae_clear(ae_cxt* cxt);
int ae_init(ae_cxt* cxt, const byte* userkey, int keylen);
int process_ad(ae_cxt* cxt, const byte* ad, unsigned long long adlen, const byte* nonce, unsigned long long nlen);
int ae_encrypt(ae_cxt* cxt, byte* pt, unsigned long long mlen, byte* ct, byte* tag, unsigned long long tlen);
int ae_decrypt(ae_cxt* cxt, byte* pt, unsigned long long mlen, byte* ct, byte* tag, unsigned long long tlen);

#endif /* end of __CLOC_H_  */
