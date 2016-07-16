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

void hec_fp_cpy_2e127m1_g2i(DIV_hec_fp_2e127m1_t D3, DIV_hec_fp_2e127m1_t D1){
	fp_cpy_2e127m1_x8664_asm(D3->Q, NULL, NULL, D1->Q);
	fp_cpy_2e127m1_x8664_asm(D3->R, NULL, NULL, D1->R);
	fp_cpy_2e127m1_x8664_asm(D3->S, NULL, NULL, D1->S);
	fp_cpy_2e127m1_x8664_asm(D3->T, NULL, NULL, D1->T);
	fp_cpy_2e127m1_x8664_asm(D3->Z, NULL, NULL, D1->Z);
}

void hec_fp_neg_2e127m1_g2i(DIV_hec_fp_2e127m1_t D3, DIV_hec_fp_2e127m1_t D1){
	fp_cpy_2e127m1_x8664_asm(D3->Q, NULL, NULL, D1->Q);
	fp_cpy_2e127m1_x8664_asm(D3->R, NULL, NULL, D1->R);
	fp_neg_2e127m1_x8664_asm(D3->S, NULL, NULL, D1->S);
	fp_neg_2e127m1_x8664_asm(D3->T, NULL, NULL, D1->T);
	fp_cpy_2e127m1_x8664_asm(D3->Z, NULL, NULL, D1->Z);
}

/* Assumption: D2 ne 0. */
void hec_fp_add_2e127m1_g2i(TEMP_hec_fp_2e127m1 t, DIV_hec_fp_2e127m1 D2){
	if((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)){
		fp_cpy_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, D2->Q);
		fp_cpy_2e127m1_x8664_asm(t->D1->R, NULL, NULL, D2->R);
		fp_cpy_2e127m1_x8664_asm(t->D1->S, NULL, NULL, D2->S);
		fp_cpy_2e127m1_x8664_asm(t->D1->T, NULL, NULL, D2->T);
		fp_st1_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, 1);
	}else{
#ifdef GENERATED_ASM
		//ADD++;
		hec_fp_add_2e127m1_g2i_x8664_asm(t, D2);
#else
		fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, D2->Z);
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, D2->Z);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->T, D2->Z);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, D2->T, t->D1->Z);
		fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, D2->R, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, D2->Q, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n03, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n02, t->D1->R);
		fp_sub_2e127m1_x8664_asm(t->n05, NULL, NULL, t->D1->Q, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->D1->Q, t->D1->R);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, D2->S, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->Z, D2->Z);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->D1->S, D2->Z);
		fp_sub_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n07, t->n06);
		fp_add_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n07, t->n06);
		fp_sqr_2e127m1_x8664_asm(t->n09, NULL, NULL, t->D1->Q);
		fp_mul_2e127m1_x8664_asm(t->n10, NULL, NULL, t->D1->Z, t->n02);
		fp_add_2e127m1_x8664_asm(t->n10, NULL, NULL, t->n09, t->n10);
		fp_sqr_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n03);
		fp_add_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->Q, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n10, t->n11);
		fp_add_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n09, t->n11);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n04, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->n05);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n01, t->n05);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n12);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n02, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n02, t->n12);
		fp_add_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n09, t->n01);
		fp_add_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n05, t->n08);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n02, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n05, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n02, t->n04);
		fp_sqr_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n05, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n01, t->n04);
		fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->n05);
		fp_ml2_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n04);
		fp_sub_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n09, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n05, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n09, t->n12);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n09, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n02, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n05, t->n11);
		fp_add_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n02, t->n11);
		fp_dv2_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->D1->Z, t->n05);
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, t->n12);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n08, t->n12);
		fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, D2->Z, t->n12);
		fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n11, t->D1->T);
		fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n11, t->D1->S);
		fp_sub_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n04, t->n09);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->D1->Q, t->n04);
		fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n08, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->D1->Z);
		fp_add_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n06);
		fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01, t->D1->R);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n02, t->n05);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n09, t->n11);
		fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n01, t->n11);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->D1->Q, t->n04);
		fp_add_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n06, t->n02);
		fp_add_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n06, t->n05);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->D1->R, t->n04);
		fp_add_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n04, t->n11);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n09, t->n08);
		fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n09, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n01, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n05, t->D1->Z);
		fp_sub_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n05, t->D1->S);
		fp_sub_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n11, t->D1->T);
		fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->Z, t->n12);
#endif
	}
}

/* Assumption: D2 ne 0. */
void hec_fp_madd_2e127m1_g2i(TEMP_hec_fp_2e127m1 t, DIV_hec_fp_2e127m1 D2){
	if((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)){
		fp_cpy_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, D2->Q);
		fp_cpy_2e127m1_x8664_asm(t->D1->R, NULL, NULL, D2->R);
		fp_cpy_2e127m1_x8664_asm(t->D1->S, NULL, NULL, D2->S);
		fp_cpy_2e127m1_x8664_asm(t->D1->T, NULL, NULL, D2->T);
		fp_st1_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, 1);
	}else{
#ifdef GENERATED_ASM
		//MADD++;
		hec_fp_madd_2e127m1_g2i_x8664_asm(t, D2);
#else
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, D2->T, t->D1->Z);
		fp_sub_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->D1->T, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, D2->S, t->D1->Z);
		fp_add_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01, t->D1->S);
		fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, D2->Q, t->D1->Z);
		fp_add_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->S, t->D1->Q);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, D2->R, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->D1->S, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->D1->Q, t->D1->R);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n06, t->n05);
		fp_sub_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, t->n04);
		fp_sqr_2e127m1_x8664_asm(t->n05, NULL, NULL, t->D1->S);
		fp_sqr_2e127m1_x8664_asm(t->n07, NULL, NULL, t->D1->Q);
		fp_sub_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->S, t->D1->Q);
		fp_sub_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n05, t->n07);
		fp_add_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n05, t->n07);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->D1->Z, t->D1->R);
		fp_add_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n07, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n06, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->R, t->n01);
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n06, t->D1->Q);
		fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->T, t->D1->Q);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->T, t->n08);
		fp_sub_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n07, t->n08);
		fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->D1->Q);
		fp_sub_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, t->n06);
		fp_sqr_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->R);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n01, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n06);
		fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n01, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n01, t->n05);
		fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n07, t->n06);
		fp_sqr_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n06);
		fp_sqr_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n07);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->D1->R, t->n06);
		fp_ml2_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->T);
		fp_sub_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->R, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n07, t->D1->Z);
		fp_add_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n07, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01, t->n03);
		fp_sub_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->Q, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03, t->n08);
		fp_add_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03, t->n05);
		fp_dv2_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n07, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->S, t->D1->T);
		fp_sub_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->D1->T, t->D1->Q);
		fp_sub_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n07, t->n04);
		fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n05);
		fp_add_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->Q, t->D1->T);
		fp_add_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->n08);
		fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->D1->T, t->n07);
		fp_add_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n04, t->D1->T);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n06, D2->S);
		fp_sub_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->n04);
		fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->D1->R);
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n07, t->D1->R);
		fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->Z, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->Z, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->D1->Z, D2->T);
		fp_sub_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->D1->T, t->n07);
#endif
	}
}

void hec_fp_dbl_2e127m1_g2i(TEMP_hec_fp_2e127m1 t){
	if(!((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0))){
#ifdef GENERATED_ASM
		//DBL++;
		hec_fp_dbl_2e127m1_g2i_x8664_asm(t);
#else
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, t->D1->Z);
		fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->Z);
		fp_sqr_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->Q);
		fp_ml2_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n02);
		fp_ml2_2e127m1_x8664_asm(t->n04, NULL, NULL, t->D1->R);
		fp_add_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n03, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n05, t->D1->Q);
		fp_sqr_2e127m1_x8664_asm(t->n06, NULL, NULL, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->cn->a2, t->n01);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n07, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n06, t->D1->Z);
		fp_add_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n06, t->n05);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->cn->a3, t->n01);
		fp_add_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n01, t->n04);
		fp_add_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->n03);
		fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->D1->T, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->Q, t->D1->S);
		fp_ml2_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01);
		fp_add_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->D1->T);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n02, t->D1->T);
		fp_add_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03, t->D1->R);
		fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->S, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n03, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n06, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n05, t->n07);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n06, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->n01);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n05, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n03, t->n04);
		fp_sqr_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->D1->R, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n04, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->D1->Q);
		fp_ml2_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03);
		fp_sqr_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03, t->D1->Z);
		fp_ml2_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n02);
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n02, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->D1->R);
		fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->D1->T, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01, t->n04);
		fp_sqr_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n05);
		fp_ml2_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n08, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n08, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n08, t->D1->Q);
		fp_add_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n08, t->n05);
		fp_ml2_2e127m1_x8664_asm(t->n05, NULL, NULL, t->D1->S);
		fp_add_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n08, t->n05);
		fp_add_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n06, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n06, t->n02);
		fp_ml2_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n02);
		fp_sub_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->Q, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->D1->Q);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->R, t->D1->Z);
		fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->D1->Q);
		fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n08, t->D1->R);
		fp_sub_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->n08);
		fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->n07);
		fp_sub_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n04, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->D1->T, t->n07);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n08);
		fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n06);
		fp_sub_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n01, t->D1->T);
		fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->Z, t->n07);
#endif
	}
}

void hec_fp_dbl_2e127m1_g2i_a3is1(TEMP_hec_fp_2e127m1 t){
	if(!((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0))){
#ifdef GENERATED_ASM
		//DBL_a3is1++;
		hec_fp_dbl_2e127m1_g2i_x8664_asm_a3is1(t);
#else
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, t->D1->Z);
		fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->Z);
		fp_sqr_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->Q);
		fp_ml2_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n02);
		fp_ml2_2e127m1_x8664_asm(t->n04, NULL, NULL, t->D1->R);
		fp_add_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n03, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n05, t->D1->Q);
		fp_sqr_2e127m1_x8664_asm(t->n06, NULL, NULL, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->cn->a2, t->n01);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n07, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n06, t->D1->Z);
		fp_add_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n06, t->n05);
		fp_add_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n01, t->n04);
		fp_add_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->n03);
		fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->D1->T, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->Q, t->D1->S);
		fp_ml2_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01);
		fp_add_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->D1->T);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n02, t->D1->T);
		fp_add_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03, t->D1->R);
		fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->S, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n03, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n06, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n05, t->n07);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n06, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->n01);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n05, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n03, t->n04);
		fp_sqr_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->D1->R, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n04, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->D1->Q);
		fp_ml2_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03);
		fp_sqr_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n03, t->D1->Z);
		fp_ml2_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n02);
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n02, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->D1->R);
		fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->D1->T, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01, t->n04);
		fp_sqr_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n05);
		fp_ml2_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n08, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n08, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n08, t->D1->Q);
		fp_add_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n08, t->n05);
		fp_ml2_2e127m1_x8664_asm(t->n05, NULL, NULL, t->D1->S);
		fp_add_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n08, t->n05);
		fp_add_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n06, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n06, t->n02);
		fp_ml2_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n02);
		fp_sub_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->Q, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->D1->Q);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n04, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->R, t->D1->Z);
		fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->D1->Q);
		fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n08, t->D1->R);
		fp_sub_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->n08);
		fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->n07);
		fp_sub_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n04, t->D1->S);
		fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->D1->T, t->n07);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n08);
		fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n01, t->n06);
		fp_sub_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n01, t->D1->T);
		fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->Z, t->n07);
#endif
	}
}

