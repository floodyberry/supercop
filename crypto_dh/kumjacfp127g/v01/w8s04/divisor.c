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

void hec_fp_cpy_2e127m1_g2i_jac(DIV_hec_fp_2e127m1_t D3, DIV_hec_fp_2e127m1_t D1){
	fp_cpy_2e127m1_x8664_asm(D3->Q, NULL, NULL, D1->Q);
	fp_cpy_2e127m1_x8664_asm(D3->R, NULL, NULL, D1->R);
	fp_cpy_2e127m1_x8664_asm(D3->S, NULL, NULL, D1->S);
	fp_cpy_2e127m1_x8664_asm(D3->T, NULL, NULL, D1->T);
	fp_cpy_2e127m1_x8664_asm(D3->Z, NULL, NULL, D1->Z);
	fp_cpy_2e127m1_x8664_asm(D3->W, NULL, NULL, D1->W);
	fp_cpy_2e127m1_x8664_asm(D3->V, NULL, NULL, D1->V);
}

void hec_fp_neg_2e127m1_g2i_jac(DIV_hec_fp_2e127m1_t D3, DIV_hec_fp_2e127m1_t D1){
	fp_cpy_2e127m1_x8664_asm(D3->Q, NULL, NULL, D1->Q);
	fp_cpy_2e127m1_x8664_asm(D3->R, NULL, NULL, D1->R);
	fp_neg_2e127m1_x8664_asm(D3->S, NULL, NULL, D1->S);
	fp_neg_2e127m1_x8664_asm(D3->T, NULL, NULL, D1->T);
	fp_cpy_2e127m1_x8664_asm(D3->Z, NULL, NULL, D1->Z);
	fp_cpy_2e127m1_x8664_asm(D3->W, NULL, NULL, D1->W);
	fp_cpy_2e127m1_x8664_asm(D3->V, NULL, NULL, D1->V);
}

/* Assumption: D2 ne 0. */
void hec_fp_aadd_2e127m1_g2i_jac(TEMP_hec_fp_2e127m1 t, DIV_hec_fp_2e127m1 D2){
	if(((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)) || ((t->D1->W[0] == 0) && (t->D1->W[1] == 0))){
		fp_cpy_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, D2->Q);
		fp_cpy_2e127m1_x8664_asm(t->D1->R, NULL, NULL, D2->R);
		fp_cpy_2e127m1_x8664_asm(t->D1->S, NULL, NULL, D2->S);
		fp_cpy_2e127m1_x8664_asm(t->D1->T, NULL, NULL, D2->T);
		fp_cpy_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, D2->Z);
		fp_cpy_2e127m1_x8664_asm(t->D1->W, NULL, NULL, D2->W);
		fp_cpy_2e127m1_x8664_asm(t->D1->V, NULL, NULL, D2->V);
	}else{
#ifdef GENERATED_ASM
		//AADD++;
		hec_fp_aadd_2e127m1_g2i_jac_x8664_asm(t, D2);
#else
		fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->Q, D2->Q);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->R, D2->R);
		fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->S, D2->S);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->D1->T, D2->T);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n01, D2->Q);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n01, D2->R);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n02, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n01, t->n04);
		fp_sub_2e127m1_x8664_asm(t->D3->Z, NULL, NULL, t->n09, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n06, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n07, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n12, t->n11);
		fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n07, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n06, t->n02);
		fp_sub_2e127m1_x8664_asm(t->D3->W, NULL, NULL, t->n15, t->n14);
		fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D3->Z);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D3->Z, t->n01);
		fp_sqr_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n13, t->D3->Z);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n02, t->D3->W);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, D2->Q, t->n01);
		fp_add_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n06, t->n04);
		fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->n01);
		fp_add_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->Q, t->n06);
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, D2->S, t->n05);
		fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->n05);
		fp_add_2e127m1_x8664_asm(t->n11, NULL, NULL, t->D1->S, t->n09);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->D1->T, t->n01);
		fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n12, t->n05);
		fp_sqr_2e127m1_x8664_asm(t->D3->V, NULL, NULL, t->D3->W);
		fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->D1->Q, t->n07);
		fp_sub_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n13, t->D3->V);
		fp_sub_2e127m1_x8664_asm(t->D3->Q, NULL, NULL, t->n14, t->n04);
		fp_sub_2e127m1_x8664_asm(t->n15, NULL, NULL, t->D3->Q, t->D1->Q);
		fp_mul_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n04, t->n13);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D3->V, t->n08);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01, t->n16);
		fp_sub_2e127m1_x8664_asm(t->D3->R, NULL, NULL, t->n02, t->n11);
		fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D3->R, t->D1->R);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n14, t->n15);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->D1->S);
		fp_sub_2e127m1_x8664_asm(t->D3->S, NULL, NULL, t->n06, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n03, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D3->R, t->n15);
		fp_add_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n08, t->n07);
		fp_sub_2e127m1_x8664_asm(t->D3->T, NULL, NULL, t->n09, t->D1->T);
#endif
	}
}

void hec_fp_zadd_2e127m1_g2i_jac(TEMP_hec_fp_2e127m1 t, DIV_hec_fp_2e127m1 D2){
	if(((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)) || ((t->D1->W[0] == 0) && (t->D1->W[1] == 0))){
		fp_cpy_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, D2->Q);
		fp_cpy_2e127m1_x8664_asm(t->D1->R, NULL, NULL, D2->R);
		fp_cpy_2e127m1_x8664_asm(t->D1->S, NULL, NULL, D2->S);
		fp_cpy_2e127m1_x8664_asm(t->D1->T, NULL, NULL, D2->T);
		fp_cpy_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, D2->Z);
		fp_cpy_2e127m1_x8664_asm(t->D1->W, NULL, NULL, D2->W);
		fp_cpy_2e127m1_x8664_asm(t->D1->V, NULL, NULL, D2->V);
	}else if(((D2->Z[0] == 0) && (D2->Z[1] == 0)) || ((D2->W[0] == 0) && (D2->W[1] == 0))){ /*** THINK!!! **/
		fp_cpy_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q);
		fp_cpy_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R);
		fp_cpy_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S);
		fp_cpy_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->D1->T);
		fp_cpy_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->Z);
		fp_cpy_2e127m1_x8664_asm(t->D1->W, NULL, NULL, t->D1->W);
		fp_cpy_2e127m1_x8664_asm(t->D1->V, NULL, NULL, t->D1->V);
	}else{
#ifdef GENERATED_ASM
		//ZADD++;
		hec_fp_zadd_2e127m1_g2i_jac_x8664_asm(t, D2);
#else
		fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->Q, D2->Q);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->R, D2->R);
		fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->S, D2->S);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->D1->T, D2->T);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n01, D2->Q);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n01, D2->R);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n02, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n01, t->n04);
		fp_sub_2e127m1_x8664_asm(t->n10, NULL, NULL, t->n09, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n06, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n07, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n12, t->n11);
		fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n07, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n06, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n15, t->n14);
		fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n10);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n10, t->n01);
		fp_sqr_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n13, t->n10);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n02, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, D2->Q, t->n01);
		fp_add_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n06, t->n04);
		fp_mul_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->D1->Q, t->n01);
		fp_add_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->Q, t->n06);
		fp_mul_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->D1->R, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, D2->S, t->n05);
		fp_mul_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->D1->S, t->n05);
		fp_add_2e127m1_x8664_asm(t->n11, NULL, NULL, t->D1->S, t->n09);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->D1->T, t->n01);
		fp_mul_2e127m1_x8664_asm(t->D1->W, NULL, NULL, t->D1->W, t->n16);
		fp_cpy_2e127m1_x8664_asm(t->D3->W, NULL, NULL, t->D1->W);
		fp_mul_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n12, t->n05);
		fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->Z, t->n10);
		fp_cpy_2e127m1_x8664_asm(t->D3->Z, NULL, NULL, t->D1->Z);
		fp_sqr_2e127m1_x8664_asm(t->D3->V, NULL, NULL, t->D1->W);
		fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->D1->Q, t->n07);
		fp_sub_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n13, t->D3->V);
		fp_sub_2e127m1_x8664_asm(t->D3->Q, NULL, NULL, t->n14, t->n04);
		fp_sub_2e127m1_x8664_asm(t->n15, NULL, NULL, t->D3->Q, t->D1->Q);
		fp_mul_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n04, t->n13);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D3->V, t->n08);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01, t->n16);
		fp_sub_2e127m1_x8664_asm(t->D3->R, NULL, NULL, t->n02, t->n11);
		fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D3->R, t->D1->R);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n14, t->n15);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->D1->S);
		fp_sub_2e127m1_x8664_asm(t->D3->S, NULL, NULL, t->n06, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n03, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D3->R, t->n15);
		fp_add_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n08, t->n07);
		fp_sub_2e127m1_x8664_asm(t->D3->T, NULL, NULL, t->n09, t->D1->T);
#endif
	}
}

/* Assumption: D2 ne 0. */
void hec_fp_madd_2e127m1_g2i_jac(TEMP_hec_fp_2e127m1 t, DIV_hec_fp_2e127m1 D2){
	if(((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)) || ((t->D1->W[0] == 0) && (t->D1->W[1] == 0))){
		fp_cpy_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, D2->Q);
		fp_cpy_2e127m1_x8664_asm(t->D1->R, NULL, NULL, D2->R);
		fp_cpy_2e127m1_x8664_asm(t->D1->S, NULL, NULL, D2->S);
		fp_cpy_2e127m1_x8664_asm(t->D1->T, NULL, NULL, D2->T);
		fp_st1_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, 1);
		fp_st1_2e127m1_x8664_asm(t->D1->W, NULL, NULL, 1);
		fp_st1_2e127m1_x8664_asm(t->D1->V, NULL, NULL, 1);
	}else{
#ifdef GENERATED_ASM
		//MADD++;
		hec_fp_madd_2e127m1_g2i_jac_x8664_asm(t, D2);
#else
		fp_sqr_2e127m1_x8664_asm(t->n16, NULL, NULL, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->D1->W, t->D1->Z);
		fp_sqr_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n17, NULL, NULL, D2->Q, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n18, NULL, NULL, D2->R, t->n15);
		fp_mul_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n14, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n14, t->n15);
		fp_mul_2e127m1_x8664_asm(t->n19, NULL, NULL, D2->S, t->n13);
		fp_mul_2e127m1_x8664_asm(t->n20, NULL, NULL, D2->T, t->n12);
		fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->Q, t->n17);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->R, t->n18);
		fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->S, t->n19);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->D1->T, t->n20);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n01, t->n17);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n01, t->n18);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n02, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n01, t->n04);
		fp_sub_2e127m1_x8664_asm(t->n10, NULL, NULL, t->n09, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n06, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n07, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n12, t->n11);
		fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n07, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n06, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n15, t->n14);
		fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n10);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n10, t->n01);
		fp_sqr_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n13, t->n10);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n02, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n17, t->n01);
		fp_add_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n06, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n17, NULL, NULL, t->D1->Q, t->n01);
		fp_add_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n17, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n18, NULL, NULL, t->D1->R, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n19, t->n05);
		fp_mul_2e127m1_x8664_asm(t->n19, NULL, NULL, t->D1->S, t->n05);
		fp_add_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n19, t->n09);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->D1->T, t->n01);
		fp_mul_2e127m1_x8664_asm(t->D1->W, NULL, NULL, t->D1->W, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n20, NULL, NULL, t->n12, t->n05);
		fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->Z, t->n10);
		fp_sqr_2e127m1_x8664_asm(t->D1->V, NULL, NULL, t->D1->W);
		fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n17, t->n07);
		fp_sub_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n13, t->D1->V);
		fp_sub_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n14, t->n04);
		fp_sub_2e127m1_x8664_asm(t->n15, NULL, NULL, t->D1->Q, t->n17);
		fp_mul_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n04, t->n13);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->V, t->n08);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01, t->n16);
		fp_sub_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n02, t->n11);
		fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->R, t->n18);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n14, t->n15);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n19);
		fp_sub_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n06, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n03, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->R, t->n15);
		fp_add_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n08, t->n07);
		fp_sub_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n09, t->n20);
#endif
	}
}


/* Assumption: D2 ne 0. */
void hec_fp_add_2e127m1_g2i_jac(TEMP_hec_fp_2e127m1 t, DIV_hec_fp_2e127m1 D2){
	if(((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)) || ((t->D1->W[0] == 0) && (t->D1->W[1] == 0))){
		fp_cpy_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, D2->Q);
		fp_cpy_2e127m1_x8664_asm(t->D1->R, NULL, NULL, D2->R);
		fp_cpy_2e127m1_x8664_asm(t->D1->S, NULL, NULL, D2->S);
		fp_cpy_2e127m1_x8664_asm(t->D1->T, NULL, NULL, D2->T);
		fp_cpy_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, D2->Z);
		fp_cpy_2e127m1_x8664_asm(t->D1->W, NULL, NULL, D2->W);
		fp_cpy_2e127m1_x8664_asm(t->D1->V, NULL, NULL, D2->V);
	}else{
#ifdef GENERATED_ASM
		//AADD++;
		hec_fp_add_2e127m1_g2i_jac_x8664_asm(t, D2);
#else
		fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->Z);
		fp_sqr_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->W, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->n17, NULL, NULL, D2->Q, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n18, NULL, NULL, D2->R, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n03, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n19, NULL, NULL, D2->S, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n03, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n20, NULL, NULL, D2->T, t->n05);
		fp_sqr_2e127m1_x8664_asm(t->n06, NULL, NULL, D2->Z);
		fp_sqr_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, D2->W, D2->Z);
		fp_mul_2e127m1_x8664_asm(t->n21, NULL, NULL, t->D1->Q, t->n06);
		fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n21, t->n17);
		fp_mul_2e127m1_x8664_asm(t->n22, NULL, NULL, t->D1->R, t->n07);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n22, t->n18);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n08, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n23, NULL, NULL, t->D1->S, t->n09);
		fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n23, t->n19);
		fp_mul_2e127m1_x8664_asm(t->n10, NULL, NULL, t->n08, t->n07);
		fp_mul_2e127m1_x8664_asm(t->n24, NULL, NULL, t->D1->T, t->n10);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n24, t->n20);
		fp_mul_2e127m1_x8664_asm(t->n26, NULL, NULL, t->D1->Z, D2->Z);
		fp_mul_2e127m1_x8664_asm(t->n25, NULL, NULL, t->D1->W, D2->W);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n01, t->n17);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n01, t->n18);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n02, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n01, t->n04);
		fp_sub_2e127m1_x8664_asm(t->n10, NULL, NULL, t->n09, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n06, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n07, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n12, t->n11);
		fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n07, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n06, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n15, t->n14);
		fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n10);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n10, t->n01);
		fp_sqr_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n13, t->n10);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n02, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n17, t->n01);
		fp_add_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n06, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n17, NULL, NULL, t->n21, t->n01);
		fp_add_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n17, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n18, NULL, NULL, t->n22, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n19, t->n05);
		fp_mul_2e127m1_x8664_asm(t->n19, NULL, NULL, t->n23, t->n05);
		fp_add_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n19, t->n09);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n24, t->n01);
		fp_mul_2e127m1_x8664_asm(t->D1->W, NULL, NULL, t->n25, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n20, NULL, NULL, t->n12, t->n05);
		fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->n26, t->n10);
		fp_sqr_2e127m1_x8664_asm(t->D1->V, NULL, NULL, t->D1->W);
		fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n17, t->n07);
		fp_sub_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n13, t->D1->V);
		fp_sub_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n14, t->n04);
		fp_sub_2e127m1_x8664_asm(t->n15, NULL, NULL, t->D1->Q, t->n17);
		fp_mul_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n04, t->n13);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->V, t->n08);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01, t->n16);
		fp_sub_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n02, t->n11);
		fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->R, t->n18);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n14, t->n15);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n19);
		fp_sub_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n06, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n03, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->R, t->n15);
		fp_add_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n08, t->n07);
		fp_sub_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n09, t->n20);
#endif
	}
}

void hec_fp_mdbladd_2e127m1_g2i_jac(TEMP_hec_fp_2e127m1 t, const DIV_hec_fp_2e127m1 D2){

	if(((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)) || ((t->D1->W[0] == 0) && (t->D1->W[1] == 0))){
		fp_cpy_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, D2->Q);
		fp_cpy_2e127m1_x8664_asm(t->D1->R, NULL, NULL, D2->R);
		fp_cpy_2e127m1_x8664_asm(t->D1->S, NULL, NULL, D2->S);
		fp_cpy_2e127m1_x8664_asm(t->D1->T, NULL, NULL, D2->T);
		fp_st1_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, 1);
		fp_st1_2e127m1_x8664_asm(t->D1->W, NULL, NULL, 1);
		fp_st1_2e127m1_x8664_asm(t->D1->V, NULL, NULL, 1);
	}
	else{
#ifdef GENERATED_ASM
		//MDBLADD++;
		hec_fp_mdbladd_2e127m1_g2i_jac_x8664_asm(t, D2);
#else
		fp_sqr_2e127m1_x8664_asm(t->n16, NULL, NULL, t->D1->Z);
		fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->D1->W, t->D1->Z);
		fp_sqr_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n17, NULL, NULL, D2->Q, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n18, NULL, NULL, D2->R, t->n15);
		fp_mul_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n14, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n14, t->n15);
		fp_mul_2e127m1_x8664_asm(t->n19, NULL, NULL, D2->S, t->n13);
		fp_mul_2e127m1_x8664_asm(t->n20, NULL, NULL, D2->T, t->n12);
		fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->Q, t->n17);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->R, t->n18);
		fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->S, t->n19);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->D1->T, t->n20);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n01, t->n17);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n01, t->n18);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n02, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n01, t->n04);
		fp_sub_2e127m1_x8664_asm(t->n10, NULL, NULL, t->n09, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n06, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n07, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n12, t->n11);
		fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n07, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n06, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n15, t->n14);
		fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n10);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n10, t->n01);
		fp_sqr_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n13, t->n10);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n02, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n17, t->n01);
		fp_add_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n06, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n17, NULL, NULL, t->D1->Q, t->n01);
		fp_add_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n17, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n18, NULL, NULL, t->D1->R, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n19, t->n05);
		fp_mul_2e127m1_x8664_asm(t->n19, NULL, NULL, t->D1->S, t->n05);
		fp_add_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n19, t->n09);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->D1->T, t->n01);
		fp_mul_2e127m1_x8664_asm(t->D1->W, NULL, NULL, t->D1->W, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n20, NULL, NULL, t->n12, t->n05);
		fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->Z, t->n10);
		fp_sqr_2e127m1_x8664_asm(t->D1->V, NULL, NULL, t->D1->W);
		fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n17, t->n07);
		fp_sub_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n13, t->D1->V);
		fp_sub_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n14, t->n04);
		fp_sub_2e127m1_x8664_asm(t->n15, NULL, NULL, t->D1->Q, t->n17);
		fp_mul_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n04, t->n13);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->V, t->n08);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01, t->n16);
		fp_sub_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n02, t->n11);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->R, t->n18);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n14, t->n15);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n19);
		fp_sub_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n06, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->S, t->n19);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n02, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->R, t->n15);
		fp_add_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n08, t->n07);
		fp_sub_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n09, t->n20);
		fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->D1->T, t->n20);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n15, t->n17);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n02);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n15, t->n18);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n02, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n15, t->n04);
		fp_sub_2e127m1_x8664_asm(t->n10, NULL, NULL, t->n09, t->n08);
		fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n06, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n07, t->n03);
		fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n12, t->n11);
		fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n07, t->n15);
		fp_mul_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n06, t->n02);
		fp_sub_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n15, t->n14);
		fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n10);
		fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n10, t->n01);
		fp_sqr_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n01);
		fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n13, t->n10);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n02, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n17, t->n01);
		fp_add_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n06, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n17, NULL, NULL, t->D1->Q, t->n01);
		fp_add_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n17, t->n06);
		fp_mul_2e127m1_x8664_asm(t->n18, NULL, NULL, t->D1->R, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n19, t->n05);
		fp_mul_2e127m1_x8664_asm(t->n19, NULL, NULL, t->D1->S, t->n05);
		fp_add_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n19, t->n09);
		fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->D1->T, t->n01);
		fp_mul_2e127m1_x8664_asm(t->D1->W, NULL, NULL, t->D1->W, t->n16);
		fp_mul_2e127m1_x8664_asm(t->n20, NULL, NULL, t->n12, t->n05);
		fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->Z, t->n10);
		fp_sqr_2e127m1_x8664_asm(t->D1->V, NULL, NULL, t->D1->W);
		fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n17, t->n07);
		fp_sub_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n13, t->D1->V);
		fp_sub_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n14, t->n04);
		fp_sub_2e127m1_x8664_asm(t->n15, NULL, NULL, t->D1->Q, t->n17);
		fp_mul_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n04, t->n13);
		fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->V, t->n08);
		fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01, t->n16);
		fp_sub_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n02, t->n11);
		fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->D1->R, t->n18);
		fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n14, t->n15);
		fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n19);
		fp_sub_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n06, t->n03);
		fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n03, t->n04);
		fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->R, t->n15);
		fp_add_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n08, t->n07);
		fp_sub_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n09, t->n20);
#endif
	}
}

void hec_fp_zdbl_2e127m1_g2i_jac(TEMP_hec_fp_2e127m1 t, DIV_hec_fp_2e127m1 D1){
#ifdef GENERATED_ASM
	//ZDBL++;
	hec_fp_zdbl_2e127m1_g2i_jac_x8664_asm(t, D1);
#else
	fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, D1->Z);
	fp_sqr_2e127m1_x8664_asm(t->n02, NULL, NULL, D1->Q);
	fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->cn->a2, t->n01);
	fp_add_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n03, D1->Q);
	fp_ml2_2e127m1_x8664_asm(t->n05, NULL, NULL, D1->R);
	fp_ml2_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n05);
	fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n03, t->n02);
	fp_sqr_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n01);
	fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, D1->Q, t->n06);
	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n07, t->cn->a3);
	fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n04, t->n01);
	fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n03, t->n08);
	fp_ml3_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n02);
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, D1->V, t->n06);
	fp_sub_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n05, t->n07);
	fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n08, t->n01);
	fp_sqr_2e127m1_x8664_asm(t->n02, NULL, NULL, D1->S);
	fp_add_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n02, t->n04);
	fp_ml2_2e127m1_x8664_asm(t->n01, NULL, NULL, D1->S);
	fp_ml2_2e127m1_x8664_asm(t->n02, NULL, NULL, D1->T);
	fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, D1->V, t->n03);
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n01, D1->Q);
	fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n04, t->n02);
	fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n01, D1->R);
	fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n07, t->n06);
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n03, t->n05);
	fp_sub_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n04, t->n08);
	fp_mul_2e127m1_x8664_asm(t->n10, NULL, NULL, t->n07, t->n01);
	fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n03, t->n02);
	fp_sub_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n08, t->n10);
	fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n06, t->n02);
	fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n01, t->n05);
	fp_sub_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n07, t->n08);
	fp_sqr_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n03);
	fp_mul_2e127m1_x8664_asm(D1->W, NULL, NULL, D1->W, t->n04);
	fp_cpy_2e127m1_x8664_asm(t->D1->W, NULL, NULL, D1->W);
	fp_sqr_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n06);
	fp_mul_2e127m1_x8664_asm(D1->Z, NULL, NULL, D1->Z, t->n03);
	fp_cpy_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, D1->Z);
	fp_sqr_2e127m1_x8664_asm(D1->V, NULL, NULL, D1->W);
	fp_cpy_2e127m1_x8664_asm(t->D1->V, NULL, NULL, D1->V);
	fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n03, t->n06);
	fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n05, t->n04);
	fp_mul_2e127m1_x8664_asm(D1->Q, NULL, NULL, D1->Q, t->n06);
	fp_mul_2e127m1_x8664_asm(D1->R, NULL, NULL, D1->R, t->n02);
	fp_mul_2e127m1_x8664_asm(D1->S, NULL, NULL, D1->S, t->n08);
	fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n09, t->n03);
	fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n08, t->n06);
	fp_ml2_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n05);
	fp_cpy_2e127m1_x8664_asm(t->n11, NULL, NULL, D1->Q);
	fp_sub_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n09, D1->V);
	fp_mul_2e127m1_x8664_asm(D1->T, NULL, NULL, D1->T, t->n02);
	fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n11, D1->V);
	fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n08, D1->S);
	fp_ml2_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n06);
	fp_sqr_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n05);
	fp_cpy_2e127m1_x8664_asm(t->n12, NULL, NULL, D1->R);
	fp_add_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n09, t->n02);
	fp_sub_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n11, t->D1->Q);
	fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n12, t->D1->R);
	fp_sub_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n05, t->D1->Q);
	fp_mul_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n09, t->n08);
	fp_sub_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n02, D1->S);
	fp_add_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n07, t->n06);
	fp_mul_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->R, t->n08);
	fp_mul_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n06, t->n05);
	fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n09, t->n01);
	fp_sub_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n02, D1->T);
#endif
}

void hec_fp_dbl_2e127m1_g2i_jac(TEMP_hec_fp_2e127m1 t){
#ifdef GENERATED_ASM
	//DBL++;
	hec_fp_dbl_2e127m1_g2i_jac_x8664_asm(t);
#else
	fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->Z);
	fp_sqr_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->Q);
	fp_sqr_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n01);
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n03, t->cn->a3);
	fp_ml2_2e127m1_x8664_asm(t->n05, NULL, NULL, t->D1->R);
	fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n02);
	fp_add_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n06, t->n05);
	fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n01, t->cn->a2);
	fp_add_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n08, t->D1->Q);
	fp_sqr_2e127m1_x8664_asm(t->n10, NULL, NULL, t->D1->S);
	fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n09, t->n04);
	fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->D1->Q, t->n07);
	fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n12, t->n11);
	fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n13, t->D1->V);
	fp_sub_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n14, t->n10);
	fp_ml2_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n02);
	fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n16, t->n06);
	fp_add_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01, t->n04);
	fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n02, t->D1->V);
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->D1->S, t->D1->Q);
	fp_sub_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n04, t->D1->T);
	fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->D1->S, t->D1->R);
	fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->D1->S, t->n15);
	fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->T, t->n03);
	fp_sub_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n08, t->n07);
	fp_mul_2e127m1_x8664_asm(t->n10, NULL, NULL, t->n06, t->D1->S);
	fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n05, t->D1->T);
	fp_sub_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n11, t->n10);
	fp_ml2_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n12);
	fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n05, t->n15);
	fp_mul_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n06, t->n03);
	fp_sub_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n15, t->n14);
	fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n09);
	fp_sqr_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01);
	fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->Z, t->n09);
	fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n09, t->n01);
	fp_mul_2e127m1_x8664_asm(t->D1->W, NULL, NULL, t->D1->W, t->n13);
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n03, t->n13);
	fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->D1->Q, t->n01);
	fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->D1->R, t->n02);
	fp_sqr_2e127m1_x8664_asm(t->D1->V, NULL, NULL, t->D1->W);
	fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->D1->T, t->n01);
	fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->V, t->n05);
	fp_mul_2e127m1_x8664_asm(t->n10, NULL, NULL, t->n07, t->n04);
	fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n16, t->n09);
	fp_sub_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n11, t->D1->V);
	fp_add_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n12, t->n11);
	fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->D1->Q, t->n05);
	fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->D1->S, t->n04);
	fp_sub_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n14, t->n08);
	fp_ml2_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n15);
	fp_sqr_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n11);
	fp_sub_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n16, t->n01);
	fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->R, t->n06);
	fp_add_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n02, t->n14);
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n12, t->n13);
	fp_sub_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n04, t->n03);
	fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n02, t->n11);
	fp_add_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n10);
	fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->D1->R, t->n13);
	fp_sub_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n07, t->n06);
#endif
}

void hec_fp_dbl_2e127m1_g2i_jac_a3is1(TEMP_hec_fp_2e127m1 t){
#ifdef GENERATED_ASM
	//DBL_a3is1++;
	hec_fp_dbl_2e127m1_g2i_jac_x8664_asm_a3is1(t);
#else
	fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->D1->Z);
	fp_sqr_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->Q);
	fp_sqr_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n01);
	fp_ml2_2e127m1_x8664_asm(t->n05, NULL, NULL, t->D1->R);
	fp_sub_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n02);
	fp_add_2e127m1_x8664_asm(t->n07, NULL, NULL, t->n06, t->n05);
	fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->n01, t->cn->a2);
	fp_add_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n08, t->D1->Q);
	fp_sqr_2e127m1_x8664_asm(t->n10, NULL, NULL, t->D1->S);
	fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n09, t->n03);
	fp_mul_2e127m1_x8664_asm(t->n12, NULL, NULL, t->D1->Q, t->n07);
	fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n12, t->n11);
	fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n13, t->D1->V);
	fp_sub_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n14, t->n10);
	fp_ml2_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n02);
	fp_sub_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n16, t->n06);
	fp_add_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n03, t->n01);
	fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n02, t->D1->V);
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->D1->S, t->D1->Q);
	fp_sub_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n04, t->D1->T);
	fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->D1->S, t->D1->R);
	fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->D1->S, t->n15);
	fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->T, t->n03);
	fp_sub_2e127m1_x8664_asm(t->n09, NULL, NULL, t->n08, t->n07);
	fp_mul_2e127m1_x8664_asm(t->n10, NULL, NULL, t->n06, t->D1->S);
	fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n05, t->D1->T);
	fp_sub_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n11, t->n10);
	fp_ml2_2e127m1_x8664_asm(t->n13, NULL, NULL, t->n12);
	fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->n05, t->n15);
	fp_mul_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n06, t->n03);
	fp_sub_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n15, t->n14);
	fp_sqr_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n09);
	fp_sqr_2e127m1_x8664_asm(t->n02, NULL, NULL, t->n01);
	fp_mul_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, t->D1->Z, t->n09);
	fp_mul_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n09, t->n01);
	fp_mul_2e127m1_x8664_asm(t->D1->W, NULL, NULL, t->D1->W, t->n13);
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n03, t->n13);
	fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->D1->Q, t->n01);
	fp_mul_2e127m1_x8664_asm(t->n06, NULL, NULL, t->D1->R, t->n02);
	fp_sqr_2e127m1_x8664_asm(t->D1->V, NULL, NULL, t->D1->W);
	fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->D1->T, t->n01);
	fp_mul_2e127m1_x8664_asm(t->n08, NULL, NULL, t->D1->V, t->n05);
	fp_mul_2e127m1_x8664_asm(t->n10, NULL, NULL, t->n07, t->n04);
	fp_mul_2e127m1_x8664_asm(t->n11, NULL, NULL, t->n16, t->n09);
	fp_sub_2e127m1_x8664_asm(t->n12, NULL, NULL, t->n11, t->D1->V);
	fp_add_2e127m1_x8664_asm(t->D1->Q, NULL, NULL, t->n12, t->n11);
	fp_sub_2e127m1_x8664_asm(t->n13, NULL, NULL, t->D1->Q, t->n05);
	fp_mul_2e127m1_x8664_asm(t->n14, NULL, NULL, t->D1->S, t->n04);
	fp_sub_2e127m1_x8664_asm(t->n15, NULL, NULL, t->n14, t->n08);
	fp_ml2_2e127m1_x8664_asm(t->n01, NULL, NULL, t->n15);
	fp_sqr_2e127m1_x8664_asm(t->n16, NULL, NULL, t->n11);
	fp_sub_2e127m1_x8664_asm(t->D1->R, NULL, NULL, t->n16, t->n01);
	fp_sub_2e127m1_x8664_asm(t->n02, NULL, NULL, t->D1->R, t->n06);
	fp_add_2e127m1_x8664_asm(t->n03, NULL, NULL, t->n02, t->n14);
	fp_mul_2e127m1_x8664_asm(t->n04, NULL, NULL, t->n12, t->n13);
	fp_sub_2e127m1_x8664_asm(t->D1->S, NULL, NULL, t->n04, t->n03);
	fp_mul_2e127m1_x8664_asm(t->n05, NULL, NULL, t->n02, t->n11);
	fp_add_2e127m1_x8664_asm(t->n06, NULL, NULL, t->n05, t->n10);
	fp_mul_2e127m1_x8664_asm(t->n07, NULL, NULL, t->D1->R, t->n13);
	fp_sub_2e127m1_x8664_asm(t->D1->T, NULL, NULL, t->n07, t->n06);
#endif
}

