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
	Rijndael 256-bit blocks
	ChaCha 512-bit
	Authentication 128
*/
#define RD_WORDS 8
#define RD_BYTES (RD_WORDS*4)
#define RD_ROUNDS 14
#define RD_RKEYS (RD_ROUNDS+1)

#define CC_WORDS 16
#define CC_BYTES (CC_WORDS*4)

# define AUTH_WORDS 4
# define AUTH_BYTES (AUTH_WORDS*4)

/*
 * functions to do various simple things to data chunks
 *
 * conventions are as for memcpy()
 * all take pointers s for source, t for target
 * argument order always s, t
*/

void zero_128( u32 * ) ;
void cpy_128( u32 *, u32 * ) ;
void mov_128( u32 *, u32 * ) ;
void add_128(u32 *s, u32 *t );
void xor_128(u32 *s, u32 *t ) ;

void zero_256( u32 * ) ;
void cpy_256( u32 *, u32 * ) ;
void mov_256( u32 *, u32 * ) ;
void add_256(u32 *s, u32 *t );
void xor_256(u32 *s, u32 *t ) ;

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

/* functions in rijndael.c */

int rijndael_encrypt( const byte *, byte *, const byte * ) ;

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