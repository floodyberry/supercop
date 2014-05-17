#ifndef __MARBLE_H_
#define __MARBLE_H_
#include "aes.h"
#define AD_ERROR            -2       // ERROR in associated data
#define KEY_ERROR           -1       // ERROR in key
#define SUCCESS             0        // SUCCESS
#define RETURN_SUCCESS      0
#define RETURN_TAG_NO_MATCH -1
#define RETURN_MEMORY_FAIL  -2
#define RETURN_KEYSIZE_ERR  -3
#define RETURN_UNSUPPORTED	-4
#define SLEN	16
#define GFPOLY	0x87
typedef unsigned char byte;
typedef struct{
	byte L[SLEN];		// derived key L
	byte iMask[SLEN];	//  input mask
	byte oMask[SLEN];	// output mask
	byte S1[SLEN];		// chaining S1
	byte S2[SLEN];		// chaining S2
	byte Tau[SLEN];		// Tau for tag generation
	byte MSum[SLEN];	// Sum of all message blocks
	AES_KEY ekey0, ekey1, ekey2; 	// encryption keys for E0, E1, E2
	AES_KEY dkey0, dkey1, dkey2;	// decryption keys for E0, E1, E2
} ae_cxt;

ae_cxt* ae_allocate();
void pstate(const unsigned char* st, int len);
int ae_init(ae_cxt* cxt, const byte* userkey, int keylen);
int process_ad(ae_cxt* cxt, const byte* ad, unsigned long long adlen, const byte* nonce, unsigned long long nlen);
int ae_encrypt(ae_cxt* cxt, byte* pt, unsigned long long mlen, byte* ct);
int ae_decrypt(ae_cxt* cxt, byte* pt, unsigned long long clen, byte* ct, byte* tag);
void xor_bytes(byte*x, const byte*y, int nb);
void xor_bytes2(byte* result, const byte* x, const byte* y, int nb);
#define SUCCESS	0
#endif	/* end of __MARBLE_H_ */
