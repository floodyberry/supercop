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

void kum_fp_smul_2e128mc_g(DIV_kum_fp_2e128mc d2, const uni kn, const DIV_kum_fp_2e128mc d0, CNS_kum_fp_2e128mc cn)
{
	DIV_kum_fp_2e128mc_t d1;
	TEMP_kum_fp_2e128mc_t t;
	int i, j;

	fp_cpy_2e128mc_x8664(d1->X, d0->X);
	fp_cpy_2e128mc_x8664(d1->Y, d0->Y);
	fp_cpy_2e128mc_x8664(d1->Z, d0->Z);
	fp_cpy_2e128mc_x8664(d1->T, d0->T);
	fp_cpy_2e128mc_x8664(d2->X, d0->X);
	fp_cpy_2e128mc_x8664(d2->Y, d0->Y);
	fp_cpy_2e128mc_x8664(d2->Z, d0->Z);
	fp_cpy_2e128mc_x8664(d2->T, d0->T);
#ifdef GENERATED_ASM
	kum_fp_dbl_2e128mc_g_x8664_asm((uni)t, NULL, NULL, (uni)d1, NULL, (uni)cn);
	fp_cnt_bits(&i, kn, 2*FP_LEN); /*printf("%d ", i);*/
	for(j = i - 2; j >= 0; j--){
		kum_fp_dbladd_2e128mc_g_x8664_asm((uni)t, kn, j, (uni)d1, (uni)d2, (uni)cn);
	}
#else
	fp_add_2e128mc_x8664(t->n01, cn->prm, d1->X, d1->Y);
	fp_add_2e128mc_x8664(t->n02, cn->prm, d1->Z, d1->T);
	fp_sub_2e128mc_x8664(t->n03, cn->prm, d1->X, d1->Y);
	fp_sub_2e128mc_x8664(t->n04, cn->prm, d1->Z, d1->T);
	fp_add_2e128mc_x8664(d1->X, cn->prm, t->n01, t->n02);
	fp_sub_2e128mc_x8664(d1->Y, cn->prm, t->n01, t->n02);
	fp_add_2e128mc_x8664(d1->Z, cn->prm, t->n03, t->n04);
	fp_sub_2e128mc_x8664(d1->T, cn->prm, t->n03, t->n04);
	fp_sqr_2e128mc_x8664(d1->X, cn->prm, NULL, d1->X);
	fp_sqr_2e128mc_x8664(d1->Y, cn->prm, NULL, d1->Y);
	fp_sqr_2e128mc_x8664(d1->Z, cn->prm, NULL, d1->Z);
	fp_sqr_2e128mc_x8664(d1->T, cn->prm, NULL, d1->T);
	fp_mul_2e128mc_x8664(d1->Y, cn->prm, NULL, d1->Y, cn->yd);
	fp_mul_2e128mc_x8664(d1->Z, cn->prm, NULL, d1->Z, cn->zd);
	fp_mul_2e128mc_x8664(d1->T, cn->prm, NULL, d1->T, cn->td);
	fp_add_2e128mc_x8664(t->n01, cn->prm, d1->X, d1->Y);
	fp_add_2e128mc_x8664(t->n02, cn->prm, d1->Z, d1->T);
	fp_sub_2e128mc_x8664(t->n03, cn->prm, d1->X, d1->Y);
	fp_sub_2e128mc_x8664(t->n04, cn->prm, d1->Z, d1->T);
	fp_add_2e128mc_x8664(d1->X, cn->prm, t->n01, t->n02);
	fp_sub_2e128mc_x8664(d1->Y, cn->prm, t->n01, t->n02);
	fp_add_2e128mc_x8664(d1->Z, cn->prm, t->n03, t->n04);
	fp_sub_2e128mc_x8664(d1->T, cn->prm, t->n03, t->n04);
	fp_sqr_2e128mc_x8664(d1->X, cn->prm, NULL, d1->X);
	fp_sqr_2e128mc_x8664(d1->Y, cn->prm, NULL, d1->Y);
	fp_sqr_2e128mc_x8664(d1->Z, cn->prm, NULL, d1->Z);
	fp_sqr_2e128mc_x8664(d1->T, cn->prm, NULL, d1->T);
	fp_mul_2e128mc_x8664(d1->Y, cn->prm, NULL, d1->Y, cn->y0);
	fp_mul_2e128mc_x8664(d1->Z, cn->prm, NULL, d1->Z, cn->z0);
	fp_mul_2e128mc_x8664(d1->T, cn->prm, NULL, d1->T, cn->t0);
	fp_cnt_bits(&i, kn, FP_LEN*2);
	int ei;
	for(j = i - 1; j > 0; j--){
		mam_ith_bit(ei, kn, j);
		if(ei == 1){
			fp_add_2e128mc_x8664(t->n01, cn->prm, d1->X, d1->Y);
			fp_add_2e128mc_x8664(t->n02, cn->prm, d1->Z, d1->T);
			fp_sub_2e128mc_x8664(t->n03, cn->prm, d1->X, d1->Y);
			fp_sub_2e128mc_x8664(t->n04, cn->prm, d1->Z, d1->T);
			fp_add_2e128mc_x8664(d1->X, cn->prm, t->n01, t->n02);
			fp_sub_2e128mc_x8664(d1->Y, cn->prm, t->n01, t->n02);
			fp_add_2e128mc_x8664(d1->Z, cn->prm, t->n03, t->n04);
			fp_sub_2e128mc_x8664(d1->T, cn->prm, t->n03, t->n04);
			fp_add_2e128mc_x8664(t->n01, cn->prm, d2->X, d2->Y);
			fp_add_2e128mc_x8664(t->n02, cn->prm, d2->Z, d2->T);
			fp_sub_2e128mc_x8664(t->n03, cn->prm, d2->X, d2->Y);
			fp_sub_2e128mc_x8664(t->n04, cn->prm, d2->Z, d2->T);
			fp_add_2e128mc_x8664(d2->X, cn->prm, t->n01, t->n02);
			fp_sub_2e128mc_x8664(d2->Y, cn->prm, t->n01, t->n02);
			fp_add_2e128mc_x8664(d2->Z, cn->prm, t->n03, t->n04);
			fp_sub_2e128mc_x8664(d2->T, cn->prm, t->n03, t->n04);
			fp_mul_2e128mc_x8664(d2->X, cn->prm, NULL, d1->X, d2->X);
			fp_mul_2e128mc_x8664(t->n01, cn->prm, NULL, d1->Y, cn->yd);
			fp_mul_2e128mc_x8664(t->n02, cn->prm, NULL, d1->Z, cn->zd);
			fp_mul_2e128mc_x8664(t->n03, cn->prm, NULL, d1->T, cn->td);
			fp_sqr_2e128mc_x8664(d1->X, cn->prm, NULL, d1->X);
			fp_mul_2e128mc_x8664(d1->Y, cn->prm, NULL, d1->Y, t->n01);
			fp_mul_2e128mc_x8664(d1->Z, cn->prm, NULL, d1->Z, t->n02);
			fp_mul_2e128mc_x8664(d1->T, cn->prm, NULL, d1->T, t->n03);
			fp_mul_2e128mc_x8664(d2->Y, cn->prm, NULL, t->n01, d2->Y);
			fp_mul_2e128mc_x8664(d2->Z, cn->prm, NULL, t->n02, d2->Z);
			fp_mul_2e128mc_x8664(d2->T, cn->prm, NULL, t->n03, d2->T);
			fp_add_2e128mc_x8664(t->n01, cn->prm, d1->X, d1->Y);
			fp_add_2e128mc_x8664(t->n02, cn->prm, d1->Z, d1->T);
			fp_sub_2e128mc_x8664(t->n03, cn->prm, d1->X, d1->Y);
			fp_sub_2e128mc_x8664(t->n04, cn->prm, d1->Z, d1->T);
			fp_add_2e128mc_x8664(d1->X, cn->prm, t->n01, t->n02);
			fp_sub_2e128mc_x8664(d1->Y, cn->prm, t->n01, t->n02);
			fp_add_2e128mc_x8664(d1->Z, cn->prm, t->n03, t->n04);
			fp_sub_2e128mc_x8664(d1->T, cn->prm, t->n03, t->n04);
			fp_add_2e128mc_x8664(t->n01, cn->prm, d2->X, d2->Y);
			fp_add_2e128mc_x8664(t->n02, cn->prm, d2->Z, d2->T);
			fp_sub_2e128mc_x8664(t->n03, cn->prm, d2->X, d2->Y);
			fp_sub_2e128mc_x8664(t->n04, cn->prm, d2->Z, d2->T);
			fp_add_2e128mc_x8664(d2->X, cn->prm, t->n01, t->n02);
			fp_sub_2e128mc_x8664(d2->Y, cn->prm, t->n01, t->n02);
			fp_add_2e128mc_x8664(d2->Z, cn->prm, t->n03, t->n04);
			fp_sub_2e128mc_x8664(d2->T, cn->prm, t->n03, t->n04);
			fp_sqr_2e128mc_x8664(d1->X, cn->prm, NULL, d1->X);
			fp_sqr_2e128mc_x8664(d1->Y, cn->prm, NULL, d1->Y);
			fp_sqr_2e128mc_x8664(d1->Z, cn->prm, NULL, d1->Z);
			fp_sqr_2e128mc_x8664(d1->T, cn->prm, NULL, d1->T);
			fp_sqr_2e128mc_x8664(d2->X, cn->prm, NULL, d2->X);
			fp_sqr_2e128mc_x8664(d2->Y, cn->prm, NULL, d2->Y);
			fp_sqr_2e128mc_x8664(d2->Z, cn->prm, NULL, d2->Z);
			fp_sqr_2e128mc_x8664(d2->T, cn->prm, NULL, d2->T);
			fp_mul_2e128mc_x8664(d1->Y, cn->prm, NULL, d1->Y, cn->y0);
			fp_mul_2e128mc_x8664(d1->Z, cn->prm, NULL, d1->Z, cn->z0);
			fp_mul_2e128mc_x8664(d1->T, cn->prm, NULL, d1->T, cn->t0);
			fp_mul_2e128mc_x8664(d2->Y, cn->prm, NULL, d2->Y, cn->yb);
			fp_mul_2e128mc_x8664(d2->Z, cn->prm, NULL, d2->Z, cn->zb);
			fp_mul_2e128mc_x8664(d2->T, cn->prm, NULL, d2->T, cn->tb);
		}
		else{
			fp_add_2e128mc_x8664(t->n01, cn->prm, d2->X, d2->Y);
			fp_add_2e128mc_x8664(t->n02, cn->prm, d2->Z, d2->T);
			fp_sub_2e128mc_x8664(t->n03, cn->prm, d2->X, d2->Y);
			fp_sub_2e128mc_x8664(t->n04, cn->prm, d2->Z, d2->T);
			fp_add_2e128mc_x8664(d2->X, cn->prm, t->n01, t->n02);
			fp_sub_2e128mc_x8664(d2->Y, cn->prm, t->n01, t->n02);
			fp_add_2e128mc_x8664(d2->Z, cn->prm, t->n03, t->n04);
			fp_sub_2e128mc_x8664(d2->T, cn->prm, t->n03, t->n04);
			fp_add_2e128mc_x8664(t->n01, cn->prm, d1->X, d1->Y);
			fp_add_2e128mc_x8664(t->n02, cn->prm, d1->Z, d1->T);
			fp_sub_2e128mc_x8664(t->n03, cn->prm, d1->X, d1->Y);
			fp_sub_2e128mc_x8664(t->n04, cn->prm, d1->Z, d1->T);
			fp_add_2e128mc_x8664(d1->X, cn->prm, t->n01, t->n02);
			fp_sub_2e128mc_x8664(d1->Y, cn->prm, t->n01, t->n02);
			fp_add_2e128mc_x8664(d1->Z, cn->prm, t->n03, t->n04);
			fp_sub_2e128mc_x8664(d1->T, cn->prm, t->n03, t->n04);
			fp_mul_2e128mc_x8664(d1->X, cn->prm, NULL, d2->X, d1->X);
			fp_mul_2e128mc_x8664(t->n01, cn->prm, NULL, d2->Y, cn->yd);
			fp_mul_2e128mc_x8664(t->n02, cn->prm, NULL, d2->Z, cn->zd);
			fp_mul_2e128mc_x8664(t->n03, cn->prm, NULL, d2->T, cn->td);
			fp_sqr_2e128mc_x8664(d2->X, cn->prm, NULL, d2->X);
			fp_mul_2e128mc_x8664(d2->Y, cn->prm, NULL, d2->Y, t->n01);
			fp_mul_2e128mc_x8664(d2->Z, cn->prm, NULL, d2->Z, t->n02);
			fp_mul_2e128mc_x8664(d2->T, cn->prm, NULL, d2->T, t->n03);
			fp_mul_2e128mc_x8664(d1->Y, cn->prm, NULL, t->n01, d1->Y);
			fp_mul_2e128mc_x8664(d1->Z, cn->prm, NULL, t->n02, d1->Z);
			fp_mul_2e128mc_x8664(d1->T, cn->prm, NULL, t->n03, d1->T);
			fp_add_2e128mc_x8664(t->n01, cn->prm, d2->X, d2->Y);
			fp_add_2e128mc_x8664(t->n02, cn->prm, d2->Z, d2->T);
			fp_sub_2e128mc_x8664(t->n03, cn->prm, d2->X, d2->Y);
			fp_sub_2e128mc_x8664(t->n04, cn->prm, d2->Z, d2->T);
			fp_add_2e128mc_x8664(d2->X, cn->prm, t->n01, t->n02);
			fp_sub_2e128mc_x8664(d2->Y, cn->prm, t->n01, t->n02);
			fp_add_2e128mc_x8664(d2->Z, cn->prm, t->n03, t->n04);
			fp_sub_2e128mc_x8664(d2->T, cn->prm, t->n03, t->n04);
			fp_add_2e128mc_x8664(t->n01, cn->prm, d1->X, d1->Y);
			fp_add_2e128mc_x8664(t->n02, cn->prm, d1->Z, d1->T);
			fp_sub_2e128mc_x8664(t->n03, cn->prm, d1->X, d1->Y);
			fp_sub_2e128mc_x8664(t->n04, cn->prm, d1->Z, d1->T);
			fp_add_2e128mc_x8664(d1->X, cn->prm, t->n01, t->n02);
			fp_sub_2e128mc_x8664(d1->Y, cn->prm, t->n01, t->n02);
			fp_add_2e128mc_x8664(d1->Z, cn->prm, t->n03, t->n04);
			fp_sub_2e128mc_x8664(d1->T, cn->prm, t->n03, t->n04);
			fp_sqr_2e128mc_x8664(d2->X, cn->prm, NULL, d2->X);
			fp_sqr_2e128mc_x8664(d2->Y, cn->prm, NULL, d2->Y);
			fp_sqr_2e128mc_x8664(d2->Z, cn->prm, NULL, d2->Z);
			fp_sqr_2e128mc_x8664(d2->T, cn->prm, NULL, d2->T);
			fp_sqr_2e128mc_x8664(d1->X, cn->prm, NULL, d1->X);
			fp_sqr_2e128mc_x8664(d1->Y, cn->prm, NULL, d1->Y);
			fp_sqr_2e128mc_x8664(d1->Z, cn->prm, NULL, d1->Z);
			fp_sqr_2e128mc_x8664(d1->T, cn->prm, NULL, d1->T);
			fp_mul_2e128mc_x8664(d2->Y, cn->prm, NULL, d2->Y, cn->y0);
			fp_mul_2e128mc_x8664(d2->Z, cn->prm, NULL, d2->Z, cn->z0);
			fp_mul_2e128mc_x8664(d2->T, cn->prm, NULL, d2->T, cn->t0);
			fp_mul_2e128mc_x8664(d1->Y, cn->prm, NULL, d1->Y, cn->yb);
			fp_mul_2e128mc_x8664(d1->Z, cn->prm, NULL, d1->Z, cn->zb);
			fp_mul_2e128mc_x8664(d1->T, cn->prm, NULL, d1->T, cn->tb);
		}
	}
#endif
}



