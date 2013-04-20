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

#define WINDOW_SIZE_LTR 5
#define TABLE_SIZE_LTR (1 << (WINDOW_SIZE_LTR - 2))
/*#define AFFINE_LOOKUP*/

static void hec_fp_cpy_2e127m1_g2i(DIV_hec_fp_2e127m1_t D3, DIV_hec_fp_2e127m1_t D1){
	fp_cpy_2e127m1_x8664(D3->P, D1->P);
	fp_cpy_2e127m1_x8664(D3->R, D1->R);
	fp_cpy_2e127m1_x8664(D3->S, D1->S);
	fp_cpy_2e127m1_x8664(D3->T, D1->T);
	fp_cpy_2e127m1_x8664(D3->Z, D1->Z);
}

static void hec_fp_neg_2e127m1_g2i(DIV_hec_fp_2e127m1_t D3, DIV_hec_fp_2e127m1_t D1){
	fp_cpy_2e127m1_x8664(D3->P, D1->P);
	fp_cpy_2e127m1_x8664(D3->R, D1->R);
	fp_sub_2_2e127m1_x8664(D3->S, 0, D1->S);
	fp_sub_2_2e127m1_x8664(D3->T, 0, D1->T);
	fp_cpy_2e127m1_x8664(D3->Z, D1->Z);
}

static void hec_fp_dbl_2e127m1_g2i(DIV_hec_fp_2e127m1 d3, const DIV_hec_fp_2e127m1 d1, CNS_hec_fp_2e127m1 cn){
	TEMP_hec_fp_2e127m1_t t;

#ifdef GENERATED_ASM
	hec_fp_dbl_2e127m1_g2i_x8664_asm((uni)t, NULL, NULL, (uni)d3, (uni)d1, (uni)cn);
#else
	fp_mul_2e127m1_x8664(d3->R, d1->R, NULL, d1->Z);
	fp_sqr_2e127m1_x8664(t->n01, d1->Z);
	fp_sqr_2e127m1_x8664(t->n02, d1->P);
	fp_ml2_2e127m1_x8664(t->n03, t->n02);
	fp_ml2_2e127m1_x8664(t->n04, d3->R);
	fp_add_2e127m1_x8664(t->n05, t->n03, t->n04);
	fp_mul_2e127m1_x8664(t->n05, t->n05, NULL, d1->P);
	fp_sqr_2e127m1_x8664(t->n06, d1->S);
	fp_mul_2e127m1_x8664(t->n07, cn->a2, NULL, t->n01);
	fp_sub_2e127m1_x8664(t->n06, t->n07, t->n06);
	fp_mul_2e127m1_x8664(t->n06, t->n06, NULL, d1->Z);
	fp_add_2e127m1_x8664(t->n06, t->n06, t->n05);
	fp_mul_2e127m1_x8664(t->n01, cn->a3, NULL, t->n01);
	fp_add_2e127m1_x8664(t->n01, t->n01, t->n02);
	fp_sub_2e127m1_x8664(t->n04, t->n01, t->n04);
	fp_add_2e127m1_x8664(t->n04, t->n04, t->n03);
	fp_mul_2e127m1_x8664(d3->T, d1->T, NULL, d1->Z);
	fp_mul_2e127m1_x8664(t->n01, d1->P, NULL, d1->S);
	fp_ml2_2e127m1_x8664(t->n02, t->n01);
	fp_add_2e127m1_x8664(t->n01, t->n01, d3->T);
	fp_sub_2e127m1_x8664(t->n02, t->n02, d3->T);
	fp_add_2e127m1_x8664(t->n03, t->n03, d3->R);
	fp_mul_2e127m1_x8664(t->n03, d1->S, NULL, t->n03);
	fp_mul_2e127m1_x8664(t->n05, t->n03, NULL, t->n04);
	fp_mul_2e127m1_x8664(t->n07, t->n06, NULL, t->n02);
	fp_sub_2e127m1_x8664(t->n05, t->n05, t->n07);
	fp_mul_2e127m1_x8664(t->n06, t->n06, NULL, d1->S);
	fp_mul_2e127m1_x8664(t->n04, t->n04, NULL, t->n01);
	fp_sub_2e127m1_x8664(t->n04, t->n04, t->n06);
	fp_mul_2e127m1_x8664(t->n03, t->n03, NULL, d1->S);
	fp_mul_2e127m1_x8664(t->n01, t->n01, NULL, t->n02);
	fp_sub_2e127m1_x8664(t->n03, t->n03, t->n01);
	fp_mul_2e127m1_x8664(t->n01, t->n05, NULL, t->n04);
	fp_mul_2e127m1_x8664(t->n02, t->n03, NULL, t->n04);
	fp_sqr_2e127m1_x8664(t->n04, t->n04);
	fp_mul_2e127m1_x8664(t->n06, d3->R, NULL, t->n04);
	fp_mul_2e127m1_x8664(t->n07, t->n04, NULL, d1->Z);
	fp_mul_2e127m1_x8664(t->n04, t->n04, NULL, d1->P);
	fp_ml2_2e127m1_x8664(t->n03, t->n03);
	fp_sqr_2e127m1_x8664(t->n03, t->n03);
	fp_mul_2e127m1_x8664(t->n03, t->n03, NULL, d1->Z);
	fp_ml2_2e127m1_x8664(t->n02, t->n02);
	fp_mul_2e127m1_x8664(d3->R, t->n02, NULL, d1->Z);
	fp_mul_2e127m1_x8664(d3->S, d1->S, NULL, d3->R);
	fp_mul_2e127m1_x8664(d3->T, d3->T, NULL, t->n02);
	fp_sub_2e127m1_x8664(t->n02, t->n01, t->n04);
	fp_sqr_2e127m1_x8664(t->n05, t->n05);
	fp_ml2_2e127m1_x8664(t->n08, t->n03);
	fp_sub_2e127m1_x8664(t->n08, t->n08, t->n02);
	fp_sub_2e127m1_x8664(t->n08, t->n08, t->n01);
	fp_mul_2e127m1_x8664(t->n08, t->n08, NULL, d1->P);
	fp_add_2e127m1_x8664(t->n08, t->n08, t->n05);
	fp_ml2_2e127m1_x8664(t->n05, d3->S);
	fp_add_2e127m1_x8664(t->n08, t->n08, t->n05);
	fp_add_2e127m1_x8664(d3->S, t->n06, d3->S);
	fp_mul_2e127m1_x8664(t->n06, t->n06, NULL, t->n02);
	fp_ml2_2e127m1_x8664(d3->P, t->n02);
	fp_sub_2e127m1_x8664(d3->P, d3->P, t->n03);
	fp_sub_2e127m1_x8664(t->n02, d3->P, t->n02);
	fp_sub_2e127m1_x8664(t->n04, t->n04, d3->P);
	fp_mul_2e127m1_x8664(t->n04, t->n04, NULL, t->n02);
	fp_mul_2e127m1_x8664(t->n04, t->n04, NULL, d1->Z);
	fp_mul_2e127m1_x8664(d3->Z, d3->R, NULL, d1->Z);
	fp_sub_2e127m1_x8664(t->n01, t->n01, d3->P);
	fp_mul_2e127m1_x8664(d3->P, d3->P, NULL, d3->Z);
	fp_mul_2e127m1_x8664(d3->R, t->n08, NULL, d3->R);
	fp_sub_2e127m1_x8664(d3->S, d3->S, t->n08);
	fp_mul_2e127m1_x8664(d3->S, d3->S, NULL, t->n07);
	fp_sub_2e127m1_x8664(d3->S, t->n04, d3->S);
	fp_mul_2e127m1_x8664(d3->T, d3->T, NULL, t->n07);
	fp_mul_2e127m1_x8664(t->n01, t->n01, NULL, t->n08);
	fp_sub_2e127m1_x8664(t->n01, t->n01, t->n06);
	fp_sub_2e127m1_x8664(d3->T, t->n01, d3->T);
	fp_mul_2e127m1_x8664(d3->Z, d3->Z, NULL, t->n07);
#endif
}

static void hec_fp_add_2e127m1_g2i(DIV_hec_fp_2e127m1 d3, const DIV_hec_fp_2e127m1 d1, const DIV_hec_fp_2e127m1 d2, CNS_hec_fp_2e127m1 cn){
	TEMP_hec_fp_2e127m1_t t;

	if((d1->Z[0] == 0) && (d1->Z[1] == 0)){
		fp_cpy_2e127m1_x8664(d3->P, d2->P);
		fp_cpy_2e127m1_x8664(d3->R, d2->R);
		fp_cpy_2e127m1_x8664(d3->S, d2->S);
		fp_cpy_2e127m1_x8664(d3->T, d2->T);
		fp_cpy_2e127m1_x8664(d3->Z, d2->Z);
	}
	else if((d2->Z[0] == 0) && (d2->Z[1] == 0)){
		fp_cpy_2e127m1_x8664(d3->P, d1->P);
		fp_cpy_2e127m1_x8664(d3->R, d1->R);
		fp_cpy_2e127m1_x8664(d3->S, d1->S);
		fp_cpy_2e127m1_x8664(d3->T, d1->T);
		fp_cpy_2e127m1_x8664(d3->Z, d1->Z);
	}
	else{
#ifdef GENERATED_ASM
		hec_fp_add_2e127m1_g2i_x8664_asm((uni)t, NULL, NULL, (uni)d3, (uni)d1, (uni)d2);
#else
		fp_mul_2e127m1_x8664(d3->P, d1->P, NULL, d2->Z);
		fp_mul_2e127m1_x8664(d3->R, d1->R, NULL, d2->Z);
		fp_mul_2e127m1_x8664(t->n01, d1->T, NULL, d2->Z);
		fp_mul_2e127m1_x8664(t->n02, d2->T, NULL, d1->Z);
		fp_sub_2e127m1_x8664(t->n01, t->n01, t->n02);
		fp_mul_2e127m1_x8664(t->n02, d2->R, NULL, d1->Z);
		fp_mul_2e127m1_x8664(t->n03, d2->P, NULL, d1->Z);
		fp_mul_2e127m1_x8664(t->n04, t->n03, NULL, t->n02);
		fp_sub_2e127m1_x8664(t->n02, t->n02, d3->R);
		fp_sub_2e127m1_x8664(t->n05, d3->P, t->n03);
		fp_mul_2e127m1_x8664(t->n06, d3->P, NULL, d3->R);
		fp_sub_2e127m1_x8664(t->n04, t->n04, t->n06);
		fp_mul_2e127m1_x8664(t->n06, d2->S, NULL, d1->Z);
		fp_mul_2e127m1_x8664(d3->Z, d1->Z, NULL, d2->Z);
		fp_mul_2e127m1_x8664(t->n07, d1->S, NULL, d2->Z);
		fp_sub_2e127m1_x8664(t->n08, t->n07, t->n06);
		fp_add_2e127m1_x8664(t->n06, t->n07, t->n06);
		fp_sqr_2e127m1_x8664(t->n09, d3->P);
		fp_mul_2e127m1_x8664(t->n10, d3->Z, NULL, t->n02);
		fp_add_2e127m1_x8664(t->n10, t->n09, t->n10);
		fp_sqr_2e127m1_x8664(t->n11, t->n03);
		fp_add_2e127m1_x8664(t->n03, d3->P, t->n03);
		fp_sub_2e127m1_x8664(t->n12, t->n10, t->n11);
		fp_add_2e127m1_x8664(t->n11, t->n09, t->n11);
		fp_mul_2e127m1_x8664(t->n09, t->n04, NULL, t->n08);
		fp_mul_2e127m1_x8664(t->n04, t->n04, NULL, t->n05);
		fp_mul_2e127m1_x8664(t->n05, t->n01, NULL, t->n05);
		fp_mul_2e127m1_x8664(t->n01, t->n01, NULL, t->n12);
		fp_mul_2e127m1_x8664(t->n08, t->n02, NULL, t->n08);
		fp_mul_2e127m1_x8664(t->n02, t->n02, NULL, t->n12);
		fp_add_2e127m1_x8664(t->n01, t->n09, t->n01);
		fp_add_2e127m1_x8664(t->n05, t->n05, t->n08);
		fp_sub_2e127m1_x8664(t->n02, t->n02, t->n04);
		fp_mul_2e127m1_x8664(t->n04, t->n05, NULL, d3->Z);
		fp_mul_2e127m1_x8664(t->n08, t->n02, NULL, t->n04);
		fp_sqr_2e127m1_x8664(t->n02, t->n02);
		fp_mul_2e127m1_x8664(t->n05, t->n05, NULL, t->n04);
		fp_mul_2e127m1_x8664(t->n04, t->n01, NULL, t->n04);
		fp_mul_2e127m1_x8664(d3->P, d3->P, NULL, t->n05);
		fp_ml2_2e127m1_x8664(t->n09, t->n04);
		fp_sub_2e127m1_x8664(t->n09, t->n09, t->n02);
		fp_mul_2e127m1_x8664(t->n12, t->n05, NULL, t->n03);
		fp_sub_2e127m1_x8664(t->n09, t->n09, t->n12);
		fp_sub_2e127m1_x8664(t->n02, t->n09, t->n02);
		fp_mul_2e127m1_x8664(t->n02, t->n02, NULL, t->n03);
		fp_mul_2e127m1_x8664(t->n11, t->n05, NULL, t->n11);
		fp_add_2e127m1_x8664(t->n02, t->n02, t->n11);
		fp_dv2_2e127m1_x8664(t->n02, t->n02);
		fp_mul_2e127m1_x8664(t->n12, d3->Z, NULL, t->n05);
		fp_mul_2e127m1_x8664(d3->R, d3->R, NULL, t->n12);
		fp_mul_2e127m1_x8664(t->n12, t->n08, NULL, t->n12);
		fp_mul_2e127m1_x8664(t->n11, d2->Z, NULL, t->n12);
		fp_mul_2e127m1_x8664(d3->T, t->n11, NULL, d1->T);
		fp_mul_2e127m1_x8664(d3->S, t->n11, NULL, d1->S);
		fp_sub_2e127m1_x8664(t->n11, t->n04, t->n09);
		fp_sub_2e127m1_x8664(t->n04, d3->P, t->n04);
		fp_sqr_2e127m1_x8664(t->n01, t->n01);
		fp_mul_2e127m1_x8664(t->n06, t->n08, NULL, t->n06);
		fp_mul_2e127m1_x8664(t->n01, t->n01, NULL, d3->Z);
		fp_add_2e127m1_x8664(t->n01, t->n01, t->n06);
		fp_sub_2e127m1_x8664(t->n01, t->n01, t->n02);
		fp_sub_2e127m1_x8664(t->n02, t->n01, d3->R);
		fp_mul_2e127m1_x8664(t->n05, t->n02, NULL, t->n05);
		fp_mul_2e127m1_x8664(t->n02, t->n09, NULL, t->n11);
		fp_mul_2e127m1_x8664(t->n11, t->n01, NULL, t->n11);
		fp_mul_2e127m1_x8664(t->n06, d3->P, NULL, t->n04);
		fp_add_2e127m1_x8664(t->n06, t->n06, t->n02);
		fp_add_2e127m1_x8664(t->n05, t->n06, t->n05);
		fp_mul_2e127m1_x8664(t->n04, d3->R, NULL, t->n04);
		fp_add_2e127m1_x8664(t->n11, t->n04, t->n11);
		fp_mul_2e127m1_x8664(t->n09, t->n09, NULL, t->n08);
		fp_mul_2e127m1_x8664(d3->P, t->n09, NULL, d3->Z);
		fp_mul_2e127m1_x8664(d3->R, t->n01, NULL, t->n08);
		fp_mul_2e127m1_x8664(t->n05, t->n05, NULL, d3->Z);
		fp_sub_2e127m1_x8664(d3->S, t->n05, d3->S);
		fp_sub_2e127m1_x8664(d3->T, t->n11, d3->T);
		fp_mul_2e127m1_x8664(d3->Z, d3->Z, NULL, t->n12);
#endif
	}
}

static void hec_fp_madd_2e127m1_g2i(DIV_hec_fp_2e127m1 d3, const DIV_hec_fp_2e127m1 d1, const DIV_hec_fp_2e127m1 d2, CNS_hec_fp_2e127m1 cn){
	TEMP_hec_fp_2e127m1_t t;

	if((d1->Z[0] == 0) && (d1->Z[1] == 0)){
		fp_cpy_2e127m1_x8664(d3->P, d2->P);
		fp_cpy_2e127m1_x8664(d3->R, d2->R);
		fp_cpy_2e127m1_x8664(d3->S, d2->S);
		fp_cpy_2e127m1_x8664(d3->T, d2->T);
		fp_set_1_2e127m1_x8664(d3->Z, 1);
	}
	else{
#ifdef GENERATED_ASM
		hec_fp_madd_2e127m1_g2i_x8664_asm((uni)t, NULL, NULL, (uni)d3, (uni)d1, (uni)d2);
#else
		fp_mul_2e127m1_x8664(t->n01, d2->T, NULL, d1->Z);
		fp_sub_2e127m1_x8664(d3->T, d1->T, t->n01);
		fp_mul_2e127m1_x8664(t->n01, d2->S, NULL, d1->Z);
		fp_add_2e127m1_x8664(t->n02, t->n01, d1->S);
		fp_sub_2e127m1_x8664(t->n01, t->n01, d1->S);
		fp_mul_2e127m1_x8664(d3->S, d2->P, NULL, d1->Z);
		fp_add_2e127m1_x8664(t->n03, d3->S, d1->P);
		fp_mul_2e127m1_x8664(t->n04, d2->R, NULL, d1->Z);
		fp_mul_2e127m1_x8664(t->n05, d3->S, NULL, t->n04);
		fp_mul_2e127m1_x8664(t->n06, d1->P, NULL, d1->R);
		fp_sub_2e127m1_x8664(t->n06, t->n06, t->n05);
		fp_sub_2e127m1_x8664(d3->R, d1->R, t->n04);
		fp_sqr_2e127m1_x8664(t->n05, d3->S);
		fp_sqr_2e127m1_x8664(t->n07, d1->P);
		fp_sub_2e127m1_x8664(d3->P, d3->S, d1->P);
		fp_sub_2e127m1_x8664(t->n08, t->n05, t->n07);
		fp_add_2e127m1_x8664(t->n05, t->n05, t->n07);
		fp_mul_2e127m1_x8664(t->n07, d1->Z, NULL, d3->R);
		fp_add_2e127m1_x8664(t->n08, t->n07, t->n08);
		fp_mul_2e127m1_x8664(t->n07, t->n06, NULL, t->n01);
		fp_mul_2e127m1_x8664(t->n01, d3->R, NULL, t->n01);
		fp_mul_2e127m1_x8664(d3->R, d3->R, NULL, t->n08);
		fp_mul_2e127m1_x8664(t->n06, t->n06, NULL, d3->P);
		fp_mul_2e127m1_x8664(d3->P, d3->T, NULL, d3->P);
		fp_mul_2e127m1_x8664(t->n08, d3->T, NULL, t->n08);
		fp_sub_2e127m1_x8664(t->n07, t->n07, t->n08);
		fp_sub_2e127m1_x8664(t->n01, t->n01, d3->P);
		fp_sub_2e127m1_x8664(d3->R, d3->R, t->n06);
		fp_sqr_2e127m1_x8664(t->n08, d3->R);
		fp_mul_2e127m1_x8664(t->n06, t->n01, NULL, d1->Z);
		fp_mul_2e127m1_x8664(d3->R, d3->R, NULL, t->n06);
		fp_mul_2e127m1_x8664(t->n01, t->n01, NULL, t->n06);
		fp_mul_2e127m1_x8664(d3->S, t->n01, NULL, d3->S);
		fp_mul_2e127m1_x8664(t->n05, t->n01, NULL, t->n05);
		fp_mul_2e127m1_x8664(d3->T, t->n07, NULL, t->n06);
		fp_sqr_2e127m1_x8664(t->n06, t->n06);
		fp_sqr_2e127m1_x8664(t->n07, t->n07);
		fp_mul_2e127m1_x8664(t->n04, t->n04, NULL, t->n06);
		fp_mul_2e127m1_x8664(t->n06, d3->R, NULL, t->n06);
		fp_ml2_2e127m1_x8664(d3->P, d3->T);
		fp_sub_2e127m1_x8664(d3->P, d3->P, t->n08);
		fp_mul_2e127m1_x8664(t->n02, d3->R, NULL, t->n02);
		fp_mul_2e127m1_x8664(t->n07, t->n07, NULL, d1->Z);
		fp_add_2e127m1_x8664(t->n07, t->n07, t->n02);
		fp_mul_2e127m1_x8664(t->n02, t->n01, NULL, t->n03);
		fp_sub_2e127m1_x8664(d3->P, d3->P, t->n02);
		fp_sub_2e127m1_x8664(t->n08, d3->P, t->n08);
		fp_mul_2e127m1_x8664(t->n03, t->n03, NULL, t->n08);
		fp_add_2e127m1_x8664(t->n03, t->n03, t->n05);
		fp_dv2_2e127m1_x8664(t->n03, t->n03);
		fp_sub_2e127m1_x8664(t->n07, t->n07, t->n03);
		fp_sub_2e127m1_x8664(t->n08, d3->S, d3->T);
		fp_sub_2e127m1_x8664(d3->T, d3->T, d3->P);
		fp_sub_2e127m1_x8664(t->n05, t->n07, t->n04);
		fp_mul_2e127m1_x8664(d3->S, d3->S, NULL, t->n08);
		fp_mul_2e127m1_x8664(t->n01, t->n01, NULL, t->n05);
		fp_add_2e127m1_x8664(t->n01, t->n01, d3->S);
		fp_mul_2e127m1_x8664(d3->S, d3->P, NULL, d3->T);
		fp_add_2e127m1_x8664(d3->S, d3->S, t->n01);
		fp_mul_2e127m1_x8664(t->n04, t->n04, NULL, t->n08);
		fp_mul_2e127m1_x8664(d3->T, d3->T, NULL, t->n07);
		fp_add_2e127m1_x8664(d3->T, t->n04, d3->T);
		fp_mul_2e127m1_x8664(t->n04, t->n06, NULL, d2->S);
		fp_sub_2e127m1_x8664(d3->S, d3->S, t->n04);
		fp_mul_2e127m1_x8664(d3->P, d3->P, NULL, d1->Z);
		fp_mul_2e127m1_x8664(d3->P, d3->P, NULL, d3->R);
		fp_mul_2e127m1_x8664(d3->R, t->n07, NULL, d3->R);
		fp_mul_2e127m1_x8664(d3->S, d1->Z, NULL, d3->S);
		fp_mul_2e127m1_x8664(d3->Z, d1->Z, NULL, t->n06);
		fp_mul_2e127m1_x8664(t->n07, d3->Z, NULL, d2->T);
		fp_sub_2e127m1_x8664(d3->T, d3->T, t->n07);
#endif
	}
}

void hec_fp_smul_2e127m1_g2i(DIV_hec_fp_2e127m1 D1, const uni kn,  DIV_hec_fp_2e127m1 D2, CNS_hec_fp_2e127m1 cn)
{
	DIV_hec_fp_2e127m1_t D[TABLE_SIZE_LTR], mD2, tmD2;
	int i, j, ni, k, wd;

	hec_fp_neg_2e127m1_g2i(mD2, D2);
	fp_cnt_bits(&i, kn, FP_LEN*2); /*printf("%d ", i);*/
	if(i == 0){
		fp_set_1_2e127m1_x8664(D1->Z, 0); /* Marker for the identity. */
	}
	else{
		hec_fp_dbl_2e127m1_g2i(D[0], D2, cn); /* 2*D. */
		hec_fp_madd_2e127m1_g2i(D[1], D[0], D2, cn); /* 3*D. */
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			hec_fp_add_2e127m1_g2i(D[j], D[j-1], D[0], cn);
		}
#ifdef AFFINE_LOOKUP
		uni_t c[TABLE_SIZE_LTR][FP_LEN], u[FP_LEN], aa[TABLE_SIZE_LTR][FP_LEN];
		fp_cpy_2e127m1_x8664(c[0], D[0]->Z);
		for(j = 1; j < TABLE_SIZE_LTR; j++){
			fp_mul_2e127m1_x8664(c[j], D[j]->Z, NULL, c[j-1]);
		}
		fp_inv_2e127m1_x8664(u, c[TABLE_SIZE_LTR-1]);
		for(j = TABLE_SIZE_LTR-1; j > 0; j--){
			fp_mul_2e127m1_x8664(aa[j], c[j-1], NULL, u);
			fp_mul_2e127m1_x8664(u, D[j]->Z, NULL, u);
		}
		fp_cpy_2e127m1_x8664(aa[0], u);
		for(j = 0; j < TABLE_SIZE_LTR; j++){
			fp_mul_2e127m1_x8664(D[j]->P, aa[j], NULL, D[j]->P);
			fp_mul_2e127m1_x8664(D[j]->R, aa[j], NULL, D[j]->R);
			fp_mul_2e127m1_x8664(D[j]->S, aa[j], NULL, D[j]->S);
			fp_mul_2e127m1_x8664(D[j]->T, aa[j], NULL, D[j]->T);
			fp_set_1_2e127m1_x8664(D[j]->Z, 1);
		}
#endif
		find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
		i -= wd;
		if(ni > 0){
			ni >>= 1;
			if(ni == 0){
				hec_fp_cpy_2e127m1_g2i(D1, D2);
			}
			else{
				hec_fp_cpy_2e127m1_g2i(D1, D[ni]);
			}
		}
		else{
			ni = (-ni) >> 1;
			if(ni == 0){
				hec_fp_neg_2e127m1_g2i(D1, D2);
			}
			else{
				hec_fp_neg_2e127m1_g2i(D1, D[ni]);
			}
		}
		for(j = k - 1; i >= 0;){
			find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
			i -= wd;
			if(ni == 0){
				hec_fp_dbl_2e127m1_g2i(D1, D1, cn); //DBL1++;
				j--;
			}
			else{
				for(; j >= k; j--){
					hec_fp_dbl_2e127m1_g2i(D1, D1, cn); //DBL2++;
				}
#ifdef AFFINE_LOOKUP
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						hec_fp_madd_2e127m1_g2i(D1, D1, D2, cn); //DBL3++;

					}
					else{
						hec_fp_madd_2e127m1_g2i(D1, D1, D[ni], cn); //DBL3++;
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						hec_fp_madd_2e127m1_g2i(D1, D1, mD2, cn); //DBL3++;
					}
					else{
						hec_fp_neg_2e127m1_g2i(tmD2, D[ni]);
						hec_fp_madd_2e127m1_g2i(D1, D1, tmD2, cn); //DBL3++;
					}
				}
#else
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						hec_fp_madd_2e127m1_g2i(D1, D1, D2, cn); //DBL3++;

					}
					else{
						hec_fp_add_2e127m1_g2i(D1, D1, D[ni], cn); //DBL3++;
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						hec_fp_madd_2e127m1_g2i(D1, D1, mD2, cn); //DBL3++;
					}
					else{
						hec_fp_neg_2e127m1_g2i(tmD2, D[ni]);
						hec_fp_add_2e127m1_g2i(D1, D1, tmD2, cn); //DBL3++;
					}
				}
#endif
			}
		}
		for(; j >= 1; j--){
			hec_fp_dbl_2e127m1_g2i(D1, D1, cn); //DBL4++;
		};
	}
	/*These calls are for correcting the effect of incomplete additions. */
	fp_add_1_2e127m1_x8664(D1->P, D1->P, 1);
	fp_add_1_2e127m1_x8664(D1->R, D1->R, 1);
	fp_add_1_2e127m1_x8664(D1->S, D1->S, 1);
	fp_add_1_2e127m1_x8664(D1->T, D1->T, 1);
	fp_add_1_2e127m1_x8664(D1->Z, D1->Z, 1);
	fp_sub_1_2e127m1_x8664(D1->P, D1->P, 1);
	fp_sub_1_2e127m1_x8664(D1->R, D1->R, 1);
	fp_sub_1_2e127m1_x8664(D1->S, D1->S, 1);
	fp_sub_1_2e127m1_x8664(D1->T, D1->T, 1);
	fp_sub_1_2e127m1_x8664(D1->Z, D1->Z, 1);
}

void hec_fp_smulcached_2e127m1_g2i(DIV_hec_fp_2e127m1 D1, const uni kn, unsigned char *D2, CNS_hec_fp_2e127m1 cn, int slice, int window, int csize)
{
	unsigned int i, j, k, c, m, n, p, ei, e[slice];

	fp_set_1_2e127m1_x8664(D1->Z, 0);
	k = 256/(window*slice);

	for(i = k; i > 0; i--){
		p = 0;
		for(c = 0; c < slice; c++){
			e[c] = 0;
			n = 0;
			for(j = 0; j < window; j++){
				mam_ith_bit(ei, kn, i + n + p);
				e[c] |= (ei << j);
				n += (256/window);
			}
			e[c] <<= 6;
			p += k;
		}
		hec_fp_dbl_2e127m1_g2i(D1, D1, cn);
		for(n = 0, j = 0; j < slice; j++, n += csize){
			if(e[j] != 0){
				m = (e[j] + n);
				hec_fp_madd_2e127m1_g2i(D1, D1, (DIV_hec_fp_2e127m1)(D2 + m), cn);
			}
		}
	}
	/*These calls are for correcting the effect of incomplete additions. */
	fp_add_1_2e127m1_x8664(D1->P, D1->P, 1);
	fp_add_1_2e127m1_x8664(D1->R, D1->R, 1);
	fp_add_1_2e127m1_x8664(D1->S, D1->S, 1);
	fp_add_1_2e127m1_x8664(D1->T, D1->T, 1);
	fp_add_1_2e127m1_x8664(D1->Z, D1->Z, 1);
	fp_sub_1_2e127m1_x8664(D1->P, D1->P, 1);
	fp_sub_1_2e127m1_x8664(D1->R, D1->R, 1);
	fp_sub_1_2e127m1_x8664(D1->S, D1->S, 1);
	fp_sub_1_2e127m1_x8664(D1->T, D1->T, 1);
	fp_sub_1_2e127m1_x8664(D1->Z, D1->Z, 1);
}
