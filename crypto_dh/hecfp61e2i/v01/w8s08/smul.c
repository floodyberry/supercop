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

void hec_fp_smul_2e061m1e2_g2i(DIV_hec_fp_2e061m1e2 D1, const uni kn,  DIV_hec_fp_2e061m1e2 D2, CNS_hec_fp_2e061m1e2 cn)
{
	DIV_hec_fp_2e061m1e2_t D[TABLE_SIZE_LTR], mD2, tmD2;
	int i, j, ni, k, wd;

	hec_fp_neg_2e061m1e2_g2i(mD2, D2);
	fp_cnt_bits(&i, kn, FP_LEN*2);
	if(i == 0){
		fp_st1_2e061m1e2_x8664_asm(D1->Z, NULL, NULL, 0); /* Marker for the identity. */
	}
	else{
		hec_fp_dbl_2e061m1e2_g2i(D[0], D2, cn); /* 2*D. */
		hec_fp_madd_2e061m1e2_g2i(D[1], D[0], D2, cn); /* 3*D. */
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			hec_fp_add_2e061m1e2_g2i(D[j], D[j-1], D[0], cn);
		}
#ifdef AFFINE_LOOKUP
		uni_t c[TABLE_SIZE_LTR][FP_LEN], u[FP_LEN], t[TABLE_SIZE_LTR][FP_LEN];
		fp_cpy_2e061m1e2_x8664_asm(c[0], NULL, NULL, D[0]->Z);
		for(j = 1; j < TABLE_SIZE_LTR; j++){
			fp_mul_2e061m1e2_x8664_asm(c[j], NULL, NULL, D[j]->Z, c[j-1]);
		}
		fp_inv_2e061m1e2_x8664(u, NULL, NULL, c[TABLE_SIZE_LTR-1]);
		for(j = TABLE_SIZE_LTR-1; j > 0; j--){
			fp_mul_2e061m1e2_x8664_asm(t[j], NULL, NULL, c[j-1], u);
			fp_mul_2e061m1e2_x8664_asm(u, NULL, NULL, D[j]->Z, u);
		}
		fp_cpy_2e061m1e2_x8664_asm(t[0], NULL, NULL, u);
		for(j = 0; j < TABLE_SIZE_LTR; j++){
			fp_mul_2e061m1e2_x8664_asm(D[j]->P, NULL, NULL, t[j], D[j]->P);
			fp_mul_2e061m1e2_x8664_asm(D[j]->R, NULL, NULL, t[j], D[j]->R);
			fp_mul_2e061m1e2_x8664_asm(D[j]->S, NULL, NULL, t[j], D[j]->S);
			fp_mul_2e061m1e2_x8664_asm(D[j]->T, NULL, NULL, t[j], D[j]->T);
			fp_st1_2e061m1e2_x8664_asm(D[j]->Z, NULL, NULL, 1);
		}
#endif
		find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
		i -= wd;
		if(ni > 0){
			ni >>= 1;
			if(ni == 0){
				hec_fp_cpy_2e061m1e2_g2i(D1, D2);
			}
			else{
				hec_fp_cpy_2e061m1e2_g2i(D1, D[ni]);
			}
		}
		else{
			ni = (-ni) >> 1;
			if(ni == 0){
				hec_fp_neg_2e061m1e2_g2i(D1, D2);
			}
			else{
				hec_fp_neg_2e061m1e2_g2i(D1, D[ni]);
			}
		}
		for(j = k - 1; i >= 0;){
			find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
			i -= wd;
			if(ni == 0){
				hec_fp_dbl_2e061m1e2_g2i(D1, D1, cn);
				j--;
			}
			else{
				for(; j >= k; j--){
					hec_fp_dbl_2e061m1e2_g2i(D1, D1, cn);
				}
#ifdef AFFINE_LOOKUP
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						hec_fp_madd_2e061m1e2_g2i(D1, D1, D2, cn);

					}
					else{
						hec_fp_madd_2e061m1e2_g2i(D1, D1, D[ni], cn);
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						hec_fp_madd_2e061m1e2_g2i(D1, D1, mD2, cn);
					}
					else{
						hec_fp_neg_2e061m1e2_g2i(tmD2, D[ni]);
						hec_fp_madd_2e061m1e2_g2i(D1, D1, tmD2, cn);
					}
				}
#else
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						hec_fp_madd_2e061m1e2_g2i(D1, D1, D2, cn);

					}
					else{
						hec_fp_add_2e061m1e2_g2i(D1, D1, D[ni], cn);
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						hec_fp_madd_2e061m1e2_g2i(D1, D1, mD2, cn);
					}
					else{
						hec_fp_neg_2e061m1e2_g2i(tmD2, D[ni]);
						hec_fp_add_2e061m1e2_g2i(D1, D1, tmD2, cn);
					}
				}
#endif
			}
		}
		for(; j >= 1; j--){
			hec_fp_dbl_2e061m1e2_g2i(D1, D1, cn);
		};
	}
	/*These calls are for correcting the effect of incomplete additions. */
	fp_neg_2e061m1e2_x8664_asm(D1->P, NULL, NULL, D1->P);
	fp_neg_2e061m1e2_x8664_asm(D1->R, NULL, NULL, D1->R);
	fp_neg_2e061m1e2_x8664_asm(D1->S, NULL, NULL, D1->S);
	fp_neg_2e061m1e2_x8664_asm(D1->T, NULL, NULL, D1->T);
	fp_neg_2e061m1e2_x8664_asm(D1->Z, NULL, NULL, D1->Z);
	fp_neg_2e061m1e2_x8664_asm(D1->P, NULL, NULL, D1->P);
	fp_neg_2e061m1e2_x8664_asm(D1->R, NULL, NULL, D1->R);
	fp_neg_2e061m1e2_x8664_asm(D1->S, NULL, NULL, D1->S);
	fp_neg_2e061m1e2_x8664_asm(D1->T, NULL, NULL, D1->T);
	fp_neg_2e061m1e2_x8664_asm(D1->Z, NULL, NULL, D1->Z);
}


void hec_fp_smul_2e061m1e2_g2i_a2is0_a3is0(DIV_hec_fp_2e061m1e2 D1, const uni kn,  DIV_hec_fp_2e061m1e2 D2, CNS_hec_fp_2e061m1e2 cn)
{
	DIV_hec_fp_2e061m1e2_t D[TABLE_SIZE_LTR], mD2, tmD2;
	int i, j, ni, k, wd;

	hec_fp_neg_2e061m1e2_g2i(mD2, D2);
	fp_cnt_bits(&i, kn, FP_LEN*2);
	if(i == 0){
		fp_st1_2e061m1e2_x8664_asm(D1->Z, NULL, NULL, 0); /* Marker for the identity. */
	}
	else{
		hec_fp_dbl_2e061m1e2_g2i_a2is0_a3is0(D[0], D2, cn); /* 2*D. */
		hec_fp_madd_2e061m1e2_g2i(D[1], D[0], D2, cn); /* 3*D. */
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			hec_fp_add_2e061m1e2_g2i(D[j], D[j-1], D[0], cn);
		}
#ifdef AFFINE_LOOKUP
		uni_t c[TABLE_SIZE_LTR][FP_LEN], u[FP_LEN], aa[TABLE_SIZE_LTR][FP_LEN];
		fp_cpy_2e061m1e2_x8664_asm(c[0], NULL, NULL, D[0]->Z);
		for(j = 1; j < TABLE_SIZE_LTR; j++){
			fp_mul_2e061m1e2_x8664_asm(c[j], NULL, NULL, D[j]->Z, c[j-1]);
		}
		fp_inv_2e061m1e2_x8664(u, NULL, NULL, c[TABLE_SIZE_LTR-1]);
		for(j = TABLE_SIZE_LTR-1; j > 0; j--){
			fp_mul_2e061m1e2_x8664_asm(aa[j], NULL, NULL, c[j-1], u);
			fp_mul_2e061m1e2_x8664_asm(u, NULL, NULL, D[j]->Z, u);
		}
		fp_cpy_2e061m1e2_x8664_asm(aa[0], NULL, NULL, u);
		for(j = 0; j < TABLE_SIZE_LTR; j++){
			fp_mul_2e061m1e2_x8664_asm(D[j]->P, NULL, NULL, aa[j], D[j]->P);
			fp_mul_2e061m1e2_x8664_asm(D[j]->R, NULL, NULL, aa[j], D[j]->R);
			fp_mul_2e061m1e2_x8664_asm(D[j]->S, NULL, NULL, aa[j], D[j]->S);
			fp_mul_2e061m1e2_x8664_asm(D[j]->T, NULL, NULL, aa[j], D[j]->T);
			fp_st1_2e061m1e2_x8664_asm(D[j]->Z, NULL, NULL, 1);
		}
#endif
		find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
		i -= wd;
		if(ni > 0){
			ni >>= 1;
			if(ni == 0){
				hec_fp_cpy_2e061m1e2_g2i(D1, D2);
			}
			else{
				hec_fp_cpy_2e061m1e2_g2i(D1, D[ni]);
			}
		}
		else{
			ni = (-ni) >> 1;
			if(ni == 0){
				hec_fp_neg_2e061m1e2_g2i(D1, D2);
			}
			else{
				hec_fp_neg_2e061m1e2_g2i(D1, D[ni]);
			}
		}
		for(j = k - 1; i >= 0;){
			find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
			i -= wd;
			if(ni == 0){
				hec_fp_dbl_2e061m1e2_g2i_a2is0_a3is0(D1, D1, cn);
				j--;
			}
			else{
				for(; j >= k; j--){
					hec_fp_dbl_2e061m1e2_g2i_a2is0_a3is0(D1, D1, cn);
				}
#ifdef AFFINE_LOOKUP
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						hec_fp_madd_2e061m1e2_g2i(D1, D1, D2, cn);

					}
					else{
						hec_fp_madd_2e061m1e2_g2i(D1, D1, D[ni], cn);
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						hec_fp_madd_2e061m1e2_g2i(D1, D1, mD2, cn);
					}
					else{
						hec_fp_neg_2e061m1e2_g2i(tmD2, D[ni]);
						hec_fp_madd_2e061m1e2_g2i(D1, D1, tmD2, cn);
					}
				}
#else
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						hec_fp_madd_2e061m1e2_g2i(D1, D1, D2, cn);

					}
					else{
						hec_fp_add_2e061m1e2_g2i(D1, D1, D[ni], cn);
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						hec_fp_madd_2e061m1e2_g2i(D1, D1, mD2, cn);
					}
					else{
						hec_fp_neg_2e061m1e2_g2i(tmD2, D[ni]);
						hec_fp_add_2e061m1e2_g2i(D1, D1, tmD2, cn);
					}
				}
#endif
			}
		}
		for(; j >= 1; j--){
			hec_fp_dbl_2e061m1e2_g2i_a2is0_a3is0(D1, D1, cn);
		};
	}
	/*These calls are for correcting the effect of incomplete additions. */
	fp_neg_2e061m1e2_x8664_asm(D1->P, NULL, NULL, D1->P);
	fp_neg_2e061m1e2_x8664_asm(D1->R, NULL, NULL, D1->R);
	fp_neg_2e061m1e2_x8664_asm(D1->S, NULL, NULL, D1->S);
	fp_neg_2e061m1e2_x8664_asm(D1->T, NULL, NULL, D1->T);
	fp_neg_2e061m1e2_x8664_asm(D1->Z, NULL, NULL, D1->Z);
	fp_neg_2e061m1e2_x8664_asm(D1->P, NULL, NULL, D1->P);
	fp_neg_2e061m1e2_x8664_asm(D1->R, NULL, NULL, D1->R);
	fp_neg_2e061m1e2_x8664_asm(D1->S, NULL, NULL, D1->S);
	fp_neg_2e061m1e2_x8664_asm(D1->T, NULL, NULL, D1->T);
	fp_neg_2e061m1e2_x8664_asm(D1->Z, NULL, NULL, D1->Z);
}

void hec_fp_smulcached_2e061m1e2_g2i(DIV_hec_fp_2e061m1e2 D1, const uni kn, unsigned char *D2, CNS_hec_fp_2e061m1e2 cn, int slice, int window, int csize)
{
	unsigned int i, j, k, c, m, n, p, ei, e[slice];

	fp_st1_2e061m1e2_x8664_asm(D1->Z, NULL, NULL, 0);
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
		hec_fp_dbl_2e061m1e2_g2i(D1, D1, cn);
		for(n = 0, j = 0; j < slice; j++, n += csize){
			if(e[j] != 0){
				m = (e[j] + n);
				hec_fp_madd_2e061m1e2_g2i(D1, D1, (DIV_hec_fp_2e061m1e2)(D2 + m), cn);
			}
		}
	}
}

void hec_fp_smulcached_2e061m1e2_g2i_a2is0_a3is0(DIV_hec_fp_2e061m1e2 D1, const uni kn, unsigned char *D2, CNS_hec_fp_2e061m1e2 cn, int slice, int window, int csize)
{
	unsigned int i, j, k, c, m, n, p, ei, e[slice];

	fp_st1_2e061m1e2_x8664_asm(D1->Z, NULL, NULL, 0);
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
		hec_fp_dbl_2e061m1e2_g2i_a2is0_a3is0(D1, D1, cn);
		for(n = 0, j = 0; j < slice; j++, n += csize){
			if(e[j] != 0){
				m = (e[j] + n);
				hec_fp_madd_2e061m1e2_g2i(D1, D1, (DIV_hec_fp_2e061m1e2)(D2 + m), cn);
			}
		}
	}
}

