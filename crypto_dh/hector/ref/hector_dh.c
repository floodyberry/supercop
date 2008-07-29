/*
 * hector/src/hector_dh.c version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#include <stdio.h>
#include <gmp.h>
#include <cpucycles.h>

#include "sizes.h"
#include "config.h"
#include "curve.h"
#include "generator.h"
#include "divclass.h"
#include "conversion.h"
#include "common.h"
#include "crypto_dh.h"


int crypto_dh(
		unsigned char *s,
		const unsigned char *pk,
		const unsigned char *sk
		)
{
	init_all();

	divclass Q;
	divclass R;
	divclass_init(Q);
	divclass_init(R);

	// Write sk to mpz_t:
	mpz_t skey;
	mpz_init(skey);
	bytearray_to_mpz_t(skey, sk, SECRETKEY_BYTES);

	// Compute shared key:
	bytearray_to_divclass(Q, pk);

	divclass_multiply(R, Q, skey);

	divclass_to_bytearray(s, R);

	mpz_clear(skey);
	clear_all();

	return 0;
}


#ifdef MAIN
int main(int argc, char* arv[])
{
	unsigned long long sklen1 = SECRETKEY_BYTES;
	unsigned long long sklen2 = SECRETKEY_BYTES;
	unsigned long long pklen1 = PUBLICKEY_BYTES;
	unsigned long long pklen2 = PUBLICKEY_BYTES;
	unsigned long long slen1 = SHAREDSECRET_BYTES;
	unsigned long long slen2 = SHAREDSECRET_BYTES;

	unsigned char sk1[sklen1];
	unsigned char pk1[pklen1];
	unsigned char sk2[sklen2];
	unsigned char pk2[pklen2];
	unsigned char s1[slen1];
	unsigned char s2[slen2];


	unsigned long long int start, stop;


	start = cpucycles();

	// Generate first key pair:
	keypair(sk1, &sklen1, pk1, &pklen1);

	// Generate second key pair:
	keypair(sk2, &sklen2, pk2, &pklen2);

	// Compute shared secret:
	sharedsecret(s2, &slen2, sk2, sklen2, pk1, pklen1);

	// Compute shared secret:
	sharedsecret(s1, &slen1, sk1, sklen1, pk2, pklen2);

	stop = cpucycles();

	assert(slen1 == slen2);
	assert(memcmp(s1, s2, slen1) == 0);

	printf("Cycles needed for computation: %lld\n", stop - start);


	return 0;
}
#endif
