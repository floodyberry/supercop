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

#ifndef SLICE

#ifdef TEST_BOX
static
#endif
int crypto_dh_keypair(unsigned char* pk, unsigned char *sk)
{
	unsigned int i;
	DIV_hec_fp_2e127m1_t t1;
	DIV_hec_fp_2e127m1 tbase;
	DIV_kum_fp_2e127m1_g tpk;
	CONSTANTS;
	GENERATOR;

	tpk = (DIV_kum_fp_2e127m1_g)pk;
	tbase = (DIV_hec_fp_2e127m1)base;

	/*Generate secret key (this should be replaced with a secure pseudorandom number generator).*/
	for (i = 0; i < SECRETKEY_BYTES; i++) sk[i] = random();

	/*Make the scalar 251 bits.*/
	sk[SECRETKEY_BYTES-1] = (sk[SECRETKEY_BYTES-1] & 0x07) | 0x04;

	/*Convert to homogeneous projective coordinates representation.*/
	fp_cpy_2e127m1_x8664_asm(t1->Q, NULL, NULL, tbase->Q);
	fp_cpy_2e127m1_x8664_asm(t1->R, NULL, NULL, tbase->R);
	fp_cpy_2e127m1_x8664_asm(t1->S, NULL, NULL, tbase->S);
	fp_cpy_2e127m1_x8664_asm(t1->T, NULL, NULL, tbase->T);
	fp_st1_2e127m1_x8664_asm(t1->Z, NULL, NULL, 1);
	fp_st1_2e127m1_x8664_asm(t1->W, NULL, NULL, 1);
	fp_st1_2e127m1_x8664_asm(t1->V, NULL, NULL, 1);

	/*Perform the scalar multiplication.*/
	//hec_fp_smul_2e127m1_g2i_jac(t1, (uni)sk, t1, (CNS_hec_fp_2e127m1)cn);
	hec_fp_smul_2e127m1_g2i_jac_a3is1(t1, (uni)sk, t1, (CNS_hec_fp_2e127m1)cn);

	char u[16]   = { 0x2A, 0x86, 0x63, 0xA9, 0xE7, 0xAD, 0x73, 0xF3, 0xDB, 0xE8, 0x5B, 0xA1, 0xD6, 0xD8, 0xF0, 0x0E };
	char c01[16] = { 0x7D, 0x93, 0xAD, 0xAD, 0xEC, 0x52, 0xBC, 0x3E, 0xA2, 0xFF, 0x85, 0x25, 0x98, 0x8D, 0x52, 0x20 };
	char c02[16] = { 0x52, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x15 };
	char c03[16] = { 0x46, 0xA7, 0x19, 0x19, 0xC3, 0x05, 0xA5, 0x05, 0x0E, 0x13, 0x15, 0xB3, 0xFB, 0x34, 0xE3, 0x73 };
	char c04[16] = { 0xF3, 0x21, 0x2D, 0x2D, 0x48, 0x06, 0x58, 0x6B, 0x71, 0x99, 0xF7, 0x3B, 0xB6, 0xB1, 0x2A, 0x55 };

	char a[16] = { 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
	char b[16] = { 0xE9, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x7F };
	char c[16] = { 0xEC, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x7F };
	char d[16] = { 0xFC, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x7F };

	TEMP_hec_fp_2e127m1_t t;

	hec_fp_cpy_2e127m1_g2i_jac(t->D1, t1);

	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, (uni)u, t->D1->Z);              //n01:=u*Z1;
	fp_sqr_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01);                        //n02:=n01^2;
	fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->W, t->n01);              //n03:=W1*n01;
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n02, t->n03);                //n04:=n02*n03;
	fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, t->n03);            //R1:=R1*n03;
	fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->n02);            //S1:=S1*n02;
	fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->n04);            //P1:=P1*n04;
	fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->n02, t->n04);              //Z1:=n02*n04;
	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, (uni)c01, t->D1->Z);            //n01:=c01*Z1;
	fp_ml2_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n01);                        //n03:=2*n01;
	fp_add_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n03, t->D1->Q);            //P1:=n03+P1;
	fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->Q, t->n01);              //n02:=P1-n01;
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n02, (uni)c01);              //n04:=n02*c01;
	fp_add_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n04, t->D1->R);            //R1:=n04+R1;
	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, (uni)c01, t->D1->S);            //n01:=c01*S1;
	fp_add_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n01, t->D1->T);            //T1:=n01+T1;
	fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->T);                      //n01:=T1^2;
	fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, (uni)c02, t->D1->Z);            //n02:=c02*Z1;
	fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, (uni)c03, t->D1->Z);            //n03:=c03*Z1;
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, (uni)c04, t->D1->Z);            //n04:=c04*Z1;
	fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n01, t->D1->Z);            //T1:=n01*Z1;
	fp_add_2e127m1_x8664_asm(t->D1->W, NULL, NULL, t->D1->Z, t->D1->Q);          //W1:=Z1+P1;
	fp_add_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->n02, t->D1->Q);            //Z1:=n02+P1;
	fp_add_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->Z, t->n04);            //S1:=Z1+n04;
	fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n03, t->D1->R);              //n01:=n03-R1;
	fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n01, t->D1->S);            //P1:=n01*S1;
	fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->R, t->D1->Q);          //S1:=R1*P1;
	fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->S, t->D1->T);            //n01:=S1-T1;
	fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, (uni)a, t->n01);              //P1:=a*n01;
	fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, (uni)c04, t->n02);            //S1:=c04*n02;
	fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->S, t->D1->R);            //n01:=S1-R1;
	fp_add_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->W, t->n03);            //S1:=W1+n03;
	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->D1->S);              //n01:=n01*S1;
	fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->R, t->n01);            //S1:=R1*n01;
	fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->S, t->D1->T);            //n01:=S1-T1;
	fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, (uni)b, t->n01);              //S1:=b*n01;
	fp_add_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->Z, t->n03);              //n01:=Z1+n03;
	fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n04, t->D1->R);              //n03:=n04-R1;
	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n03);                //n01:=n01*n03;
	fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->R, t->n01);              //n03:=R1*n01;
	fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n03, t->D1->T);              //n01:=n03-T1;
	fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, (uni)c03, t->n02);            //Z1:=c03*n02;
	fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->Z, t->D1->R);            //n03:=Z1-R1;
	fp_add_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->W, t->n04);              //n02:=W1+n04;
	fp_mul_2e127m1_x8664_asm(t->D1->W, NULL, NULL, t->D1->R, t->n03);            //W1:=R1*n03;
	fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, (uni)c, t->n01);              //R1:=c*n01;
	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->W, t->n02);              //n01:=W1*n02;
	fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n01, t->D1->T);              //n04:=n01-T1;
	fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, (uni)d, t->n04);              //T1:=d*n04;
	fp_inv_2e127m1_x8664(t->D1->Z, NULL, NULL, t->D1->T);                        //Z1:=1/P1;
	fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->D1->Z);          //S1:=S1*Z1;
	fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->D1->Z);          //S1:=S1*Z1;
	fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, t->D1->Z);          //R1:=R1*Z1;

	fp_cpy_2e127m1_x8664_asm(tpk->X, NULL, NULL, t->D1->Q);
	fp_cpy_2e127m1_x8664_asm(tpk->Y, NULL, NULL, t->D1->S);
	fp_cpy_2e127m1_x8664_asm(tpk->Z, NULL, NULL, t->D1->R);

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
	DIV_kum_fp_2e127m1_g tpk;
	CONSTANTS;
	CACHE;

	tpk = (DIV_kum_fp_2e127m1_g)pk;

	/*Generate secret key (this should be replaced with a secure pseudorandom number generator).*/
	for (i = 0; i < SECRETKEY_BYTES; i++) sk[i] = random();

	/*Make the scalar 251 bits.*/
	sk[SECRETKEY_BYTES-1] = (sk[SECRETKEY_BYTES-1] & 0x07) | 0x04;

	//hec_fp_smulcached_2e127m1_g2i_jac(t1, (uni)sk, (unsigned char *)D2, (CNS_hec_fp_2e127m1)cn, SLICE, WINDOW, CSIZE);
	hec_fp_smulcached_2e127m1_g2i_jac_a3is1(t1, (uni)sk, (unsigned char *)D2, (CNS_hec_fp_2e127m1)cn, SLICE, WINDOW, CSIZE);

	char u[16]   = { 0x2A, 0x86, 0x63, 0xA9, 0xE7, 0xAD, 0x73, 0xF3, 0xDB, 0xE8, 0x5B, 0xA1, 0xD6, 0xD8, 0xF0, 0x0E };
	char c01[16] = { 0x7D, 0x93, 0xAD, 0xAD, 0xEC, 0x52, 0xBC, 0x3E, 0xA2, 0xFF, 0x85, 0x25, 0x98, 0x8D, 0x52, 0x20 };
	char c02[16] = { 0x52, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x55, 0x15 };
	char c03[16] = { 0x46, 0xA7, 0x19, 0x19, 0xC3, 0x05, 0xA5, 0x05, 0x0E, 0x13, 0x15, 0xB3, 0xFB, 0x34, 0xE3, 0x73 };
	char c04[16] = { 0xF3, 0x21, 0x2D, 0x2D, 0x48, 0x06, 0x58, 0x6B, 0x71, 0x99, 0xF7, 0x3B, 0xB6, 0xB1, 0x2A, 0x55 };

	char a[16] = { 0x0B, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
	char b[16] = { 0xE9, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x7F };
	char c[16] = { 0xEC, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x7F };
	char d[16] = { 0xFC, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x7F };

	TEMP_hec_fp_2e127m1_t t;

	hec_fp_cpy_2e127m1_g2i_jac(t->D1, t1);

	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, (uni)u, t->D1->Z);              //n01:=u*Z1;
	fp_sqr_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01);                        //n02:=n01^2;
	fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->W, t->n01);              //n03:=W1*n01;
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n02, t->n03);                //n04:=n02*n03;
	fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, t->n03);            //R1:=R1*n03;
	fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->n02);            //S1:=S1*n02;
	fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->n04);            //P1:=P1*n04;
	fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->n02, t->n04);              //Z1:=n02*n04;
	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, (uni)c01, t->D1->Z);            //n01:=c01*Z1;
	fp_ml2_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n01);                        //n03:=2*n01;
	fp_add_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n03, t->D1->Q);            //P1:=n03+P1;
	fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->Q, t->n01);              //n02:=P1-n01;
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n02, (uni)c01);              //n04:=n02*c01;
	fp_add_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n04, t->D1->R);            //R1:=n04+R1;
	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, (uni)c01, t->D1->S);            //n01:=c01*S1;
	fp_add_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n01, t->D1->T);            //T1:=n01+T1;
	fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->T);                      //n01:=T1^2;
	fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, (uni)c02, t->D1->Z);            //n02:=c02*Z1;
	fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, (uni)c03, t->D1->Z);            //n03:=c03*Z1;
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, (uni)c04, t->D1->Z);            //n04:=c04*Z1;
	fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n01, t->D1->Z);            //T1:=n01*Z1;
	fp_add_2e127m1_x8664_asm(t->D1->W, NULL, NULL, t->D1->Z, t->D1->Q);          //W1:=Z1+P1;
	fp_add_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->n02, t->D1->Q);            //Z1:=n02+P1;
	fp_add_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->Z, t->n04);            //S1:=Z1+n04;
	fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n03, t->D1->R);              //n01:=n03-R1;
	fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n01, t->D1->S);            //P1:=n01*S1;
	fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->R, t->D1->Q);          //S1:=R1*P1;
	fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->S, t->D1->T);            //n01:=S1-T1;
	fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, (uni)a, t->n01);              //P1:=a*n01;
	fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, (uni)c04, t->n02);            //S1:=c04*n02;
	fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->S, t->D1->R);            //n01:=S1-R1;
	fp_add_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->W, t->n03);            //S1:=W1+n03;
	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->D1->S);              //n01:=n01*S1;
	fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->R, t->n01);            //S1:=R1*n01;
	fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->S, t->D1->T);            //n01:=S1-T1;
	fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, (uni)b, t->n01);              //S1:=b*n01;
	fp_add_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->Z, t->n03);              //n01:=Z1+n03;
	fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n04, t->D1->R);              //n03:=n04-R1;
	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n03);                //n01:=n01*n03;
	fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->R, t->n01);              //n03:=R1*n01;
	fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n03, t->D1->T);              //n01:=n03-T1;
	fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, (uni)c03, t->n02);            //Z1:=c03*n02;
	fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->Z, t->D1->R);            //n03:=Z1-R1;
	fp_add_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->W, t->n04);              //n02:=W1+n04;
	fp_mul_2e127m1_x8664_asm(t->D1->W, NULL, NULL, t->D1->R, t->n03);            //W1:=R1*n03;
	fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, (uni)c, t->n01);              //R1:=c*n01;
	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->W, t->n02);              //n01:=W1*n02;
	fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n01, t->D1->T);              //n04:=n01-T1;
	fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, (uni)d, t->n04);              //T1:=d*n04;
	fp_inv_2e127m1_x8664(t->D1->Z, NULL, NULL, t->D1->T);                        //Z1:=1/P1;
	fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->D1->Z);          //S1:=S1*Z1;
	fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->D1->Z);          //S1:=S1*Z1;
	fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, t->D1->Z);          //R1:=R1*Z1;

	fp_cpy_2e127m1_x8664_asm(tpk->X, NULL, NULL, t->D1->Q);
	fp_cpy_2e127m1_x8664_asm(tpk->Y, NULL, NULL, t->D1->S);
	fp_cpy_2e127m1_x8664_asm(tpk->Z, NULL, NULL, t->D1->R);

	/*TODO: Point compression.*/

	return 0;
}

#endif


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

	/*Make sure that the scalar is 251 bits.*/
	if(sk[SECRETKEY_BYTES-1] != ((sk[SECRETKEY_BYTES-1] & 0x07) | 0x04)){
		printf("The scalar does not meet the specification\n");
		exit(1);
	}

	/*TODO: Point decompression.*/

	/*Convert to homogeneous projective coordinates representation.*/
	fp_cpy_2e127m1_x8664_asm(t2->X, NULL, NULL, tpk->X);
	fp_cpy_2e127m1_x8664_asm(t2->Y, NULL, NULL, tpk->Y);
	fp_cpy_2e127m1_x8664_asm(t2->Z, NULL, NULL, tpk->Z);
	fp_st1_2e127m1_x8664_asm(t2->T, NULL, NULL, 1);

	/*Naive approach to calculate yb, zb, tb.*/
	/*
	fp_inv_2e127m1_x8664(n01, NULL, NULL, t2->Y);
	fp_inv_2e127m1_x8664(n02, NULL, NULL, t2->Z);
	fp_inv_2e127m1_x8664(n03, NULL, NULL, t2->T);
	fp_mul_2e127m1_x8664_asm(tcn->yb, NULL, NULL, t2->X, n01);
	fp_mul_2e127m1_x8664_asm(tcn->zb, NULL, NULL, t2->X, n02);
	fp_mul_2e127m1_x8664_asm(tcn->tb, NULL, NULL, t2->X, n03);
	*/

	/*Montgomery's simultaneous inversion algorithm to calculate yb, zb, tb.*/
	fp_mul_2e127m1_x8664_asm(n01, NULL, NULL, t2->Y, t2->Z);
	fp_mul_2e127m1_x8664_asm(n02, NULL, NULL, n01, t2->T);
	fp_inv_2e127m1_x8664(n02, NULL, NULL, n02);
	fp_mul_2e127m1_x8664_asm(tcn->tb, NULL, NULL, n02, n01);
	fp_mul_2e127m1_x8664_asm(n02, NULL, NULL, n02, t2->T);
	fp_mul_2e127m1_x8664_asm(tcn->zb, NULL, NULL, n02, t2->Y);
	fp_mul_2e127m1_x8664_asm(tcn->yb, NULL, NULL, n02, t2->Z);
	fp_mul_2e127m1_x8664_asm(tcn->yb, NULL, NULL, tcn->yb, t2->X);
	fp_mul_2e127m1_x8664_asm(tcn->zb, NULL, NULL, tcn->zb, t2->X);
	fp_mul_2e127m1_x8664_asm(tcn->tb, NULL, NULL, tcn->tb, t2->X);

	/*Perform the scalar multiplication.*/
	kum_fp_smul_ym_2e127m1_g(t1, (uni)sk, t2, tcn);

	/*Convert to affine coordinates representation.*/
	fp_neg_2e127m1_x8664_asm(t1->T, NULL, NULL, t1->T);
	fp_inv_2e127m1_x8664(t1->T, NULL, NULL, t1->T);
	fp_mul_2e127m1_x8664_asm(ts->X, NULL, NULL, t1->X, t1->T);
	fp_mul_2e127m1_x8664_asm(ts->Y, NULL, NULL, t1->Y, t1->T);
	fp_mul_2e127m1_x8664_asm(ts->Z, NULL, NULL, t1->Z, t1->T);
	fp_neg_2e127m1_x8664_asm(ts->X, NULL, NULL, ts->X);
	fp_neg_2e127m1_x8664_asm(ts->Y, NULL, NULL, ts->Y);
	fp_neg_2e127m1_x8664_asm(ts->Z, NULL, NULL, ts->Z);

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
void test_ckdh_kumhec_fp_2e127m1(char *s)
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

void test_perf_kumhec_fp_2e127m1(char *s)
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

