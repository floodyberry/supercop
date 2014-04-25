//Huseyin Hisil, 2013.

#define NOXGCD

#ifdef NOXGCD
#include "_core.h"
#include "finite064.h"

void fp_inv_2e061m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni an){
	uni ah, al, zh, zl;
	uni_t n01[FP_LEN], n02[FP_LEN];

	ah = an + FP_LEN; al = an;
	zh = zn + FP_LEN; zl = zn;
	fp_sqr_2e061m1_x8664_asm(n01, NULL, NULL, al);
	fp_sqr_2e061m1_x8664_asm(n02, NULL, NULL, ah);
	fp_add_2e061m1_x8664_asm(n01, NULL, NULL, n01, n02);
	fp_inv_2e061m1_x8664(n01, NULL, NULL, n01);
	fp_mul_2e061m1_x8664_asm(zh, NULL, NULL, ah, n01);
	fp_neg_2e061m1_x8664_asm(zh, NULL, NULL, zh);
	fp_mul_2e061m1_x8664_asm(zl, NULL, NULL, al, n01);
}

#else

#include "kernel.h"
#include "multiprecision.h"
#include "multiprecision_stack.h"
#include "finite128.h"

void fp_inv_2e061m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni an){
	/*TODO: */
}

#endif

