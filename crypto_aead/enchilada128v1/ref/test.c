#include "enchilada.h"

#include <stdio.h>
#include <assert.h>

/*
	large buffer
	fill with random data
	use pieces of it for plaintext, key, nonce
*/
#define A 1024
#define B 8
#define SIZE (A*B)
byte stuff[SIZE] ;

int fill_stuff()
{
	FILE *fp ;
	int r, got_r ;
	/* get from file if possible */
	if( (fp = fopen("random_data", "r")) == NULL )	{
		got_r = 0 ;
		if( (fp = fopen("/dev/urandom", "r")) == NULL )	{
			fprintf(stderr, "fopen() failed\n") ;
			return -1 ;
		}
	}
	else	got_r = 1 ;
	r = fread( stuff, A, B, fp ) ;
	if( r != B ) 	{
		fprintf(stderr, "fread() failed\n") ;
		return -1 ;
	}
	if( got_r == 0 )	{
		fclose(fp) ;
		if( (fp = fopen("random_data", "w")) != NULL )	{
			r = fwrite( stuff, A, B, fp ) ;
			if( r != B ) 	{
				fprintf(stderr, "fwrite() failed\n") ;
				return -1 ;
	}	}	}
	fclose(fp) ;
	return 0  ;
}

/*
	Data block size for testing
*/
#define T32	256
#define T_BYTES (T32*4)

int main(int argc, char **argv)
{
	int i , r ;
	/* pointers into stuff[] */
	byte *x, *key, *nonce, *ad, *data ;
	/* working space */
	byte t1[AES_BYTES], t2[AES_BYTES] ;
	byte r1[T_BYTES+AES_BYTES], r2[T_BYTES] ;
	/*	encrypt & decrypt get pointers to these
		and store results into them */
	u64 clen, outlen ;

	r = fill_stuff() ;
	if( r != 0 )	{
		fprintf(stderr, "fill_stuff() failed\n") ;
		exit(-1) ;
	}
	x = stuff ;

	printf("test: First AES test, separate buffers\n") ;
	key = x + 1024 ;
	r = aes_encrypt( x, t1, key ) ;
	printf("test: aes_encrypt returns %d\n", r) ;
	r = aes_decrypt( t1, t2, key ) ;
	printf("test: aes_decrypt returns %d\n", r) ;
	r = memcmp( x, t2, AES_BYTES ) ;
	printf("test: results compare %s\n", r ? "unequal" : "equal") ;
	if( r )
		exit(1) ;

	printf("\ntest: 2nd AES test, same buffer in & out\n") ;
	memcpy( t2, t1, AES_BYTES ) ;
	r = aes_encrypt( t1, t1, key ) ;
	printf("test: aes_encrypt returns %d\n", r) ;
	r = aes_decrypt( t1, t1, key ) ;
	printf("test: aes_decrypt returns %d\n", r) ;
	r = memcmp( t1, t2, AES_BYTES ) ;
	printf("test: results compare %s\n", r ? "unequal" : "equal") ;
	if( r )
		exit(1) ;

	printf("\nstarting tests on Enchilada\n") ;
	key = x ;
	nonce = x + 32 ;
	ad = nonce + 16 ;
	data = x + 2048 ;
	printf("test: byte offsets: key %d nonce %d ad %d data %d\n", key-x, nonce-x, ad-x, data-x ) ;

	printf("\ntest: doing encryption\n" ) ;
	r = crypto_aead_encrypt( r1,
		(unsigned long long *) &clen,
		data, (unsigned long long) T_BYTES,
		ad, (unsigned long long) 48,
		NULL, nonce, key) ;
	printf("test: encryption returns %d\n", r ) ;
	printf("test: encrypt() set clen to %llu\n", clen) ;

	printf("\ntest: doing decryption\n" ) ;
	r =  crypto_aead_decrypt( r2,
		(unsigned long long *) &outlen,
		NULL, 
		r1, (unsigned long long) clen,
		ad, (unsigned long long) 48,
		nonce, key) ;
	printf( "test: decrypt() set outlen to %llu\n", outlen ) ;
	switch(r)	{
		case 0 :
			printf("test: decryption returns OK, %d\n", r ) ;
			break ;
		case -1 :
			fprintf(stderr, "decrypt intial conditions not met\n") ;
			exit(1) ;
		case -2 :
			fprintf(stderr, "decrypt/auth failed\n") ;
			exit(1) ;
		default:
			fprintf(stderr, "unexpected error in decrypt\n") ;
			exit(1) ;
	}

	printf("\ntest: checking result\n") ;
	i = memcmp( data, r2, T_BYTES) ;
	if( i == 0 )
		printf("test: success in output comparison\n" ) ;
	else
		printf("test: failed in output comparison\n" ) ;
	exit(i) ;
}