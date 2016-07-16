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

static inline void phi(DIV_hec_fp_2e128mc D3, const DIV_hec_fp_2e128mc D1, const CNS_hec_fp_2e128mc_glv4 cn){
	fp_mul_2e128mc_x8664_asm(D3->Q, cn->prm, NULL, D1->Q, cn->u1z);
	fp_mul_2e128mc_x8664_asm(D3->R, cn->prm, NULL, D1->R, cn->u0z);
	fp_mul_2e128mc_x8664_asm(D3->S, cn->prm, NULL, D1->S, cn->v1z);
	fp_mul_2e128mc_x8664_asm(D3->T, cn->prm, NULL, D1->T, cn->v0z);
	fp_cpy_2e128mc_x8664_asm(D3->Z, cn->prm, NULL, D1->Z);
}

void hec_fp_smul_2e128mc_bk_glv4(DIV_hec_fp_2e128mc D1, const uni kn,  DIV_hec_fp_2e128mc D2, CNS_hec_fp_2e128mc_glv4 cn)
{
	uni_t y1s[4*FP_LEN], y2s[4*FP_LEN], y3s[4*FP_LEN], y4s[4*FP_LEN], rs[4*FP_LEN], ts[4*FP_LEN], k0s[4*FP_LEN], k1s[4*FP_LEN], k2s[4*FP_LEN], k3s[4*FP_LEN], Ks[4*FP_LEN], Ts[4*FP_LEN];
	MI_t y1, y2, y3, y4, ah1, ah2, ah3, ah4, N, r, k, t, A1, A2, A3, A4, k0, k1, k2, k3, K, T, Nt;
	DIV_hec_fp_2e128mc_t d0, d1, d2, d3, tbl[16];
	TEMP_hec_fp_2e128mc_t w;
	int j, ei, b, bt;

	w->cn->prm = cn->prm;
	fp_cpy_2e128mc_x8664_asm(w->cn->a2, w->cn->prm, NULL, cn->a2);
	fp_cpy_2e128mc_x8664_asm(w->cn->a3, w->cn->prm, NULL, cn->a3);

	/*uni_t i; fp_cnt_bits(&i, kn, FP_LEN*2); printf("%d ", i);*/

	ah1->v->n = (uni)cn->ah1; ah1->v->l = 3*FP_LEN/2; ah1->s = NEGATIVE;
	ah2->v->n = (uni)cn->ah2; ah2->v->l = 3*FP_LEN/2; ah2->s = NEGATIVE;
	ah3->v->n = (uni)cn->ah3; ah3->v->l = 3*FP_LEN/2; ah3->s = NEGATIVE;
	ah4->v->n = (uni)cn->ah4; ah4->v->l = 3*FP_LEN/2; ah4->s = NEGATIVE;
	A1->v->n = (uni)cn->A1; A1->v->l = FP_LEN/2; A1->s = POSITIVE;
	A2->v->n = (uni)cn->A2; A2->v->l = FP_LEN/2; A2->s = POSITIVE;
	A3->v->n = (uni)cn->A3; A3->v->l = FP_LEN/2; A3->s = NEGATIVE;
	A4->v->n = (uni)cn->A4; A4->v->l = FP_LEN/2; A4->s = NEGATIVE;
	N->v->n = (uni)cn->N; N->v->l = 2*FP_LEN; N->s = POSITIVE;
	Nt->v->n = (uni)cn->Nhalf; Nt->v->l = 2*FP_LEN; Nt->s = POSITIVE;
	k->v->n = kn; k->v->l = 2*FP_LEN; k->s = POSITIVE;
	y1->v->n = y1s; y2->v->n = y2s; y3->v->n = y3s; y4->v->n = y4s;
	k0->v->n = k0s; k1->v->n = k1s; k2->v->n = k2s; k3->v->n = k3s;
	t->v->n = ts; r->v->n = rs; T->v->n = Ts; K->v->n = Ks;

	mi_mul_stack(t, ah1, k); mi_div_q_r_stack(y1, r, t, N);
	if(mi_compare_abs_stack(r, Nt) == GREATER){
		if(t->s == POSITIVE){
			mi_add_1_stack(y1, y1, 1);
		}
		else{
			mi_sub_1_stack(y1, y1, 1);
		}
	}
	mi_mul_stack(t, ah2, k); mi_div_q_r_stack(y2, r, t, N);
	if(mi_compare_abs_stack(r, Nt) == GREATER){
		if(t->s == POSITIVE){
			mi_add_1_stack(y2, y2, 1);
		}
		else{
			mi_sub_1_stack(y2, y2, 1);
		}
	}
	mi_mul_stack(t, ah3, k); mi_div_q_r_stack(y3, r, t, N);
	if(mi_compare_abs_stack(r, Nt) == GREATER){
		if(t->s == POSITIVE){
			mi_add_1_stack(y3, y3, 1);
		}
		else{
			mi_sub_1_stack(y3, y3, 1);
		}
	}
	mi_mul_stack(t, ah4, k); mi_div_q_r_stack(y4, r, t, N);
	if(mi_compare_abs_stack(r, Nt) == GREATER){
		if(t->s == POSITIVE){
			mi_add_1_stack(y4, y4, 1);
		}
		else{
			mi_sub_1_stack(y4, y4, 1);
		}
	}

	mi_mul_stack(K, A2, y4);
	mi_mul_stack(T, A3, y3);
	mi_add_stack(K, K, T);
	mi_mul_stack(T, A4, y2);
	mi_add_stack(K, K, T);
	mi_mul_stack(k0, A1, y1);
	mi_mul_stack(T, A4, y3);
	mi_add_stack(k0, k0, T);
	mi_mul_stack(T, A3, y4);
	mi_add_stack(k0, k0, T);
	mi_sub_stack(k0, k0, K);
	mi_sub_stack(k0, k, k0);
	mi_mul_stack(k1, A1, y2);
	mi_mul_stack(T, A2, y1);
	mi_add_stack(k1, k1, T);
	mi_mul_stack(T, A4, y4);
	mi_add_stack(k1, k1, T);
	mi_sub_stack(k1, K, k1);
	mi_mul_stack(k2, A1, y3);
	mi_mul_stack(T, A2, y2);
	mi_add_stack(k2, k2, T);
	mi_mul_stack(T, A3, y1);
	mi_add_stack(k2, k2, T);
	mi_sub_stack(k2, K, k2);
	mi_mul_stack(k3, A2, y3);
	mi_mul_stack(T, A1, y4);
	mi_add_stack(k3, k3, T);
	mi_mul_stack(T, A4, y1);
	mi_add_stack(k3, k3, T);
	mi_mul_stack(T, A3, y2);
	mi_add_stack(k3, k3, T);
	mi_sub_stack(k3, K, k3);

	hec_fp_cpy_2e128mc_g2i(w, d0, D2);
	phi(d1, d0, cn);
	phi(d2, d1, cn);
	phi(d3, d2, cn);

	if(k0->s == NEGATIVE){
		hec_fp_neg_2e128mc_g2i(w, d0, d0);
	}
	if(k1->s == NEGATIVE){
		hec_fp_neg_2e128mc_g2i(w, d1, d1);
	}
	if(k2->s == NEGATIVE){
		hec_fp_neg_2e128mc_g2i(w, d2, d2);
	}
	if(k3->s == NEGATIVE){
		hec_fp_neg_2e128mc_g2i(w, d3, d3);
	}

	hec_fp_cpy_2e128mc_g2i(w, w->D1, d0);
	hec_fp_aadd_2e128mc_g2i(w, d1);
	hec_fp_cpy_2e128mc_g2i(w, tbl[0], w->D1);

	hec_fp_cpy_2e128mc_g2i(w, w->D1, d0);
	hec_fp_aadd_2e128mc_g2i(w, d2);
	hec_fp_cpy_2e128mc_g2i(w, tbl[1], w->D1);

	hec_fp_cpy_2e128mc_g2i(w, w->D1, d1);
	hec_fp_aadd_2e128mc_g2i(w, d2);
	hec_fp_cpy_2e128mc_g2i(w, tbl[2], w->D1);

	hec_fp_cpy_2e128mc_g2i(w, w->D1, tbl[0]);
	hec_fp_madd_2e128mc_g2i(w, d2);
	hec_fp_cpy_2e128mc_g2i(w, tbl[3], w->D1);

	hec_fp_cpy_2e128mc_g2i(w, w->D1, d0);
	hec_fp_aadd_2e128mc_g2i(w, d3);
	hec_fp_cpy_2e128mc_g2i(w, tbl[4], w->D1);

	hec_fp_cpy_2e128mc_g2i(w, w->D1, d1);
	hec_fp_aadd_2e128mc_g2i(w, d3);
	hec_fp_cpy_2e128mc_g2i(w, tbl[5], w->D1);

	hec_fp_cpy_2e128mc_g2i(w, w->D1, tbl[0]);
	hec_fp_madd_2e128mc_g2i(w, d3);
	hec_fp_cpy_2e128mc_g2i(w, tbl[6], w->D1);

	hec_fp_cpy_2e128mc_g2i(w, w->D1, d2);
	hec_fp_aadd_2e128mc_g2i(w, d3);
	hec_fp_cpy_2e128mc_g2i(w, tbl[7], w->D1);

	hec_fp_cpy_2e128mc_g2i(w, w->D1, tbl[1]);
	hec_fp_madd_2e128mc_g2i(w, d3);
	hec_fp_cpy_2e128mc_g2i(w, tbl[8], w->D1);

	hec_fp_cpy_2e128mc_g2i(w, w->D1, tbl[2]);
	hec_fp_madd_2e128mc_g2i(w, d3);
	hec_fp_cpy_2e128mc_g2i(w, tbl[9], w->D1);

	hec_fp_cpy_2e128mc_g2i(w, w->D1, tbl[3]);
	hec_fp_madd_2e128mc_g2i(w, d3);
	hec_fp_cpy_2e128mc_g2i(w, tbl[10], w->D1);

	/*******************/
//	fp_cpy_2e128mc_x8664_asm(tbl[0]->V, w->cn->prm, NULL, tbl[0]->Z);             //V is accumulator now, W is temp now.
//	for(j = 1; j < 11; j++){
//		fp_mul_2e128mc_x8664_asm(tbl[j]->V, w->cn->prm, NULL, tbl[j]->Z, tbl[j-1]->V);
//	}
//	fp_inv_2e128mc_x8664(tbl[11-1]->V, w->cn->prm, NULL, tbl[11-1]->V);
//	for(j = 11-1; j > 0; j--){
//		fp_mul_2e128mc_x8664_asm(tbl[j]->W, w->cn->prm, NULL, tbl[j-1]->V, tbl[11-1]->V);
//		fp_mul_2e128mc_x8664_asm(tbl[11-1]->V, w->cn->prm, NULL, tbl[j]->Z, tbl[11-1]->V);
//		fp_mul_2e128mc_x8664_asm(tbl[j]->Q, w->cn->prm, NULL, tbl[j]->W, tbl[j]->Q);
//		fp_mul_2e128mc_x8664_asm(tbl[j]->R, w->cn->prm, NULL, tbl[j]->W, tbl[j]->R);
//		fp_mul_2e128mc_x8664_asm(tbl[j]->S, w->cn->prm, NULL, tbl[j]->W, tbl[j]->S);
//		fp_mul_2e128mc_x8664_asm(tbl[j]->T, w->cn->prm, NULL, tbl[j]->W, tbl[j]->T);
//	}
//	fp_mul_2e128mc_x8664_asm(tbl[0]->Q, w->cn->prm, NULL, tbl[11-1]->V, tbl[0]->Q);
//	fp_mul_2e128mc_x8664_asm(tbl[0]->R, w->cn->prm, NULL, tbl[11-1]->V, tbl[0]->R);
//	fp_mul_2e128mc_x8664_asm(tbl[0]->S, w->cn->prm, NULL, tbl[11-1]->V, tbl[0]->S);
//	fp_mul_2e128mc_x8664_asm(tbl[0]->T, w->cn->prm, NULL, tbl[11-1]->V, tbl[0]->T);
//	for(j = 0; j < 11; j++){
//		fp_st1_2e128mc_x8664_asm(tbl[j]->Z, w->cn->prm, NULL, 1);
//	}
	/*******************/

	hec_fp_cpy_2e128mc_g2i(w, tbl[15], tbl[10]);
	hec_fp_cpy_2e128mc_g2i(w, tbl[14], tbl[9]);
	hec_fp_cpy_2e128mc_g2i(w, tbl[13], tbl[8]);
	hec_fp_cpy_2e128mc_g2i(w, tbl[12], tbl[7]);
	hec_fp_cpy_2e128mc_g2i(w, tbl[11], tbl[6]);
	hec_fp_cpy_2e128mc_g2i(w, tbl[10], tbl[5]);
	hec_fp_cpy_2e128mc_g2i(w, tbl[9], tbl[4]);
	hec_fp_cpy_2e128mc_g2i(w, tbl[8], d3);
	hec_fp_cpy_2e128mc_g2i(w, tbl[7], tbl[3]);
	hec_fp_cpy_2e128mc_g2i(w, tbl[6], tbl[2]);
	hec_fp_cpy_2e128mc_g2i(w, tbl[5], tbl[1]);
	hec_fp_cpy_2e128mc_g2i(w, tbl[4], d2);
	hec_fp_cpy_2e128mc_g2i(w, tbl[3], tbl[0]);
	hec_fp_cpy_2e128mc_g2i(w, tbl[2], d1);
	hec_fp_cpy_2e128mc_g2i(w, tbl[1], d0);
	fp_st1_2e128mc_x8664_asm(tbl[0]->Z, cn->prm, NULL, 0); //Marker for the identity element.

	/*TODO: The following lines solves a minor problem caused by 1-bit-longer-than-expected mini-scalars at low-level. This can be made prettier. */
	fp_cnt_bits(&bt, k0->v->n, k0->v->l);
	fp_cnt_bits(&b, k1->v->n, k1->v->l);
	if(b > bt){ bt = b; }
	fp_cnt_bits(&b, k2->v->n, k2->v->l);
	if(b > bt){ bt = b; }
	fp_cnt_bits(&b, k3->v->n, k3->v->l);
	if(b > bt){ bt = b; }
	k0->v->n[k0->v->l] = 0;
	k1->v->n[k1->v->l] = 0;
	k2->v->n[k2->v->l] = 0;
	k3->v->n[k3->v->l] = 0;

	j = bt;
	mam_ith_bit(ei, k3->v->n, j); b = ei;
	mam_ith_bit(ei, k2->v->n, j); b = (b << 1) + ei;
	mam_ith_bit(ei, k1->v->n, j); b = (b << 1) + ei;
	mam_ith_bit(ei, k0->v->n, j); b = (b << 1) + ei;
	hec_fp_cpy_2e128mc_g2i(w, w->D1, tbl[b]);
	//#pragma omp parallel for num_threads(2)
	for(j = bt-1; j > 0; j--){
		hec_fp_dbl_2e128mc_g2i_a2a3is0(w);
		mam_ith_bit(ei, k3->v->n, j); b = ei;
		mam_ith_bit(ei, k2->v->n, j); b = (b << 1) + ei;
		mam_ith_bit(ei, k1->v->n, j); b = (b << 1) + ei;
		mam_ith_bit(ei, k0->v->n, j); b = (b << 1) + ei;
		if(b != 0){
			if((tbl[b]->Z[0] == 1) && (tbl[b]->Z[1] == 0)){
				hec_fp_madd_2e128mc_g2i(w, tbl[b]);
			}else{
				hec_fp_add_2e128mc_g2i(w, tbl[b]);
			}
		}
	}
	hec_fp_cpy_2e128mc_g2i(w, D1, w->D1);
}
