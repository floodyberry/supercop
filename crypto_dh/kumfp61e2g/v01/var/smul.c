//Huseyin Hisil, 2012-2013.

//#define DEBUG_MODE

#ifdef DEBUG_MODE
	#include <stdio.h>
	#include "kernel.h"
	#include "multiprecision.h"
	#include "multiprecision_stack.h"
#else
	#include "_core.h"
#endif
#include "finite128.h"

void kum_fp_smul_2e061m1e2_g(DIV_kum_fp_2e061m1e2_g d2, const uni kn, const DIV_kum_fp_2e061m1e2_g d0, CNS_kum_fp_2e061m1e2_g cn)
{
	int i, j;
	DIV_kum_fp_2e061m1e2_g_t d1;
	TEMP_kum_fp_2e061m1e2_g_t t;

	fp_cpy_2e061m1e2_x8664_asm(d1->X, NULL, NULL, d0->X);
	fp_cpy_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, d0->Y);
	fp_cpy_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, d0->Z);
	fp_cpy_2e061m1e2_x8664_asm(d1->T, NULL, NULL, d0->T);
	fp_cpy_2e061m1e2_x8664_asm(d2->X, NULL, NULL, d0->X);
	fp_cpy_2e061m1e2_x8664_asm(d2->Y, NULL, NULL, d0->Y);
	fp_cpy_2e061m1e2_x8664_asm(d2->Z, NULL, NULL, d0->Z);
	fp_cpy_2e061m1e2_x8664_asm(d2->T, NULL, NULL, d0->T);
#ifdef GENERATED_ASM
	kum_fp_dbl_2e061m1e2_g_x8664_asm((uni)t, NULL, NULL, (uni)d1, NULL, (uni)cn);
	fp_cnt_bits(&i, kn, 2*FP_LEN);
	for(j = i - 2; j >= 0; j--){
		kum_fp_dbladd_2e061m1e2_g_x8664_asm((uni)t, kn, j, (uni)d1, (uni)d2, (uni)cn);
	}
#else
	fp_hdm_2e061m1e2_x8664_asm(d1->X, d1->Y, d1->Z, d1->T);
	/*
	fp_add_2e061m1e2_x8664_asm(t->n01, NULL, NULL, d1->X, d1->Y);
	fp_add_2e061m1e2_x8664_asm(t->n02, NULL, NULL, d1->Z, d1->T);
	fp_sub_2e061m1e2_x8664_asm(t->n03, NULL, NULL, d1->X, d1->Y);
	fp_sub_2e061m1e2_x8664_asm(t->n04, NULL, NULL, d1->Z, d1->T);
	fp_add_2e061m1e2_x8664_asm(d1->X, NULL, NULL, t->n01, t->n02);
	fp_sub_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, t->n01, t->n02);
	fp_add_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, t->n03, t->n04);
	fp_sub_2e061m1e2_x8664_asm(d1->T, NULL, NULL, t->n03, t->n04);
	*/

	fp_sqr_2e061m1e2_x8664_asm(d1->X, NULL, NULL, d1->X);
	fp_sqr_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, d1->Y);
	fp_sqr_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, d1->Z);
	fp_sqr_2e061m1e2_x8664_asm(d1->T, NULL, NULL, d1->T);
	fp_mul_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, d1->Y, cn->yd);
	fp_mul_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, d1->Z, cn->zd);
	fp_mul_2e061m1e2_x8664_asm(d1->T, NULL, NULL, d1->T, cn->td);
	fp_add_2e061m1e2_x8664_asm(t->n01, NULL, NULL, d1->X, d1->Y);
	fp_add_2e061m1e2_x8664_asm(t->n02, NULL, NULL, d1->Z, d1->T);
	fp_sub_2e061m1e2_x8664_asm(t->n03, NULL, NULL, d1->X, d1->Y);
	fp_sub_2e061m1e2_x8664_asm(t->n04, NULL, NULL, d1->Z, d1->T);
	fp_add_2e061m1e2_x8664_asm(d1->X, NULL, NULL, t->n01, t->n02);
	fp_sub_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, t->n01, t->n02);
	fp_add_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, t->n03, t->n04);
	fp_sub_2e061m1e2_x8664_asm(d1->T, NULL, NULL, t->n03, t->n04);
	fp_sqr_2e061m1e2_x8664_asm(d1->X, NULL, NULL, d1->X);
	fp_sqr_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, d1->Y);
	fp_sqr_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, d1->Z);
	fp_sqr_2e061m1e2_x8664_asm(d1->T, NULL, NULL, d1->T);
	fp_mul_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, d1->Y, cn->y0);
	fp_mul_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, d1->Z, cn->z0);
	fp_mul_2e061m1e2_x8664_asm(d1->T, NULL, NULL, d1->T, cn->t0);

	fp_cnt_bits(&i, kn, FP_LEN*2);
	int ei;
	for(j = i - 1; j > 0; j--){
		mam_ith_bit(ei, kn, j);
		if(ei == 1){
			fp_hdm_2e061m1e2_x8664_asm(d1->X, d1->Y, d1->Z, d1->T);
			fp_hdm_2e061m1e2_x8664_asm(d2->X, d2->Y, d2->Z, d2->T);
			/*
			fp_add_2e061m1e2_x8664_asm(t->n01, NULL, NULL, d1->X, d1->Y);
			fp_add_2e061m1e2_x8664_asm(t->n02, NULL, NULL, d1->Z, d1->T);
			fp_sub_2e061m1e2_x8664_asm(t->n03, NULL, NULL, d1->X, d1->Y);
			fp_sub_2e061m1e2_x8664_asm(t->n04, NULL, NULL, d1->Z, d1->T);
			fp_add_2e061m1e2_x8664_asm(d1->X, NULL, NULL, t->n01, t->n02);
			fp_add_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, t->n03, t->n04);
			fp_sub_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, t->n01, t->n02);
			fp_sub_2e061m1e2_x8664_asm(d1->T, NULL, NULL, t->n03, t->n04);
			fp_add_2e061m1e2_x8664_asm(t->n01, NULL, NULL, d2->X, d2->Y);
			fp_add_2e061m1e2_x8664_asm(t->n02, NULL, NULL, d2->Z, d2->T);
			fp_sub_2e061m1e2_x8664_asm(t->n03, NULL, NULL, d2->X, d2->Y);
			fp_sub_2e061m1e2_x8664_asm(t->n04, NULL, NULL, d2->Z, d2->T);
			fp_add_2e061m1e2_x8664_asm(d2->X, NULL, NULL, t->n01, t->n02);
			fp_add_2e061m1e2_x8664_asm(d2->Z, NULL, NULL, t->n03, t->n04);
			fp_sub_2e061m1e2_x8664_asm(d2->Y, NULL, NULL, t->n01, t->n02);
			fp_sub_2e061m1e2_x8664_asm(d2->T, NULL, NULL, t->n03, t->n04);
			*/

			fp_mul_2e061m1e2_x8664_asm(d2->X, NULL, NULL, d1->X, d2->X);
			fp_mul_2e061m1e2_x8664_asm(t->n01, NULL, NULL, d1->Y, cn->yd);
			fp_mul_2e061m1e2_x8664_asm(t->n02, NULL, NULL, d1->Z, cn->zd);
			fp_mul_2e061m1e2_x8664_asm(t->n03, NULL, NULL, d1->T, cn->td);
			fp_sqr_2e061m1e2_x8664_asm(d1->X, NULL, NULL, d1->X);
			fp_mul_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, d1->Y, t->n01);
			fp_mul_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, d1->Z, t->n02);
			fp_mul_2e061m1e2_x8664_asm(d1->T, NULL, NULL, d1->T, t->n03);
			fp_mul_2e061m1e2_x8664_asm(d2->Y, NULL, NULL, t->n01, d2->Y);
			fp_mul_2e061m1e2_x8664_asm(d2->Z, NULL, NULL, t->n02, d2->Z);
			fp_mul_2e061m1e2_x8664_asm(d2->T, NULL, NULL, t->n03, d2->T);
			fp_add_2e061m1e2_x8664_asm(t->n01, NULL, NULL, d1->X, d1->Y);
			fp_add_2e061m1e2_x8664_asm(t->n02, NULL, NULL, d1->Z, d1->T);
			fp_sub_2e061m1e2_x8664_asm(t->n03, NULL, NULL, d1->X, d1->Y);
			fp_sub_2e061m1e2_x8664_asm(t->n04, NULL, NULL, d1->Z, d1->T);
			fp_add_2e061m1e2_x8664_asm(d1->X, NULL, NULL, t->n01, t->n02);
			fp_add_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, t->n03, t->n04);
			fp_sub_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, t->n01, t->n02);
			fp_sub_2e061m1e2_x8664_asm(d1->T, NULL, NULL, t->n03, t->n04);
			fp_add_2e061m1e2_x8664_asm(t->n01, NULL, NULL, d2->X, d2->Y);
			fp_add_2e061m1e2_x8664_asm(t->n02, NULL, NULL, d2->Z, d2->T);
			fp_sub_2e061m1e2_x8664_asm(t->n03, NULL, NULL, d2->X, d2->Y);
			fp_sub_2e061m1e2_x8664_asm(t->n04, NULL, NULL, d2->Z, d2->T);
			fp_add_2e061m1e2_x8664_asm(d2->X, NULL, NULL, t->n01, t->n02);
			fp_add_2e061m1e2_x8664_asm(d2->Z, NULL, NULL, t->n03, t->n04);
			fp_sub_2e061m1e2_x8664_asm(d2->Y, NULL, NULL, t->n01, t->n02);
			fp_sub_2e061m1e2_x8664_asm(d2->T, NULL, NULL, t->n03, t->n04);
			fp_sqr_2e061m1e2_x8664_asm(d1->X, NULL, NULL, d1->X);
			fp_sqr_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, d1->Y);
			fp_sqr_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, d1->Z);
			fp_sqr_2e061m1e2_x8664_asm(d1->T, NULL, NULL, d1->T);
			fp_sqr_2e061m1e2_x8664_asm(d2->X, NULL, NULL, d2->X);
			fp_sqr_2e061m1e2_x8664_asm(d2->Y, NULL, NULL, d2->Y);
			fp_sqr_2e061m1e2_x8664_asm(d2->Z, NULL, NULL, d2->Z);
			fp_sqr_2e061m1e2_x8664_asm(d2->T, NULL, NULL, d2->T);
			fp_mul_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, d1->Y, cn->y0);
			fp_mul_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, d1->Z, cn->z0);
			fp_mul_2e061m1e2_x8664_asm(d1->T, NULL, NULL, d1->T, cn->t0);
			fp_mul_2e061m1e2_x8664_asm(d2->Y, NULL, NULL, d2->Y, cn->yb);
			fp_mul_2e061m1e2_x8664_asm(d2->Z, NULL, NULL, d2->Z, cn->zb);
			fp_mul_2e061m1e2_x8664_asm(d2->T, NULL, NULL, d2->T, cn->tb);
		}
		else{
			fp_hdm_2e061m1e2_x8664_asm(d2->X, d2->Y, d2->Z, d2->T);
			fp_hdm_2e061m1e2_x8664_asm(d1->X, d1->Y, d1->Z, d1->T);
			/*
			fp_add_2e061m1e2_x8664_asm(t->n01, NULL, NULL, d2->X, d2->Y);
			fp_add_2e061m1e2_x8664_asm(t->n02, NULL, NULL, d2->Z, d2->T);
			fp_sub_2e061m1e2_x8664_asm(t->n03, NULL, NULL, d2->X, d2->Y);
			fp_sub_2e061m1e2_x8664_asm(t->n04, NULL, NULL, d2->Z, d2->T);
			fp_add_2e061m1e2_x8664_asm(d2->X, NULL, NULL, t->n01, t->n02);
			fp_add_2e061m1e2_x8664_asm(d2->Z, NULL, NULL, t->n03, t->n04);
			fp_sub_2e061m1e2_x8664_asm(d2->Y, NULL, NULL, t->n01, t->n02);
			fp_sub_2e061m1e2_x8664_asm(d2->T, NULL, NULL, t->n03, t->n04);
			fp_add_2e061m1e2_x8664_asm(t->n01, NULL, NULL, d1->X, d1->Y);
			fp_add_2e061m1e2_x8664_asm(t->n02, NULL, NULL, d1->Z, d1->T);
			fp_sub_2e061m1e2_x8664_asm(t->n03, NULL, NULL, d1->X, d1->Y);
			fp_sub_2e061m1e2_x8664_asm(t->n04, NULL, NULL, d1->Z, d1->T);
			fp_add_2e061m1e2_x8664_asm(d1->X, NULL, NULL, t->n01, t->n02);
			fp_add_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, t->n03, t->n04);
			fp_sub_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, t->n01, t->n02);
			fp_sub_2e061m1e2_x8664_asm(d1->T, NULL, NULL, t->n03, t->n04);
			*/

			fp_mul_2e061m1e2_x8664_asm(d1->X, NULL, NULL, d2->X, d1->X);
			fp_mul_2e061m1e2_x8664_asm(t->n01, NULL, NULL, d2->Y, cn->yd);
			fp_mul_2e061m1e2_x8664_asm(t->n02, NULL, NULL, d2->Z, cn->zd);
			fp_mul_2e061m1e2_x8664_asm(t->n03, NULL, NULL, d2->T, cn->td);
			fp_sqr_2e061m1e2_x8664_asm(d2->X, NULL, NULL, d2->X);
			fp_mul_2e061m1e2_x8664_asm(d2->Y, NULL, NULL, d2->Y, t->n01);
			fp_mul_2e061m1e2_x8664_asm(d2->Z, NULL, NULL, d2->Z, t->n02);
			fp_mul_2e061m1e2_x8664_asm(d2->T, NULL, NULL, d2->T, t->n03);
			fp_mul_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, t->n01, d1->Y);
			fp_mul_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, t->n02, d1->Z);
			fp_mul_2e061m1e2_x8664_asm(d1->T, NULL, NULL, t->n03, d1->T);
			fp_add_2e061m1e2_x8664_asm(t->n01, NULL, NULL, d2->X, d2->Y);
			fp_add_2e061m1e2_x8664_asm(t->n02, NULL, NULL, d2->Z, d2->T);
			fp_sub_2e061m1e2_x8664_asm(t->n03, NULL, NULL, d2->X, d2->Y);
			fp_sub_2e061m1e2_x8664_asm(t->n04, NULL, NULL, d2->Z, d2->T);
			fp_add_2e061m1e2_x8664_asm(d2->X, NULL, NULL, t->n01, t->n02);
			fp_add_2e061m1e2_x8664_asm(d2->Z, NULL, NULL, t->n03, t->n04);
			fp_sub_2e061m1e2_x8664_asm(d2->Y, NULL, NULL, t->n01, t->n02);
			fp_sub_2e061m1e2_x8664_asm(d2->T, NULL, NULL, t->n03, t->n04);
			fp_add_2e061m1e2_x8664_asm(t->n01, NULL, NULL, d1->X, d1->Y);
			fp_add_2e061m1e2_x8664_asm(t->n02, NULL, NULL, d1->Z, d1->T);
			fp_sub_2e061m1e2_x8664_asm(t->n03, NULL, NULL, d1->X, d1->Y);
			fp_sub_2e061m1e2_x8664_asm(t->n04, NULL, NULL, d1->Z, d1->T);
			fp_add_2e061m1e2_x8664_asm(d1->X, NULL, NULL, t->n01, t->n02);
			fp_add_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, t->n03, t->n04);
			fp_sub_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, t->n01, t->n02);
			fp_sub_2e061m1e2_x8664_asm(d1->T, NULL, NULL, t->n03, t->n04);
			fp_sqr_2e061m1e2_x8664_asm(d2->X, NULL, NULL, d2->X);
			fp_sqr_2e061m1e2_x8664_asm(d2->Y, NULL, NULL, d2->Y);
			fp_sqr_2e061m1e2_x8664_asm(d2->Z, NULL, NULL, d2->Z);
			fp_sqr_2e061m1e2_x8664_asm(d2->T, NULL, NULL, d2->T);
			fp_sqr_2e061m1e2_x8664_asm(d1->X, NULL, NULL, d1->X);
			fp_sqr_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, d1->Y);
			fp_sqr_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, d1->Z);
			fp_sqr_2e061m1e2_x8664_asm(d1->T, NULL, NULL, d1->T);
			fp_mul_2e061m1e2_x8664_asm(d2->Y, NULL, NULL, d2->Y, cn->y0);
			fp_mul_2e061m1e2_x8664_asm(d2->Z, NULL, NULL, d2->Z, cn->z0);
			fp_mul_2e061m1e2_x8664_asm(d2->T, NULL, NULL, d2->T, cn->t0);
			fp_mul_2e061m1e2_x8664_asm(d1->Y, NULL, NULL, d1->Y, cn->yb);
			fp_mul_2e061m1e2_x8664_asm(d1->Z, NULL, NULL, d1->Z, cn->zb);
			fp_mul_2e061m1e2_x8664_asm(d1->T, NULL, NULL, d1->T, cn->tb);
		}
	}
#endif
}
