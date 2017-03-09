#include <stdio.h>
#include "crympix.h"
#include "finite256.h"
#include "ec_fp_256i.h"

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
#endif

#define SECRETKEY_BYTES 32
#define PUBLICKEY_BYTES 96
#define SHAREDSECRET_BYTES 32

#ifdef TEST_BOX
static
#endif
int crypto_dh_keypair(unsigned char* pk, unsigned char *sk)
{
	unsigned char zzn[32];
	EC_FP_SMULBASE_256I_CACHE;
	unsigned int i;

	/*Secret key (To be replaced with a secure pseudorandom number generator).*/
	//srand(925);
	for (i = 0; i < SECRETKEY_BYTES; i++) sk[i] = rand();

#if EC_FP_SMULBASE_SLICE == 0
	ec_fp_smul_256i((uni)pk, (uni)(pk + (PUBLICKEY_BYTES/3)), (uni)(pk + (2*PUBLICKEY_BYTES/3)), (uni)zzn, (uni)sk, (uni)sn0, (uni)cn0, (uni)dn0);
#else
	ec_fp_smulbase_256i((uni)pk, (uni)(pk + (PUBLICKEY_BYTES/3)), (uni)(pk + (2*PUBLICKEY_BYTES/3)), (uni)zzn, (uni)sk, (uni *)sn0, (uni *)cn0, (uni *)dn0);
#endif

	/*Normalization.*/
	fp_inv_256((uni)zzn, (uni)zzn);
	fp_mul_256((uni)pk, (uni)pk, (uni)zzn);
	fp_mul_256((uni)(pk + (PUBLICKEY_BYTES/3)), (uni)(pk + (PUBLICKEY_BYTES/3)), (uni)zzn);
	fp_mul_256((uni)(pk + (2*PUBLICKEY_BYTES/3)), (uni)(pk + (2*PUBLICKEY_BYTES/3)), (uni)zzn);

	return 0;
}

#ifdef TEST_BOX
static
#endif
int crypto_dh(unsigned char *s, const unsigned char* pk, const unsigned char *sk){
	uni_t zzn[FP_LEN], ccn[FP_LEN], ddn[FP_LEN];
	unsigned char result[32];

	/*scalar multiplication*/
	ec_fp_smul_256i((uni)result, ccn, ddn, zzn, (uni)sk, (uni)pk, (uni)(pk + (PUBLICKEY_BYTES/3)), (uni)(pk + (2*PUBLICKEY_BYTES/3)));

	/*normalization*/
	fp_inv_256((uni)zzn, (uni)zzn);
	fp_mul_256((uni)result, (uni)result, (uni)zzn);

	memcpy(s,result,32);

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
	return 100;
}

#ifdef TEST_BOX
static
#endif
int patentclaims(){
	return 0;
}

#ifdef TEST_BOX
void test_try_ec_fp_smulbase_256i()
{
	unsigned char pk1[PUBLICKEY_BYTES], sk1[SECRETKEY_BYTES];
	unsigned char pk2[PUBLICKEY_BYTES], sk2[SECRETKEY_BYTES];
	unsigned char ss1[PUBLICKEY_BYTES], ss2[SECRETKEY_BYTES];
	long count, i;

	printf("\nExtended Jacobi Intersection (b=1) I^{ma} \n");

	for(count = 0; count < 1000000000UL; count++){
		crypto_dh_keypair(pk1, sk1);
		crypto_dh_keypair(pk2, sk2);
		crypto_dh(ss1, pk1, sk2);
		crypto_dh(ss2, pk2, sk1);

		for(i = 0; i < 32; i++){
			if(ss1[i] != ss2[i]){
				printf("Error! Secret does not match. (@ %lu)\n", count);
				exit(1);
			}
		}

		if((count%10000) == 0){
			printf("%lu\n", count);
		}
	}
	copyrightclaims();
	timingattacks();
	patentclaims();
}
#endif

