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
#define AFFINE_LOOKUP

void hec_fp_smul_2e064mce2_g2i(DIV_hec_fp_2e064mce2 D1, const uni kn,  DIV_hec_fp_2e064mce2 D2, CNS_hec_fp_2e064mce2 cn)
{
	DIV_hec_fp_2e064mce2_t D[TABLE_SIZE_LTR], mD2, tmD2;
	int i, j, ni, k, wd;

	hec_fp_neg_2e064mce2_g2i(mD2, D2, cn);
	fp_cnt_bits(&i, kn, FP_LEN*2);
	if(i == 0){
		fp_st1_2e064mce2_x8664(D1->Z, cn->prm, NULL, 0); /*Marker for identity.*/
	}
	else{
		hec_fp_dbl_2e064mce2_g2i(D[0], D2, cn); /* 2*D. */
		hec_fp_madd_2e064mce2_g2i(D[1], D[0], D2, cn); /* 3*D. */
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			hec_fp_add_2e064mce2_g2i(D[j], D[j - 1], D[0], cn);
		}
#ifdef AFFINE_LOOKUP
		uni_t c[TABLE_SIZE_LTR][FP_LEN], u[FP_LEN], t[TABLE_SIZE_LTR][FP_LEN];
		fp_cpy_2e064mce2_x8664(c[0], cn->prm, NULL, D[0]->Z);
		for(j = 1; j < TABLE_SIZE_LTR; j++){
			fp_mul_2e064mce2_x8664(c[j], cn->prm, NULL, D[j]->Z, c[j-1]);
		}
		fp_inv_2e064mce2_x8664(u, cn->prm, NULL, c[TABLE_SIZE_LTR-1]);
		for(j = TABLE_SIZE_LTR-1; j > 0; j--){
			fp_mul_2e064mce2_x8664(t[j], cn->prm, NULL, c[j-1], u);
			fp_mul_2e064mce2_x8664(u, cn->prm, NULL, D[j]->Z, u);
		}
		fp_cpy_2e064mce2_x8664(t[0], cn->prm, NULL, u);
		for(j = 0; j < TABLE_SIZE_LTR; j++){
			fp_mul_2e064mce2_x8664(D[j]->P, cn->prm, NULL, t[j], D[j]->P);
			fp_mul_2e064mce2_x8664(D[j]->R, cn->prm, NULL, t[j], D[j]->R);
			fp_mul_2e064mce2_x8664(D[j]->S, cn->prm, NULL, t[j], D[j]->S);
			fp_mul_2e064mce2_x8664(D[j]->T, cn->prm, NULL, t[j], D[j]->T);
			fp_st1_2e064mce2_x8664(D[j]->Z, cn->prm, NULL, 1);
		}
#endif
		find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
		i -= wd;
		if(ni > 0){
			ni >>= 1;
			if(ni == 0){
				hec_fp_cpy_2e064mce2_g2i(D1, D2, cn);
			}
			else{
				hec_fp_cpy_2e064mce2_g2i(D1, D[ni], cn);
			}
		}
		else{
			ni = (-ni) >> 1;
			if(ni == 0){
				hec_fp_neg_2e064mce2_g2i(D1, D2, cn);
			}
			else{
				hec_fp_neg_2e064mce2_g2i(D1, D[ni], cn);
			}
		}
		for(j = k - 1; i >= 0;){
			find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
			i -= wd;
			if(ni == 0){
				hec_fp_dbl_2e064mce2_g2i(D1, D1, cn);
				j--;
			}
			else{
				for(; j >= k; j--){
					hec_fp_dbl_2e064mce2_g2i(D1, D1, cn);
				}
#ifdef AFFINE_LOOKUP
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						hec_fp_madd_2e064mce2_g2i(D1, D1, D2, cn);

					}
					else{
						hec_fp_madd_2e064mce2_g2i(D1, D1, D[ni], cn);
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						hec_fp_madd_2e064mce2_g2i(D1, D1, mD2, cn);
					}
					else{
						hec_fp_neg_2e064mce2_g2i(tmD2, D[ni], cn);
						hec_fp_madd_2e064mce2_g2i(D1, D1, tmD2, cn);
					}
				}
#else
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						hec_fp_madd_2e064mce2_g2i(D1, D1, D2, cn);

					}
					else{
						hec_fp_add_2e064mce2_g2i(D1, D1, D[ni], cn);
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						hec_fp_madd_2e064mce2_g2i(D1, D1, mD2, cn);
					}
					else{
						hec_fp_neg_2e064mce2_g2i(tmD2, D[ni], cn);
						hec_fp_add_2e064mce2_g2i(D1, D1, tmD2, cn);
					}
				}
#endif
			}
		}
		for(; j >= 1; j--){
			hec_fp_dbl_2e064mce2_g2i(D1, D1, cn);
		}
	}
}

void hec_fp_smul_2e064mce2_g2i_a2is0_a3is0(DIV_hec_fp_2e064mce2 D1, const uni kn,  DIV_hec_fp_2e064mce2 D2, CNS_hec_fp_2e064mce2 cn)
{
	DIV_hec_fp_2e064mce2_t D[TABLE_SIZE_LTR], mD2, tmD2;
	int i, j, ni, k, wd;

	hec_fp_neg_2e064mce2_g2i(mD2, D2, cn);
	fp_cnt_bits(&i, kn, FP_LEN*2); /*printf("%d ", i);*/
	if(i == 0){
		fp_st1_2e064mce2_x8664(D1->Z, cn->prm, NULL, 0); /*Marker for identity.*/
	}
	else{
		hec_fp_dbl_2e064mce2_g2i_a2is0_a3is0(D[0], D2, cn); /* 2*D. */
		hec_fp_madd_2e064mce2_g2i(D[1], D[0], D2, cn); /* 3*D. */
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			hec_fp_add_2e064mce2_g2i(D[j], D[j - 1], D[0], cn);
		}
#ifdef AFFINE_LOOKUP
		uni_t c[TABLE_SIZE_LTR][FP_LEN], u[FP_LEN], aa[TABLE_SIZE_LTR][FP_LEN];
		fp_cpy_2e064mce2_x8664(c[0], cn->prm, NULL, D[0]->Z);
		for(j = 1; j < TABLE_SIZE_LTR; j++){
			fp_mul_2e064mce2_x8664(c[j], cn->prm, NULL, D[j]->Z, c[j-1]);
		}
		fp_inv_2e064mce2_x8664(u, cn->prm, NULL, c[TABLE_SIZE_LTR-1]);
		for(j = TABLE_SIZE_LTR-1; j > 0; j--){
			fp_mul_2e064mce2_x8664(aa[j], cn->prm, NULL, c[j-1], u);
			fp_mul_2e064mce2_x8664(u, cn->prm, NULL, D[j]->Z, u);
		}
		fp_cpy_2e064mce2_x8664(aa[0], cn->prm, NULL, u);
		for(j = 0; j < TABLE_SIZE_LTR; j++){
			fp_mul_2e064mce2_x8664(D[j]->P, cn->prm, NULL, aa[j], D[j]->P);
			fp_mul_2e064mce2_x8664(D[j]->R, cn->prm, NULL, aa[j], D[j]->R);
			fp_mul_2e064mce2_x8664(D[j]->S, cn->prm, NULL, aa[j], D[j]->S);
			fp_mul_2e064mce2_x8664(D[j]->T, cn->prm, NULL, aa[j], D[j]->T);
			fp_st1_2e064mce2_x8664(D[j]->Z, cn->prm, NULL, 1);
		}
#endif
		find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
		i -= wd;
		if(ni > 0){
			ni >>= 1;
			if(ni == 0){
				hec_fp_cpy_2e064mce2_g2i(D1, D2, cn);
			}
			else{
				hec_fp_cpy_2e064mce2_g2i(D1, D[ni], cn);
			}
		}
		else{
			ni = (-ni) >> 1;
			if(ni == 0){
				hec_fp_neg_2e064mce2_g2i(D1, D2, cn);
			}
			else{
				hec_fp_neg_2e064mce2_g2i(D1, D[ni], cn);
			}
		}
		for(j = k - 1; i >= 0;){
			find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
			i -= wd;
			if(ni == 0){
				hec_fp_dbl_2e064mce2_g2i_a2is0_a3is0(D1, D1, cn);
				j--;
			}
			else{
				for(; j >= k; j--){
					hec_fp_dbl_2e064mce2_g2i_a2is0_a3is0(D1, D1, cn);
				}
#ifdef AFFINE_LOOKUP
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						hec_fp_madd_2e064mce2_g2i(D1, D1, D2, cn);

					}
					else{
						hec_fp_madd_2e064mce2_g2i(D1, D1, D[ni], cn);
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						hec_fp_madd_2e064mce2_g2i(D1, D1, mD2, cn);
					}
					else{
						hec_fp_neg_2e064mce2_g2i(tmD2, D[ni], cn);
						hec_fp_madd_2e064mce2_g2i(D1, D1, tmD2, cn);
					}
				}
#else
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						hec_fp_madd_2e064mce2_g2i(D1, D1, D2, cn);

					}
					else{
						hec_fp_add_2e064mce2_g2i(D1, D1, D[ni], cn);
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						hec_fp_madd_2e064mce2_g2i(D1, D1, mD2, cn);
					}
					else{
						hec_fp_neg_2e064mce2_g2i(tmD2, D[ni], cn);
						hec_fp_add_2e064mce2_g2i(D1, D1, tmD2, cn);
					}
				}
#endif
			}
		}
		for(; j >= 1; j--){
			hec_fp_dbl_2e064mce2_g2i_a2is0_a3is0(D1, D1, cn);
		}
	}
}


void hec_fp_smulcached_2e064mce2_g2i(DIV_hec_fp_2e064mce2 D1, const uni kn, unsigned char *D2, CNS_hec_fp_2e064mce2 cn, int slice, int window, int csize)
{
	unsigned int i, j, k, c, m, n, p, ei, e[slice];

	fp_st1_2e064mce2_x8664(D1->Z, cn->prm, NULL, 0);
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
		hec_fp_dbl_2e064mce2_g2i(D1, D1, cn);
		for(n = 0, j = 0; j < slice; j++, n += csize){
			if(e[j] != 0){
				m = (e[j] + n);
				hec_fp_madd_2e064mce2_g2i(D1, D1, (DIV_hec_fp_2e064mce2)(D2 + m), cn);
			}
		}
	}
}

void hec_fp_smulcached_2e064mce2_g2i_a2is0_a3is0(DIV_hec_fp_2e064mce2 D1, const uni kn, unsigned char *D2, CNS_hec_fp_2e064mce2 cn, int slice, int window, int csize)
{
	unsigned int i, j, k, c, m, n, p, ei, e[slice];

	fp_st1_2e064mce2_x8664(D1->Z, cn->prm, NULL, 0);
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
		hec_fp_dbl_2e064mce2_g2i_a2is0_a3is0(D1, D1, cn);
		for(n = 0, j = 0; j < slice; j++, n += csize){
			if(e[j] != 0){
				m = (e[j] + n);
				hec_fp_madd_2e064mce2_g2i(D1, D1, (DIV_hec_fp_2e064mce2)(D2 + m), cn);
			}
		}
	}
}

