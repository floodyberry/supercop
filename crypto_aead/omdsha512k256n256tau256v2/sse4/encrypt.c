/**
 * The implementation of the CAESAR encrypt/decrypt interface
 */
#include "crypto_aead.h"
#include "omd_api.h"
#include "omdsha512.h"
/**
 * The CAESAR encrypt interface
 * @param c A pointer to buffer for CT
 * @param clen Ciphertext length in Bytes
 * @param k The secret key
 * @param m A pointer to the PT
 * @param mlen Plaintext length in Bytes
 * @param ad A pointer to associated data
 * @param adlen Length of associated data in Bytes
 * @param npub A pointer to the nonce
 * @param nsec A pointer to secret message number (ignored)
 */

int crypto_aead_encrypt(
			unsigned char *c,unsigned long long *clen,
			const unsigned char *m,unsigned long long mlen,
			const unsigned char *ad,unsigned long long adlen,
			const unsigned char *nsec,
			const unsigned char *npub,
			const unsigned char *k
			) {
   (void)nsec;

   *clen = mlen + CRYPTO_ABYTES;

   return omdsha512_process(c, k, m, mlen, ad, adlen, npub, OMD_ENCRYPT);
}

/**
 * The CAESAR decrypt interface
 * @param c A pointer to buffer for CT
 * @param clen Ciphertext length in Bytes
 * @param k The secret key
 * @param m A pointer to the PT
 * @param mlen Plaintext length in Bytes
 * @param ad A pointer to associated data
 * @param adlen Length of associated data  in Bytes
 * @param npub A pointer to the nonce
 * @param nsec A pointer to secret message number (ignored)
 */
int crypto_aead_decrypt(
			unsigned char *m,unsigned long long *mlen,
			unsigned char *nsec,
			const unsigned char *c,unsigned long long clen,
			const unsigned char *ad,unsigned long long adlen,
			const unsigned char *npub,
			const unsigned char *k
			) {
   (void)nsec;

   *mlen = clen - CRYPTO_ABYTES;

   return omdsha512_process(m, k, c, clen, ad, adlen, npub, OMD_DECRYPT);
}
