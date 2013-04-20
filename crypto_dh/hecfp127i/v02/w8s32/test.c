//#define DEBUG_MODE

#ifdef DEBUG_MODE
#include <stdio.h>
#include "kernel.h"
#include "multiprecision.h"
#else
#include "_core.h"
#endif

#include "finite128.h"
#include "constants.h"
#include "base.h"
#include "api.h"

#ifdef TEST_BOX
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>
#include "test.h"
#include "timer.h"
#else
#include <string.h>
#include <stdarg.h>
#include <math.h>
#include "crypto_dh.h"
#include "api.h"
#endif

#if SLICE == 0

#ifdef TEST_BOX
static
#endif
int crypto_dh_keypair(unsigned char* pk, unsigned char *sk)
{
	unsigned int i;
	DIV_hec_fp_2e127m1_t t1, t2;
	DIV_hec_fp_2e127m1 tpk, tbase;
	CONSTANTS;
	GENERATOR;

	tpk = (DIV_hec_fp_2e127m1)pk;
	tbase = (DIV_hec_fp_2e127m1)base;

	/*Generate secret key (this should be replaced with a secure pseudorandom number generator).*/
	for (i = 0; i < SECRETKEY_BYTES; i++) sk[i] = random();

	/*Make the scalar 254 bits.*/
	sk[SECRETKEY_BYTES-1] = (sk[SECRETKEY_BYTES-1] & 0x3F) | 0x20;

	/*Convert to homogeneous projective coordinates representation.*/
	fp_cpy_2e127m1_x8664(t2->P, tbase->P);
	fp_cpy_2e127m1_x8664(t2->R, tbase->R);
	fp_cpy_2e127m1_x8664(t2->S, tbase->S);
	fp_cpy_2e127m1_x8664(t2->T, tbase->T);
	fp_set_1_2e127m1_x8664(t2->Z, 1);

	/*Perform the scalar multiplication.*/
	hec_fp_smul_2e127m1_g2i(t1, (uni)sk, t2, (CNS_hec_fp_2e127m1)cn);

	/*Convert to affine coordinates representation.*/
	fp_inv_2e127m1_x8664(t1->Z, t1->Z);
	fp_mul_2e127m1_x8664(tpk->P, t1->P, NULL, t1->Z);
	fp_mul_2e127m1_x8664(tpk->R, t1->R, NULL, t1->Z);
	fp_mul_2e127m1_x8664(tpk->S, t1->S, NULL, t1->Z);
	fp_mul_2e127m1_x8664(tpk->T, t1->T, NULL, t1->Z);

	/*TODO: Point compression.*/

	return 0;
}

#else

#ifdef TEST_BOX
static
#endif
int crypto_dh_keypair(unsigned char* pk, unsigned char *sk)
{
	unsigned int i;
	DIV_hec_fp_2e127m1_t t1;
	DIV_hec_fp_2e127m1 tpk;
	CONSTANTS;
	CACHE;

	tpk = (DIV_hec_fp_2e127m1)pk;

	/*Generate secret key (this should be replaced with a secure pseudorandom number generator).*/
	for (i = 0; i < SECRETKEY_BYTES; i++) sk[i] = random();

	/*Make the scalar 254 bits.*/
	sk[SECRETKEY_BYTES-1] = (sk[SECRETKEY_BYTES-1] & 0x2F) | 0x20;

	hec_fp_smulcached_2e127m1_g2i(t1, (uni)sk, (unsigned char *)D2, (CNS_hec_fp_2e127m1)cn,
		SLICE, WINDOW, CSIZE
	);

	/*Convert to affine coordinates representation.*/
	fp_inv_2e127m1_x8664(t1->Z, t1->Z);
	fp_mul_2e127m1_x8664(tpk->P, t1->P, NULL, t1->Z);
	fp_mul_2e127m1_x8664(tpk->R, t1->R, NULL, t1->Z);
	fp_mul_2e127m1_x8664(tpk->S, t1->S, NULL, t1->Z);
	fp_mul_2e127m1_x8664(tpk->T, t1->T, NULL, t1->Z);

	/*TODO: Point compression.*/

	return 0;
}

#endif

#ifdef TEST_BOX
static
#endif
int crypto_dh(unsigned char *s, const unsigned char* pk, const unsigned char *sk){
	CONSTANTS;
	DIV_hec_fp_2e127m1_t t1, t2;
	DIV_hec_fp_2e127m1 ts, tpk;

	ts = (DIV_hec_fp_2e127m1)s;
	tpk = (DIV_hec_fp_2e127m1)pk;

	/*TODO: Point decompression.*/

	/*Convert to homogeneous projective coordinates representation.*/
	fp_cpy_2e127m1_x8664(t2->P, tpk->P);
	fp_cpy_2e127m1_x8664(t2->R, tpk->R);
	fp_cpy_2e127m1_x8664(t2->S, tpk->S);
	fp_cpy_2e127m1_x8664(t2->T, tpk->T);
	fp_set_1_2e127m1_x8664(t2->Z, 1);

	/*Perform the scalar multiplication.*/
	hec_fp_smul_2e127m1_g2i(t1, (uni)sk, t2, (CNS_hec_fp_2e127m1)cn);

	/*Convert to affine coordinates representation.*/
	fp_inv_2e127m1_x8664(t1->Z, t1->Z);
	fp_mul_2e127m1_x8664(ts->P, t1->P, NULL, t1->Z);
	fp_mul_2e127m1_x8664(ts->R, t1->R, NULL, t1->Z);
	fp_mul_2e127m1_x8664(ts->S, t1->S, NULL, t1->Z);
	fp_mul_2e127m1_x8664(ts->T, t1->T, NULL, t1->Z);

	return 0;
}

#ifdef TEST_BOX
static
#endif
int copyrightclaims(){
	return 0;
}

#ifdef TEST_BOX
static
#endif
int timingattacks(){
	return 1;
}

#ifdef TEST_BOX
static
#endif
int patentclaims(){
	return 0;
}

#ifdef TEST_BOX
void test_ckdh_hec_fp_2e127m1_g2i(char *s)
{
	unsigned char pk1[PUBLICKEY_BYTES], pk2[PUBLICKEY_BYTES];
	unsigned char sk1[SECRETKEY_BYTES], sk2[SECRETKEY_BYTES];
	unsigned char ss1[SHAREDSECRET_BYTES], ss2[SHAREDSECRET_BYTES];
	long count, i;

	printf("\n//%s\n", s); fflush(stdout);
	for(count = 0; count < 1000000000UL; count++){
		crypto_dh_keypair(pk1, sk1);
		crypto_dh_keypair(pk2, sk2);
		crypto_dh(ss1, pk1, sk2);
		crypto_dh(ss2, pk2, sk1);

		for(i = 0; i < SHAREDSECRET_BYTES; i++){
			if(ss1[i] != ss2[i]){
				printf("Error! Secret does not match. (@ %lu)\n", count);
				exit(1);
			}
		}

		if((count%10000) == 0){
			printf("%lu\n", count); fflush(stdout);
		}
	}
	copyrightclaims();
	timingattacks();
	patentclaims();
}

void test_perf_hec_fp_2e127m1_g2i(char *s)
{
	unsigned char pk[PUBLICKEY_BYTES], sk[SECRETKEY_BYTES], ss[SHAREDSECRET_BYTES];
	struct timeval t_start, t_end, t_diff;
	long long st, fn, count;

	printf("\n//%s\n", s); fflush(stdout);
	gettimeofday(&t_start, NULL);
	st = cpucycles();
	for(count = 0; count < TRIAL; count++){
		crypto_dh_keypair(pk, sk);
	}
	fn = cpucycles();
	gettimeofday(&t_end, NULL);
	timersub(&t_end, &t_start, &t_diff);
	printf("Key pair generation cycles: %lld\n", (fn - st)/TRIAL);
	printf("Key pair generation time: %.3f msec\n", get_msec(t_diff, TRIAL, 1)); fflush(stdout);
	gettimeofday(&t_start, NULL);
	st = cpucycles();
	for(count = 0; count < TRIAL; count++){
		crypto_dh(ss, pk, sk);
	}
	fn = cpucycles();
	gettimeofday(&t_end, NULL);
	timersub(&t_end, &t_start, &t_diff);
	printf("Secret sharing cycles: %lld\n", (fn - st)/TRIAL);
	printf("Secret sharing time: %.3f msec\n", get_msec(t_diff, TRIAL, 1)); fflush(stdout);
}
#endif

