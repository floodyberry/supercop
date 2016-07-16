#include "crypto_uint16.h"
#include "crypto_uint8.h"
#include <string.h>
#include <assert.h>

#include "api.h"
#include "crypto_aead.h"

#define blocklen 16
void LS_encrypt(const crypto_uint8 input[blocklen],
		const crypto_uint8 key[blocklen],
		const crypto_uint8 tweak[blocklen],
		crypto_uint8 output[blocklen]);
void LS_decrypt(const crypto_uint8 input[blocklen],
		const crypto_uint8 key[blocklen],
		const crypto_uint8 tweak[blocklen],
		crypto_uint8 output[blocklen]);

static void increment(crypto_uint8 T[blocklen]) {
  int i = 14;
  while (++T[i] == 0)
    i--;
}

int crypto_aead_encrypt(
                        unsigned char *c,unsigned long long *clen,
                        const unsigned char *m, unsigned long long mlen,
                        const unsigned char *ad, unsigned long long adlen,
                        const unsigned char *nsec,
                        const unsigned char *npub,
                        const unsigned char *k
                        )
{
    unsigned char K[blocklen];
    unsigned char T[blocklen] = {0};
    unsigned char auth[blocklen] = {0};
    unsigned char sum[blocklen] = {0};
    unsigned long long i;
    unsigned j;
    memcpy(K, k, blocklen);
    memcpy(T, npub, CRYPTO_NPUBBYTES);
    T[15]  = 0x02;           /* control byte for a.d. */

    /* Process Associated Data */
    for (i=0; i<adlen; i+=blocklen) {

      unsigned char block[blocklen] = {0};

      if (i+blocklen < adlen) {
	/* Normal block */
	memcpy(block, ad+i, blocklen);
      } else if (i+blocklen == adlen) {
	/* Final block: full */
	memcpy(block, ad+i, blocklen);
	T[15] = 0x04;	
      } else {
	/* Final block: partial with padding */
	memcpy(block, ad+i, adlen % blocklen);
	block[adlen % blocklen] = 0x80;
	T[15] = 0x06;
      }

      LS_encrypt(block, K, T, block);
      for (j = 0; j < blocklen; j++)
	auth[j] ^= block[j];
      increment(T);
    }

    
    /* Process Message */
    memset(T, 0, blocklen);
    memcpy(T, npub, CRYPTO_NPUBBYTES);

    for (i=0; i < mlen; i+=blocklen) {
      if (i+blocklen <= mlen) {
	/* Full block (can be last block) */
	for (j=0; j < blocklen; j++)
	  sum[j] ^= m[i+j];
	LS_encrypt(m+i, K, T, c+i);

	increment(T);
      } else {
	/* Partial block (final) */
	unsigned char block[blocklen] = {0};
	block[15] = 8*(mlen % blocklen);
	LS_encrypt(block, K, T, block);

	for (j=0; j < mlen%blocklen; j++) {
	  sum[j] ^= m[i+j];
	  c[i+j] = block[j] ^ m[i+j];
	}
      }
    }

    /* Generate Tag */
    T[15] = ((8*(mlen % blocklen)) << 1) | 1;

    LS_encrypt(sum, K, T, sum);
    for (i = 0; i < CRYPTO_ABYTES; i++)
      c[mlen+i] = auth[i] ^ sum[i];

    *clen = mlen + CRYPTO_ABYTES;
    return 0;
}

int crypto_aead_decrypt(
                        unsigned char *m,unsigned long long *outputmlen,
                        unsigned char *nsec,
                        const unsigned char *c,unsigned long long clen,
                        const unsigned char *ad,unsigned long long adlen,
                        const unsigned char *npub,
                        const unsigned char *k
                        )
{
    unsigned char K[blocklen];
    unsigned char T[blocklen] = {0};
    unsigned char auth[blocklen] = {0};
    unsigned char sum[blocklen] = {0};
    unsigned long long i;
    unsigned j;
    memcpy(K, k, blocklen);

    if (clen < CRYPTO_ABYTES) return -1;
    *outputmlen = clen - CRYPTO_ABYTES;

    /* Process Associated Data */
    memcpy(T, npub, CRYPTO_NPUBBYTES);
    T[15]  = 0x02;           /* control byte for a.d. */
    
    for (i=0; i<adlen; i+=blocklen) {

      unsigned char block[blocklen] = {0};

      if (i+blocklen < adlen) {
	/* Normal block */
	memcpy(block, ad+i, blocklen);
      } else if (i+blocklen == adlen) {
	/* Final block: full */
	memcpy(block, ad+i, blocklen);
	T[15] = 0x04;	
      } else {
	/* Final block: partial with padding */
	memcpy(block, ad+i, adlen % blocklen);
	block[adlen % blocklen] = 0x80;
	T[15] = 0x06;
      }

      LS_encrypt(block, K, T, block);
      for (j = 0; j < blocklen; j++)
	auth[j] ^= block[j];
      increment(T);
    }

    
    /* Process Message */
    memset(T, 0, blocklen);
    memcpy(T, npub, CRYPTO_NPUBBYTES);

    for (i=0; i < *outputmlen; i+=blocklen) {
      if (i+blocklen <= *outputmlen) {
	/* Full block (can be last block) */
	LS_decrypt(c+i, K, T, m+i);
	for (j=0; j < blocklen; j++)
	  sum[j] ^= m[i+j];

	increment(T);
      } else {
	/* Partial block (final) */
	unsigned char block[blocklen] = {0};
	block[15] = 8*(*outputmlen % blocklen);
	LS_encrypt(block, K, T, block);

	for (j=0; j < *outputmlen%blocklen; j++) {
	  m[i+j] = block[j] ^ c[i+j];
	  sum[j] ^= m[i+j];
	}
      }
    }

    /* Generate Tag */
    T[15] = ((8*(*outputmlen % blocklen)) << 1) | 1;

    LS_encrypt(sum, K, T, sum);
    for (i = 0; i < CRYPTO_ABYTES; i++)
      if (c[*outputmlen+i] != (auth[i] ^ sum[i])) {
	memset(m, 0, *outputmlen);
	return -1;
      }
    
    return 0;
}
 


