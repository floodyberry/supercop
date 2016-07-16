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

void hec_fp_cpy_2e128mc_g2i_jac(TEMP_hec_fp_2e128mc t, DIV_hec_fp_2e128mc_t D3, DIV_hec_fp_2e128mc_t D1){
	fp_cpy_2e128mc_x8664_asm(D3->Q, t->cn->prm, NULL, D1->Q);
	fp_cpy_2e128mc_x8664_asm(D3->R, t->cn->prm, NULL, D1->R);
	fp_cpy_2e128mc_x8664_asm(D3->S, t->cn->prm, NULL, D1->S);
	fp_cpy_2e128mc_x8664_asm(D3->T, t->cn->prm, NULL, D1->T);
	fp_cpy_2e128mc_x8664_asm(D3->Z, t->cn->prm, NULL, D1->Z);
	fp_cpy_2e128mc_x8664_asm(D3->W, t->cn->prm, NULL, D1->W);
	fp_cpy_2e128mc_x8664_asm(D3->V, t->cn->prm, NULL, D1->V);
}

void hec_fp_neg_2e128mc_g2i_jac(TEMP_hec_fp_2e128mc t, DIV_hec_fp_2e128mc_t D3, DIV_hec_fp_2e128mc_t D1){
	fp_cpy_2e128mc_x8664_asm(D3->Q, t->cn->prm, NULL, D1->Q);
	fp_cpy_2e128mc_x8664_asm(D3->R, t->cn->prm, NULL, D1->R);
	fp_neg_2e128mc_x8664_asm(D3->S, t->cn->prm, NULL, D1->S);
	fp_neg_2e128mc_x8664_asm(D3->T, t->cn->prm, NULL, D1->T);
	fp_cpy_2e128mc_x8664_asm(D3->Z, t->cn->prm, NULL, D1->Z);
	fp_cpy_2e128mc_x8664_asm(D3->W, t->cn->prm, NULL, D1->W);
	fp_cpy_2e128mc_x8664_asm(D3->V, t->cn->prm, NULL, D1->V);
}

void hec_fp_zadd_2e128mc_g2i_jac(TEMP_hec_fp_2e128mc t, DIV_hec_fp_2e128mc D2){
	if(((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)) || ((t->D1->W[0] == 0) && (t->D1->W[1] == 0))){
		fp_cpy_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, D2->Q);
		fp_cpy_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, D2->R);
		fp_cpy_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, D2->S);
		fp_cpy_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, D2->T);
		fp_cpy_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, D2->Z);
		fp_cpy_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, D2->W);
		fp_cpy_2e128mc_x8664_asm(t->D1->V, t->cn->prm, NULL, D2->V);
	}else if(((D2->Z[0] == 0) && (D2->Z[1] == 0)) || ((D2->W[0] == 0) && (D2->W[1] == 0))){ /*** THINK!!! **/
		fp_cpy_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q);
		fp_cpy_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R);
		fp_cpy_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S);
		fp_cpy_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->D1->T);
		fp_cpy_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->Z);
		fp_cpy_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, t->D1->W);
		fp_cpy_2e128mc_x8664_asm(t->D1->V, t->cn->prm, NULL, t->D1->V);
	}else{
#ifdef GENERATED_ASM
		//ZADD++;
		hec_fp_zadd_2e128mc_g2i_jac_x8664_asm(t, D2);
#else
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->Q, D2->Q);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->R, D2->R);
		fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D1->S, D2->S);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->D1->T, D2->T);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n01, D2->Q);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n01, D2->R);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n02, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n01, t->n04);
		fp_sub_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->n09, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n06, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n07, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n12, t->n11);
		fp_mul_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n07, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->n06, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n15, t->n14);
		fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n10);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n10, t->n01);
		fp_sqr_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n13, t->n10);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n02, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, D2->Q, t->n01);
		fp_add_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n06, t->n04);
		fp_mul_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->n01);
		fp_add_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->Q, t->n06);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, D2->S, t->n05);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->n05);
		fp_add_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->D1->S, t->n09);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->D1->T, t->n01);
		fp_mul_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, t->D1->W, t->n16);
		fp_cpy_2e128mc_x8664_asm(t->D3->W, t->cn->prm, NULL, t->D1->W);
		fp_mul_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n12, t->n05);
		fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->Z, t->n10);
		fp_cpy_2e128mc_x8664_asm(t->D3->Z, t->cn->prm, NULL, t->D1->Z);
		fp_sqr_2e128mc_x8664_asm(t->D3->V, t->cn->prm, NULL, t->D1->W);
		fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->D1->Q, t->n07);
		fp_sub_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n13, t->D3->V);
		fp_sub_2e128mc_x8664_asm(t->D3->Q, t->cn->prm, NULL, t->n14, t->n04);
		fp_sub_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->D3->Q, t->D1->Q);
		fp_mul_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n04, t->n13);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D3->V, t->n08);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01, t->n16);
		fp_sub_2e128mc_x8664_asm(t->D3->R, t->cn->prm, NULL, t->n02, t->n11);
		fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D3->R, t->D1->R);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n14, t->n15);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->D1->S);
		fp_sub_2e128mc_x8664_asm(t->D3->S, t->cn->prm, NULL, t->n06, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n03, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D3->R, t->n15);
		fp_add_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n08, t->n07);
		fp_sub_2e128mc_x8664_asm(t->D3->T, t->cn->prm, NULL, t->n09, t->D1->T);
#endif
	}
}

/* Assumption: D2 ne 0*/
void hec_fp_aadd_2e128mc_g2i_jac(TEMP_hec_fp_2e128mc t, DIV_hec_fp_2e128mc D2){
	if(((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)) || ((t->D1->W[0] == 0) && (t->D1->W[1] == 0))){
		fp_cpy_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, D2->Q);
		fp_cpy_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, D2->R);
		fp_cpy_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, D2->S);
		fp_cpy_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, D2->T);
		fp_cpy_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, D2->Z);
		fp_cpy_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, D2->W);
		fp_cpy_2e128mc_x8664_asm(t->D1->V, t->cn->prm, NULL, D2->V);
	}else{
#ifdef GENERATED_ASM
		//AADD++;
		hec_fp_aadd_2e128mc_g2i_jac_x8664_asm(t, D2);
#else
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->Q, D2->Q);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->R, D2->R);
		fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D1->S, D2->S);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->D1->T, D2->T);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n01, D2->Q);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n01, D2->R);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n02, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n01, t->n04);
		fp_sub_2e128mc_x8664_asm(t->D3->Z, t->cn->prm, NULL, t->n09, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n06, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n07, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n12, t->n11);
		fp_mul_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n07, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->n06, t->n02);
		fp_sub_2e128mc_x8664_asm(t->D3->W, t->cn->prm, NULL, t->n15, t->n14);
		fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D3->Z);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D3->Z, t->n01);
		fp_sqr_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n13, t->D3->Z);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n02, t->D3->W);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, D2->Q, t->n01);
		fp_add_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n06, t->n04);
		fp_mul_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->D1->Q, t->n01);
		fp_add_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->Q, t->n06);
		fp_mul_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->D1->R, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, D2->S, t->n05);
		fp_mul_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->D1->S, t->n05);
		fp_add_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->D1->S, t->n09);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->D1->T, t->n01);
		fp_mul_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n12, t->n05);
		fp_sqr_2e128mc_x8664_asm(t->D3->V, t->cn->prm, NULL, t->D3->W);
		fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->D1->Q, t->n07);
		fp_sub_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n13, t->D3->V);
		fp_sub_2e128mc_x8664_asm(t->D3->Q, t->cn->prm, NULL, t->n14, t->n04);
		fp_sub_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->D3->Q, t->D1->Q);
		fp_mul_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n04, t->n13);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D3->V, t->n08);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01, t->n16);
		fp_sub_2e128mc_x8664_asm(t->D3->R, t->cn->prm, NULL, t->n02, t->n11);
		fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D3->R, t->D1->R);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n14, t->n15);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->D1->S);
		fp_sub_2e128mc_x8664_asm(t->D3->S, t->cn->prm, NULL, t->n06, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n03, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D3->R, t->n15);
		fp_add_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n08, t->n07);
		fp_sub_2e128mc_x8664_asm(t->D3->T, t->cn->prm, NULL, t->n09, t->D1->T);
#endif
	}
}

/* Assumption: D2 ne 0*/
void hec_fp_madd_2e128mc_g2i_jac(TEMP_hec_fp_2e128mc t, DIV_hec_fp_2e128mc D2){
	if(((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)) || ((t->D1->W[0] == 0) && (t->D1->W[1] == 0))){
		fp_cpy_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, D2->Q);
		fp_cpy_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, D2->R);
		fp_cpy_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, D2->S);
		fp_cpy_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, D2->T);
		fp_st1_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, 1);
		fp_st1_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, 1);
		fp_st1_2e128mc_x8664_asm(t->D1->V, t->cn->prm, NULL, 1);
	}else{
#ifdef GENERATED_ASM
		//MADD++;
		hec_fp_madd_2e128mc_g2i_jac_x8664_asm(t, D2);
#else
		fp_sqr_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->D1->W, t->D1->Z);
		fp_sqr_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n17, t->cn->prm, NULL, D2->Q, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n18, t->cn->prm, NULL, D2->R, t->n15);
		fp_mul_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n14, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n14, t->n15);
		fp_mul_2e128mc_x8664_asm(t->n19, t->cn->prm, NULL, D2->S, t->n13);
		fp_mul_2e128mc_x8664_asm(t->n20, t->cn->prm, NULL, D2->T, t->n12);
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->Q, t->n17);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->R, t->n18);
		fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D1->S, t->n19);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->D1->T, t->n20);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n01, t->n17);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n01, t->n18);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n02, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n01, t->n04);
		fp_sub_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->n09, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n06, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n07, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n12, t->n11);
		fp_mul_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n07, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->n06, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n15, t->n14);
		fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n10);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n10, t->n01);
		fp_sqr_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n13, t->n10);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n02, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n17, t->n01);
		fp_add_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n06, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n17, t->cn->prm, NULL, t->D1->Q, t->n01);
		fp_add_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n17, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n18, t->cn->prm, NULL, t->D1->R, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n19, t->n05);
		fp_mul_2e128mc_x8664_asm(t->n19, t->cn->prm, NULL, t->D1->S, t->n05);
		fp_add_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n19, t->n09);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->D1->T, t->n01);
		fp_mul_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, t->D1->W, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n20, t->cn->prm, NULL, t->n12, t->n05);
		fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->Z, t->n10);
		fp_sqr_2e128mc_x8664_asm(t->D1->V, t->cn->prm, NULL, t->D1->W);
		fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n17, t->n07);
		fp_sub_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n13, t->D1->V);
		fp_sub_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->n14, t->n04);
		fp_sub_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->D1->Q, t->n17);
		fp_mul_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n04, t->n13);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->V, t->n08);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01, t->n16);
		fp_sub_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n02, t->n11);
		fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D1->R, t->n18);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n14, t->n15);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->n19);
		fp_sub_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n06, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n03, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->R, t->n15);
		fp_add_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n08, t->n07);
		fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n09, t->n20);
#endif
	}
}

void hec_fp_mdbladd_2e128mc_g2i_jac(TEMP_hec_fp_2e128mc t, DIV_hec_fp_2e128mc D2){
	if(((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)) || ((t->D1->W[0] == 0) && (t->D1->W[1] == 0))){
		fp_cpy_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, D2->Q);
		fp_cpy_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, D2->R);
		fp_cpy_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, D2->S);
		fp_cpy_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, D2->T);
		fp_st1_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, 1);
		fp_st1_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, 1);
		fp_st1_2e128mc_x8664_asm(t->D1->V, t->cn->prm, NULL, 1);
	}else if(((D2->Z[0] == 0) && (D2->Z[1] == 0)) || ((D2->W[0] == 0) && (D2->W[1] == 0))){ /*** THINK!!! **/
		/*TODO: Fix me.*/
		//hec_fp_dbl_2e128mc_g2i_jac(t);
		hec_fp_dbl_2e128mc_g2i_jac_a2a3is0(t);
	}else{
#ifdef GENERATED_ASM
		//MDBLADD++;
		hec_fp_mdbladd_2e128mc_g2i_jac_x8664_asm(t, D2);
#else
		fp_sqr_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->D1->W, t->D1->Z);
		fp_sqr_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n17, t->cn->prm, NULL, D2->Q, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n18, t->cn->prm, NULL, D2->R, t->n15);
		fp_mul_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n14, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n14, t->n15);
		fp_mul_2e128mc_x8664_asm(t->n19, t->cn->prm, NULL, D2->S, t->n13);
		fp_mul_2e128mc_x8664_asm(t->n20, t->cn->prm, NULL, D2->T, t->n12);
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->Q, t->n17);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->R, t->n18);
		fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D1->S, t->n19);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->D1->T, t->n20);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n01, t->n17);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n01, t->n18);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n02, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n01, t->n04);
		fp_sub_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->n09, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n06, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n07, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n12, t->n11);
		fp_mul_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n07, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->n06, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n15, t->n14);
		fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n10);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n10, t->n01);
		fp_sqr_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n13, t->n10);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n02, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n17, t->n01);
		fp_add_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n06, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n17, t->cn->prm, NULL, t->D1->Q, t->n01);
		fp_add_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n17, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n18, t->cn->prm, NULL, t->D1->R, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n19, t->n05);
		fp_mul_2e128mc_x8664_asm(t->n19, t->cn->prm, NULL, t->D1->S, t->n05);
		fp_add_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n19, t->n09);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->D1->T, t->n01);
		fp_mul_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, t->D1->W, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n20, t->cn->prm, NULL, t->n12, t->n05);
		fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->Z, t->n10);
		fp_sqr_2e128mc_x8664_asm(t->D1->V, t->cn->prm, NULL, t->D1->W);
		fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n17, t->n07);
		fp_sub_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n13, t->D1->V);
		fp_sub_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->n14, t->n04);
		fp_sub_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->D1->Q, t->n17);
		fp_mul_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n04, t->n13);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->V, t->n08);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01, t->n16);
		fp_sub_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n02, t->n11);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->R, t->n18);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n14, t->n15);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->n19);
		fp_sub_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n06, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D1->S, t->n19);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n02, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->R, t->n15);
		fp_add_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n08, t->n07);
		fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n09, t->n20);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->D1->T, t->n20);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n15, t->n17);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n15, t->n18);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n02, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n15, t->n04);
		fp_sub_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->n09, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n06, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n07, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n12, t->n11);
		fp_mul_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n07, t->n15);
		fp_mul_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->n06, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n15, t->n14);
		fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n10);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n10, t->n01);
		fp_sqr_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n13, t->n10);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n02, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n17, t->n01);
		fp_add_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n06, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n17, t->cn->prm, NULL, t->D1->Q, t->n01);
		fp_add_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n17, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n18, t->cn->prm, NULL, t->D1->R, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n19, t->n05);
		fp_mul_2e128mc_x8664_asm(t->n19, t->cn->prm, NULL, t->D1->S, t->n05);
		fp_add_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n19, t->n09);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->D1->T, t->n01);
		fp_mul_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, t->D1->W, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n20, t->cn->prm, NULL, t->n12, t->n05);
		fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->Z, t->n10);
		fp_sqr_2e128mc_x8664_asm(t->D1->V, t->cn->prm, NULL, t->D1->W);
		fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n17, t->n07);
		fp_sub_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n13, t->D1->V);
		fp_sub_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->n14, t->n04);
		fp_sub_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->D1->Q, t->n17);
		fp_mul_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n04, t->n13);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->V, t->n08);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01, t->n16);
		fp_sub_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n02, t->n11);
		fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D1->R, t->n18);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n14, t->n15);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->n19);
		fp_sub_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n06, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n03, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->R, t->n15);
		fp_add_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n08, t->n07);
		fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n09, t->n20);
#endif
	}
}

void hec_fp_zdbl_2e128mc_g2i_jac(TEMP_hec_fp_2e128mc t, DIV_hec_fp_2e128mc D1){
#ifdef GENERATED_ASM
	//ZDBL++;
	hec_fp_zdbl_2e128mc_g2i_jac_x8664_asm(t, D1);
#else
	fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, D1->Z);
	fp_sqr_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, D1->Q);
	fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->cn->a2, t->n01);
	fp_add_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n03, D1->Q);
	fp_ml2_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, D1->R);
	fp_ml2_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n05);
	fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n03, t->n02);
	fp_sqr_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n01);
	fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, D1->Q, t->n06);
	fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n07, t->cn->a3);
	fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n04, t->n01);
	fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n03, t->n08);
	fp_ml3_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n02);
	fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, D1->V, t->n06);
	fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n05, t->n07);
	fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n08, t->n01);
	fp_sqr_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, D1->S);
	fp_add_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n02, t->n04);
	fp_ml2_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, D1->S);
	fp_ml2_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, D1->T);
	fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, D1->V, t->n03);
	fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n01, D1->Q);
	fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n04, t->n02);
	fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n01, D1->R);
	fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n07, t->n06);
	fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n03, t->n05);
	fp_sub_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n04, t->n08);
	fp_mul_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->n07, t->n01);
	fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n03, t->n02);
	fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n08, t->n10);
	fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n06, t->n02);
	fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n01, t->n05);
	fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n07, t->n08);
	fp_sqr_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n03);
	fp_mul_2e128mc_x8664_asm(D1->W, t->cn->prm, NULL, D1->W, t->n04);
	fp_cpy_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, D1->W);
	fp_sqr_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n06);
	fp_mul_2e128mc_x8664_asm(D1->Z, t->cn->prm, NULL, D1->Z, t->n03);
	fp_cpy_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, D1->Z);
	fp_sqr_2e128mc_x8664_asm(D1->V, t->cn->prm, NULL, D1->W);
	fp_cpy_2e128mc_x8664_asm(t->D1->V, t->cn->prm, NULL, D1->V);
	fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n03, t->n06);
	fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n05, t->n04);
	fp_mul_2e128mc_x8664_asm(D1->Q, t->cn->prm, NULL, D1->Q, t->n06);
	fp_mul_2e128mc_x8664_asm(D1->R, t->cn->prm, NULL, D1->R, t->n02);
	fp_mul_2e128mc_x8664_asm(D1->S, t->cn->prm, NULL, D1->S, t->n08);
	fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n09, t->n03);
	fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n08, t->n06);
	fp_ml2_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n05);
	fp_cpy_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, D1->Q);
	fp_sub_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->n09, D1->V);
	fp_mul_2e128mc_x8664_asm(D1->T, t->cn->prm, NULL, D1->T, t->n02);
	fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n11, D1->V);
	fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n08, D1->S);
	fp_ml2_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n06);
	fp_sqr_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n05);
	fp_cpy_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, D1->R);
	fp_add_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n09, t->n02);
	fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n11, t->D1->Q);
	fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n12, t->D1->R);
	fp_sub_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n05, t->D1->Q);
	fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n09, t->n08);
	fp_sub_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n02, D1->S);
	fp_add_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n07, t->n06);
	fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->R, t->n08);
	fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n06, t->n05);
	fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n09, t->n01);
	fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n02, D1->T);
#endif
}

void hec_fp_dbl_2e128mc_g2i_jac(TEMP_hec_fp_2e128mc t){
#ifdef GENERATED_ASM
		//DBL++;
		hec_fp_dbl_2e128mc_g2i_jac_x8664_asm(t);
#else
	fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->Z);
	fp_sqr_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->Q);
	fp_sqr_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n01);
	fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n03, t->cn->a3);
	fp_ml2_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->D1->R);
	fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->n02);
	fp_add_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n06, t->n05);
	fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n01, t->cn->a2);
	fp_add_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n08, t->D1->Q);
	fp_sqr_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->D1->S);
	fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n09, t->n04);
	fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->D1->Q, t->n07);
	fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n12, t->n11);
	fp_mul_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n13, t->D1->V);
	fp_sub_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->n14, t->n10);
	fp_ml2_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n02);
	fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n16, t->n06);
	fp_add_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01, t->n04);
	fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n02, t->D1->V);
	fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->D1->S, t->D1->Q);
	fp_sub_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n04, t->D1->T);
	fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->S, t->D1->R);
	fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->D1->S, t->n15);
	fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->T, t->n03);
	fp_sub_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n08, t->n07);
	fp_mul_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->n06, t->D1->S);
	fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n05, t->D1->T);
	fp_sub_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n11, t->n10);
	fp_ml2_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n12);
	fp_mul_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n05, t->n15);
	fp_mul_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->n06, t->n03);
	fp_sub_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n15, t->n14);
	fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n09);
	fp_sqr_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01);
	fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->Z, t->n09);
	fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n09, t->n01);
	fp_mul_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, t->D1->W, t->n13);
	fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n03, t->n13);
	fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->D1->Q, t->n01);
	fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->R, t->n02);
	fp_sqr_2e128mc_x8664_asm(t->D1->V, t->cn->prm, NULL, t->D1->W);
	fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->D1->T, t->n01);
	fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->V, t->n05);
	fp_mul_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->n07, t->n04);
	fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n16, t->n09);
	fp_sub_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n11, t->D1->V);
	fp_add_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->n12, t->n11);
	fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->D1->Q, t->n05);
	fp_mul_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->D1->S, t->n04);
	fp_sub_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->n14, t->n08);
	fp_ml2_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n15);
	fp_sqr_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n11);
	fp_sub_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n16, t->n01);
	fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->R, t->n06);
	fp_add_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n02, t->n14);
	fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n12, t->n13);
	fp_sub_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n04, t->n03);
	fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n02, t->n11);
	fp_add_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->n10);
	fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->D1->R, t->n13);
	fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n07, t->n06);
#endif
}

void hec_fp_dbl_2e128mc_g2i_jac_a2a3is0(TEMP_hec_fp_2e128mc t){
#ifdef GENERATED_ASM
		//DBL_a2a3is0++;
		hec_fp_dbl_2e128mc_g2i_jac_x8664_asm_a2a3is0(t);
#else
	fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->Q);
	fp_ml2_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->R);
	fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n02, t->n01);
	fp_add_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n03, t->n02);
	fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->D1->Q, t->n04);
	fp_sqr_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->S);
	fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n05, t->D1->V);
	fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n07, t->n06);
	fp_ml2_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n01);
	fp_sub_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->n09, t->n03);
	fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n10, t->D1->V);
	fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->D1->S, t->D1->Q);
	fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n12, t->D1->T);
	fp_mul_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->D1->S, t->D1->R);
	fp_mul_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->D1->S, t->n08);
	fp_mul_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->D1->T, t->n11);
	fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n16, t->n15);
	fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n14, t->D1->S);
	fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n13, t->D1->T);
	fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n03, t->n02);
	fp_ml2_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n04);
	fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n13, t->n08);
	fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n14, t->n11);
	fp_sub_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n07, t->n06);
	fp_sqr_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n01);
	fp_sqr_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->n09);
	fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->D1->Z, t->n01);
	fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n01, t->n09);
	fp_mul_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, t->D1->W, t->n05);
	fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n11, t->n05);
	fp_mul_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->D1->Q, t->n09);
	fp_mul_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->D1->R, t->n10);
	fp_sqr_2e128mc_x8664_asm(t->D1->V, t->cn->prm, NULL, t->D1->W);
	fp_mul_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->D1->T, t->n09);
	fp_mul_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n15, t->n12);
	fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->D1->V, t->n13);
	fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n08, t->n01);
	fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n03, t->D1->V);
	fp_add_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->n04, t->n03);
	fp_sub_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->D1->Q, t->n13);
	fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->D1->S, t->n12);
	fp_sub_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n06, t->n02);
	fp_ml2_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n07);
	fp_sqr_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n03);
	fp_sub_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n09, t->n08);
	fp_sub_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->D1->R, t->n14);
	fp_add_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n10, t->n06);
	fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n04, t->n05);
	fp_sub_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n12, t->n11);
	fp_mul_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n10, t->n03);
	fp_add_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n13, t->n16);
	fp_mul_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->D1->R, t->n05);
	fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n15, t->n14);
#endif
}

/* Assumption: D2 ne 0. */
void hec_fp_add_2e128mc_g2i_jac(TEMP_hec_fp_2e128mc t, DIV_hec_fp_2e128mc D2){
	if(((t->D1->Z[0] == 0) && (t->D1->Z[1] == 0)) || ((t->D1->W[0] == 0) && (t->D1->W[1] == 0))){
		fp_cpy_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, D2->Q);
		fp_cpy_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, D2->R);
		fp_cpy_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, D2->S);
		fp_cpy_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, D2->T);
		fp_cpy_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, D2->Z);
		fp_cpy_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, D2->W);
		fp_cpy_2e128mc_x8664_asm(t->D1->V, t->cn->prm, NULL, D2->V);
	}else{
#ifdef GENERATED_ASM
		//ADD++;
		hec_fp_add_2e128mc_g2i_jac_x8664_asm(t, D2);
#else
		fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->Z);
		fp_sqr_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D1->W, t->D1->Z);
		fp_mul_2e128mc_x8664_asm(t->n17, t->cn->prm, NULL, D2->Q, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n18, t->cn->prm, NULL, D2->R, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n03, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n19, t->cn->prm, NULL, D2->S, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n03, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n20, t->cn->prm, NULL, D2->T, t->n05);
		fp_sqr_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, D2->Z);
		fp_sqr_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, D2->W, D2->Z);
		fp_mul_2e128mc_x8664_asm(t->n21, t->cn->prm, NULL, t->D1->Q, t->n06);
		fp_sub_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n21, t->n17);
		fp_mul_2e128mc_x8664_asm(t->n22, t->cn->prm, NULL, t->D1->R, t->n07);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n22, t->n18);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n08, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n23, t->cn->prm, NULL, t->D1->S, t->n09);
		fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n23, t->n19);
		fp_mul_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->n08, t->n07);
		fp_mul_2e128mc_x8664_asm(t->n24, t->cn->prm, NULL, t->D1->T, t->n10);
		fp_sub_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n24, t->n20);
		fp_mul_2e128mc_x8664_asm(t->n26, t->cn->prm, NULL, t->D1->Z, D2->Z);
		fp_mul_2e128mc_x8664_asm(t->n25, t->cn->prm, NULL, t->D1->W, D2->W);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n01, t->n17);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->n02);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n01, t->n18);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n02, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n01, t->n04);
		fp_sub_2e128mc_x8664_asm(t->n10, t->cn->prm, NULL, t->n09, t->n08);
		fp_mul_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n06, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n07, t->n03);
		fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n12, t->n11);
		fp_mul_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n07, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->n06, t->n02);
		fp_sub_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n15, t->n14);
		fp_sqr_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->n10);
		fp_mul_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n10, t->n01);
		fp_sqr_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->n01);
		fp_mul_2e128mc_x8664_asm(t->n04, t->cn->prm, NULL, t->n13, t->n10);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n02, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n17, t->n01);
		fp_add_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n06, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n17, t->cn->prm, NULL, t->n21, t->n01);
		fp_add_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->n17, t->n06);
		fp_mul_2e128mc_x8664_asm(t->n18, t->cn->prm, NULL, t->n22, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n19, t->n05);
		fp_mul_2e128mc_x8664_asm(t->n19, t->cn->prm, NULL, t->n23, t->n05);
		fp_add_2e128mc_x8664_asm(t->n11, t->cn->prm, NULL, t->n19, t->n09);
		fp_mul_2e128mc_x8664_asm(t->n12, t->cn->prm, NULL, t->n24, t->n01);
		fp_mul_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, t->n25, t->n16);
		fp_mul_2e128mc_x8664_asm(t->n20, t->cn->prm, NULL, t->n12, t->n05);
		fp_mul_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, t->n26, t->n10);
		fp_sqr_2e128mc_x8664_asm(t->D1->V, t->cn->prm, NULL, t->D1->W);
		fp_sub_2e128mc_x8664_asm(t->n13, t->cn->prm, NULL, t->n17, t->n07);
		fp_sub_2e128mc_x8664_asm(t->n14, t->cn->prm, NULL, t->n13, t->D1->V);
		fp_sub_2e128mc_x8664_asm(t->D1->Q, t->cn->prm, NULL, t->n14, t->n04);
		fp_sub_2e128mc_x8664_asm(t->n15, t->cn->prm, NULL, t->D1->Q, t->n17);
		fp_mul_2e128mc_x8664_asm(t->n16, t->cn->prm, NULL, t->n04, t->n13);
		fp_mul_2e128mc_x8664_asm(t->n01, t->cn->prm, NULL, t->D1->V, t->n08);
		fp_sub_2e128mc_x8664_asm(t->n02, t->cn->prm, NULL, t->n01, t->n16);
		fp_sub_2e128mc_x8664_asm(t->D1->R, t->cn->prm, NULL, t->n02, t->n11);
		fp_sub_2e128mc_x8664_asm(t->n03, t->cn->prm, NULL, t->D1->R, t->n18);
		fp_mul_2e128mc_x8664_asm(t->n05, t->cn->prm, NULL, t->n14, t->n15);
		fp_sub_2e128mc_x8664_asm(t->n06, t->cn->prm, NULL, t->n05, t->n19);
		fp_sub_2e128mc_x8664_asm(t->D1->S, t->cn->prm, NULL, t->n06, t->n03);
		fp_mul_2e128mc_x8664_asm(t->n07, t->cn->prm, NULL, t->n03, t->n04);
		fp_mul_2e128mc_x8664_asm(t->n08, t->cn->prm, NULL, t->D1->R, t->n15);
		fp_add_2e128mc_x8664_asm(t->n09, t->cn->prm, NULL, t->n08, t->n07);
		fp_sub_2e128mc_x8664_asm(t->D1->T, t->cn->prm, NULL, t->n09, t->n20);
#endif
	}
}

