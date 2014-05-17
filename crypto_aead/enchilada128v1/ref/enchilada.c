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
		cpy_128( dest, chacha_next ) ;
		dest += AES_WORDS ;
		chacha_next += AES_WORDS ; 
		chacha_got-- ;
	}
}

/*
	From Bernstein's example code
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
void setup(u64 mlen, u64 adlen, const byte *npub, const byte *k)
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
	cpy_128( I, H ) ;

	/* from Bernstein's aes-gcm code */
	store64((byte *) finalblock,8 * adlen);
	store64(((byte *) finalblock) + 8,8 * mlen);

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
	Handle additional data, same for en/de crypt

	This does not use ChaCha data so need not be rerun
	 when you have done auth & want to reset ChaCha
	 for the decryption
*/
void do_additional( const byte *ad, u64 adlen )
{
	u64 n ;

	assert( ad != NULL ) ;

	zero_128( accum ) ;
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
  const unsigned char *m,unsigned long long mlen,
  const unsigned char *ad,unsigned long long adlen,
  const unsigned char *nsec,
  const unsigned char *npub,
  const unsigned char *k
)
{
	u32 white[AES_WORDS], *p, *q ;
	u64 n, start ;
	byte *ptr, t_in[AES_BYTES], t_out[AES_BYTES] ;
	int i ;

	assert( c != NULL ) ;
	/* are framework declarations compatible with mine? */
	assert( sizeof(long long) == sizeof( u64) ) ;

#ifdef TESTING
	printf("encrypt: plaintext %llu ad %llu\n", mlen, adlen ) ;
#endif
	/*
	This seems like strange code to me
	store a result via a non-obvious side effect?
	But Bernstein's example code does it, so I will too
	I assume the interface needs it
	*/
	*clen = mlen+AUTH_BYTES ;
	/*
	I add some extra to allow for padding
	I'm using AES in block mode, not CTR
	so need to end on a block boundary
	*/
	n = mlen % AES_BYTES ;
	if( n > 0 )	{
		*clen += (AES_BYTES - n ) ;
	}

	/* where authentication data will be put */
	ptr = c + mlen ;

	/* key schedule */
	setup(mlen, (u64) adlen, npub, k) ;
	/* data authenticated but not encrypted */
	do_additional( ad, (u64) adlen ) ;

#ifdef NO_ENCRYPT
	/*
	for testing
	just copy plaintext to ciphertext

	apply sensationally stupid "encryption"
	 just so they are not identical
	*/
	memcpy(c, m, (size_t) mlen) ;
	for( i = 0 ; i < (size_t) mlen ; i++ )
		c[i] ^= 0x55 ;

#else
	/*
	encryption
	mlen is unsigned so always > = 0
	use start for an error check
	*/
	start = mlen ;
	while( (mlen != 0) && (mlen <= start) ) {
		n = (u64) ((mlen >= AES_BYTES)? AES_BYTES : mlen) ;
		/*
		different if we lack a full block
		*/
		if( n == AES_BYTES )
			memcpy( t_in, m, AES_BYTES) ;
		else	{
			/*
			zero padding
			Might be faster to do arihmetic
			 & only zero part of it
			This is easier & less error-prone
			*/
			memset( t_in, 0, AES_BYTES ) ;
			memcpy( t_in, m, n) ;
		}
/*
#ifdef TESTING
	printf("%d ", ++i ) ;
#endif
*/
		chacha_copy( white, 1 ) ;
		add_128( (u32 *) t_in, white ) ;
		/* cast to void is OK
		   called code always returns 0 anyway
		*/
		(void) aes_encrypt( t_in, t_out, (byte *) aes_rk ) ;
		add_128( (u32 *) t_out, white ) ;
		memcpy( c, t_out, AES_BYTES ) ;
		mix_in( (u32 *) c ) ;
		c += AES_BYTES;
		m += AES_BYTES;
		mlen -= n ;
	}

#endif

#ifdef TESTING
	printf("encrypt: last white is %08x %08x %08x %08x\n",
          white[0], white[1], white[2], white[3] ) ;
#endif
	/*
	finish authentication
	*/
	mix_in(finalblock) ;
	xor_128( accum, I ) ;
	memcpy( ptr, (void *) accum, AES_BYTES ) ;
	/*
	cleanup
	*/
	memset( t_in,  0, AES_BYTES ) ;
	memset( t_out, 0, AES_BYTES ) ;
	zero_128( white ) ;
	zero_128( H ) ;
	zero_128( I ) ;
	zero_128( accum ) ;
	memset( (byte *) chacha_ctx, 0, CC_BYTES ) ;
#ifdef TESTING
	p = (u32 *) m ;
	q = (u32 *) c ;
	printf("encrypt: reached end, showing first words\n" ) ;
	printf("plaintext %08x ciphertext %08x\n", *p, *q  ) ;
#endif
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
	const byte *origc;
	byte *ptr, *t_in[AES_BYTES], t_out[AES_BYTES] ;
	u32 white[AES_WORDS] ;
	int i ;
	u32 *p, *q ;

	assert( m != NULL ) ;
	assert( outputmlen != NULL ) ;
	assert( c != NULL ) ;
	assert( ad != NULL ) ;
	assert( npub != NULL ) ;
	assert( k != NULL ) ;

	/*
	These cannot happen with a properly encrypted file
	*/
	if( clen < AUTH_BYTES)		return -1;
	if( (clen % AES_BYTES) != 0 )	return -1;

	mlen = clen - AUTH_BYTES ;
	setup(mlen, adlen, npub, k) ;
	do_additional( ad, adlen ) ;

	origc = c;
	origmlen = mlen;
	*outputmlen = mlen;

#ifdef TESTING
	printf("decrypt: total %llu text %llu ad %llu\n", clen, mlen, adlen ) ;
	printf("decrypt: starting authentication check\n" ) ;
#endif

#ifdef NO_ENCRYPT
	/*
	for testing	
	copy ciphertext to plaintext

	apply sensationally stupid "encryption"
	 just so they are not identical
	*/
	memcpy(m, c, (size_t) mlen) ;
	for( i = 0 ; i < (size_t) mlen ; i++ )
		m[i] ^= (byte) 0x55 ;

#else
	/*
	authenticate
	*/
	ptr = c + mlen ;
	while (mlen > 0) {
		mix_in( (u32 *) c ) ;
		c += AES_BYTES;
		mlen -= AES_BYTES;
	}
	mix_in(finalblock) ;
	xor_128( accum, I ) ;
	/* see if we have a match */
	if( memcmp((void *) accum, (void *) ptr, AUTH_BYTES) != 0)
		return -2;
#ifdef TESTING
	printf("decrypt: auth matched, going to decrypt\n" ) ;
#endif
	c = origc;
	mlen = origmlen;

	/*
	reset things
	start encryption with correct ChaCha state
	*/
	setup(mlen, adlen, npub, k) ;

	/*
	decrypt, simpler than encryption
	always full blocks
	no authentication to do
	
	mlen is unsigned so always > = 0
	use start for an error check
	*/
	start = mlen ;
	while( (mlen > 0) && (mlen <= start) ) {
		n = (u64) ((mlen >= AES_BYTES)? AES_BYTES : mlen) ;
		memcpy( t_in, c, AES_BYTES) ;
		chacha_copy( white, 1 ) ;
		sub_128( (u32 *) t_in, white ) ;
		/* cast to void is OK
		   called code always returns 0 anyway
		*/
		(void) aes_decrypt( t_in, t_out, (byte *) aes_rk ) ;
		sub_128( (u32 *) t_out, white ) ;
		memcpy( m, t_out, AES_BYTES ) ;
		c += AES_BYTES;
		m += AES_BYTES;
		mlen -= n ;
	}

#endif

#ifdef TESTING
	printf("decrypt: last white is %08x %08x %08x %08x\n", white[0], white[1], white[2], white[3] ) ;
#endif
	/*
	cleanup
	*/
	memset( t_in,  0, AES_BYTES ) ;
	memset( t_out, 0, AES_BYTES ) ;
	zero_128( white ) ;
	zero_128( H ) ;
	zero_128( I ) ;
	zero_128( accum ) ;
	memset( (byte *) chacha_ctx, 0, CC_BYTES ) ;
#ifdef TESTING
	p = (u32 *) m ;
	q = (u32 *) c ;
	printf("decrypt: reached end, showing first words\n" ) ;
	printf("plaintext %08x ciphertext %08x\n", *p, *q  ) ;
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
	assert( t != NULL ) ;
	memset( t, 0, AES_BYTES ) ;
}

/*
 * Copy source data to target
*/
inline void cpy_128( u32 *d, u32 *s )
{
	assert( d != NULL ) ;
	assert( s != NULL ) ;
	memcpy( (byte *) d, (byte *) s, AES_BYTES ) ;
}

/*
 * Move source data to target
 * copy it, then zero out source
*/
inline void mov_128( u32 *d, u32 *s )
{
	assert( d != NULL ) ;
	assert( s != NULL ) ;
	memcpy( (byte *) d, (byte *) s, AES_BYTES ) ;
	memset( (byte *) s, 0, AES_BYTES ) ;
}

/*
 * 32-bit additions, with no carry
*/
inline void add_128( u32 *d, u32 *s )
{
	int i ;
	assert( d != NULL ) ;
	assert( s != NULL ) ;
	for( i = 0 ; i < AES_WORDS ; i++, d++, s++ )
		*d += *s ;
}


/*
 * the inverse, subtractions, with no carry
*/
inline void sub_128( u32 *d, u32 *s )
{
	int i ;
	assert( d != NULL ) ;
	assert( s != NULL ) ;
	for( i = 0 ; i < AES_WORDS ; i++, d++, s++ )
		*d -= *s ;
}

/*
 * XOR
 * uses 32-bit arithmetic in my code
 * could be done with 64 instead
*/ 
inline void xor_128( u32 *d, u32 *s )
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
