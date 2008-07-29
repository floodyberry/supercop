/*
 * hector/src/common.c version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#include "common.h"
#include "config.h"
#include "sizes.h"
#include "conversion.h"
#include "generator.h"
#include "divclass.h"
#include "cpucycles.h"
#include "randombytes.h"
#include "crypto_sign.h"

void gen_keypair(mpz_t sk, divclass pk){

	unsigned char skbytes[SECRETKEY_BYTES];
	int i;
	// Get secret bits using randombytes() (SUPERCOP API), key must be smaller than p:
	do{
		randombytes(skbytes,SECRETKEY_BYTES);

		int leading_zeros = 8 * SECRETKEY_BYTES - size_of_p;

		assert(leading_zeros < 8);

		// Eliminate leading zeros in sk:
		for(i = 1; i <= leading_zeros; i++)
		{
			skbytes[SECRETKEY_BYTES - i] &= 0x7f;
		}

		// Write key to the mpz_t:
		scrambled_bytearray_to_mpz_t(sk, skbytes, SECRETKEY_BYTES);
	}
	while(mpz_cmp(sk, p) >= 0 || mpz_cmp_ui(sk, 0) == 0);
	generator_multiply(pk, skbytes);
}

int crypto_sign_keypair(
		unsigned char *pk,
		unsigned char *sk
	   )
{
	long long int start, stop;
	// Initialize Curve parameters:
	init_all();

	//start = cpucycles();
	mpz_t key;
	mpz_init(key);

	divclass Q;
	divclass_init(Q);
	//stop = cpucycles();
	//printf("Cycles consumed before gen_keypair: %lld\n", stop - start);

	//start = cpucycles();
	gen_keypair(key, Q);
	//stop = cpucycles();
	//printf("Cycles consumed in gen_keypair: %lld\n", stop - start);

	// Convert public key Q to byte array:
	divclass_to_bytearray(pk, Q);

	mpz_t_to_bytearray(sk, SECRETKEY_BYTES, key);

	mpz_clear(key);
	// Clear memory used by global parameters

	clear_all();
	return 0;
}


