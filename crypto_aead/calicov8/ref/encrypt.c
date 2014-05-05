#ifndef CAT_MSVC_TEST
#include "crypto_aead.h"
#endif

#include "calico.h"

int crypto_aead_encrypt(
	unsigned char *c,unsigned long long *clen,
	const unsigned char *m,unsigned long long mlen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *nsec, /* unused */
	const unsigned char *npub,
	const unsigned char *k)
{
	// Encrypt
	chacha(k, npub, m, mlen, c);

	// Attach tag
	siphash24_mac(c + mlen, k + 32, npub, c, mlen, ad, adlen);

	*clen = mlen + 8;

	return 0;
}

int crypto_aead_decrypt(
	unsigned char *m,unsigned long long *mlen_p,
	unsigned char *nsec, /* unused */
	const unsigned char *c,unsigned long long clen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k)
{
	unsigned char tag[8];
	unsigned long long mlen = clen - 8;
	unsigned char zero = 0;
	int ii;

	// Validate input
	if (clen < 8) {
		return -1;
	}

	// Generate tag
	siphash24_mac(tag, k + 32, npub, c, mlen, ad, adlen);

	// Verify that tag matches message tag
	for (ii = 0; ii < 8; ++ii) {
		zero |= tag[ii] ^ c[mlen + ii];
	}
	if (0 != zero) {
		return -1;
	}

	// Decrypt
	chacha(k, npub, c, mlen, m);

	*mlen_p = mlen;

	return 0;
}
