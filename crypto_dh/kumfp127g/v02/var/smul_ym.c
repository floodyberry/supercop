//Huseyin Hisil, 2012-2013.

//#define DEBUG_MODE

#ifdef DEBUG_MODE
	#include <stdio.h>
	#include "kernel.h"
	#include "multiprecision.h"
#else
	#include "_core.h"
#endif
#include "finite128.h"

void kum_fp_smul_ym_2e127m1_g(DIV_kum_fp_2e127m1_g d2, const uni kn, const DIV_kum_fp_2e127m1_g d0, CNS_kum_fp_2e127m1_g cn)
{
	DIV_kum_fp_2e127m1_g_t d1;
	TEMP_kum_fp_2e127m1_g_t t;
	int i, j;

	fp_cpy_2e127m1_x8664(d1->X, d0->X);
	fp_cpy_2e127m1_x8664(d1->Y, d0->Y);
	fp_cpy_2e127m1_x8664(d1->T, d0->T);
	fp_cpy_2e127m1_x8664(d1->Z, d0->Z);
	fp_cpy_2e127m1_x8664(d2->X, d0->X);
	fp_cpy_2e127m1_x8664(d2->Y, d0->Y);
	fp_cpy_2e127m1_x8664(d2->T, d0->T);
	fp_cpy_2e127m1_x8664(d2->Z, d0->Z);
	fp_neg_2e127m1_x8664(d1->Y, d1->Y);
	fp_neg_2e127m1_x8664(d2->Y, d2->Y);
	fp_neg_2e127m1_x8664(cn->yb, cn->yb); /* Destructive operation on cn. */
#ifdef GENERATED_ASM
	kum_fp_dbl_2e127m1_g_ym_x8664_asm((uni)t, NULL, NULL, (uni)d1, NULL, (uni)cn);
	fp_cnt_bits(&i, kn, 2*FP_LEN); /*printf("%d ", i);*/
	for(j = i - 2; j >= 0; j--){
		kum_fp_dbladd_2e127m1_g_ym_x8664_asm((uni)t, kn, j, (uni)d1, (uni)d2, (uni)cn);
	}
#else
	fp_hdm_ym_2e127m1_x8664(d1->X, d1->Y, d1->Z, d1->T);
	fp_sqr_2e127m1_x8664(d1->X, d1->X);
	fp_sqr_2e127m1_x8664(d1->Y, d1->Y);
	fp_sqr_2e127m1_x8664(d1->Z, d1->Z);
	fp_sqr_2e127m1_x8664(d1->T, d1->T);
	fp_ml3_2e127m1_x8664(d1->Y, d1->Y);                      /* mul by -{cn->yd} */
	fp_mul_2e127m1_x8664(d1->Z, d1->Z, NULL, cn->zd);
	fp_mul_2e127m1_x8664(d1->T, d1->T, NULL, cn->td);
	fp_hdm_ym_2e127m1_x8664(d1->X, d1->Y, d1->Z, d1->T);
	fp_sqr_2e127m1_x8664(d1->X, d1->X);
	fp_ml2_2e127m1_x8664(d1->X, d1->X);                      /* mul by {cn->x0} */
	fp_sqr_2e127m1_x8664(d1->Y, d1->Y);
	fp_sqr_2e127m1_x8664(d1->Z, d1->Z);
	fp_sqr_2e127m1_x8664(d1->T, d1->T);
	fp_mul_2e127m1_x8664(d1->Z, d1->Z, NULL, cn->z0);
	fp_mul_2e127m1_x8664(d1->T, d1->T, NULL, cn->t0);
	fp_cnt_bits(&i, kn, FP_LEN*2);
	int ei;
	for(j = i - 1; j > 0; j--){
		mam_ith_bit(ei, kn, j);
		if(ei == 1){
			fp_hdm_ym_2e127m1_x8664(d1->X, d1->Y, d1->Z, d1->T);
			fp_hdm_ym_2e127m1_x8664(d2->X, d2->Y, d2->Z, d2->T);
			fp_mul_2e127m1_x8664(d2->X, d1->X, NULL, d2->X);
			fp_ml3_2e127m1_x8664(t->n01, d1->Y);                      /* mul by -{cn->yd} */
			fp_mul_2e127m1_x8664(t->n02, d1->Z, NULL, cn->zd);
			fp_mul_2e127m1_x8664(t->n03, d1->T, NULL, cn->td);
			fp_sqr_2e127m1_x8664(d1->X, d1->X);
			fp_mul_2e127m1_x8664(d1->Y, d1->Y, NULL, t->n01);
			fp_mul_2e127m1_x8664(d1->Z, d1->Z, NULL, t->n02);
			fp_mul_2e127m1_x8664(d1->T, d1->T, NULL, t->n03);
			fp_mul_2e127m1_x8664(d2->Y, t->n01, NULL, d2->Y);
			fp_mul_2e127m1_x8664(d2->Z, t->n02, NULL, d2->Z);
			fp_mul_2e127m1_x8664(d2->T, t->n03, NULL, d2->T);
			fp_hdm_ym_2e127m1_x8664(d1->X, d1->Y, d1->Z, d1->T);
			fp_hdm_ym_2e127m1_x8664(d2->X, d2->Y, d2->Z, d2->T);
			fp_sqr_2e127m1_x8664(d1->X, d1->X);
			fp_ml2_2e127m1_x8664(d1->X, d1->X);                       /* mul by {cn->x0} */
			fp_sqr_2e127m1_x8664(d1->Y, d1->Y);
			fp_sqr_2e127m1_x8664(d1->Z, d1->Z);
			fp_sqr_2e127m1_x8664(d1->T, d1->T);
			fp_sqr_2e127m1_x8664(d2->X, d2->X);
			fp_sqr_2e127m1_x8664(d2->Y, d2->Y);
			fp_sqr_2e127m1_x8664(d2->Z, d2->Z);
			fp_sqr_2e127m1_x8664(d2->T, d2->T);
			fp_mul_2e127m1_x8664(d1->Z, d1->Z, NULL, cn->z0);
			fp_mul_2e127m1_x8664(d1->T, d1->T, NULL, cn->t0);
			fp_mul_2e127m1_x8664(d2->Y, d2->Y, NULL, cn->yb);         /* mul by -{cn->yb} */
			fp_mul_2e127m1_x8664(d2->Z, d2->Z, NULL, cn->zb);
			fp_mul_2e127m1_x8664(d2->T, d2->T, NULL, cn->tb);
		}
		else{
			fp_hdm_ym_2e127m1_x8664(d2->X, d2->Y, d2->Z, d2->T);
			fp_hdm_ym_2e127m1_x8664(d1->X, d1->Y, d1->Z, d1->T);
			fp_mul_2e127m1_x8664(d1->X, d2->X, NULL, d1->X);
			fp_ml3_2e127m1_x8664(t->n01, d2->Y);                      /* mul by -{cn->yd} */
			fp_mul_2e127m1_x8664(t->n02, d2->Z, NULL, cn->zd);
			fp_mul_2e127m1_x8664(t->n03, d2->T, NULL, cn->td);
			fp_sqr_2e127m1_x8664(d2->X, d2->X);
			fp_mul_2e127m1_x8664(d2->Y, d2->Y, NULL, t->n01);
			fp_mul_2e127m1_x8664(d2->Z, d2->Z, NULL, t->n02);
			fp_mul_2e127m1_x8664(d2->T, d2->T, NULL, t->n03);
			fp_mul_2e127m1_x8664(d1->Y, t->n01, NULL, d1->Y);
			fp_mul_2e127m1_x8664(d1->Z, t->n02, NULL, d1->Z);
			fp_mul_2e127m1_x8664(d1->T, t->n03, NULL, d1->T);
			fp_hdm_ym_2e127m1_x8664(d2->X, d2->Y, d2->Z, d2->T);
			fp_hdm_ym_2e127m1_x8664(d1->X, d1->Y, d1->Z, d1->T);
			fp_sqr_2e127m1_x8664(d2->X, d2->X);
			fp_ml2_2e127m1_x8664(d2->X, d2->X);                       /* mul by {cn->x0} */
			fp_sqr_2e127m1_x8664(d2->Y, d2->Y);
			fp_sqr_2e127m1_x8664(d2->Z, d2->Z);
			fp_sqr_2e127m1_x8664(d2->T, d2->T);
			fp_sqr_2e127m1_x8664(d1->X, d1->X);
			fp_sqr_2e127m1_x8664(d1->Y, d1->Y);
			fp_sqr_2e127m1_x8664(d1->Z, d1->Z);
			fp_sqr_2e127m1_x8664(d1->T, d1->T);
			fp_mul_2e127m1_x8664(d2->Z, d2->Z, NULL, cn->z0);
			fp_mul_2e127m1_x8664(d2->T, d2->T, NULL, cn->t0);
			fp_mul_2e127m1_x8664(d1->Y, d1->Y, NULL, cn->yb);         /* mul by -{cn->yb} */
			fp_mul_2e127m1_x8664(d1->Z, d1->Z, NULL, cn->zb);
			fp_mul_2e127m1_x8664(d1->T, d1->T, NULL, cn->tb);
		}
	}
#endif
	fp_neg_2e127m1_x8664(cn->yb, cn->yb);  /* Fixed to original value. */
	fp_neg_2e127m1_x8664(d2->Y, d2->Y);
}
