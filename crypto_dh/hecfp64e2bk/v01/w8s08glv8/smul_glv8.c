//#define DEBUG_MODE

#ifdef DEBUG_MODE
	#include <stdio.h>
	#include "kernel.h"
#else
	#include "_core.h"
#endif
#include "multiprecision.h"
#include "multiprecision_stack.h"
#include "finite128.h"

static inline void psi1(DIV_hec_fp_2e064mce2 D3, const DIV_hec_fp_2e064mce2 D1, const CNS_hec_fp_2e064mce2_glv8_s2 cn){
	fp_cjg_2e064mce2_x8664(D3->P, cn->prm, NULL, D1->P);
	fp_mul_2e064mce2_x8664(D3->P, cn->prm, NULL, D3->P, cn->u1z);
	fp_cjg_2e064mce2_x8664(D3->R, cn->prm, NULL, D1->R);
	fp_mul_2e064mce2_x8664(D3->R, cn->prm, NULL, D3->R, cn->u0z);
	fp_cjg_2e064mce2_x8664(D3->S, cn->prm, NULL, D1->S);
	fp_mul_2e064mce2_x8664(D3->S, cn->prm, NULL, D3->S, cn->v1z);
	fp_cjg_2e064mce2_x8664(D3->T, cn->prm, NULL, D1->T);
	fp_mul_2e064mce2_x8664(D3->T, cn->prm, NULL, D3->T, cn->v0z);
	fp_cjg_2e064mce2_x8664(D3->Z, cn->prm, NULL, D1->Z);
}

static inline void psi2(DIV_hec_fp_2e064mce2 D3, const DIV_hec_fp_2e064mce2 D1, const CNS_hec_fp_2e064mce2_glv8_s2 cn){
	/*
	fp_mul_2e064mce2_x8664(D3->P, cn->prm, NULL, D1->P, cn->u1m2);
	fp_mul_2e064mce2_x8664(D3->R, cn->prm, NULL, D1->R, cn->u0m2);
	fp_mul_2e064mce2_x8664(D3->S, cn->prm, NULL, D1->S, cn->v1m2);
	fp_mul_2e064mce2_x8664(D3->T, cn->prm, NULL, D1->T, cn->v0m2);
	*/
	fp_mld_2e064mce2_x8664(D3->P, cn->prm, NULL, D1->P, cn->u1m2);
	fp_mld_2e064mce2_x8664(D3->R, cn->prm, NULL, D1->R, cn->u0m2);
	fp_mld_2e064mce2_x8664(D3->S, cn->prm, NULL, D1->S, cn->v1m2);
	fp_neg_2e064mce2_x8664(D3->T, cn->prm, NULL, D1->T);

	fp_cpy_2e064mce2_x8664(D3->Z, cn->prm, NULL, D1->Z);
}

static inline void psi3(DIV_hec_fp_2e064mce2 D3, const DIV_hec_fp_2e064mce2 D1, const CNS_hec_fp_2e064mce2_glv8_s2 cn){
	fp_cjg_2e064mce2_x8664(D3->P, cn->prm, NULL, D1->P);
	fp_mul_2e064mce2_x8664(D3->P, cn->prm, NULL, D3->P, cn->u1m3);
	fp_cjg_2e064mce2_x8664(D3->R, cn->prm, NULL, D1->R);
	fp_mul_2e064mce2_x8664(D3->R, cn->prm, NULL, D3->R, cn->u0m3);
	fp_cjg_2e064mce2_x8664(D3->S, cn->prm, NULL, D1->S);
	fp_mul_2e064mce2_x8664(D3->S, cn->prm, NULL, D3->S, cn->v1m3);
	fp_cjg_2e064mce2_x8664(D3->T, cn->prm, NULL, D1->T);
	fp_mul_2e064mce2_x8664(D3->T, cn->prm, NULL, D3->T, cn->v0m3);
	fp_cjg_2e064mce2_x8664(D3->Z, cn->prm, NULL, D1->Z);
	fp_cjg_2e064mce2_x8664(D3->Z, cn->prm, NULL, D1->Z);
}

static inline void psi4(DIV_hec_fp_2e064mce2 D3, const DIV_hec_fp_2e064mce2 D1, const CNS_hec_fp_2e064mce2_glv8_s2 cn){
	/*
	fp_mul_2e064mce2_x8664(D3->P, cn->prm, NULL, D1->P, cn->u1m4);
	fp_mul_2e064mce2_x8664(D3->R, cn->prm, NULL, D1->R, cn->u0m4);
	fp_mul_2e064mce2_x8664(D3->S, cn->prm, NULL, D1->S, cn->v1m4);
	fp_mul_2e064mce2_x8664(D3->T, cn->prm, NULL, D1->T, cn->v0m4);
	*/
	fp_mld_2e064mce2_x8664(D3->P, cn->prm, NULL, D1->P, cn->u1m4);
	fp_mld_2e064mce2_x8664(D3->R, cn->prm, NULL, D1->R, cn->u0m4);
	fp_mld_2e064mce2_x8664(D3->S, cn->prm, NULL, D1->S, cn->v1m4);
	fp_cpy_2e064mce2_x8664(D3->T, cn->prm, NULL, D1->T);

	fp_cpy_2e064mce2_x8664(D3->Z, cn->prm, NULL, D1->Z);
}

static inline void psi5(DIV_hec_fp_2e064mce2 D3, const DIV_hec_fp_2e064mce2 D1, const CNS_hec_fp_2e064mce2_glv8_s2 cn){
	fp_cjg_2e064mce2_x8664(D3->P, cn->prm, NULL, D1->P);
	fp_mul_2e064mce2_x8664(D3->P, cn->prm, NULL, D3->P, cn->u1m5);
	fp_cjg_2e064mce2_x8664(D3->R, cn->prm, NULL, D1->R);
	fp_mul_2e064mce2_x8664(D3->R, cn->prm, NULL, D3->R, cn->u0m5);
	fp_cjg_2e064mce2_x8664(D3->S, cn->prm, NULL, D1->S);
	fp_mul_2e064mce2_x8664(D3->S, cn->prm, NULL, D3->S, cn->v1m5);
	fp_cjg_2e064mce2_x8664(D3->T, cn->prm, NULL, D1->T);
	fp_mul_2e064mce2_x8664(D3->T, cn->prm, NULL, D3->T, cn->v0m5);
	fp_cjg_2e064mce2_x8664(D3->Z, cn->prm, NULL, D1->Z);
	fp_cjg_2e064mce2_x8664(D3->Z, cn->prm, NULL, D1->Z);
}

static inline void psi6(DIV_hec_fp_2e064mce2 D3, const DIV_hec_fp_2e064mce2 D1, const CNS_hec_fp_2e064mce2_glv8_s2 cn){
	/*
	fp_mul_2e064mce2_x8664(D3->P, cn->prm, NULL, D1->P, cn->u1m6);
	fp_mul_2e064mce2_x8664(D3->R, cn->prm, NULL, D1->R, cn->u0m6);
	fp_mul_2e064mce2_x8664(D3->S, cn->prm, NULL, D1->S, cn->v1m6);
	fp_mul_2e064mce2_x8664(D3->T, cn->prm, NULL, D1->T, cn->v0m6);
	*/
	fp_mld_2e064mce2_x8664(D3->P, cn->prm, NULL, D1->P, cn->u1m6);
	fp_mld_2e064mce2_x8664(D3->R, cn->prm, NULL, D1->R, cn->u0m6);
	fp_mld_2e064mce2_x8664(D3->S, cn->prm, NULL, D1->S, cn->v1m6);
	fp_mld_2e064mce2_x8664(D3->T, cn->prm, NULL, D1->T, cn->v0m6);

	fp_cpy_2e064mce2_x8664(D3->Z, cn->prm, NULL, D1->Z);
}



void hec_fp_smul_2e064mce2_glv8_a2is0_a3is0_antep_s2(DIV_hec_fp_2e064mce2 d1, const uni kn,  DIV_hec_fp_2e064mce2 d2, CNS_hec_fp_2e064mce2_glv8_s2 cn)
{
	uni_t y0s[16*FP_LEN], y1s[16*FP_LEN], y2s[16*FP_LEN], y3s[16*FP_LEN], y4s[16*FP_LEN], y5s[16*FP_LEN], y6s[16*FP_LEN], y7s[16*FP_LEN];
	uni_t k0s[16*FP_LEN], k1s[16*FP_LEN], k2s[16*FP_LEN], k3s[16*FP_LEN], k4s[16*FP_LEN], k5s[16*FP_LEN], k6s[16*FP_LEN], k7s[16*FP_LEN];
	uni_t rs[16*FP_LEN], ts[16*FP_LEN], Ts[16*FP_LEN], Ks[16*FP_LEN];
	MI_t ah1, ah2, ah3, ah4, ah5, ah6, ah7, ah8;
	MI_t A0, A1, A2, A3, A4, A5, A6, A7;
	MI_t y0, y1, y2, y3, y4, y5, y6, y7;
	MI_t k0, k1, k2, k3, k4, k5, k6, k7;
	MI_t N, r, k, t, T, K, Nt;
	DIV_hec_fp_2e064mce2_t T1[16], T2[16];

	ah1->v->n = (uni)cn->ah1; ah1->v->l = 2*FP_LEN; ah1->s = POSITIVE;
	ah2->v->n = (uni)cn->ah2; ah2->v->l = 2*FP_LEN; ah2->s = POSITIVE;
	ah3->v->n = (uni)cn->ah3; ah3->v->l = 2*FP_LEN; ah3->s = NEGATIVE;
	ah4->v->n = (uni)cn->ah4; ah4->v->l = 2*FP_LEN; ah4->s = NEGATIVE;
	ah5->v->n = (uni)cn->ah5; ah5->v->l = 2*FP_LEN; ah5->s = POSITIVE;
	ah6->v->n = (uni)cn->ah6; ah6->v->l = 2*FP_LEN; ah6->s = POSITIVE;
	ah7->v->n = (uni)cn->ah7; ah7->v->l = 2*FP_LEN; ah7->s = POSITIVE;
	ah8->v->n = (uni)cn->ah8; ah8->v->l = 2*FP_LEN; ah8->s = NEGATIVE;

	A0->v->n = (uni)cn->A1; A0->v->l = FP_LEN/2; A0->s = POSITIVE;
	A1->v->n = (uni)cn->A2; A1->v->l = FP_LEN/2; A1->s = POSITIVE;
	A2->v->n = (uni)cn->A3; A2->v->l = FP_LEN/2; A2->s = NEGATIVE;
	A3->v->n = (uni)cn->A4; A3->v->l = FP_LEN/2; A3->s = POSITIVE;
	A4->v->n = (uni)cn->A5; A4->v->l = FP_LEN/2; A4->s = NEGATIVE;
	A5->v->n = (uni)cn->A6; A5->v->l = FP_LEN/2; A5->s = NEGATIVE;
	A6->v->n = (uni)cn->A7; A6->v->l = FP_LEN/2; A6->s = POSITIVE;
	A7->v->n = (uni)cn->A8; A7->v->l = FP_LEN/2; A7->s = NEGATIVE;

	N->v->n = (uni)cn->N; N->v->l = 2*FP_LEN; N->s = POSITIVE;
	Nt->v->n = (uni)cn->Nhalf; Nt->v->l = 2*FP_LEN; Nt->s = POSITIVE;

	k->v->n = kn; k->v->l = 2*FP_LEN; k->s = POSITIVE;

	y0->v->n = y0s; y1->v->n = y1s; y2->v->n = y2s; y3->v->n = y3s;
	y4->v->n = y4s; y5->v->n = y5s; y6->v->n = y6s; y7->v->n = y7s;

	k0->v->n = k0s; k1->v->n = k1s; k2->v->n = k2s; k3->v->n = k3s;
	k4->v->n = k4s; k5->v->n = k5s; k6->v->n = k6s; k7->v->n = k7s;

	t->v->n = ts; r->v->n = rs; T->v->n = Ts; K->v->n = Ks;

	mi_mul_stack(t, ah1, k); mi_div_q_r_stack(y0, r, t, N);
	if(mi_compare_abs_stack(r, Nt) == GREATER){
		if(t->s == POSITIVE){
			mi_add_1_stack(y0, y0, 1);
		}
		else{
			mi_sub_1_stack(y0, y0, 1);
		}
	}
	mi_mul_stack(t, ah2, k); mi_div_q_r_stack(y1, r, t, N);
	if(mi_compare_abs_stack(r, Nt) == GREATER){
		if(t->s == POSITIVE){
			mi_add_1_stack(y1, y1, 1);
		}
		else{
			mi_sub_1_stack(y1, y1, 1);
		}
	}
	mi_mul_stack(t, ah3, k); mi_div_q_r_stack(y2, r, t, N);
	if(mi_compare_abs_stack(r, Nt) == GREATER){
		if(t->s == POSITIVE){
			mi_add_1_stack(y2, y2, 1);
		}
		else{
			mi_sub_1_stack(y2, y2, 1);
		}
	}
	mi_mul_stack(t, ah4, k); mi_div_q_r_stack(y3, r, t, N);
	if(mi_compare_abs_stack(r, Nt) == GREATER){
		if(t->s == POSITIVE){
			mi_add_1_stack(y3, y3, 1);
		}
		else{
			mi_sub_1_stack(y3, y3, 1);
		}
	}
	mi_mul_stack(t, ah5, k); mi_div_q_r_stack(y4, r, t, N);
	if(mi_compare_abs_stack(r, Nt) == GREATER){
		if(t->s == POSITIVE){
			mi_add_1_stack(y4, y4, 1);
		}
		else{
			mi_sub_1_stack(y4, y4, 1);
		}
	}
	mi_mul_stack(t, ah6, k); mi_div_q_r_stack(y5, r, t, N);
	if(mi_compare_abs_stack(r, Nt) == GREATER){
		if(t->s == POSITIVE){
			mi_add_1_stack(y5, y5, 1);
		}
		else{
			mi_sub_1_stack(y5, y5, 1);
		}
	}
	mi_mul_stack(t, ah7, k); mi_div_q_r_stack(y6, r, t, N);
	if(mi_compare_abs_stack(r, Nt) == GREATER){
		if(t->s == POSITIVE){
			mi_add_1_stack(y6, y6, 1);
		}
		else{
			mi_sub_1_stack(y6, y6, 1);
		}
	}
	mi_mul_stack(t, ah8, k); mi_div_q_r_stack(y7, r, t, N);
	if(mi_compare_abs_stack(r, Nt) == GREATER){
		if(t->s == POSITIVE){
			mi_add_1_stack(y7, y7, 1);
		}
		else{
			mi_sub_1_stack(y7, y7, 1);
		}
	}


	MI_t ZR;
	uni_t ZRn[FP_LEN];

	ZR->v->n = ZRn;
	mi_set_1_stack(ZR, 0);

	mi_mul_stack(T, A0, y0);
	mi_sub_stack(k0, k, T);
	mi_mul_stack(T, A0, y1);
	mi_mul_stack(K, A1, y0);
	mi_add_stack(T, T, K);
	mi_sub_stack(k1, ZR, T);
	mi_mul_stack(T, A2, y0);
	mi_mul_stack(K, A0, y2);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A1, y1);
	mi_add_stack(T, T, K);
	mi_sub_stack(k2, ZR, T);
	mi_mul_stack(T, A3, y0);
	mi_mul_stack(K, A0, y3);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A1, y2);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A2, y1);
	mi_add_stack(T, T, K);
	mi_sub_stack(k3, ZR, T);
	mi_mul_stack(T, A0, y4);
	mi_mul_stack(K, A4, y0);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A1, y3);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A3, y1);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A2, y2);
	mi_add_stack(T, T, K);
	mi_sub_stack(k4, ZR, T);
	mi_mul_stack(T, A0, y5);
	mi_mul_stack(K, A5, y0);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A1, y4);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A4, y1);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A2, y3);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A3, y2);
	mi_add_stack(T, T, K);
	mi_sub_stack(k5, ZR, T);
	mi_mul_stack(T, A0, y6);
	mi_mul_stack(K, A6, y0);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A1, y5);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A5, y1);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A2, y4);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A4, y2);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A3, y3);
	mi_add_stack(T, T, K);
	mi_sub_stack(k6, ZR, T);
	mi_mul_stack(T, A0, y7);
	mi_mul_stack(K, A7, y0);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A1, y6);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A6, y1);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A2, y5);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A5, y2);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A3, y4);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A4, y3);
	mi_add_stack(T, T, K);
	mi_sub_stack(k7, ZR, T);
	mi_mul_stack(T, A1, y7);
	mi_mul_stack(K, A7, y1);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A2, y6);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A6, y2);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A3, y5);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A4, y4);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A5, y3);
	mi_add_stack(T, T, K);
	mi_add_stack(k0, k0, T);
	mi_sub_stack(k2, k2, T);
	mi_add_stack(k4, k4, T);
	mi_sub_stack(k6, k6, T);
	mi_mul_stack(T, A6, y3);
	mi_mul_stack(K, A7, y2);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A3, y6);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A4, y5);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A5, y4);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A2, y7);
	mi_add_stack(T, T, K);
	mi_add_stack(k1, k1, T);
	mi_sub_stack(k3, k3, T);
	mi_add_stack(k5, k5, T);
	mi_sub_stack(k7, k7, T);
	mi_mul_stack(T, A4, y6);
	mi_mul_stack(K, A5, y5);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A6, y4);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A7, y3);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A3, y7);
	mi_add_stack(T, T, K);
	mi_add_stack(k0, k0, T);
	mi_mul_stack(T, A7, y4);
	mi_mul_stack(K, A6, y5);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A4, y7);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A5, y6);
	mi_add_stack(T, T, K);
	mi_add_stack(k1, k1, T);
	mi_mul_stack(T, A7, y5);
	mi_mul_stack(K, A6, y6);
	mi_add_stack(T, T, K);
	mi_mul_stack(K, A5, y7);
	mi_add_stack(T, T, K);
	mi_add_stack(k2, k2, T);
	mi_mul_stack(T, A7, y6);
	mi_mul_stack(K, A6, y7);
	mi_add_stack(T, T, K);
	mi_add_stack(k3, k3, T);
	mi_mul_stack(T, A7, y7);
	mi_add_stack(k4, k4, T);

	hec_fp_cpy_2e064mce2_g2i(T1[1], d2, (CNS_hec_fp_2e064mce2)cn);  //D0
	psi1(T1[2], T1[1], cn);  //D1
	psi2(T1[4], T1[1], cn);  //D2
	psi2(T1[8], T1[2], cn);  //D3
	psi4(T2[1], T1[1], cn);  //D4
	psi4(T2[2], T1[2], cn);  //D5
	psi4(T2[4], T1[4], cn);  //D6
	psi4(T2[8], T1[8], cn);  //D7

	if(k0->s == NEGATIVE){
		hec_fp_neg_2e064mce2_g2i(T1[1], T1[1], (CNS_hec_fp_2e064mce2)cn);
	}
	if(k1->s == NEGATIVE){
		hec_fp_neg_2e064mce2_g2i(T1[2], T1[2], (CNS_hec_fp_2e064mce2)cn);
	}
	if(k2->s == NEGATIVE){
		hec_fp_neg_2e064mce2_g2i(T1[4], T1[4], (CNS_hec_fp_2e064mce2)cn);
	}
	if(k3->s == NEGATIVE){
		hec_fp_neg_2e064mce2_g2i(T1[8], T1[8], (CNS_hec_fp_2e064mce2)cn);
	}
	if(k4->s == NEGATIVE){
		hec_fp_neg_2e064mce2_g2i(T2[1], T2[1], (CNS_hec_fp_2e064mce2)cn);
	}
	if(k5->s == NEGATIVE){
		hec_fp_neg_2e064mce2_g2i(T2[2], T2[2], (CNS_hec_fp_2e064mce2)cn);
	}
	if(k6->s == NEGATIVE){
		hec_fp_neg_2e064mce2_g2i(T2[4], T2[4], (CNS_hec_fp_2e064mce2)cn);
	}
	if(k7->s == NEGATIVE){
		hec_fp_neg_2e064mce2_g2i(T2[8], T2[8], (CNS_hec_fp_2e064mce2)cn);
	}
	fp_st1_2e064mce2_x8664(T1[0]->Z, cn->prm, NULL, 0); //Marker for the identity element.
	fp_st1_2e064mce2_x8664(T2[0]->Z, cn->prm, NULL, 0); //Marker for the identity element.
	hec_fp_aadd_2e064mce2_g2i(T1[3], T1[2], T1[1], (CNS_hec_fp_2e064mce2)cn);
	hec_fp_aadd_2e064mce2_g2i(T1[5], T1[4], T1[1], (CNS_hec_fp_2e064mce2)cn);
	if(k0->s == k2->s){
		psi1(T1[6], T1[3], cn);
		if(k0->s != k1->s){
			hec_fp_neg_2e064mce2_g2i(T1[6], T1[6], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_aadd_2e064mce2_g2i(T1[6], T1[4], T1[2], (CNS_hec_fp_2e064mce2)cn);
	}
	hec_fp_madd_2e064mce2_g2i(T1[7], T1[6], T1[1], (CNS_hec_fp_2e064mce2)cn);
	hec_fp_aadd_2e064mce2_g2i(T1[9], T1[8], T1[1], (CNS_hec_fp_2e064mce2)cn);
	if((k0->s ^ k2->s) == (k1->s ^ k3->s)){
		psi1(T1[10], T1[5], cn);
		if(k0->s != k1->s){
			hec_fp_neg_2e064mce2_g2i(T1[10], T1[10], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_aadd_2e064mce2_g2i(T1[10], T1[8], T1[2], (CNS_hec_fp_2e064mce2)cn);
	}
	hec_fp_madd_2e064mce2_g2i(T1[11], T1[10], T1[1], (CNS_hec_fp_2e064mce2)cn);
	if(k1->s == k3->s){
		psi1(T1[12], T1[6], cn);
		if(k1->s != k2->s){
			hec_fp_neg_2e064mce2_g2i(T1[12], T1[12], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_aadd_2e064mce2_g2i(T1[12], T1[8], T1[4], (CNS_hec_fp_2e064mce2)cn);
	}
	hec_fp_madd_2e064mce2_g2i(T1[13], T1[12], T1[1], (CNS_hec_fp_2e064mce2)cn);
	if((k0->s == k1->s) && (k0->s == k2->s) && (k0->s == k3->s)){
		psi1(T1[14], T1[7], cn);
	}
	else{
		hec_fp_madd_2e064mce2_g2i(T1[14], T1[12], T1[2], (CNS_hec_fp_2e064mce2)cn);
	}
	hec_fp_madd_2e064mce2_g2i(T1[15], T1[14], T1[1], (CNS_hec_fp_2e064mce2)cn);
	if((k2->s ^ k3->s) == (k4->s ^ k5->s)){
		psi2(T2[3], T1[12], cn);
		if(k2->s != k4->s){
			hec_fp_neg_2e064mce2_g2i(T2[3], T2[3], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if((k1->s ^ k2->s) == (k4->s ^ k5->s)){
		psi3(T2[3], T1[6], cn);
		if(k1->s != k4->s){
			hec_fp_neg_2e064mce2_g2i(T2[3], T2[3], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if((k0->s ^ k1->s) == (k4->s ^ k5->s)){
		psi4(T2[3], T1[3], cn);
		if(k0->s != k4->s){
			hec_fp_neg_2e064mce2_g2i(T2[3], T2[3], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_aadd_2e064mce2_g2i(T2[3], T2[2], T2[1], (CNS_hec_fp_2e064mce2)cn);
	}
	if((k1->s ^ k3->s) == (k4->s ^ k6->s)){
		psi3(T2[5], T1[10], cn);
		if(k1->s != k4->s){
			hec_fp_neg_2e064mce2_g2i(T2[5], T2[5], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if((k0->s ^ k2->s) == (k4->s ^ k6->s)){
		psi4(T2[5], T1[5], cn);
		if(k0->s != k4->s){
			hec_fp_neg_2e064mce2_g2i(T2[5], T2[5], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_aadd_2e064mce2_g2i(T2[5], T2[4], T2[1], (CNS_hec_fp_2e064mce2)cn);
	}
	if(k4->s == k6->s){
		psi1(T2[6], T2[3], cn);
		if(k4->s != k5->s){
			hec_fp_neg_2e064mce2_g2i(T2[6], T2[6], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if((k2->s ^ k3->s) == (k5->s ^ k6->s)){
		psi3(T2[6], T1[12], cn);
		if(k2->s != k5->s){
			hec_fp_neg_2e064mce2_g2i(T2[6], T2[6], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if((k1->s ^ k2->s) == (k5->s ^ k6->s)){
		psi4(T2[6], T1[6], cn);
		if(k1->s != k5->s){
			hec_fp_neg_2e064mce2_g2i(T2[6], T2[6], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if((k0->s ^ k1->s) == (k5->s ^ k6->s)){
		psi5(T2[6], T1[3], cn);
		if(k0->s != k5->s){
			hec_fp_neg_2e064mce2_g2i(T2[6], T2[6], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_aadd_2e064mce2_g2i(T2[6], T2[4], T2[2], (CNS_hec_fp_2e064mce2)cn);
	}
	if(((k1->s ^ k4->s) == (k2->s ^ k5->s)) && ((k1->s ^ k4->s) == (k3->s ^ k6->s))){
		psi3(T2[7], T1[14], cn);
		if(k1->s != k4->s){
			hec_fp_neg_2e064mce2_g2i(T2[7], T2[7], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if(((k0->s ^ k4->s) == (k1->s ^ k5->s)) && ((k0->s ^ k4->s) == (k2->s ^ k6->s))){
		psi4(T2[7], T1[7], cn);
		if(k0->s != k4->s){
			hec_fp_neg_2e064mce2_g2i(T2[7], T2[7], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_madd_2e064mce2_g2i(T2[7], T2[6], T2[1], (CNS_hec_fp_2e064mce2)cn);
	}
	if((k0->s ^ k4->s) == (k3->s ^ k7->s)){
		psi4(T2[9], T1[9], cn);
		if(k0->s != k4->s){
			hec_fp_neg_2e064mce2_g2i(T2[9], T2[9], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_aadd_2e064mce2_g2i(T2[9], T2[8], T2[1], (CNS_hec_fp_2e064mce2)cn);
	}
	if((k4->s ^ k5->s) == (k6->s ^ k7->s)){
		psi1(T2[10], T2[5], cn);
		if(k4->s != k5->s){
			hec_fp_neg_2e064mce2_g2i(T2[10], T2[10], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if((k1->s ^ k5->s) == (k3->s ^ k7->s)){
		psi4(T2[10], T1[10], cn);
		if(k1->s != k5->s){
			hec_fp_neg_2e064mce2_g2i(T2[10], T2[10], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if((k0->s ^ k5->s) == (k2->s ^ k7->s)){
		psi5(T2[10], T1[5], cn);
		if(k0->s != k5->s){
			hec_fp_neg_2e064mce2_g2i(T2[10], T2[10], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_aadd_2e064mce2_g2i(T2[10], T2[8], T2[2], (CNS_hec_fp_2e064mce2)cn);
	}
	if(((k0->s ^ k4->s) == (k1->s ^ k5->s)) && ((k0->s ^ k4->s) == (k3->s ^ k7->s))){
		psi4(T2[11], T1[11], cn);
		if(k0->s != k4->s){
			hec_fp_neg_2e064mce2_g2i(T2[11], T2[11], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_madd_2e064mce2_g2i(T2[11], T2[10], T2[1], (CNS_hec_fp_2e064mce2)cn);
	}
	if(k5->s == k7->s){
		psi1(T2[12], T2[6], cn);
		if(k5->s != k6->s){
			hec_fp_neg_2e064mce2_g2i(T2[12], T2[12], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if((k4->s ^ k6->s) == (k5->s ^ k7->s)){
		psi2(T2[12], T2[3], cn);
		if(k4->s != k6->s){
			hec_fp_neg_2e064mce2_g2i(T2[12], T2[12], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if((k2->s ^ k6->s) == (k3->s ^ k7->s)){
		psi4(T2[12], T1[12], cn);
		if(k2->s != k6->s){
			hec_fp_neg_2e064mce2_g2i(T2[12], T2[12], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if((k1->s ^ k6->s) == (k2->s ^ k7->s)){
		psi5(T2[12], T1[6], cn);
		if(k1->s != k6->s){
			hec_fp_neg_2e064mce2_g2i(T2[12], T2[12], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if((k0->s ^ k6->s) == (k1->s ^ k7->s)){
		psi6(T2[12], T1[3], cn);
		if(k0->s != k6->s){
			hec_fp_neg_2e064mce2_g2i(T2[12], T2[12], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_aadd_2e064mce2_g2i(T2[12], T2[8], T2[4], (CNS_hec_fp_2e064mce2)cn);
	}
	if(((k0->s ^ k4->s) == (k2->s ^ k6->s)) && ((k0->s ^ k4->s) == (k3->s ^ k7->s))){
		psi4(T2[13], T1[13], cn);
		if(k0->s != k4->s){
			hec_fp_neg_2e064mce2_g2i(T2[13], T2[13], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_madd_2e064mce2_g2i(T2[13], T2[12], T2[1], (CNS_hec_fp_2e064mce2)cn);
	}
	if((k4->s == k5->s) && (k4->s == k6->s) && (k4->s == k7->s)){
		psi1(T2[14], T2[7], cn);
	}
	else if(((k1->s ^ k5->s) == (k2->s ^ k6->s)) && ((k1->s ^ k5->s) == (k3->s ^ k7->s))){
		psi4(T2[14], T1[14], cn);
		if(k1->s != k5->s){
			hec_fp_neg_2e064mce2_g2i(T2[14], T2[14], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else if(((k0->s ^ k5->s) == (k1->s ^ k6->s)) && ((k0->s ^ k5->s) == (k2->s ^ k7->s))){
		psi5(T2[14], T1[7], cn);
		if(k0->s != k5->s){
			hec_fp_neg_2e064mce2_g2i(T2[14], T2[14], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_madd_2e064mce2_g2i(T2[14], T2[12], T2[2], (CNS_hec_fp_2e064mce2)cn);
	}
	if(((k0->s ^ k4->s) == (k1->s ^ k5->s)) && ((k0->s ^ k4->s) == (k2->s ^ k6->s)) && ((k0->s ^ k4->s) == (k3->s ^ k7->s))){
		psi4(T2[15], T1[15], cn);
		if(k0->s != k4->s){
			hec_fp_neg_2e064mce2_g2i(T2[15], T2[15], (CNS_hec_fp_2e064mce2)cn);
		}
	}
	else{
		hec_fp_madd_2e064mce2_g2i(T2[15], T2[14], T2[1], (CNS_hec_fp_2e064mce2)cn);
	}

	int j, ei, b, bt;

	fp_st1_2e064mce2_x8664(d1->Z, cn->prm, NULL, 0); //Marker for the identity element.

	fp_cnt_bits(&bt, k0->v->n, k0->v->l);
	fp_cnt_bits(&b, k1->v->n, k1->v->l);
	if(b > bt){ bt = b; }
	fp_cnt_bits(&b, k2->v->n, k2->v->l);
	if(b > bt){ bt = b; }
	fp_cnt_bits(&b, k3->v->n, k3->v->l);
	if(b > bt){ bt = b; }
	fp_cnt_bits(&b, k4->v->n, k4->v->l);
	if(b > bt){ bt = b; }
	fp_cnt_bits(&b, k5->v->n, k5->v->l);
	if(b > bt){ bt = b; }
	fp_cnt_bits(&b, k6->v->n, k6->v->l);
	if(b > bt){ bt = b; }
	fp_cnt_bits(&b, k7->v->n, k7->v->l);
	if(b > bt){ bt = b; }

	k0->v->n[k0->v->l] = 0;
	k1->v->n[k1->v->l] = 0;
	k2->v->n[k2->v->l] = 0;
	k3->v->n[k3->v->l] = 0;
	k4->v->n[k4->v->l] = 0;
	k5->v->n[k5->v->l] = 0;
	k6->v->n[k6->v->l] = 0;
	k7->v->n[k7->v->l] = 0;

	j = bt;
	mam_ith_bit(ei, k3->v->n, j); b = ei;
	mam_ith_bit(ei, k2->v->n, j); b = (b << 1) + ei;
	mam_ith_bit(ei, k1->v->n, j); b = (b << 1) + ei;
	mam_ith_bit(ei, k0->v->n, j); b = (b << 1) + ei;
	hec_fp_cpy_2e064mce2_g2i(d1, T1[b], (CNS_hec_fp_2e064mce2)cn);
	mam_ith_bit(ei, k7->v->n, j); b = ei;
	mam_ith_bit(ei, k6->v->n, j); b = (b << 1) + ei;
	mam_ith_bit(ei, k5->v->n, j); b = (b << 1) + ei;
	mam_ith_bit(ei, k4->v->n, j); b = (b << 1) + ei;
	if((b == 1) || (b == 2) || (b == 4) || (b == 8)){
		hec_fp_madd_2e064mce2_g2i(d1, d1, T2[b], (CNS_hec_fp_2e064mce2)cn);
	}
	else{
		hec_fp_add_2e064mce2_g2i(d1, d1, T2[b], (CNS_hec_fp_2e064mce2)cn);
	}
	for(j = bt-1; j > 0; j--){
		hec_fp_dbl_2e064mce2_g2i_a2is0_a3is0(d1, d1, (CNS_hec_fp_2e064mce2)cn);
		mam_ith_bit(ei, k3->v->n, j); b = ei;
		mam_ith_bit(ei, k2->v->n, j); b = (b << 1) + ei;
		mam_ith_bit(ei, k1->v->n, j); b = (b << 1) + ei;
		mam_ith_bit(ei, k0->v->n, j); b = (b << 1) + ei;
		if((b == 1) || (b == 2) || (b == 4) || (b == 8)){
			hec_fp_madd_2e064mce2_g2i(d1, d1, T1[b], (CNS_hec_fp_2e064mce2)cn);
		}
		else{
			hec_fp_add_2e064mce2_g2i(d1, d1, T1[b], (CNS_hec_fp_2e064mce2)cn);
		}
		mam_ith_bit(ei, k7->v->n, j); b = ei;
		mam_ith_bit(ei, k6->v->n, j); b = (b << 1) + ei;
		mam_ith_bit(ei, k5->v->n, j); b = (b << 1) + ei;
		mam_ith_bit(ei, k4->v->n, j); b = (b << 1) + ei;
		if((b == 1) || (b == 2) || (b == 4) || (b == 8)){
			hec_fp_madd_2e064mce2_g2i(d1, d1, T2[b], (CNS_hec_fp_2e064mce2)cn);
		}
		else{
			hec_fp_add_2e064mce2_g2i(d1, d1, T2[b], (CNS_hec_fp_2e064mce2)cn);
		}
	}
}

