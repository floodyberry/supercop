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
	Not using the test framework's AES implementation
	It does not separate key scheduling & encryption
	  in any obvious way
	I need that since I use ChaCha for the key schedule

	Use Brian Gladman's "low resource" AES code instead
	from http://brgladman.org/oldsite/AES/
	My modified version of that in aes.c

	Use Bernstein's code for ChaCha
	from test framework distribution
	My modified version of that in chacha.c

	In both cases, modifications were mostly removing
	things I did not need in Enchilada.
*/

/*
	Bernstein's authentication code	from AES-GCM example
	is in auth.c

	This is for convenience, call with fixed parameters
*/
static void mix_in( u32 * ) ;

/*
 * functions to do various simple things to data chunks
 * 
 * conventions are as for memcpy()
 * pointers d for destination, s for source
 * argument order always d, s
 *
 * pointer arguments are to u32
*/

static void add_128(u32 *, u32 * ) ;
static void xor_128(u32 *, u32 * ) ;

#define AUTH_BYTES 16

/*
	static variables for various things
	ChaCha context & output
	AES key schedule
*/
static u32 chacha_ctx[CC_WORDS] ;	/* context, state */
static u32 chacha_out[CC_WORDS] ;
static u32 chacha_got ;
static u32 *chacha_next ;

static u32 aes_rk[AES_WORDS*AES_RKEYS] ;

/*
	For authentication
*/
static u32 H[AES_WORDS], I[AES_WORDS], 
	finalblock[AES_WORDS], accum[AES_WORDS] ;

/*
	get 512 bits from ChaCha
*/
static void chacha_round( void )
{
	chacha_keystream_bytes(chacha_ctx, (byte *) chacha_out, CC_BYTES ) ;
	chacha_got = 4 ;
	chacha_next = chacha_out ;
}

/*
	use 128-bit chunks from ChaCha
*/
static void chacha_copy( u32 *dest, u32 blocks )
{
	u32 i ;

	assert( dest != NULL ) ;
	assert( chacha_got <= 4 ) ;

	for( i = blocks ; i > 0 ; i-- )	{
		if( chacha_got == 0 )	{
			chacha_round() ;
		}
		memcpy( dest, chacha_next, AES_BYTES ) ;
		dest += AES_WORDS ;
		chacha_next += AES_WORDS ; 
		chacha_got-- ;
	}
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
static u32 counter[AES_WORDS] ;

static void white_aes( byte *out )
{
	u32 temp[AES_WORDS], white[AES_WORDS] ;
	u32 *p ;
	byte *t, *c ;

	/*
	declared as words so aligned
	& convenient for some things
	but char* aliases also convenient
	*/
	t = (byte *) temp ;
	c = (byte *) counter ;

	chacha_copy( white, 1 ) ;
	memcpy( t, c, AES_BYTES ) ;
	add_128( temp, white ) ;
	/*
	cast to void is ok here, at least for me
	called code always returns 0 anyway
	might be problematic if modified to call other code
	*/
	(void) aes_encrypt( t, t, (byte *) aes_rk ) ;
	add_128( temp, white ) ;
	memcpy( out, t, AES_BYTES ) ;
	/*
	Mix operations so Hamming weight changes
	 more than a simple counter

	128-bit counter is treated as p[4]
	limit to 61 cases; < 64 so should work anywhere
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
	From Bernstein's example aes-gcm code
	cast added to make splint(1) happy
*/

static void store64(byte *x,u64 u)
{
  int i;
  for (i = 7;i >= 0;--i) { x[i] = (byte) u; u >>= 8; }
}

/*
	setup needed for both encrypt & decrypt
*/
static void setup(u64 mlen, u64 adlen, const byte *npub, const byte *k)
{
	assert( k != NULL) ;
	assert( npub != NULL) ;
	
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
	chacha_copy( H, 1 ) ;
	memcpy( I, H, AUTH_BYTES ) ;
	store64((byte *) finalblock,8 * adlen);
	store64(((byte *) finalblock) + 8,8 * mlen);
	/*
	random init for counter
	*/
	chacha_copy( counter, 1 ) ;
	iter_count = 0 ;
	/*
	use ChaCha to generate aes round keys
	*/
	chacha_copy( aes_rk, AES_RKEYS ) ;
#ifdef TESTING
	printf( "setup: called for %lld text and %lld ad\n", mlen, adlen ) ;
	printf( "setup: round keys start with %08x %08x\n", aes_rk[0], aes_rk[1] ) ;
#endif
}

/*
	zero out global state

	does not do function locals

	does not do passed memory areas
	those have plaintext, key, nonce
*/
static void cleanup()
{
#ifdef TESTING
	printf( "cleanup() called\n" ) ;
	fflush(stdout) ;
#endif
	memset( counter, 0, AES_BYTES ) ;
	memset( H, 0, AES_BYTES ) ;
	memset( I, 0, AES_BYTES ) ;
	memset( accum, 0, AES_BYTES ) ;
	memset( (byte *) chacha_ctx, 0, CC_BYTES ) ;
	memset( (byte *) aes_rk, 0, (AES_BYTES*AES_RKEYS) ) ;
	iter_count = 0 ;
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

	memset( accum, 0, AES_BYTES ) ;
	while (adlen > 0) {
		n = (u64) ((adlen >= AES_BYTES)? AES_BYTES : adlen) ;
		addmul((byte *) accum,ad,n,(byte *) H);
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
  const unsigned char *m, unsigned long long mlen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *nsec,
  const unsigned char *npub,
  const unsigned char *k
)
{
	u64 n, start ;
	byte temp[AES_BYTES] ;
	byte *p, *q, *ptr ;
	int i ;
#ifdef TESTING
	byte *origm, *origc ;

	assert( c != NULL ) ;
	/* are framework declarations compatible with mine? */
	assert( sizeof(long long) == sizeof( u64) ) ;

	printf("encrypt: plaintext %llu ad %llu\n", mlen, adlen ) ;
	origm = m ;
	origc = c ;
#endif
	/*
	Bernstein's example aes-gcm code sets *clen
	I copy that, assuming the interface needs it
	*/
	*clen = mlen+AUTH_BYTES ;
	
	/* address for authentication data */
	ptr = c + mlen ;

	/* key schedule */
	setup( mlen, (u64) adlen, npub, k) ;
	/* data authenticated but not encrypted */
	do_additional( ad, (u64) adlen ) ;

	/*
	encryption
	mlen is unsigned so always > = 0
	use start for an error check
	*/
	start = mlen ;
	while( (mlen != 0) && (mlen <= start) ) {
		n = (u64) ((mlen >= AES_BYTES)? AES_BYTES : mlen) ;
		white_aes( temp ) ;
		for( i = 0, p = temp, q = c ; i < n ; i++, q++, m++, p++ )
			*q = *m ^ *p ;
		addmul( (byte *) accum, c, n, (byte *) H) ;
		mlen -= n;
		c += n ;
	}
	if( mlen > start )	{
#ifdef TESTING
		printf("encrypt: mlen out of bounds\n" ) ;
#endif
		return -2 ;
	}
#ifdef TESTING
		printf("encrypt: auth before finalisation %08x %08x\n", accum[0], accum[1] ) ;
#endif
	/*
	finish authentication
	*/
	mix_in(finalblock) ;
	xor_128( accum, I ) ;
	memcpy( ptr, (void *) accum, AES_BYTES ) ;

#ifdef TESTING
	printf("encrypt: reached end, showing first words\n" ) ;
	printf("plaintext %08x ciphertext %08x auth %08x\n", *((u32 *) origm), *((u32 *) origc), accum[0]  ) ;
#endif
	memset( temp,  0, AES_BYTES ) ;
	cleanup() ;
	return 0 ;
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
	u64 mlen, n, origmlen, start ;
	const byte *ptr, *origc;
	byte temp[AES_BYTES], *p ;
	int i ;

	assert( m != NULL ) ;
	assert( outputmlen != NULL ) ;
	assert( c != NULL ) ;
	assert( ad != NULL ) ;
	assert( npub != NULL ) ;
	assert( k != NULL ) ;

	if( clen < AUTH_BYTES)		return -1;

	/* where auth data should be */
	mlen = clen - AUTH_BYTES ;
	ptr = c + mlen ;
	*outputmlen = mlen;

	setup(mlen, adlen, npub, k) ;
	do_additional( ad, adlen ) ;

	origc = c;
	origmlen = mlen;

#ifdef TESTING
	printf("decrypt: total %llu text %llu ad %llu\n", clen, mlen, adlen ) ;
	printf("decrypt: ciphertext starts with %08xu\n", ((u32 *) origc)[0] ) ;
	printf("decrypt: starting authentication check %08x\n", ((u32 *) ptr)[0] ) ;
#endif

	/*
	authenticate
	*/
	start = mlen ;
	while( (mlen > 0) && (mlen <= start) ) {
		n = (u64) ((mlen >= AES_BYTES) ? AES_BYTES : mlen) ;
		addmul( (byte *) accum, c, n, (byte *) H) ;
		c += n;
		mlen -= n;
	}
	if( mlen > start )	{
#ifdef TESTING
		printf("decrypt: mlen out of bounds\n" ) ;
#endif
		return -2 ;
	}
#ifdef TESTING
		printf("decrypt: auth before finalisation %08x %08x\n", accum[0], accum[1] ) ;
#endif
	mix_in(finalblock) ;
	xor_128( accum, I ) ;

	/* see if we have a match */
	if( memcmp((void *) accum, (void *) ptr, AUTH_BYTES) != 0)	{
#ifdef TESTING
		printf("decrypt: auth failed, result here %08x\n", accum[0] ) ;
#endif
		return -3;
	}

#ifdef TESTING
	printf("decrypt: auth matched, going to decrypt\n" ) ;
	printf("decrypt: 1st ciphertext word %08x\n", *((u32 *) c)  ) ;
#endif

	/*
	reset things
	start encryption with correct ChaCha state
	*/
	c = origc;
	mlen = origmlen;
	setup(mlen, adlen, npub, k) ;

	/*
	decrypt, simpler than encryption
	no authentication to do
	*/
	start = mlen ;
	while( (mlen > 0) && (mlen <= start) ) {
		n = (u64) ((mlen >= AES_BYTES)? AES_BYTES : mlen) ;
		white_aes( temp ) ;
		for( i = 0, p = temp ; i < n ; i++, c++, m++, p++ )
			*m = *c ^ *p ;
		mlen -= n;
	}
	if( mlen > start )	{
#ifdef TESTING
		printf("decrypt: mlen out of bounds\n" ) ;
#endif
		return -2 ;
	}
#ifdef TESTING
	printf("decrypt: reached end, showing first words\n" ) ;
	printf("plaintext %08x ciphertext %08x auth %08x\n",*((u32 *) m), *((u32 *) c), accum[0]  ) ;
#endif
	memset( temp, 0, AES_BYTES ) ;
	cleanup() ;
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
 * 32-bit additions, with no carry
*/
static inline void add_128( u32 *d, u32 *s )
{
	int i ;
	assert( d != NULL ) ;
	assert( s != NULL ) ;
	for( i = 0 ; i < AES_WORDS ; i++, d++, s++ )
		*d += *s ;
}

/*
 * XOR
 * uses 32-bit arithmetic in my code
 * could be done with 64 instead
*/ 
static inline void xor_128( u32 *d, u32 *s )
{
	int i ;
	assert( d != NULL ) ;
	assert( s != NULL ) ;
	for( i = 0 ; i < AES_WORDS ; i++, d++, s++ )
		*d ^= *s ;
}

/*
	simple interface to auth.c
	call addmul() with full block of data
	operate on global accum[]
*/
static void mix_in( u32 *data )
{
	addmul( (byte *) accum, (byte *) data,
		 AES_BYTES, (byte *) H ) ;
}