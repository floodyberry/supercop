/* aes.h 
 * Jason E. Holt
 * released into the public domain
 */

#ifndef AES_H
#define AES_H

//extern unsigned long aes_nonce[2];

struct aes_key_struct {
	unsigned int rd_key[60];
	int rounds;
};

typedef struct aes_key_struct AES_KEY;

int AES_set_encrypt_key(const unsigned char *userKey, const int bits,
				            AES_KEY *key);

int AES_set_decrypt_key(const unsigned char *userKey, const int bits,
				             AES_KEY *key);

void AES_decrypt(const unsigned char *in, unsigned char *out,
				         const AES_KEY *key);

void AES_encrypt(const unsigned char *in, unsigned char *out,
				         const AES_KEY *key);



#endif
