//Huseyin Hisil, 2012-2014.

//#define DEBUG_MODE

#ifdef DEBUG_MODE
	#include <stdio.h>
	#include "kernel.h"
	#include "multiprecision.h"
#else
	#include "_core.h"
#endif
#include "finite128.h"

/* The base point is assumed to be of odd order. */
void kum_fp_smul_ym_2e127m1_g(DIV_kum_fp_2e127m1_g d2, const uni kn, const DIV_kum_fp_2e127m1_g d0, CNS_kum_fp_2e127m1_g cn)
{
	TEMP_kum_fp_2e127m1_g_t t;

	/*Make the scalar 251 bits.*/
	kn[3] = (kn[3] & 0x07FFFFFFFFFFFFFFUL) | 0x0400000000000000UL;

	t->s = 0;
	fp_cpy_2e127m1_x8664_asm(t->X1, NULL, NULL, d0->X);
	fp_neg_2e127m1_x8664_asm(t->Y1, NULL, NULL, d0->Y);
	fp_cpy_2e127m1_x8664_asm(t->Z1, NULL, NULL, d0->Z);
	fp_cpy_2e127m1_x8664_asm(t->T1, NULL, NULL, d0->T);
	fp_cpy_2e127m1_x8664_asm(t->X2, NULL, NULL, d0->X);
	fp_neg_2e127m1_x8664_asm(t->Y2, NULL, NULL, d0->Y);
	fp_cpy_2e127m1_x8664_asm(t->Z2, NULL, NULL, d0->Z);
	fp_cpy_2e127m1_x8664_asm(t->T2, NULL, NULL, d0->T);
	fp_neg_2e127m1_x8664_asm(cn->yb, NULL, NULL, cn->yb); /* Destructive operation on cn. */
#ifdef GENERATED_ASM
	kum_fp_dbl_2e127m1_g_ym_x8664_asm(t, NULL, NULL, t->X2, NULL, cn);
#ifdef DEBUG_MODE
	int i, j;
	fp_cnt_bits(&i, kn, 2*FP_LEN);
	for(j = i - 2; j >= 0; j--){
		kum_fp_dbladd_2e127m1_g_ym_x8664_asm(t, NULL, NULL, j, cn, kn);
	}
#else
	kum_fp_dbladd_2e127m1_g_ym_mainloop_x8664_asm(t, NULL, NULL, 249, cn, kn);
#endif
	kum_fp_swap_2e127m1_g_ym_x8664_asm(t, t->s);
	fp_neg_2e127m1_x8664_asm(cn->yb, NULL, NULL, cn->yb);  /* Fixed to the original value. */
	fp_cpy_2e127m1_x8664_asm(d2->X, NULL, NULL, t->X1);
	fp_neg_2e127m1_x8664_asm(d2->Y, NULL, NULL, t->Y1);
	fp_cpy_2e127m1_x8664_asm(d2->Z, NULL, NULL, t->Z1);
	fp_cpy_2e127m1_x8664_asm(d2->T, NULL, NULL, t->T1);
#else
	fp_hdy_2e127m1_x8664_asm(t->X1, t->Y1, t->Z1, t->T1);
	fp_sqr_2e127m1_x8664_asm(t->X1, NULL, NULL, t->X1);
	fp_sqr_2e127m1_x8664_asm(t->Y1, NULL, NULL, t->Y1);
	fp_sqr_2e127m1_x8664_asm(t->Z1, NULL, NULL, t->Z1);
	fp_sqr_2e127m1_x8664_asm(t->T1, NULL, NULL, t->T1);
	fp_ml3_2e127m1_x8664_asm(t->Y1, NULL, NULL, t->Y1);                      /* mul by -{cn->yd} */
	fp_mul_2e127m1_x8664_asm(t->Z1, NULL, NULL, t->Z1, cn->zd);
	fp_mul_2e127m1_x8664_asm(t->T1, NULL, NULL, t->T1, cn->td);
	fp_hdy_2e127m1_x8664_asm(t->X1, t->Y1, t->Z1, t->T1);
	fp_sqr_2e127m1_x8664_asm(t->X1, NULL, NULL, t->X1);
	fp_ml2_2e127m1_x8664_asm(t->X1, NULL, NULL, t->X1);                      /* mul by {cn->x0} */
	fp_sqr_2e127m1_x8664_asm(t->Y1, NULL, NULL, t->Y1);
	fp_sqr_2e127m1_x8664_asm(t->Z1, NULL, NULL, t->Z1);
	fp_sqr_2e127m1_x8664_asm(t->T1, NULL, NULL, t->T1);
	fp_mul_2e127m1_x8664_asm(t->Z1, NULL, NULL, t->Z1, cn->z0);
	fp_mul_2e127m1_x8664_asm(t->T1, NULL, NULL, t->T1, cn->t0);
	int i, j, ei;
	fp_cnt_bits(&i, kn, FP_LEN*2);
	for(j = i - 1; j > 0; j--){
		mam_ith_bit(ei, kn, j);
		if(ei == 1){
			fp_hdy_2e127m1_x8664_asm(t->X1, t->Y1, t->Z1, t->T1);
			fp_hdy_2e127m1_x8664_asm(t->X2, t->Y2, t->Z2, t->T2);
			fp_mul_2e127m1_x8664_asm(t->X2, NULL, NULL, t->X1, t->X2);
			fp_ml3_2e127m1_x8664_asm(t->n01, NULL, NULL, t->Y1);                      /* mul by -{cn->yd} */
			fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->Z1, cn->zd);
			fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->T1, cn->td);
			fp_sqr_2e127m1_x8664_asm(t->X1, NULL, NULL, t->X1);
			fp_mul_2e127m1_x8664_asm(t->Y1, NULL, NULL, t->Y1, t->n01);
			fp_mul_2e127m1_x8664_asm(t->Z1, NULL, NULL, t->Z1, t->n02);
			fp_mul_2e127m1_x8664_asm(t->T1, NULL, NULL, t->T1, t->n03);
			fp_mul_2e127m1_x8664_asm(t->Y2, NULL, NULL, t->n01, t->Y2);
			fp_mul_2e127m1_x8664_asm(t->Z2, NULL, NULL, t->n02, t->Z2);
			fp_mul_2e127m1_x8664_asm(t->T2, NULL, NULL, t->n03, t->T2);
			fp_hdy_2e127m1_x8664_asm(t->X1, t->Y1, t->Z1, t->T1);
			fp_hdy_2e127m1_x8664_asm(t->X2, t->Y2, t->Z2, t->T2);
			fp_sqr_2e127m1_x8664_asm(t->X1, NULL, NULL, t->X1);
			fp_ml2_2e127m1_x8664_asm(t->X1, NULL, NULL, t->X1);                       /* mul by {cn->x0} */
			fp_sqr_2e127m1_x8664_asm(t->Y1, NULL, NULL, t->Y1);
			fp_sqr_2e127m1_x8664_asm(t->Z1, NULL, NULL, t->Z1);
			fp_sqr_2e127m1_x8664_asm(t->T1, NULL, NULL, t->T1);
			fp_sqr_2e127m1_x8664_asm(t->X2, NULL, NULL, t->X2);
			fp_sqr_2e127m1_x8664_asm(t->Y2, NULL, NULL, t->Y2);
			fp_sqr_2e127m1_x8664_asm(t->Z2, NULL, NULL, t->Z2);
			fp_sqr_2e127m1_x8664_asm(t->T2, NULL, NULL, t->T2);
			fp_mul_2e127m1_x8664_asm(t->Z1, NULL, NULL, t->Z1, cn->z0);
			fp_mul_2e127m1_x8664_asm(t->T1, NULL, NULL, t->T1, cn->t0);
			fp_mul_2e127m1_x8664_asm(t->Y2, NULL, NULL, t->Y2, cn->yb);         /* mul by -{cn->yb} */
			fp_mul_2e127m1_x8664_asm(t->Z2, NULL, NULL, t->Z2, cn->zb);
			fp_mul_2e127m1_x8664_asm(t->T2, NULL, NULL, t->T2, cn->tb);
		}
		else{
			fp_hdy_2e127m1_x8664_asm(t->X2, t->Y2, t->Z2, t->T2);
			fp_hdy_2e127m1_x8664_asm(t->X1, t->Y1, t->Z1, t->T1);
			fp_mul_2e127m1_x8664_asm(t->X1, NULL, NULL, t->X2, t->X1);
			fp_ml3_2e127m1_x8664_asm(t->n01, NULL, NULL, t->Y2);                      /* mul by -{cn->yd} */
			fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->Z2, cn->zd);
			fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->T2, cn->td);
			fp_sqr_2e127m1_x8664_asm(t->X2, NULL, NULL, t->X2);
			fp_mul_2e127m1_x8664_asm(t->Y2, NULL, NULL, t->Y2, t->n01);
			fp_mul_2e127m1_x8664_asm(t->Z2, NULL, NULL, t->Z2, t->n02);
			fp_mul_2e127m1_x8664_asm(t->T2, NULL, NULL, t->T2, t->n03);
			fp_mul_2e127m1_x8664_asm(t->Y1, NULL, NULL, t->n01, t->Y1);
			fp_mul_2e127m1_x8664_asm(t->Z1, NULL, NULL, t->n02, t->Z1);
			fp_mul_2e127m1_x8664_asm(t->T1, NULL, NULL, t->n03, t->T1);
			fp_hdy_2e127m1_x8664_asm(t->X2, t->Y2, t->Z2, t->T2);
			fp_hdy_2e127m1_x8664_asm(t->X1, t->Y1, t->Z1, t->T1);
			fp_sqr_2e127m1_x8664_asm(t->X2, NULL, NULL, t->X2);
			fp_ml2_2e127m1_x8664_asm(t->X2, NULL, NULL, t->X2);                       /* mul by {cn->x0} */
			fp_sqr_2e127m1_x8664_asm(t->Y2, NULL, NULL, t->Y2);
			fp_sqr_2e127m1_x8664_asm(t->Z2, NULL, NULL, t->Z2);
			fp_sqr_2e127m1_x8664_asm(t->T2, NULL, NULL, t->T2);
			fp_sqr_2e127m1_x8664_asm(t->X1, NULL, NULL, t->X1);
			fp_sqr_2e127m1_x8664_asm(t->Y1, NULL, NULL, t->Y1);
			fp_sqr_2e127m1_x8664_asm(t->Z1, NULL, NULL, t->Z1);
			fp_sqr_2e127m1_x8664_asm(t->T1, NULL, NULL, t->T1);
			fp_mul_2e127m1_x8664_asm(t->Z2, NULL, NULL, t->Z2, cn->z0);
			fp_mul_2e127m1_x8664_asm(t->T2, NULL, NULL, t->T2, cn->t0);
			fp_mul_2e127m1_x8664_asm(t->Y1, NULL, NULL, t->Y1, cn->yb);         /* mul by -{cn->yb} */
			fp_mul_2e127m1_x8664_asm(t->Z1, NULL, NULL, t->Z1, cn->zb);
			fp_mul_2e127m1_x8664_asm(t->T1, NULL, NULL, t->T1, cn->tb);
		}
	}
	fp_neg_2e127m1_x8664_asm(cn->yb, NULL, NULL, cn->yb);  /* Fixed to the original value. */
	fp_cpy_2e127m1_x8664_asm(d2->X, NULL, NULL, t->X2);
	fp_neg_2e127m1_x8664_asm(d2->Y, NULL, NULL, t->Y2);
	fp_cpy_2e127m1_x8664_asm(d2->Z, NULL, NULL, t->Z2);
	fp_cpy_2e127m1_x8664_asm(d2->T, NULL, NULL, t->T2);
#endif
}
