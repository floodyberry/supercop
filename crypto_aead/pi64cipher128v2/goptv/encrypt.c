/*
 * encrypt.c
 *
 *  Created on: 2015-09-14
 *      Author: bg
 */

#include "crypto_aead.h"
#include "pi-cipher.h"
#include "api.h"
/*
   void PI_ENCRYPT_SIMPLE(
        void *cipher,
        uint16_t *cipher_len_B,
        void *tag,
        uint16_t *tag_length_B,
        const void *msg,
        uint16_t msg_len_B,
        const void *ad,
        uint16_t ad_len_B,
        const void *nonce_secret,
        const void *nonce_public,
        uint16_t nonce_public_len_B,
        const void *key,
        uint16_t key_len_B
        );
 */


int crypto_aead_encrypt(
	unsigned char *c,unsigned long long *clen,
	const unsigned char *m,unsigned long long mlen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *nsec,
	const unsigned char *npub,
	const unsigned char *k
)
{
/*
...
... the code for the cipher implementation goes here,
... generating a ciphertext c[0],c[1],...,c[*clen-1]
... from a plaintext m[0],m[1],...,m[mlen-1]
... and associated data ad[0],ad[1],...,ad[adlen-1]
... and secret message number nsec[0],nsec[1],...
... and public message number npub[0],npub[1],...
... and secret key k[0],k[1],...
...
*/
	size_t x;
	PI_ENCRYPT_SIMPLE(
			c,
			&x,
			m,
			mlen,
			ad,
			adlen,
			nsec,
			npub,
			CRYPTO_NPUBBYTES,
			k,
			CRYPTO_KEYBYTES );
	*clen = x;
	return 0;
}


/*
        int PI_DECRYPT_SIMPLE(
        void *msg,
        size_t *msg_len_B,
        void *nonce_secret,
        const void *cipher,
        size_t cipher_len_B,
        const void *ad,
        size_t ad_len_B,
        const void *nonce_public,
        size_t nonce_public_len_B,
        const void *key,
        size_t key_len_B
        );
 */
int crypto_aead_decrypt(
	unsigned char *m,unsigned long long *mlen,
	unsigned char *nsec,
	const unsigned char *c,unsigned long long clen,
	const unsigned char *ad,unsigned long long adlen,
	const unsigned char *npub,
	const unsigned char *k
)
{
/*
...
... the code for the cipher implementation goes here,
... generating a plaintext m[0],m[1],...,m[*mlen-1]
... and secret message number nsec[0],nsec[1],...
... from a ciphertext c[0],c[1],...,c[clen-1]
... and associated data ad[0],ad[1],...,ad[adlen-1]
... and public message number npub[0],npub[1],...
... and secret key k[0],k[1],...
...
*/
	int r;
	size_t ml;
	r = PI_DECRYPT_SIMPLE(
	        m,
	        &ml,
		nsec,
		c,
	        clen,
	        ad,
	        adlen,
	        npub,
	        CRYPTO_NPUBBYTES,
	        k,
	        CRYPTO_KEYBYTES );
	*mlen = ml;
	return r; 
}


