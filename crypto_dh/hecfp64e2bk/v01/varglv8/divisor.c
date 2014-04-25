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

void hec_fp_cpy_2e064mce2_g2i(DIV_hec_fp_2e064mce2 D3, DIV_hec_fp_2e064mce2 D1, CNS_hec_fp_2e064mce2 cn){
	fp_cpy_2e064mce2_x8664(D3->P, cn->prm, NULL, D1->P);
	fp_cpy_2e064mce2_x8664(D3->R, cn->prm, NULL, D1->R);
	fp_cpy_2e064mce2_x8664(D3->S, cn->prm, NULL, D1->S);
	fp_cpy_2e064mce2_x8664(D3->T, cn->prm, NULL, D1->T);
	fp_cpy_2e064mce2_x8664(D3->Z, cn->prm, NULL, D1->Z);
}

void hec_fp_neg_2e064mce2_g2i(DIV_hec_fp_2e064mce2 D3, DIV_hec_fp_2e064mce2 D1, CNS_hec_fp_2e064mce2 cn){
	fp_cpy_2e064mce2_x8664(D3->P, cn->prm, NULL, D1->P);
	fp_cpy_2e064mce2_x8664(D3->R, cn->prm, NULL, D1->R);
	fp_neg_2e064mce2_x8664(D3->S, cn->prm, NULL, D1->S);
	fp_neg_2e064mce2_x8664(D3->T, cn->prm, NULL, D1->T);
	fp_cpy_2e064mce2_x8664(D3->Z, cn->prm, NULL, D1->Z);
}

void hec_fp_dbl_2e064mce2_g2i(DIV_hec_fp_2e064mce2 d3, const DIV_hec_fp_2e064mce2 d1, CNS_hec_fp_2e064mce2 cn){
	TEMP_hec_fp_2e064mce2_t t;

#ifdef GENERATED_ASM
	hec_fp_dbl_2e064mce2_g2i_x8664_asm((uni)t, cn->prm, NULL, (uni)d3, (uni)d1, (uni)cn);
#else
	fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, d1->R, d1->Z);
	fp_sqr_2e064mce2_x8664(t->n01, cn->prm, NULL, d1->Z);
	fp_sqr_2e064mce2_x8664(t->n02, cn->prm, NULL, d1->P);
	fp_ml2_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n02);
	fp_ml2_2e064mce2_x8664(t->n04, cn->prm, NULL, d3->R);
	fp_add_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n03, t->n04);
	fp_mul_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n05, d1->P);
	fp_sqr_2e064mce2_x8664(t->n06, cn->prm, NULL, d1->S);
	fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, cn->a2, t->n01);
	fp_sub_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n07, t->n06);
	fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06, d1->Z);
	fp_add_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06, t->n05);
	fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, cn->a3, t->n01);
	fp_add_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n02);
	fp_sub_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n01, t->n04);
	fp_add_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, t->n03);
	fp_mul_2e064mce2_x8664(d3->T, cn->prm, NULL, d1->T, d1->Z);
	fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, d1->P, d1->S);
	fp_ml2_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n01);
	fp_add_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, d3->T);
	fp_sub_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n02, d3->T);
	fp_add_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03, d3->R);
	fp_mul_2e064mce2_x8664(t->n03, cn->prm, NULL, d1->S, t->n03);
	fp_mul_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n03, t->n04);
	fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n06, t->n02);
	fp_sub_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n05, t->n07);
	fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06, d1->S);
	fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, t->n01);
	fp_sub_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, t->n06);
	fp_mul_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03, d1->S);
	fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n02);
	fp_sub_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03, t->n01);
	fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n05, t->n04);
	fp_mul_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n03, t->n04);
	fp_sqr_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04);
	fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, d3->R, t->n04);
	fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n04, d1->Z);
	fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, d1->P);
	fp_ml2_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03);
	fp_sqr_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03);
	fp_mul_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03, d1->Z);
	fp_ml2_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n02);
	fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, t->n02, d1->Z);
	fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, d1->S, d3->R);
	fp_mul_2e064mce2_x8664(d3->T, cn->prm, NULL, d3->T, t->n02);
	fp_sub_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n01, t->n04);
	fp_sqr_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n05);
	fp_ml2_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n03);
	fp_sub_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n08, t->n02);
	fp_sub_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n08, t->n01);
	fp_mul_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n08, d1->P);
	fp_add_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n08, t->n05);
	fp_ml2_2e064mce2_x8664(t->n05, cn->prm, NULL, d3->S);
	fp_add_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n08, t->n05);
	fp_add_2e064mce2_x8664(d3->S, cn->prm, NULL, t->n06, d3->S);
	fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06, t->n02);
	fp_ml2_2e064mce2_x8664(d3->P, cn->prm, NULL, t->n02);
	fp_sub_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->P, t->n03);
	fp_sub_2e064mce2_x8664(t->n02, cn->prm, NULL, d3->P, t->n02);
	fp_sub_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, d3->P);
	fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, t->n02);
	fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, d1->Z);
	fp_mul_2e064mce2_x8664(d3->Z, cn->prm, NULL, d3->R, d1->Z);
	fp_sub_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, d3->P);
	fp_mul_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->P, d3->Z);
	fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, t->n08, d3->R);
	fp_sub_2e064mce2_x8664(d3->S, cn->prm, NULL, d3->S, t->n08);
	fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, d3->S, t->n07);
	fp_sub_2e064mce2_x8664(d3->S, cn->prm, NULL, t->n04, d3->S);
	fp_mul_2e064mce2_x8664(d3->T, cn->prm, NULL, d3->T, t->n07);
	fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n08);
	fp_sub_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n06);
	fp_sub_2e064mce2_x8664(d3->T, cn->prm, NULL, t->n01, d3->T);
	fp_mul_2e064mce2_x8664(d3->Z, cn->prm, NULL, d3->Z, t->n07);
#endif
}

void hec_fp_dbl_2e064mce2_g2i_a2is0_a3is0(DIV_hec_fp_2e064mce2 d3, const DIV_hec_fp_2e064mce2 d1, CNS_hec_fp_2e064mce2 cn){
	TEMP_hec_fp_2e064mce2_t t;

#ifdef GENERATED_ASM
	hec_fp_dbl_2e064mce2_g2i_a2is0_a3is0_x8664_asm((uni)t, cn->prm, NULL, (uni)d3, (uni)d1, NULL);
#else
	fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, d1->R, d1->Z);
	fp_sqr_2e064mce2_x8664(t->n01, cn->prm, NULL, d1->Z);
	fp_sqr_2e064mce2_x8664(t->n02, cn->prm, NULL, d1->P);
	fp_ml2_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n02);
	fp_ml2_2e064mce2_x8664(t->n04, cn->prm, NULL, d3->R);
	fp_add_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n03, t->n04);
	fp_mul_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n05, d1->P);
	fp_sqr_2e064mce2_x8664(t->n06, cn->prm, NULL, d1->S);
	fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06, d1->Z);
	fp_sub_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n05, t->n06);
	fp_sub_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n02, t->n04);
	fp_add_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, t->n03);
	fp_mul_2e064mce2_x8664(d3->T, cn->prm, NULL, d1->T, d1->Z);
	fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, d1->P, d1->S);
	fp_ml2_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n01);
	fp_add_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, d3->T);
	fp_sub_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n02, d3->T);
	fp_add_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03, d3->R);
	fp_mul_2e064mce2_x8664(t->n03, cn->prm, NULL, d1->S, t->n03);
	fp_mul_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n03, t->n04);
	fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n06, t->n02);
	fp_sub_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n05, t->n07);
	fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06, d1->S);
	fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, t->n01);
	fp_sub_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, t->n06);
	fp_mul_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03, d1->S);
	fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n02);
	fp_sub_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03, t->n01);
	fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n05, t->n04);
	fp_mul_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n03, t->n04);
	fp_sqr_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04);
	fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, d3->R, t->n04);
	fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n04, d1->Z);
	fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, d1->P);
	fp_ml2_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03);
	fp_sqr_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03);
	fp_mul_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03, d1->Z);
	fp_ml2_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n02);
	fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, t->n02, d1->Z);
	fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, d1->S, d3->R);
	fp_mul_2e064mce2_x8664(d3->T, cn->prm, NULL, d3->T, t->n02);
	fp_sub_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n01, t->n04);
	fp_sqr_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n05);
	fp_ml2_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n03);
	fp_sub_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n08, t->n02);
	fp_sub_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n08, t->n01);
	fp_mul_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n08, d1->P);
	fp_add_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n08, t->n05);
	fp_ml2_2e064mce2_x8664(t->n05, cn->prm, NULL, d3->S);
	fp_add_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n08, t->n05);
	fp_add_2e064mce2_x8664(d3->S, cn->prm, NULL, t->n06, d3->S);
	fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06, t->n02);
	fp_ml2_2e064mce2_x8664(d3->P, cn->prm, NULL, t->n02);
	fp_sub_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->P, t->n03);
	fp_sub_2e064mce2_x8664(t->n02, cn->prm, NULL, d3->P, t->n02);
	fp_sub_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, d3->P);
	fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, t->n02);
	fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, d1->Z);
	fp_mul_2e064mce2_x8664(d3->Z, cn->prm, NULL, d3->R, d1->Z);
	fp_sub_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, d3->P);
	fp_mul_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->P, d3->Z);
	fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, t->n08, d3->R);
	fp_sub_2e064mce2_x8664(d3->S, cn->prm, NULL, d3->S, t->n08);
	fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, d3->S, t->n07);
	fp_sub_2e064mce2_x8664(d3->S, cn->prm, NULL, t->n04, d3->S);
	fp_mul_2e064mce2_x8664(d3->T, cn->prm, NULL, d3->T, t->n07);
	fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n08);
	fp_sub_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n06);
	fp_sub_2e064mce2_x8664(d3->T, cn->prm, NULL, t->n01, d3->T);
	fp_mul_2e064mce2_x8664(d3->Z, cn->prm, NULL, d3->Z, t->n07);
#endif
}

void hec_fp_add_2e064mce2_g2i(DIV_hec_fp_2e064mce2 d3, const DIV_hec_fp_2e064mce2 d1, const DIV_hec_fp_2e064mce2 d2, CNS_hec_fp_2e064mce2 cn){
	TEMP_hec_fp_2e064mce2_t t;

	if((d1->Z[0] == 0) && (d1->Z[1] == 0)){
		fp_cpy_2e064mce2_x8664(d3->P, cn->prm, NULL, d2->P);
		fp_cpy_2e064mce2_x8664(d3->R, cn->prm, NULL, d2->R);
		fp_cpy_2e064mce2_x8664(d3->S, cn->prm, NULL, d2->S);
		fp_cpy_2e064mce2_x8664(d3->T, cn->prm, NULL, d2->T);
		fp_cpy_2e064mce2_x8664(d3->Z, cn->prm, NULL, d2->Z);
	}
	else if((d2->Z[0] == 0) && (d2->Z[1] == 0)){
		fp_cpy_2e064mce2_x8664(d3->P, cn->prm, NULL, d1->P);
		fp_cpy_2e064mce2_x8664(d3->R, cn->prm, NULL, d1->R);
		fp_cpy_2e064mce2_x8664(d3->S, cn->prm, NULL, d1->S);
		fp_cpy_2e064mce2_x8664(d3->T, cn->prm, NULL, d1->T);
		fp_cpy_2e064mce2_x8664(d3->Z, cn->prm, NULL, d1->Z);
	}
	else{
#ifdef GENERATED_ASM
		hec_fp_add_2e064mce2_g2i_x8664_asm((uni)t, cn->prm, NULL, (uni)d3, (uni)d1, (uni)d2);
#else
		fp_mul_2e064mce2_x8664(d3->P, cn->prm, NULL, d1->P, d2->Z);
		fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, d1->R, d2->Z);
		fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, d1->T, d2->Z);
		fp_mul_2e064mce2_x8664(t->n02, cn->prm, NULL, d2->T, d1->Z);
		fp_sub_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n02);
		fp_mul_2e064mce2_x8664(t->n02, cn->prm, NULL, d2->R, d1->Z);
		fp_mul_2e064mce2_x8664(t->n03, cn->prm, NULL, d2->P, d1->Z);
		fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n03, t->n02);
		fp_sub_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n02, d3->R);
		fp_sub_2e064mce2_x8664(t->n05, cn->prm, NULL, d3->P, t->n03);
		fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, d3->P, d3->R);
		fp_sub_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, t->n06);
		fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, d2->S, d1->Z);
		fp_mul_2e064mce2_x8664(d3->Z, cn->prm, NULL, d1->Z, d2->Z);
		fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, d1->S, d2->Z);
		fp_sub_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n07, t->n06);
		fp_add_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n07, t->n06);
		fp_sqr_2e064mce2_x8664(t->n09, cn->prm, NULL, d3->P);
		fp_mul_2e064mce2_x8664(t->n10, cn->prm, NULL, d3->Z, t->n02);
		fp_add_2e064mce2_x8664(t->n10, cn->prm, NULL, t->n09, t->n10);
		fp_sqr_2e064mce2_x8664(t->n11, cn->prm, NULL, t->n03);
		fp_add_2e064mce2_x8664(t->n03, cn->prm, NULL, d3->P, t->n03);
		fp_sub_2e064mce2_x8664(t->n12, cn->prm, NULL, t->n10, t->n11);
		fp_add_2e064mce2_x8664(t->n11, cn->prm, NULL, t->n09, t->n11);
		fp_mul_2e064mce2_x8664(t->n09, cn->prm, NULL, t->n04, t->n08);
		fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, t->n05);
		fp_mul_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n01, t->n05);
		fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n12);
		fp_mul_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n02, t->n08);
		fp_mul_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n02, t->n12);
		fp_add_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n09, t->n01);
		fp_add_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n05, t->n08);
		fp_sub_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n02, t->n04);
		fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n05, d3->Z);
		fp_mul_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n02, t->n04);
		fp_sqr_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n02);
		fp_mul_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n05, t->n04);
		fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n01, t->n04);
		fp_mul_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->P, t->n05);
		fp_ml2_2e064mce2_x8664(t->n09, cn->prm, NULL, t->n04);
		fp_sub_2e064mce2_x8664(t->n09, cn->prm, NULL, t->n09, t->n02);
		fp_mul_2e064mce2_x8664(t->n12, cn->prm, NULL, t->n05, t->n03);
		fp_sub_2e064mce2_x8664(t->n09, cn->prm, NULL, t->n09, t->n12);
		fp_sub_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n09, t->n02);
		fp_mul_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n02, t->n03);
		fp_mul_2e064mce2_x8664(t->n11, cn->prm, NULL, t->n05, t->n11);
		fp_add_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n02, t->n11);
		fp_dv2_2e064mce2_x8664(t->n02, (cn->prm)/2-1, NULL, t->n02);
		fp_mul_2e064mce2_x8664(t->n12, cn->prm, NULL, d3->Z, t->n05);
		fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, d3->R, t->n12);
		fp_mul_2e064mce2_x8664(t->n12, cn->prm, NULL, t->n08, t->n12);
		fp_mul_2e064mce2_x8664(t->n11, cn->prm, NULL, d2->Z, t->n12);
		fp_mul_2e064mce2_x8664(d3->T, cn->prm, NULL, t->n11, d1->T);
		fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, t->n11, d1->S);
		fp_sub_2e064mce2_x8664(t->n11, cn->prm, NULL, t->n04, t->n09);
		fp_sub_2e064mce2_x8664(t->n04, cn->prm, NULL, d3->P, t->n04);
		fp_sqr_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01);
		fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n08, t->n06);
		fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, d3->Z);
		fp_add_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n06);
		fp_sub_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n02);
		fp_sub_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n01, d3->R);
		fp_mul_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n02, t->n05);
		fp_mul_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n09, t->n11);
		fp_mul_2e064mce2_x8664(t->n11, cn->prm, NULL, t->n01, t->n11);
		fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, d3->P, t->n04);
		fp_add_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06, t->n02);
		fp_add_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n06, t->n05);
		fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, d3->R, t->n04);
		fp_add_2e064mce2_x8664(t->n11, cn->prm, NULL, t->n04, t->n11);
		fp_mul_2e064mce2_x8664(t->n09, cn->prm, NULL, t->n09, t->n08);
		fp_mul_2e064mce2_x8664(d3->P, cn->prm, NULL, t->n09, d3->Z);
		fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, t->n01, t->n08);
		fp_mul_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n05, d3->Z);
		fp_sub_2e064mce2_x8664(d3->S, cn->prm, NULL, t->n05, d3->S);
		fp_sub_2e064mce2_x8664(d3->T, cn->prm, NULL, t->n11, d3->T);
		fp_mul_2e064mce2_x8664(d3->Z, cn->prm, NULL, d3->Z, t->n12);
#endif
	}
}

void hec_fp_madd_2e064mce2_g2i(DIV_hec_fp_2e064mce2 d3, const DIV_hec_fp_2e064mce2 d1, const DIV_hec_fp_2e064mce2 d2, CNS_hec_fp_2e064mce2 cn){
	TEMP_hec_fp_2e064mce2_t t;

	if((d1->Z[0] == 0) && (d1->Z[1] == 0)){
		fp_cpy_2e064mce2_x8664(d3->P, cn->prm, NULL, d2->P);
		fp_cpy_2e064mce2_x8664(d3->R, cn->prm, NULL, d2->R);
		fp_cpy_2e064mce2_x8664(d3->S, cn->prm, NULL, d2->S);
		fp_cpy_2e064mce2_x8664(d3->T, cn->prm, NULL, d2->T);
		fp_st1_2e064mce2_x8664(d3->Z, cn->prm, NULL, 1);
	}
	else{
#ifdef GENERATED_ASM
		hec_fp_madd_2e064mce2_g2i_x8664_asm((uni)t, cn->prm, NULL, (uni)d3, (uni)d1, (uni)d2);
#else
		fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, d2->T, d1->Z);
		fp_sub_2e064mce2_x8664(d3->T, cn->prm, NULL, d1->T, t->n01);
		fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, d2->S, d1->Z);
		fp_add_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n01, d1->S);
		fp_sub_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, d1->S);
		fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, d2->P, d1->Z);
		fp_add_2e064mce2_x8664(t->n03, cn->prm, NULL, d3->S, d1->P);
		fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, d2->R, d1->Z);
		fp_mul_2e064mce2_x8664(t->n05, cn->prm, NULL, d3->S, t->n04);
		fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, d1->P, d1->R);
		fp_sub_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06, t->n05);
		fp_sub_2e064mce2_x8664(d3->R, cn->prm, NULL, d1->R, t->n04);
		fp_sqr_2e064mce2_x8664(t->n05, cn->prm, NULL, d3->S);
		fp_sqr_2e064mce2_x8664(t->n07, cn->prm, NULL, d1->P);
		fp_sub_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->S, d1->P);
		fp_sub_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n05, t->n07);
		fp_add_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n05, t->n07);
		fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, d1->Z, d3->R);
		fp_add_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n07, t->n08);
		fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n06, t->n01);
		fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, d3->R, t->n01);
		fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, d3->R, t->n08);
		fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06, d3->P);
		fp_mul_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->T, d3->P);
		fp_mul_2e064mce2_x8664(t->n08, cn->prm, NULL, d3->T, t->n08);
		fp_sub_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n07, t->n08);
		fp_sub_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, d3->P);
		fp_sub_2e064mce2_x8664(d3->R, cn->prm, NULL, d3->R, t->n06);
		fp_sqr_2e064mce2_x8664(t->n08, cn->prm, NULL, d3->R);
		fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n01, d1->Z);
		fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, d3->R, t->n06);
		fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n06);
		fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, t->n01, d3->S);
		fp_mul_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n01, t->n05);
		fp_mul_2e064mce2_x8664(d3->T, cn->prm, NULL, t->n07, t->n06);
		fp_sqr_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06);
		fp_sqr_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n07);
		fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, t->n06);
		fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, d3->R, t->n06);
		fp_ml2_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->T);
		fp_sub_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->P, t->n08);
		fp_mul_2e064mce2_x8664(t->n02, cn->prm, NULL, d3->R, t->n02);
		fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n07, d1->Z);
		fp_add_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n07, t->n02);
		fp_mul_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n01, t->n03);
		fp_sub_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->P, t->n02);
		fp_sub_2e064mce2_x8664(t->n08, cn->prm, NULL, d3->P, t->n08);
		fp_mul_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03, t->n08);
		fp_add_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03, t->n05);
		fp_dv2_2e064mce2_x8664(t->n03, (cn->prm)/2-1, NULL, t->n03);
		fp_sub_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n07, t->n03);
		fp_sub_2e064mce2_x8664(t->n08, cn->prm, NULL, d3->S, d3->T);
		fp_sub_2e064mce2_x8664(d3->T, cn->prm, NULL, d3->T, d3->P);
		fp_sub_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n07, t->n04);
		fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, d3->S, t->n08);
		fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n05);
		fp_add_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, d3->S);
		fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, d3->P, d3->T);
		fp_add_2e064mce2_x8664(d3->S, cn->prm, NULL, d3->S, t->n01);
		fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, t->n08);
		fp_mul_2e064mce2_x8664(d3->T, cn->prm, NULL, d3->T, t->n07);
		fp_add_2e064mce2_x8664(d3->T, cn->prm, NULL, t->n04, d3->T);
		fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n06, d2->S);
		fp_sub_2e064mce2_x8664(d3->S, cn->prm, NULL, d3->S, t->n04);
		fp_mul_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->P, d1->Z);
		fp_mul_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->P, d3->R);
		fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, t->n07, d3->R);
		fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, d1->Z, d3->S);
		fp_mul_2e064mce2_x8664(d3->Z, cn->prm, NULL, d1->Z, t->n06);
		fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, d3->Z, d2->T);
		fp_sub_2e064mce2_x8664(d3->T, cn->prm, NULL, d3->T, t->n07);
#endif
	}
}


void hec_fp_aadd_2e064mce2_g2i(DIV_hec_fp_2e064mce2 d3, const DIV_hec_fp_2e064mce2 d1, const DIV_hec_fp_2e064mce2 d2, CNS_hec_fp_2e064mce2 cn){
	TEMP_hec_fp_2e064mce2_t t;

#ifdef GENERATED_ASM
	hec_fp_aadd_2e064mce2_g2i_x8664_asm((uni)t, cn->prm, NULL, (uni)d3, (uni)d1, (uni)d2);
#else
	fp_sub_2e064mce2_x8664(d3->T, cn->prm, NULL, d1->T, d2->T);
	fp_add_2e064mce2_x8664(t->n02, cn->prm, NULL, d2->S, d1->S);
	fp_sub_2e064mce2_x8664(t->n01, cn->prm, NULL, d2->S, d1->S);
	fp_add_2e064mce2_x8664(t->n03, cn->prm, NULL, d2->P, d1->P);
	fp_mul_2e064mce2_x8664(t->n05, cn->prm, NULL, d2->P, d2->R);
	fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, d1->P, d1->R);
	fp_sub_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06, t->n05);
	fp_sub_2e064mce2_x8664(d3->R, cn->prm, NULL, d1->R, d2->R);
	fp_sqr_2e064mce2_x8664(t->n05, cn->prm, NULL, d2->P);
	fp_sqr_2e064mce2_x8664(t->n07, cn->prm, NULL, d1->P);
	fp_sub_2e064mce2_x8664(d3->P, cn->prm, NULL, d2->P, d1->P);
	fp_sub_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n05, t->n07);
	fp_add_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n05, t->n07);
	fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, d1->Z, d3->R);
	fp_add_2e064mce2_x8664(t->n08, cn->prm, NULL, t->n07, t->n08);
	fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n06, t->n01);
	fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, d3->R, t->n01);
	fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, d3->R, t->n08);
	fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06, d3->P);
	fp_mul_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->T, d3->P);
	fp_mul_2e064mce2_x8664(t->n08, cn->prm, NULL, d3->T, t->n08);
	fp_sub_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n07, t->n08);
	fp_sub_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, d3->P);
	fp_sub_2e064mce2_x8664(d3->R, cn->prm, NULL, d3->R, t->n06);
	fp_sqr_2e064mce2_x8664(t->n08, cn->prm, NULL, d3->R);
	fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n01, d1->Z);
	fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, d3->R, t->n06);
	fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n06);
	fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, t->n01, d2->P);
	fp_mul_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n01, t->n05);
	fp_mul_2e064mce2_x8664(d3->T, cn->prm, NULL, t->n07, t->n06);
	fp_sqr_2e064mce2_x8664(t->n06, cn->prm, NULL, t->n06);
	fp_sqr_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n07);
	fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, d2->R, t->n06);
	fp_mul_2e064mce2_x8664(t->n06, cn->prm, NULL, d3->R, t->n06);
	fp_ml2_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->T);
	fp_sub_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->P, t->n08);
	fp_mul_2e064mce2_x8664(t->n02, cn->prm, NULL, d3->R, t->n02);
	fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n07, d1->Z);
	fp_add_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n07, t->n02);
	fp_mul_2e064mce2_x8664(t->n02, cn->prm, NULL, t->n01, t->n03);
	fp_sub_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->P, t->n02);
	fp_sub_2e064mce2_x8664(t->n08, cn->prm, NULL, d3->P, t->n08);
	fp_mul_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03, t->n08);
	fp_add_2e064mce2_x8664(t->n03, cn->prm, NULL, t->n03, t->n05);
	fp_dv2_2e064mce2_x8664(t->n03, (cn->prm)/2-1, NULL, t->n03);
	fp_sub_2e064mce2_x8664(t->n07, cn->prm, NULL, t->n07, t->n03);
	fp_sub_2e064mce2_x8664(t->n08, cn->prm, NULL, d3->S, d3->T);
	fp_sub_2e064mce2_x8664(d3->T, cn->prm, NULL, d3->T, d3->P);
	fp_sub_2e064mce2_x8664(t->n05, cn->prm, NULL, t->n07, t->n04);
	fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, d3->S, t->n08);
	fp_mul_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, t->n05);
	fp_add_2e064mce2_x8664(t->n01, cn->prm, NULL, t->n01, d3->S);
	fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, d3->P, d3->T);
	fp_add_2e064mce2_x8664(d3->S, cn->prm, NULL, d3->S, t->n01);
	fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n04, t->n08);
	fp_mul_2e064mce2_x8664(d3->T, cn->prm, NULL, d3->T, t->n07);
	fp_add_2e064mce2_x8664(d3->T, cn->prm, NULL, t->n04, d3->T);
	fp_mul_2e064mce2_x8664(t->n04, cn->prm, NULL, t->n06, d2->S);
	fp_sub_2e064mce2_x8664(d3->S, cn->prm, NULL, d3->S, t->n04);
	fp_mul_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->P, d1->Z);
	fp_mul_2e064mce2_x8664(d3->P, cn->prm, NULL, d3->P, d3->R);
	fp_mul_2e064mce2_x8664(d3->R, cn->prm, NULL, t->n07, d3->R);
	fp_mul_2e064mce2_x8664(d3->S, cn->prm, NULL, d1->Z, d3->S);
	fp_mul_2e064mce2_x8664(d3->Z, cn->prm, NULL, d1->Z, t->n06);
	fp_mul_2e064mce2_x8664(t->n07, cn->prm, NULL, d3->Z, d2->T);
	fp_sub_2e064mce2_x8664(d3->T, cn->prm, NULL, d3->T, t->n07);
#endif
}
