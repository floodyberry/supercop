/*
 * @version 1.0 (May 2014)
 *
 * Reference ANSI C implementation of YAES
 *
 * @author Antoon Bosselaers <antoon.bosselaers@esat.kuleuven.be>
 * @author Frederik Vercauteren <frederik.vercauteren@esat.kuleuven.be>
 */
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "crypto_aead.h"
#include "api.h"
#include "aes-128.h"
#include "encrypt.h"

void EF128(const u8 N[16], const u8 M[], ull Mlen, const u8 K[], u8 C[], u8 TE[16]);
void DF128(const u8 N[16], const u8 C[], ull Clen, const u8 K[], u8 M[], u8 TE[16]);
void AD128(const u8 A[], ull Alen, const u8 K[], u8 T[16]);

int crypto_aead_encrypt(
  unsigned char *c, unsigned long long *clen,
  const unsigned char *m, unsigned long long mlen,
  const unsigned char *ad, unsigned long long adlen,
  const unsigned char *nsec,
  const unsigned char *npub,
  const unsigned char *k
)
{
/*
  ... the code for the cipher implementation goes here,
  ... generating a ciphertext c[0],c[1],...,c[*clen-1]
  ... from a plaintext m[0],m[1],...,m[mlen-1]
  ... and associated data ad[0],ad[1],...,ad[adlen-1]
  ... and secret message number nsec[0],nsec[1],...
  ... and public message number npub[0],npub[1],...
  ... and secret key k[0],k[1],...
*/
	u8 TA[16], TE[16];
	int j;

	if (adlen) {
		AD128(ad, adlen, k, TA);
	}
	EF128(npub, m, mlen, k, c, TE);
	if (adlen) {
		for (j=0; j<16; j++)
			TE[j] ^= TA[j];
	}
	for (j=0; j<CRYPTO_ABYTES; j++)
		c[mlen+j] = TE[j];
	*clen = mlen+CRYPTO_ABYTES; 

	return 0;
}

int crypto_aead_decrypt(
  unsigned char *m, unsigned long long *mlen,
  unsigned char *nsec,
  const unsigned char *c, unsigned long long clen,
  const unsigned char *ad, unsigned long long adlen,
  const unsigned char *npub,
  const unsigned char *k
)
{
/*
  ... the code for the cipher implementation goes here,
  ... generating a plaintext m[0],m[1],...,m[*mlen-1]
  ... and secret message number nsec[0],nsec[1],...
  ... from a ciphertext c[0],c[1],...,c[clen-1]
  ... and associated data ad[0],ad[1],...,ad[adlen-1]
  ... and public message number npub[0],npub[1],...
  ... and secret key k[0],k[1],...
*/
	u8 TA[16], TE[16], T[CRYPTO_ABYTES];
	int j;

	memcpy((void*)T, (void*)&c[clen-CRYPTO_ABYTES], CRYPTO_ABYTES);
	if (adlen) {
		AD128(ad, adlen, k, TA);
	}	
	DF128(npub, c, clen-CRYPTO_ABYTES, k, m, TE);
	if (adlen) {
		for (j=0; j<16; j++)
			TE[j] ^= TA[j];
	}
	*mlen = clen-CRYPTO_ABYTES;
	if (memcmp((void*)TE, (void*)T, CRYPTO_ABYTES))
		return -1;
		
	return 0;
}

#define GFmultx(Y, X)\
if ((X)[15] & 0x01)\
	t = 0xE1;\
else\
	t = 0;\
for (j=15; j>0; j--)\
	(Y)[j] = ((X)[j]>>1 ) ^ ((X)[j-1]<<7);\
(Y)[0] = ((X)[0]>>1) ^ t;


void EF128(const u8 npub[16], const u8 M[], ull Mlen, const u8 K[], u8 C[], u8 TE[16]) {

	u32 rk[44];
	u8 N[16];
	u8 L[16], S[16], V[16], tmp[16], t;
	int i, j, m, lastlen;

	m = Mlen/16;
	lastlen = Mlen % 16;
	
	memset(S, 0, 16);
	memcpy(N, npub, CRYPTO_NPUBBYTES);
	N[CRYPTO_NPUBBYTES-1] |= 0x01;
	
	aes128KeySetupEnc(rk, K);
	aes128Encrypt(rk, N, L);
	
	for (i=0; i<m; i++) {
		aes128rounds(rk, L, V, 6, 1);
		for (j=0; j<16; j++) {
			V[j] ^= M[16*i+j];
			C[16*i+j] = V[j] ^ L[j];
		}
		aes128rounds(rk, V, tmp, 4, 7);
		for (j=0; j<16; j++)
			S[j] ^= tmp[j];
		GFmultx(L, L)
	}

	if (lastlen) {
		aes128rounds(rk, L, V, 6, 1);

		for (j=0; j<lastlen; j++) {
			V[j] ^= M[16*m+j];
			C[16*m+j] = V[j] ^ L[j];
		}
		V[lastlen] ^= 0x80;

		aes128rounds(rk, V, tmp, 4, 7);
		for (j=0; j<16; j++)
			S[j] ^= tmp[j];
		GFmultx(L, L)
	}

	GFmultx(tmp, L)
	if (Mlen==0 || lastlen) {
		GFmultx(tmp, tmp)
	}
	for (j=0; j<16; j++)
		S[j] ^= L[j] ^ tmp[j];
	aes128Encrypt(rk, S, TE);
}


void DF128(const u8 npub[16], const u8 C[], ull Clen, const u8 K[], u8 M[], u8 TE[16]) {

	u32 rk[44];
	u8 N[16];
	u8 L[16], S[16], V[16], tmp[16], t;
	int i, j, c, lastlen;

	c = Clen/16;
	lastlen = Clen % 16;

	memset(S, 0, 16);
	memcpy(N, npub, CRYPTO_NPUBBYTES);
	N[CRYPTO_NPUBBYTES-1] |= 0x01;
	aes128KeySetupEnc(rk, K);
	aes128Encrypt(rk, N, L);

	for (i=0; i<c; i++) {
		aes128rounds(rk, L, V, 6, 1);
		for (j=0; j<16; j++) {
			tmp[j] = C[16*i+j] ^ L[j];
			M[16*i+j] = V[j] ^ tmp[j];
		}
		aes128rounds(rk, tmp, tmp, 4, 7);
		for (j=0; j<16; j++)
			S[j] ^= tmp[j];
		GFmultx(L, L)
	}

	if (lastlen) {
		aes128rounds(rk, L, V, 6, 1);
		for (j=0; j<lastlen; j++) {
			tmp[j] = C[16*c+j] ^ L[j];
			M[16*c+j] = V[j] ^ tmp[j];
		}
		tmp[lastlen] = 0x80 ^ V[lastlen];
		for (j=lastlen+1; j<16; j++)
			tmp[j] = V[j];

		aes128rounds(rk, tmp, tmp, 4, 7);
		for (j=0; j<16; j++)
			S[j] ^= tmp[j];
		GFmultx(L, L)
	}
	GFmultx(tmp, L)
	if (Clen==0 || lastlen) {
		GFmultx(tmp, tmp)
	}
	for (j=0; j<16; j++)
		S[j] ^= L[j] ^ tmp[j];
	aes128Encrypt(rk, S, TE);
}


void AD128(const u8 A[], ull Alen, const u8 K[], u8 T[16]) {

	u32 rk[44];
	u8 R[16], S[16], tmp[16], t;
	int i, j, a, lastlen;
	
	if (Alen == 0) {
		memset(T, 0, 16);
		return;
	}

	a = Alen/16;
	lastlen = Alen % 16;

	memset(S, 0, 16);
	aes128KeySetupEnc(rk, K);
	aes128Encrypt(rk, S, R);

	for (i=0; i<a; i++) {
		for (j=0; j<16; j++)
			tmp[j] = A[i*16+j] ^ R[j];
		aes128rounds(rk, tmp, tmp, 4, 1);
		for (j=0; j<16; j++)
			S[j] ^= tmp[j];
		GFmultx(R, R)
	}
	
	if (lastlen) {
	  
	  // initializing last block and XOR with R value
	  for (j=0; j<lastlen; j++)
	    tmp[j] = A[16*a+j] ^ R[j];
	  tmp[lastlen] = 0x80 ^ R[lastlen];
	  for (j = lastlen+1; j<16; j++)
	    tmp[j] = R[j];
	  
	  aes128rounds(rk, tmp, tmp, 4, 1);
	  for (j=0; j<16; j++)
	    S[j] ^= tmp[j];
	  GFmultx(R, R)
	 }

	GFmultx(tmp, R)
	if (lastlen) {
		GFmultx(tmp, tmp)
	}
	for (j=0; j<16; j++)
		S[j] ^= R[j] ^ tmp[j];
	aes128Encrypt(rk, S, T);
}
