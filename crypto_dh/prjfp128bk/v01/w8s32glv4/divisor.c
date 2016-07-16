////Huseyin Hisil, 2012-2014.

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

void hec_fp_cpy_2e128mc_g2i(TEMP_hec_fp_2e128mc t, DIV_hec_fp_2e128mc_t D3, DIV_hec_fp_2e128mc_t D1){
	fp_cpy_2e128mc_x8664_asm(D3->Q, t->cn->prm, NULL, D1->Q);
	fp_cpy_2e128mc_x8664_asm(D3->R, t->cn->prm, NULL, D1->R);
	fp_cpy_2e128mc_x8664_asm(D3->S, t->cn->prm, NULL, D1->S);
	fp_cpy_2e128mc_x8664_asm(D3->T, t->cn->prm, NULL, D1->T);
	fp_cpy_2e128mc_x8664_asm(D3->Z, t->cn->prm, NULL, D1->Z);
}

void hec_fp_neg_2e128mc_g2i(TEMP_hec_fp_2e128mc t, DIV_hec_fp_2e128mc_t D3, DIV_hec_fp_2e128mc_t D1){
	fp_cpy_2e128mc_x8664_asm(D3->Q, t->cn->prm, NULL, D1->Q);
	fp_cpy_2e128mc_x8664_asm(D3->R, t->cn->prm, NULL, D1->R);
	fp_neg_2e128mc_x8664_asm(D3->S, t->cn->prm, NULL, D1->S);
	fp_neg_2e128mc_x8664_asm(D3->T, t->cn->prm, NULL, D1->T);
	fp_cpy_2e128mc_x8664_asm(D3->Z, t->cn->prm, NULL, D1->Z);
}

/* Assumption: D2 ne 0. */
void hec_fp_add_2e128mc_g2i(TEMP_hec_fp_2e128mc t, DIV_hec_fp_2e128mc D2){
	if((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)){
		fp_cpy_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, D2->Q);
		fp_cpy_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, D2->R);
		fp_cpy_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, D2->S);
		fp_cpy_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, D2->T);
		fp_st1_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, 1);
	}else{
#ifdef GENERATED_ASM
		hec_fp_add_2e128mc_g2i_x8664_asm(t, D2);
#else

//		{
//			MI_t tt; tt->s = POSITIVE; tt->v->l = 2;
//			tt->v->n = t->D1->Q; mi_io_fprint_ln_stack(stdout, tt, 10);
//			tt->v->n = t->D1->R; mi_io_fprint_ln_stack(stdout, tt, 10);
//			tt->v->n = t->D1->S; mi_io_fprint_ln_stack(stdout, tt, 10);
//			tt->v->n = t->D1->T; mi_io_fprint_ln_stack(stdout, tt, 10);
//			tt->v->n = t->D1->Z; mi_io_fprint_ln_stack(stdout, tt, 10);
//			printf("\n");
//		}
//
//		{
//			MI_t tt; tt->s = POSITIVE; tt->v->l = 2;
//			tt->v->n = D2->Q; mi_io_fprint_ln_stack(stdout, tt, 10);
//			tt->v->n = D2->R; mi_io_fprint_ln_stack(stdout, tt, 10);
//			tt->v->n = D2->S; mi_io_fprint_ln_stack(stdout, tt, 10);
//			tt->v->n = D2->T; mi_io_fprint_ln_stack(stdout, tt, 10);
//			tt->v->n = D2->Z; mi_io_fprint_ln_stack(stdout, tt, 10);
//			printf("\n");
//		}

		fp_mul_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, D2->Z);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, D2->Z);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->T, D2->Z);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, D2->T, t->D1->Z);
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, D2->R, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, D2->Q, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n03, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n02, t->D1->R);
		fp_sub_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->D1->Q, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->Q, t->D1->R);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, D2->S, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->Z, D2->Z);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->D1->S, D2->Z);
		fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n07, t->n06);
		fp_add_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n07, t->n06);
		fp_sqr_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->D1->Q);
		fp_mul_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->D1->Z, t->n02);
		fp_add_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->n09, t->n10);
		fp_sqr_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n03);
		fp_add_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D1->Q, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n10, t->n11);
		fp_add_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n09, t->n11);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n04, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->n05);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n01, t->n05);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n12);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n02, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n02, t->n12);
		fp_add_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n09, t->n01);
		fp_add_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n05, t->n08);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n02, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n05, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n02, t->n04);
		fp_sqr_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n05, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n01, t->n04);
		fp_mul_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->n05);
		fp_ml2_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n04);
		fp_sub_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n09, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n05, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n09, t->n12);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n09, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n02, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n05, t->n11);
		fp_add_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n02, t->n11);

//		{
//			MI_t tt; tt->s = POSITIVE; tt->v->l = 2;
//			tt->v->n = t->n02; mi_io_fprint_ln_stack(stdout, tt, 10);
//		}

		fp_dv2_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n02);

//		{
//			MI_t tt; tt->s = POSITIVE; tt->v->l = 2;
//			tt->v->n = t->n02; mi_io_fprint_ln_stack(stdout, tt, 10);
//		}


		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->D1->Z, t->n05);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, t->n12);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n08, t->n12);
		fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, D2->Z, t->n12);
		fp_mul_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n11, t->D1->T);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n11, t->D1->S);
		fp_sub_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n04, t->n09);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->D1->Q, t->n04);
		fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n08, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->D1->Z);
		fp_add_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n06);
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01, t->D1->R);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n02, t->n05);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n09, t->n11);
		fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n01, t->n11);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->Q, t->n04);
		fp_add_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06, t->n02);
		fp_add_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n06, t->n05);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->D1->R, t->n04);
		fp_add_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n04, t->n11);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n09, t->n08);
		fp_mul_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->n09, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n01, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n05, t->D1->Z);
		fp_sub_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n05, t->D1->S);
		fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n11, t->D1->T);
		fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->Z, t->n12);

//		{
//			MI_t tt; tt->s = POSITIVE; tt->v->l = 2;
//			tt->v->n = t->D1->Q; mi_io_fprint_ln_stack(stdout, tt, 10);
//			tt->v->n = t->D1->R; mi_io_fprint_ln_stack(stdout, tt, 10);
//			tt->v->n = t->D1->S; mi_io_fprint_ln_stack(stdout, tt, 10);
//			tt->v->n = t->D1->T; mi_io_fprint_ln_stack(stdout, tt, 10);
//			tt->v->n = t->D1->Z; mi_io_fprint_ln_stack(stdout, tt, 10);
//			printf("\n");
//		}
//
//		exit(1);
#endif
	}
}

/* Assumption: D2 ne 0. */
void hec_fp_aadd_2e128mc_g2i(TEMP_hec_fp_2e128mc t, DIV_hec_fp_2e128mc D2){
	if((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)){
		fp_cpy_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, D2->Q);
		fp_cpy_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, D2->R);
		fp_cpy_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, D2->S);
		fp_cpy_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, D2->T);
		fp_st1_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, 1);
	}else{
#ifdef GENERATED_ASM
		hec_fp_aadd_2e128mc_g2i_x8664_asm(t, D2);
#else
		fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, D2->T);
		fp_add_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, D2->S, t->D1->S);
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, D2->S, t->D1->S);
		fp_add_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, D2->Q, t->D1->Q);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, D2->Q, D2->R);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->Q, t->D1->R);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06, t->n05);
		fp_sub_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, D2->R);
		fp_sqr_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, D2->Q);
		fp_sqr_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->D1->Q);
		fp_sub_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, D2->Q, t->D1->Q);
		fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n05, t->n07);
		fp_add_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n05, t->n07);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->D1->Z, t->D1->R);
		fp_add_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n07, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n06, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->R, t->n01);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06, t->D1->Q);
		fp_mul_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->T, t->D1->Q);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->T, t->n08);
		fp_sub_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n07, t->n08);
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->D1->Q);
		fp_sub_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, t->n06);
		fp_sqr_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->R);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n01, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n06);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n01, D2->Q);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n01, t->n05);
		fp_mul_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n07, t->n06);
		fp_sqr_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06);
		fp_sqr_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n07);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, D2->R, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->R, t->n06);
		fp_ml2_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->T);
		fp_sub_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->R, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n07, t->D1->Z);
		fp_add_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n07, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01, t->n03);
		fp_sub_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->Q, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03, t->n08);
		fp_add_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03, t->n05);
		fp_dv2_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n07, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->S, t->D1->T);
		fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, t->D1->Q);
		fp_sub_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n07, t->n04);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n05);
		fp_add_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->Q, t->D1->T);
		fp_add_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->n08);
		fp_mul_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, t->n07);
		fp_add_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n04, t->D1->T);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n06, D2->S);
		fp_sub_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->n04);
		fp_mul_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->D1->R);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n07, t->D1->R);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->Z, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->Z, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->D1->Z, D2->T);
		fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, t->n07);
#endif
	}
}

/* Assumption: D2 ne 0. */
void hec_fp_madd_2e128mc_g2i(TEMP_hec_fp_2e128mc t, DIV_hec_fp_2e128mc D2){
	if((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)){
		fp_cpy_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, D2->Q);
		fp_cpy_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, D2->R);
		fp_cpy_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, D2->S);
		fp_cpy_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, D2->T);
		fp_st1_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, 1);
	}else{
#ifdef GENERATED_ASM
		hec_fp_madd_2e128mc_g2i_x8664_asm(t, D2);
#else
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, D2->T, t->D1->Z);
		fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, D2->S, t->D1->Z);
		fp_add_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01, t->D1->S);
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, D2->Q, t->D1->Z);
		fp_add_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D1->S, t->D1->Q);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, D2->R, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->D1->S, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->Q, t->D1->R);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06, t->n05);
		fp_sub_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, t->n04);
		fp_sqr_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->D1->S);
		fp_sqr_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->D1->Q);
		fp_sub_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->S, t->D1->Q);
		fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n05, t->n07);
		fp_add_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n05, t->n07);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->D1->Z, t->D1->R);
		fp_add_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n07, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n06, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->R, t->n01);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06, t->D1->Q);
		fp_mul_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->T, t->D1->Q);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->T, t->n08);
		fp_sub_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n07, t->n08);
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->D1->Q);
		fp_sub_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, t->n06);
		fp_sqr_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->R);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n01, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n06);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n01, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n01, t->n05);
		fp_mul_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n07, t->n06);
		fp_sqr_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06);
		fp_sqr_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n07);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->R, t->n06);
		fp_ml2_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->T);
		fp_sub_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->R, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n07, t->D1->Z);
		fp_add_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n07, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01, t->n03);
		fp_sub_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->Q, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03, t->n08);
		fp_add_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03, t->n05);
		fp_dv2_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n07, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->S, t->D1->T);
		fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, t->D1->Q);
		fp_sub_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n07, t->n04);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n05);
		fp_add_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->Q, t->D1->T);
		fp_add_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->n08);
		fp_mul_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, t->n07);
		fp_add_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n04, t->D1->T);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n06, D2->S);
		fp_sub_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->n04);
		fp_mul_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->D1->R);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n07, t->D1->R);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->Z, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->Z, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->D1->Z, D2->T);
		fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, t->n07);
#endif
	}
}

void hec_fp_dbl_2e128mc_g2i(TEMP_hec_fp_2e128mc t){
#ifdef GENERATED_ASM
		hec_fp_dbl_2e128mc_g2i_x8664_asm(t);
#else
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, t->D1->Z);
		fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->Z);
		fp_sqr_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->Q);
		fp_ml2_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n02);
		fp_ml2_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->D1->R);
		fp_add_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n03, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n05, t->D1->Q);
		fp_sqr_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->cn->a2, t->n01);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n07, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06, t->D1->Z);
		fp_add_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06, t->n05);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->cn->a3, t->n01);
		fp_add_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n01, t->n04);
		fp_add_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->n03);
		fp_mul_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->Q, t->D1->S);
		fp_ml2_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01);
		fp_add_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->D1->T);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n02, t->D1->T);
		fp_add_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03, t->D1->R);
		fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D1->S, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n03, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n06, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n05, t->n07);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->n01);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n05, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n03, t->n04);
		fp_sqr_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->R, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n04, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->D1->Q);
		fp_ml2_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03);
		fp_sqr_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03, t->D1->Z);
		fp_ml2_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n02);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n02, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->D1->R);
		fp_mul_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01, t->n04);
		fp_sqr_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n05);
		fp_ml2_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n08, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n08, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n08, t->D1->Q);
		fp_add_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n08, t->n05);
		fp_ml2_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->D1->S);
		fp_add_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n08, t->n05);
		fp_add_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n06, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06, t->n02);
		fp_ml2_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->n02);
		fp_sub_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->Q, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->D1->Q);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->R, t->D1->Z);
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->D1->Q);
		fp_mul_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n08, t->D1->R);
		fp_sub_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->n08);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->n07);
		fp_sub_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n04, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, t->n07);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n08);
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n06);
		fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n01, t->D1->T);
		fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->Z, t->n07);
#endif
}

void hec_fp_dbl_2e128mc_g2i_a2a3is0(TEMP_hec_fp_2e128mc t){
#ifdef GENERATED_ASM
		hec_fp_dbl_2e128mc_g2i_x8664_asm_a2a3is0(t);
#else
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, t->D1->Z);
		fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->Z);
		fp_sqr_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->Q);
		fp_ml2_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n02);
		fp_ml2_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->D1->R);
		fp_add_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n03, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n05, t->D1->Q);
		fp_sqr_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06, t->D1->Z);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->n06);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n02, t->n04);
		fp_add_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->n03);
		fp_mul_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->Q, t->D1->S);
		fp_ml2_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01);
		fp_add_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->D1->T);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n02, t->D1->T);
		fp_add_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03, t->D1->R);
		fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D1->S, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n03, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n06, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n05, t->n07);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->n01);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n05, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n03, t->n04);
		fp_sqr_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->R, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n04, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->D1->Q);
		fp_ml2_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03);
		fp_sqr_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n03, t->D1->Z);
		fp_ml2_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n02);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n02, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->D1->R);
		fp_mul_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01, t->n04);
		fp_sqr_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n05);
		fp_ml2_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n08, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n08, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n08, t->D1->Q);
		fp_add_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n08, t->n05);
		fp_ml2_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->D1->S);
		fp_add_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n08, t->n05);
		fp_add_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n06, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n06, t->n02);
		fp_ml2_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->n02);
		fp_sub_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->Q, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->D1->Q);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n04, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->R, t->D1->Z);
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->D1->Q);
		fp_mul_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n08, t->D1->R);
		fp_sub_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->n08);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->n07);
		fp_sub_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n04, t->D1->S);
		fp_mul_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T, t->n07);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n08);
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n01, t->n06);
		fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n01, t->D1->T);
		fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->Z, t->n07);
#endif
}
