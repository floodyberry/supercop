/*
 * hector/src/hector_sig.c version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#include <stdio.h>
#include <gmp.h>
#include <cpucycles.h>

#include "randombytes.h"
#include "sizes.h"
#include "config.h"
#include "curve.h"
#include "generator.h"
#include "divclass.h"
#include "conversion.h"
#include "common.h"


void divclass_hash(mpz_t rop, const divclass op)
{
	mpz_t u0;
	mpz_t u1;

	mpz_init(u0);
	mpz_init(u1);

	kelt_to_mpz_t(u0, op->m_U0);	
	kelt_to_mpz_t(u1, op->m_U1);

	/* TODO: Avoid hardcoded 113 here */
	mpz_mul_2exp(rop, u1, 113);
	mpz_add(rop, rop, u0);
	mpz_mod(rop, rop, p);

	mpz_clear(u0);
	mpz_clear(u1);
}


int signedshortmessage(
		unsigned char *sm,
		unsigned long long *smlen,
		const unsigned char *m,
		unsigned long long mlen,
		const unsigned char *sk,
		unsigned long long sklen
		)
{
	init_all();

	/* See Handbook of Elliptic and Hyperelliptic Curve Cryptography, page 570 f */
	mpz_t k_mpz;
	mpz_t sk_mpz;
	mpz_t hm_mpz;
	mpz_t u;
	mpz_t s;

	mpz_init(k_mpz);
	mpz_init(sk_mpz);
	mpz_init(hm_mpz);
	mpz_init(u);
	mpz_init(s);

	bytearray_to_mpz_t(hm_mpz, m, mlen);
	bytearray_to_mpz_t(sk_mpz, sk, sklen);

	divclass E;
	divclass_init(E);
	int i;

	do
	{
		do
		{
			gen_keypair(k_mpz, E);

			divclass_make_affine(E, E);
			divclass_hash(u, E);
		}
		while(mpz_cmp_ui(u, 0) == 0);
		mpz_invert(s, k_mpz, p);

		mpz_mul(sk_mpz, sk_mpz, u);
		mpz_add(hm_mpz, hm_mpz, sk_mpz);
		mpz_mul(s, s, hm_mpz);
		mpz_mod(s, s, p);
	}
	while(mpz_cmp_ui(s, 0) == 0);

	/* Copy message to signed message */
	for(i = 0; i < SHORTMESSAGE_BYTES; i++)
	{
		sm[i] = m[i];
	}

	/* Append signature */
	mpz_t_to_bytearray(sm + SHORTMESSAGE_BYTES, SECRETKEY_BYTES, u);
	mpz_t_to_bytearray(sm + SHORTMESSAGE_BYTES + SECRETKEY_BYTES, SECRETKEY_BYTES, s);

	*smlen = SIGNATURE_BYTES;

	mpz_clear(k_mpz);
	mpz_clear(sk_mpz);
	mpz_clear(hm_mpz);
	mpz_clear(u);
	mpz_clear(s);

	clear_all();
	return 0;
}

int shortmessagesigned(
		unsigned char *m,
		unsigned long long *mlen,
		const unsigned char *sm,
		unsigned long long smlen,
		const unsigned char *pk,
		unsigned long long pklen
		)
{
	/* See Handbook of Elliptic and Hyperelliptic Curve Cryptography, page 571 */

	init_all();

	int i, ret;
	unsigned char b[SECRETKEY_BYTES];

	mpz_t hm;
	mpz_t u;
	mpz_t s;
	mpz_t u1;
	mpz_t u2;
	mpz_t w;
	mpz_t fhash;

	mpz_init(hm);
	mpz_init(u);
	mpz_init(s);
	mpz_init(u1);
	mpz_init(u2);
	mpz_init(w);
	mpz_init(fhash);

	divclass key;
	divclass_init(key);

	bytearray_to_mpz_t(hm, sm, SHORTMESSAGE_BYTES);
	bytearray_to_mpz_t(u, sm + SHORTMESSAGE_BYTES, SECRETKEY_BYTES);
	bytearray_to_mpz_t(s, sm + SHORTMESSAGE_BYTES + SECRETKEY_BYTES, SECRETKEY_BYTES);
	bytearray_to_divclass(key, pk);

	/* TODO: Test whether u,s \in [1,l-1] */
	mpz_invert(w, s, p);

	mpz_mul(u1, hm, w);
	mpz_mod(u1, u1, p);

	mpz_mul(u2, u, w);
	mpz_mod(u2, u2, p);


	divclass fbar;
	divclass dummy;
	divclass_init(fbar);
	divclass_init(dummy);

	mpz_t_to_scrambled_bytearray(b, SECRETKEY_BYTES, u1);
	generator_multiply(fbar, b);
	/* divclass_multiply(fbar, GENERATOR, u1); */

	divclass_multiply(dummy, key, u2);

	divclass_make_affine(dummy, dummy);

	divclass_make_affine(fbar, fbar);

	divclass_mixadd(fbar, fbar, dummy);
	divclass_make_affine(fbar, fbar);

	//DEBUG
	divclass_hash(fhash, fbar);

	if(!mpz_cmp(u, fhash)) 
	{
		for(i = 0; i < SHORTMESSAGE_BYTES; i++)
			m[i] = sm[i];
		*mlen = SHORTMESSAGE_BYTES;
		ret = 0;
	}
	else
	{
		ret = -100;
		/* fprintf(stderr, "Signature forgery or stupid programming error!"); */
	}

	mpz_clear(hm);
	mpz_clear(u);
	mpz_clear(s);
	mpz_clear(u1);
	mpz_clear(u2);
	mpz_clear(w);
	mpz_clear(fhash);

	clear_all();
	return ret ;
}


#ifdef MAIN
int main(int argc, char* arv[])
{
	unsigned long long sklen = SECRETKEY_BYTES;
	unsigned long long pklen = PUBLICKEY_BYTES;
	unsigned long long smlen = SIGNATURE_BYTES;
	unsigned long long mlen = SHORTMESSAGE_BYTES;

	unsigned char sk[sklen];
	unsigned char pk[pklen];
	unsigned char sm[smlen];
	unsigned char m[mlen];

	int i;

	unsigned long long int start, stop;

	init_all();
	clear_all();

	// Initialise message with random bytes:
	randombytes(m,SHORTMESSAGE_BYTES);

	start = cpucycles();
	// Generate first key pair:
	keypair(sk, &sklen, pk, &pklen);
	stop = cpucycles();
	printf("Cycles needed for keypair: %lld\n", stop - start);

	start = cpucycles();
	signedshortmessage(sm, &smlen, m, mlen, sk, sklen);
	stop = cpucycles();
	printf("Cycles needed for signedshortmessage: %lld\n", stop - start);
	
	start = cpucycles();
	shortmessagesigned(m, &mlen, sm, smlen, pk, pklen);	
	stop = cpucycles();
	printf("Cycles needed for shortmessagesigned: %lld\n", stop - start);

	return 0;
}
#endif
