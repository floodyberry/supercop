#include "enchilada.h"

#ifndef TESTING

/*
	include the required interface files
	CAESAR test framework creates these automatically
	but they do not exist during my tests
*/
#include "crypto_aead.h"
#include "crypto_verify_16.h"

/*
	I have many assert()s for sanity checking
	define this and they all compile to nothing
*/
#define NDEBUG

#endif

#include <assert.h>

/*
	I am not using the test framework's AES implementation
	It does not separate key scheduling & encryption
	  in any obvious way
	I need that since I use ChaCha for the key schedule
	Also, it does not do 256-bit blocks

	Use Brian Gladman's Rijndael code instead
	http://brgladman.org/oldsite/cryptography_technology/rijndael/index.php

	Four of his nine files are used here:
		headers aes.h and aesopt.h, modified for Enchilada
		source aes.c and aestab.c, unchanged
	See those files for the relevant license info.

	Two files here are identical to those with enchilada128
		auth.c		Bernsein's authenticatiion code
		chacha.c	Bernstein's stream cipher

	enchilada.h and test.c are not the same as the e..128 versions
	though both they & this file have things in common with those		
*/

/* copied from Gladmans code, Rijndael/aes.h */

typedef struct                   	/* the AES context for encryption   */
{   u32    k_sch[RD_RKEYS*RD_WORDS];	/* the encryption key schedule      */
    u32    n_rnd;            		/* the number of cipher rounds      */
    u32    n_blk;			/* the number of bytes in the state */
} aes_ctx;

static aes_ctx rd_context ;

extern int aes_enc_blk(const byte *, byte *, const aes_ctx *) ;

/*
	static variables for various things
	ChaCha context & output
	Rijndael round keys
*/
static u32 chacha_ctx[CC_WORDS] ;	/* context, state */
static u32 chacha_out[CC_WORDS] ;
static u32 chacha_got ;
static u32 *chacha_next ;

/*
	for cipher
	declare white as u32 so aligned
	counter is the only 64-bit array in the cipher
	byte pointers to them for some operations	
*/
static u32 white[RD_WORDS] ;
static u64 counter[RD_WORDS/2] ;
static byte *white_p, *counter_p ;
static u32 *aes_rk ;

/* for authentication */
static u32 H[AUTH_WORDS], I[AUTH_WORDS], finalblock[AUTH_WORDS], accum[AUTH_WORDS] ;

/*
	get 512 bits from ChaCha
*/
static void chacha_round()
{
	chacha_keystream_bytes(chacha_ctx, (byte *) chacha_out, CC_BYTES ) ;
	chacha_got = 4 ;
	chacha_next = chacha_out ;
}

/*
	use 128-bit chunks from ChaCha
*/
static void chacha_copy( byte *dest, u32 blocks )
{
	u32 i ;

	assert( dest != NULL ) ;
	assert( chacha_got <= 4 ) ;

	for( i = blocks ; i > 0 ; i-- )	{
		if( chacha_got == 0 )	{
			chacha_round() ;
		}
		memcpy( dest, chacha_next, 16 ) ;
		dest += 16 ;		/* bytes */
		chacha_next += 4 ;	/* words */
		chacha_got-- ;
	}
}

static void chacha_128( byte *dest )
{
	chacha_copy( dest, 1 ) ;
}

static void chacha_256( byte *dest )
{
	chacha_copy( dest, 2 ) ;
}

/*
	Use whitened AES in counter mode

	This is not what I originally specified,
	though I did mention it in the v1 spec
	as a possible tweak. The v1.1 spec has
	been revised to match this code, and has
	a rationale.

	This makes the cipher inverse-free;
	 it does not use decryption.

	Same whitening is used on both sides
*/

static int iter_count ;

static void white_aes( byte *out )
{
	u32 temp[RD_WORDS] ;
	u64 *p ;
	byte *t ;	/* alias for temp */

	t = (byte *) temp ;

	chacha_256( white_p ) ;
	memcpy( temp, counter_p, RD_BYTES ) ;
	add_256( temp, white ) ;
	/*
	cast to void is ok here, at least for me
	called code always returns 0 anyway
	might be problematic if modified to call other code
	*/
	(void) aes_enc_blk( t, t, &rd_context ) ;
	add_256( temp, white ) ;
	memcpy( out, t, RD_BYTES ) ;
	/*
	Mix operations so Hamming weight changes
	 more than a simple counter

	256-bit counter is treated as p[4]
	limit to 61 cases; < 64 so should work anywhere

	code copied from enchilada 128
	but here counter[] and *p are 64-bit
	these are the only 64-bit operations in the cipher
	*/
	p = counter ;
	switch( iter_count )	{
		/*
		mix three array elements

		each element is used
		once on left, once on right

		pattern is circular
		case labels are primes; I like those
		intervals roughly 61/4
		*/
		case 13:
			p[1] += p[2] ;
			break ;
		case 29:
			p[2] += p[3] ;
			break ;
		case 57:
			p[3] += p[1] ;
			break ;
		/* inject p[0] into that loop */
		case 43:
			p[1] += p[0] ;
			break ;
		/* restart loop */
		case 61:
			iter_count = -1 ;
			break ;
		default:
			break ;
	}
	/*
	p[0] is just a counter
	nothing above affects it
	*/ 
	p[0]++ ;
	iter_count++ ;
}

/*
	From Bernstein's example code
	cast added to make splint(1) happy
*/

static void store64(byte *x, u64 u)
{
  int i;
  for (i = 7;i >= 0;--i) { x[i] = (byte) u; u >>= 8; }
}

/*
	setup needed for both encrypt & decrypt
*/
static void setup(u64 mlen, u64 adlen, const byte *npub, const byte *k)
{
	int i ;
	u32 *p ;

	assert( k != NULL) ;
	assert( npub != NULL) ;

	white_p = (byte *) white ;
	counter_p = (byte *) counter ; 
	
/*
	run ChaCha key schedule
	and then ChaCha
*/
	chacha_keysetup(chacha_ctx, (byte *) k, 256, 64) ;
	chacha_ivsetup(chacha_ctx, npub) ;
	chacha_round() ;
/*
	set up H, I & finalblock for authentication
*/
	chacha_128( (byte *) H ) ;
	chacha_128( (byte *) I ) ;

	/* from Bernstein's aes-gcm code */
	store64((byte *) finalblock,8 * adlen);
	store64(((byte *) finalblock) + 8,8 * mlen);
/*
	random init for counter
*/
	iter_count = 0 ;
	chacha_256( counter_p ) ;

/*
	use ChaCha to generate rijndael round keys
*/
	aes_rk = rd_context.k_sch ;
	for( i = 0, p = aes_rk ; i < RD_RKEYS ; i++, p+= RD_WORDS )
		chacha_256( (byte *) p ) ;

	rd_context.n_rnd = RD_ROUNDS ;
	rd_context.n_blk = RD_RKEYS * RD_BYTES ;

#ifdef TESTING
	p = (u32 *) H ;
	printf( "setup: called for %lld text and %lld ad\n", mlen, adlen ) ;
/*
	printf( "H: %08x %08x %08x %08x\n", H[0], H[1], H[2], H[3] ) ;
	printf( "I: %08x %08x %08x %08x\n", I[0], I[1], I[2], I[3] ) ; 
*/
	printf( "setup: round keys start with %08x %08x\n", aes_rk[0], aes_rk[1] ) ;
#endif
}

/*
	Handle additional data, same for en/de crypt

	This does not use ChaCha data so need not be rerun
	 when you have done auth & want to reset ChaCha
	 for the decryption
*/
static void do_additional( const byte *ad, u64 adlen )
{
	u64 n ;

	assert( ad != NULL ) ;

	memset( (byte *) accum, 0, AUTH_BYTES ) ;
	while (adlen > 0) {
		n = (u64) ((adlen >= AUTH_BYTES)? AUTH_BYTES : adlen) ;
		addmul((byte *) accum, ad, n, (byte *) H);
   		ad += n ;
		adlen -= n;
	}
#ifdef TESTING
	printf("accum after ad: %08x %08x %08x %08x\n",
		accum[0], accum[1], accum[2], accum[3] ) ;
#endif
}

/*
	declarations for this and decrypt
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
)
{
	u32 i ;
	u64 n, x, y ;
	byte *p, *q, temp[RD_BYTES] ;
#ifdef TESTING
	u32 *p_txt, *c_txt ;
	u64 count = 0 ;
#endif
	/*
	This seems like strange code to me
	store a result via a non-obvious side effect?
	But Bernstein's example code does it, so I will too
	I assume the interface needs it
	*/
	*clen = mlen+16 ;

	/* key schedule */
	setup(mlen, (u64) adlen, npub, k) ;
	/* data authenticated but not encrypted */
	do_additional( ad, (u64) adlen ) ;
	
	/*
	encryption
	*/
	while (mlen > 0) {
		n = (mlen >= RD_BYTES)? RD_BYTES : mlen ;
		white_aes( temp ) ;
		for( i = 0, p = temp ; i < n ; i++, c++, m++, p++ )
			*c = *m ^ *p ;
		/* authentication uses different block size */
		for( x = n, p = c - n ; x > 0 ; )	{
			y = (x >= AUTH_BYTES) ? AUTH_BYTES : x ;
			addmul( (byte *) accum, p, y, (byte *) H) ;
			x -= y ;
			p += y ;
		}
		mlen -= n;
#ifdef TESTING
		count += n ;
#endif		
	}
#ifdef TESTING
	printf("accum before final, en: %08x %08x %08x %08x\n",
		accum[0], accum[1], accum[2], accum[3] ) ;
	printf( "encrypt: did %lld clen %lld, delta %lld\n", count, *clen ) ;
#endif
	/*
	finish authentication
	*/
	addmul( (byte *) accum, (byte *) finalblock, AUTH_BYTES, (byte *) H) ;
	for( i = 0, p = (byte *) accum, q = (byte *) I; i < AUTH_BYTES ; i++, p++, q++ )
		*p ^= *q ;
	memcpy( c, accum, AUTH_BYTES ) ;
	/*
	code to zero out memory should go here
	*/
#ifdef TESTING
	p_txt = (u32 *) m ;
	c_txt = (u32 *) c ;
	printf("encrypt: reached end, showing first words\n" ) ;
	printf("plaintext %08x ciphertext %08x\n", *p_txt, *c_txt  ) ;
#endif
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
	u64 mlen, origmlen, i ;
	const byte *origc, *ptr ;
	u64 n ;
	byte *p, *q, temp[RD_BYTES] ;
#ifdef TESTING
	u32 *p_txt, *c_txt ;
#endif

	if (clen < AUTH_BYTES)	return -1;

	mlen = clen - AUTH_BYTES ;
	*outputmlen = mlen ;
	/* address for auth data */
	ptr = c + mlen ;

	origc = c;
	origmlen = mlen;
	*outputmlen = mlen ;

	setup(mlen, adlen, npub, k) ;
	do_additional( ad, (u64) adlen ) ;

	/*
	first authenticate
	*/
	while (mlen > 0) {
		n = (mlen >= AUTH_BYTES)? AUTH_BYTES : mlen ;
		addmul( (byte *) accum, c, n, (byte *) H) ;
		mlen -= n;
		c += n ;
	}
#ifdef TESTING
	printf("accum before final, de: %08x %08x %08x %08x\n",
		accum[0], accum[1], accum[2], accum[3] ) ;
#endif
	addmul( (byte *) accum, (byte *) finalblock, AUTH_BYTES, (byte *) H) ;
	for( i = 0, p = (byte* ) accum, q = (byte *) I; i < AUTH_BYTES ; i++, p++, q++ )
		*p ^= *q ;
	/* see if we have a match */
	if( memcmp( accum, ptr, AUTH_BYTES) != 0)
		return -2;

	/*
	reset things so decryption can match encryption
	*/ 
	c = origc;
	mlen = origmlen;
	setup(mlen, adlen, npub, k) ;

	/*
	decrypt, same as encryption
	except no authentication to do
	*/
	while (mlen > 0) {
		n = (mlen >= RD_BYTES)? RD_BYTES : mlen ;
		white_aes( temp ) ;
		for( i = 0, p = temp ; i < n ; i++, c++, m++, p++ )
			*m = *c ^ *p ;
		mlen -= n;
	}
	/*
	code to zero out memory should go here
	*/
#ifdef TESTING
	p_txt = (u32 *) m ;
	c_txt = (u32 *) c ;
	printf("encrypt: reached end, showing first words\n" ) ;
	printf("plaintext %08x ciphertext %08x\n", *p_txt, *c_txt  ) ;
#endif
	return 0;
}

/*
 * functions to do various simple things to data chunks
 *
 * conventions are as for memcpy()
 * all take pointers d for destination, s for source
 * argument order always d, s
*/

/*
 * zero a buffer
*/
inline void zero_128( u32 *t )
{
	memset( t, 0, 16 ) ;
}
inline void zero_256( u32 *t )
{
	memset( t, 0, 32 ) ;
}

/*
 * Copy source data to target
*/
inline void cpy_128( u32 *d, u32 *s )
{
	memcpy( (byte *) d, (byte *) s, 16 ) ;
}
inline void cpy_256( u32 *d, u32 *s )
{
	memcpy( (byte *) d, (byte *) s, 32 ) ;
}

/*
 * Move source data to target
 * copy it, then zero out source
*/
inline void mov_128( u32 *d, u32 *s )
{
	memcpy( (byte *) d, (byte *) s, 16 ) ;
	memset( (byte *) s, 0, 16 ) ;
}
inline void mov_256( u32 *d, u32 *s )
{
	memcpy( (byte *) d, (byte *) s, 32 ) ;
	memset( (byte *) s, 0, 32 ) ;
}

/*
 * 32-bit additions, with no carry
*/
inline void add_128( u32 *d, u32 *s )
{
	int i ;
	for( i = 0 ; i < 4 ; i++, d++, s++ )
		*d += *s ;
}
inline void add_256( u32 *d, u32 *s )
{
	int i ;
	for( i = 0 ; i < 8 ; i++, d++, s++ )
		*d += *s ;
}

/*
 * XOR
 * uses 32-bit arithmetic in my code
 * could be done with 64 instead
*/ 
inline void xor_128( u32 *d, u32 *s )
{
	int i ;
	for( i = 0 ; i < 4 ; i++, d++, s++ )
		*d ^= *s ;
}
inline void xor_256( u32 *d, u32 *s )
{
	int i ;
	for( i = 0 ; i < 8 ; i++, d++, s++ )
		*d ^= *s ;
}

