#include "crypto_aead.h"
#include "api.h"
#include "sablier.h"
#include "authenticate.h"

static int do_crypto_aead(
	unsigned char *c,
	const unsigned char *m, unsigned long long mlen,
	const unsigned char *ad, unsigned long long adlen,
	const unsigned char *npub,
	const bool encrypt_or_decrypt,
	const bool authenticate_or_not
	){
	u8 c0, c1, m0, m1, a0, a1;
	u16 z;
	size_type i, j;

#define _leakage(stream) z = (stream)
	if (authenticate_or_not){// need authenticate
		// deal ad
#define _round_c1 C1
#define _round_c2 0x0000
		for (i = 0; (j = i + 2) <= adlen; i = j){
			m0 = ad[i];
			m1 = ad[i + 1];
			encrypt_authenticate_constant();
		}
		if (adlen & 1){
			m0 = ad[i];
			m1 = 0x81;
		}
		else{
			m0 = 0x01;
			m1 = 0x80;
		}
		encrypt_authenticate_constant();
#undef _round_c1
#undef _round_c2
		// deal npub
#define _round_c1 0x0000
#define _round_c2 C2
		for (i = 0; (j = i + 2) <= CRYPTO_NPUBBYTES; i = j){
			m0 = npub[i];
			m1 = npub[i + 1];
			encrypt_authenticate_constant();
		}
#undef _round_c1
#undef _round_c2
		// deal m
#define _round_c1 C1
#define _round_c2 C2
		for (i = 0; (j = i + 2) <= mlen; i = j){
			m0 = m[i];
			m1 = m[i + 1];
			encrypt_authenticate_message();
			c[i] = c0;
			c[i + 1] = c1;
		}
		if (mlen & 1){
			m0 = m[i];
			m1 = 0x81;
			encrypt_authenticate_message_and_constant();
			c[i++] = c0;
		}
		else{
			m0 = 0x01;
			m1 = 0x80;
			encrypt_authenticate_constant();
		}
		if (encrypt_or_decrypt){
			c[i++] = tag(0);
			c[i++] = tag(1);
			c[i++] = tag(2);
			c[i++] = tag(3);
		}
		else if (m[i + 0] != tag(0) ||
			m[i + 1] != tag(1) ||
			m[i + 2] != tag(2) ||
			m[i + 3] != tag(3)){
			memset(c, 0, mlen);

			return -1;
		}
#undef _round_c1
#undef _round_c2
	}
	else{
		// deal m
#define _round_c1 C1
#define _round_c2 C2
		for (i = 0; (j = i + 2) <= mlen; i = j){
			m0 = m[i];
			m1 = m[i + 1];
			encrypt_only();
			c[i] = c0;
			c[i + 1] = c1;
		}
		if (mlen & 1){
			m0 = m[i];
			encrypt_only();
			c[i++] = c0;
		}
#undef _round_c1
#undef _round_c2
	}
#undef _leakage

	return 0;
}

int crypto_aead_encrypt(
	unsigned char *c,unsigned long long *clen,
	const unsigned char *m,unsigned long long mlen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
){
	if (load(k, npub)){
		*clen = mlen + CRYPTO_ABYTES;
		return do_crypto_aead(c, m, mlen, ad, adlen, npub, true, true);
	}
	*clen = mlen;
	return do_crypto_aead(c, m, mlen, ad, adlen, npub, true, false);
}

int crypto_aead_decrypt(
	unsigned char *m,unsigned long long *mlen,
	unsigned char *nsec,
	const unsigned char *c,unsigned long long clen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k
){
	if (load(k, npub)){
		*mlen = clen - CRYPTO_ABYTES;
		return do_crypto_aead(m, c, *mlen, ad, adlen, npub, false, true);
	}
	*mlen = clen;
	return do_crypto_aead(m, c, *mlen, ad, adlen, npub, false, false);
}
