//#define DEBUG_MODE

#ifdef DEBUG_MODE
#include <stdio.h>
#include "kernel.h"
#include "multiprecision.h"
#else
#include "_core.h"
#endif

#include "finite128.h"
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

#ifdef TEST_BOX
static
#endif
int crypto_dh_keypair(unsigned char* pk, unsigned char *sk)
{
	unsigned int i;
	KUM_FP_2e127m1_G_CNS;
	KUM_FP_2e127m1_G_BASE;
	DIV_kum_fp_2e127m1_g_t t1, t2;
	DIV_kum_fp_2e127m1_g tpk, tbase;

	tpk = (DIV_kum_fp_2e127m1_g)pk;
	tbase = (DIV_kum_fp_2e127m1_g)base;

	/*Generate secret key (this should be replaced with a secure pseudorandom number generator).*/
	for (i = 0; i < SECRETKEY_BYTES; i++) sk[i] = random();

	/*Make the scalar 251 bits.*/
	sk[32-1] = (sk[32-1] & 0x07) | 0x04;

	/*Convert to homogeneous projective coordinates representation.*/
	fp_cpy_2e127m1_x8664(t2->X, tbase->X);
	fp_cpy_2e127m1_x8664(t2->Y, tbase->Y);
	fp_cpy_2e127m1_x8664(t2->Z, tbase->Z);
	fp_set_1_2e127m1_x8664(t2->T, 1);

	/*Perform the scalar multiplication.*/
	//kum_fp_smul_2e127m1_g(t1, (uni)sk, t2, (CNS_kum_fp_2e127m1_g)cn);
	kum_fp_smul_ym_2e127m1_g(t1, (uni)sk, t2, (CNS_kum_fp_2e127m1_g)cn); /*special code*/

	/*Convert to affine coordinates representation.*/
	fp_inv_2e127m1_x8664(t1->T, t1->T);
	fp_mul_2e127m1_x8664(tpk->X, t1->X, NULL, t1->T);
	fp_mul_2e127m1_x8664(tpk->Y, t1->Y, NULL, t1->T);
	fp_mul_2e127m1_x8664(tpk->Z, t1->Z, NULL, t1->T);

	/*TODO: Point compression.*/

	return 0;
}

#ifdef TEST_BOX
static
#endif
int crypto_dh(unsigned char *s, const unsigned char* pk, const unsigned char *sk){
	uni_t n01[FP_LEN], n02[FP_LEN];
	KUM_FP_2e127m1_G_CNS;
	DIV_kum_fp_2e127m1_g_t t1, t2;
	DIV_kum_fp_2e127m1_g ts, tpk;
	CNS_kum_fp_2e127m1_g tcn;

	tcn = (CNS_kum_fp_2e127m1_g)cn;
	tpk = (DIV_kum_fp_2e127m1_g)pk;
	ts = (DIV_kum_fp_2e127m1_g)s;

	/*TODO: Point decompression.*/

	/*Convert to homogeneous projective coordinates representation.*/
	fp_cpy_2e127m1_x8664(t2->X, tpk->X);
	fp_cpy_2e127m1_x8664(t2->Y, tpk->Y);
	fp_cpy_2e127m1_x8664(t2->Z, tpk->Z);
	fp_set_1_2e127m1_x8664(t2->T, 1);

	/*Naive approach to calculate yb, zb, tb.*/
	/*
	fp_inv_2e127m1_x8664(n01, t2->Y);
	fp_inv_2e127m1_x8664(n02, t2->Z);
	fp_inv_2e127m1_x8664(n03, t2->T);
	fp_mul_2e127m1_x8664(tcn->yb, t2->X, n01);
	fp_mul_2e127m1_x8664(tcn->zb, t2->X, n02);
	fp_mul_2e127m1_x8664(tcn->tb, t2->X, n03);
	*/

	/*Montgomery's simultaneous inversion algorithm to calculate yb, zb, tb.*/
	fp_mul_2e127m1_x8664(n01, t2->Y, NULL, t2->Z);
	fp_mul_2e127m1_x8664(n02, n01, NULL, t2->T);
	fp_inv_2e127m1_x8664(n02, n02);
	fp_mul_2e127m1_x8664(tcn->tb, n02, NULL, n01);
	fp_mul_2e127m1_x8664(n02, n02, NULL, t2->T);
	fp_mul_2e127m1_x8664(tcn->zb, n02, NULL, t2->Y);
	fp_mul_2e127m1_x8664(tcn->yb, n02, NULL, t2->Z);
	fp_mul_2e127m1_x8664(tcn->yb, tcn->yb, NULL, t2->X);
	fp_mul_2e127m1_x8664(tcn->zb, tcn->zb, NULL, t2->X);
	fp_mul_2e127m1_x8664(tcn->tb, tcn->tb, NULL, t2->X);

	/*Perform the scalar multiplication.*/
	//kum_fp_smul_2e127m1_g(t1, (uni)sk, t2, tcn);
	kum_fp_smul_ym_2e127m1_g(t1, (uni)sk, t2, tcn); /*Special code.*/

	/*Convert to affine coordinates representation.*/
	fp_inv_2e127m1_x8664(t1->T, t1->T);
	fp_mul_2e127m1_x8664(ts->X, t1->X, NULL, t1->T);
	fp_mul_2e127m1_x8664(ts->Y, t1->Y, NULL, t1->T);
	fp_mul_2e127m1_x8664(ts->Z, t1->Z, NULL, t1->T);

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
	return 0;
}

#ifdef TEST_BOX
static
#endif
int patentclaims(){
	return 0;
}

#ifdef TEST_BOX
void test_ckdh_kum_fp_2e127m1(char *s)
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

void test_perf_kum_fp_2e127m1(char *s)
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

