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
	fp_mul_2e128mc_x8664(D3->P, cn->prm, NULL, D1->P, cn->u1z);
	fp_mul_2e128mc_x8664(D3->R, cn->prm, NULL, D1->R, cn->u0z);
	fp_mul_2e128mc_x8664(D3->S, cn->prm, NULL, D1->S, cn->v1z);
	fp_mul_2e128mc_x8664(D3->T, cn->prm, NULL, D1->T, cn->v0z);
	fp_cpy_2e128mc_x8664(D3->Z, D1->Z);
}

void hec_fp_smul_2e128mc_fkt_glv4(DIV_hec_fp_2e128mc D1, const uni kn,  DIV_hec_fp_2e128mc D2, CNS_hec_fp_2e128mc_glv4 cn)
{
	uni_t y1s[4*FP_LEN], y2s[4*FP_LEN], y3s[4*FP_LEN], y4s[4*FP_LEN], rs[4*FP_LEN], ts[4*FP_LEN], k0s[4*FP_LEN], k1s[4*FP_LEN], k2s[4*FP_LEN], k3s[4*FP_LEN], Ts[4*FP_LEN];
	MI_t y1, y2, y3, y4, ah1, ah2, ah3, ah4, N, r, k, t, A1, A2, A3, A4, k0, k1, k2, k3, T, Nt;
	DIV_hec_fp_2e128mc_t d0, d1, d2, d3, tbl[16];
	int j, ei, b, bt;

	/*uni_t i; fp_cnt_bits(&i, kn, FP_LEN*2); printf("%d ", i);*/

	ah1->v->n = (uni)cn->ah1; ah1->v->l = 3*FP_LEN/2; ah1->s = NEGATIVE;
	ah2->v->n = (uni)cn->ah2; ah2->v->l = 3*FP_LEN/2; ah2->s = NEGATIVE;
	ah3->v->n = (uni)cn->ah3; ah3->v->l = 3*FP_LEN/2; ah3->s = POSITIVE;
	ah4->v->n = (uni)cn->ah4; ah4->v->l = 3*FP_LEN/2; ah4->s = NEGATIVE;
	A1->v->n = (uni)cn->A1; A1->v->l = FP_LEN/2; A1->s = POSITIVE;
	A2->v->n = (uni)cn->A2; A2->v->l = FP_LEN/2; A2->s = POSITIVE;
	A3->v->n = (uni)cn->A3; A3->v->l = FP_LEN/2; A3->s = POSITIVE;
	A4->v->n = (uni)cn->A4; A4->v->l = FP_LEN/2; A4->s = POSITIVE;
	N->v->n = (uni)cn->N; N->v->l = 2*FP_LEN; N->s = POSITIVE;
	Nt->v->n = (uni)cn->Nhalf; Nt->v->l = 2*FP_LEN; Nt->s = POSITIVE;
	k->v->n = kn; k->v->l = 2*FP_LEN; k->s = POSITIVE;
	y1->v->n = y1s; y2->v->n = y2s; y3->v->n = y3s; y4->v->n = y4s;
	k0->v->n = k0s; k1->v->n = k1s; k2->v->n = k2s; k3->v->n = k3s;
	t->v->n = ts; r->v->n = rs; T->v->n = Ts;

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

	mi_mul_stack(k0, A1, y1);
	mi_mul_stack(T, A2, y4);
	mi_sub_stack(k0, k0, T);
	mi_mul_stack(T, A3, y3);
	mi_sub_stack(k0, k0, T);
	mi_mul_stack(T, A4, y2);
	mi_sub_stack(k0, k0, T);
	mi_sub_stack(k0, k, k0);
	mi_mul_stack(k1, A1, y2);
	mi_mul_stack(T, A2, y1);
	mi_add_stack(k1, k1, T);
	mi_mul_stack(T, A3, y4);
	mi_sub_stack(k1, k1, T);
	mi_mul_stack(T, A4, y3);
	mi_sub_stack(k1, T, k1);
	mi_mul_stack(k2, A1, y3);
	mi_mul_stack(T, A2, y2);
	mi_add_stack(k2, k2, T);
	mi_mul_stack(T, A3, y1);
	mi_add_stack(k2, k2, T);
	mi_mul_stack(T, A4, y4);
	mi_sub_stack(k2, T, k2);
	mi_mul_stack(k3, A1, y4);
	mi_mul_stack(T, A2, y3);
	mi_add_stack(k3, k3, T);
	mi_mul_stack(T, A3, y2);
	mi_add_stack(k3, k3, T);
	mi_mul_stack(T, A4, y1);
	mi_add_stack(k3, k3, T);

	hec_fp_cpy_2e128mc_g2i(d0, D2);
	phi(d1, d0, cn);
	phi(d2, d1, cn);
	phi(d3, d2, cn);

	if(k0->s == NEGATIVE){
		hec_fp_neg_2e128mc_g2i(d0, d0, (CNS_hec_fp_2e128mc)cn);
	}
	if(k1->s == NEGATIVE){
		hec_fp_neg_2e128mc_g2i(d1, d1, (CNS_hec_fp_2e128mc)cn);
	}
	if(k2->s == NEGATIVE){
		hec_fp_neg_2e128mc_g2i(d2, d2, (CNS_hec_fp_2e128mc)cn);
	}
	if(k3->s == POSITIVE){ /* Actually if negative. */
		hec_fp_neg_2e128mc_g2i(d3, d3, (CNS_hec_fp_2e128mc)cn);
	}

	fp_set_1_2e128mc_x8664(tbl[0]->Z, 0); //Marker for the point at infinity.
	hec_fp_cpy_2e128mc_g2i(tbl[1], d0);
	hec_fp_cpy_2e128mc_g2i(tbl[2], d1);
	hec_fp_aadd_2e128mc_g2i(tbl[3], tbl[2], tbl[1], (CNS_hec_fp_2e128mc)cn);
	hec_fp_cpy_2e128mc_g2i(tbl[4], d2);
	hec_fp_aadd_2e128mc_g2i(tbl[5], tbl[4], tbl[1], (CNS_hec_fp_2e128mc)cn);
	hec_fp_aadd_2e128mc_g2i(tbl[6], tbl[4], tbl[2], (CNS_hec_fp_2e128mc)cn);
	hec_fp_add_2e128mc_g2i(tbl[7], tbl[4], tbl[3], (CNS_hec_fp_2e128mc)cn);
	hec_fp_cpy_2e128mc_g2i(tbl[8], d3);
	hec_fp_aadd_2e128mc_g2i(tbl[9], tbl[8], tbl[1], (CNS_hec_fp_2e128mc)cn);
	hec_fp_aadd_2e128mc_g2i(tbl[10], tbl[8], tbl[2], (CNS_hec_fp_2e128mc)cn);
	hec_fp_add_2e128mc_g2i(tbl[11], tbl[8], tbl[3], (CNS_hec_fp_2e128mc)cn);
	hec_fp_aadd_2e128mc_g2i(tbl[12], tbl[8], tbl[4], (CNS_hec_fp_2e128mc)cn);
	hec_fp_add_2e128mc_g2i(tbl[13], tbl[8], tbl[5], (CNS_hec_fp_2e128mc)cn);
	hec_fp_add_2e128mc_g2i(tbl[14], tbl[8], tbl[6], (CNS_hec_fp_2e128mc)cn);
	hec_fp_add_2e128mc_g2i(tbl[15], tbl[8], tbl[7], (CNS_hec_fp_2e128mc)cn);

	fp_set_1_2e128mc_x8664(D1->Z, 0); //Marker for the point at infinity.

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
	hec_fp_cpy_2e128mc_g2i(D1, tbl[b]);
	//#pragma omp parallel for num_threads(2)
	for(j = bt-1; j > 0; j--){
		hec_fp_dbl_2e128mc_g2i_a2is0_a3is0(D1, D1, (CNS_hec_fp_2e128mc)cn);
		mam_ith_bit(ei, k3->v->n, j); b = ei;
		mam_ith_bit(ei, k2->v->n, j); b = (b << 1) + ei;
		mam_ith_bit(ei, k1->v->n, j); b = (b << 1) + ei;
		mam_ith_bit(ei, k0->v->n, j); b = (b << 1) + ei;
		hec_fp_add_2e128mc_g2i(D1, D1, tbl[b], (CNS_hec_fp_2e128mc)cn);
	}
}
