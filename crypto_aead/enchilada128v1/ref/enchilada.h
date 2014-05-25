#include <string.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

/*
	Some convenient types
	I use these throughout
	including replacing Gladman's uint_32t etc. in aes.c
*/
typedef uint64_t u64 ;
typedef uint32_t u32 ;
typedef unsigned char byte ;

/*
	AES 128-bit blocks & ChaCha 512-bit
*/
#define AES_WORDS 4
#define AES_BYTES (AES_WORDS*4)
#define AES_ROUNDS 10
#define AES_RKEYS (AES_ROUNDS+1)

#define CC_WORDS 16
#define CC_BYTES (CC_WORDS*4)

/*
	declarations for main functions in enchilada.c
	copied from Bernstein's example AES-GCM code
	to be sure they match test framework
*/
int crypto_aead_encrypt(
  unsigned char *c,unsigned long long *clen,
  const unsigned char *m,unsigned long long mlen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *nsec,
  const unsigned char *npub,
  const unsigned char *k
) ;

int crypto_aead_decrypt(
  unsigned char *m,unsigned long long *outputmlen,
  unsigned char *nsec,
  const unsigned char *c,unsigned long long clen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *npub,
  const unsigned char *k
) ;

/* functions in aes.c */

int aes_encrypt( const byte *, byte *, const byte * ) ;
int aes_decrypt( const byte *, byte *, const byte * ) ;

/*
	one public function in auth.c
	authentication from Bernstein's aes-gcm example code
*/
void addmul(byte *, const byte *, u64, const byte *) ;

/*
	Prototypes from ecrypt-sync.h
	originally part of the ecrypt competition framework
	included with the chacha code
	not all used in enchilada

	ECRYPT changed to chacha

	corresponding code is in my version of chacha.c
*/

/*
 * Key setup. It is the user's responsibility to select the values of
 * keysize and ivsize from the set of supported values specified
 * above.
 */
void chacha_keysetup(
  u32 *ctx, const byte *key, 
  u32 keysize,                /* Key size in bits. */ 
  u32 ivsize);                /* IV size in bits. */

/*
 * IV setup. After having called ECRYPT_keysetup(), the user is
 * allowed to call ECRYPT_ivsetup() different times in order to
 * encrypt/decrypt different messages with the same key but different
 * IV's.
 */
void chacha_ivsetup( u32 *, const byte *);

void chacha_encrypt_bytes( u32 *ctx, const byte *plaintext, 
  byte *ciphertext, 
  u32 msglen);                /* Message length in bytes. */ 

void chacha_keystream_bytes(u32 *ctx, byte *dest, u32 nbytes) ;
