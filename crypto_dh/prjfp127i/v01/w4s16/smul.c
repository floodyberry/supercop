//Huseyin Hisil, 2014.

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

#define WINDOW_SIZE_LTR 5
#define TABLE_SIZE_LTR (1 << (WINDOW_SIZE_LTR - 2))

void hec_fp_smul_2e127m1_g2i(DIV_hec_fp_2e127m1 D1, const uni kn,  DIV_hec_fp_2e127m1 D2, CNS_hec_fp_2e127m1 cn)
{
	TEMP_hec_fp_2e127m1_t t;
	DIV_hec_fp_2e127m1_t mD2, tmD2;
	int i, j, ni, k, wd;

	fp_cpy_2e127m1_x8664_asm(t->cn->a2, NULL, NULL, cn->a2);
	fp_cpy_2e127m1_x8664_asm(t->cn->a3, NULL, NULL, cn->a3);

	hec_fp_neg_2e127m1_g2i(mD2, D2);
	fp_cnt_bits(&i, kn, FP_LEN*2); /*printf("%d ", i);*/
	if(i == 0){
		fp_st1_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, 0); /* Marker for the identity. */
	}
	else{
		hec_fp_cpy_2e127m1_g2i(t->D1, D2);
		hec_fp_dbl_2e127m1_g2i(t);
		hec_fp_cpy_2e127m1_g2i(t->tbl[0], t->D1);
		hec_fp_madd_2e127m1_g2i(t, D2);
		hec_fp_cpy_2e127m1_g2i(t->tbl[1], t->D1);
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			hec_fp_add_2e127m1_g2i(t, t->tbl[0]);
			hec_fp_cpy_2e127m1_g2i(t->tbl[j], t->D1);
		}
		hec_fp_cpy_2e127m1_g2i(t->tbl[0], D2);

		//t->tbl[0] is already affine.
		//So, we start Montgomery's simultaneous inversion from t->tbl[1].
		fp_cpy_2e127m1_x8664_asm(t->tbl[1]->V, NULL, NULL, t->tbl[1]->Z); //V is accumulator now. W is temp.
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			fp_mul_2e127m1_x8664_asm(t->tbl[j]->V, NULL, NULL, t->tbl[j]->Z, t->tbl[j-1]->V);
		}
		fp_inv_2e127m1_x8664(t->tbl[TABLE_SIZE_LTR-1]->V, NULL, NULL, t->tbl[TABLE_SIZE_LTR-1]->V);
		for(j = TABLE_SIZE_LTR-1; j > 1; j--){
			fp_mul_2e127m1_x8664_asm(t->tbl[j]->W, NULL, NULL, t->tbl[j-1]->V, t->tbl[TABLE_SIZE_LTR-1]->V);
			fp_mul_2e127m1_x8664_asm(t->tbl[TABLE_SIZE_LTR-1]->V, NULL, NULL, t->tbl[j]->Z, t->tbl[TABLE_SIZE_LTR-1]->V);
			fp_mul_2e127m1_x8664_asm(t->tbl[j]->Q, NULL, NULL, t->tbl[j]->W, t->tbl[j]->Q);
			fp_mul_2e127m1_x8664_asm(t->tbl[j]->R, NULL, NULL, t->tbl[j]->W, t->tbl[j]->R);
			fp_mul_2e127m1_x8664_asm(t->tbl[j]->S, NULL, NULL, t->tbl[j]->W, t->tbl[j]->S);
			fp_mul_2e127m1_x8664_asm(t->tbl[j]->T, NULL, NULL, t->tbl[j]->W, t->tbl[j]->T);
		}
		fp_mul_2e127m1_x8664_asm(t->tbl[1]->Q, NULL, NULL, t->tbl[1]->Q, t->tbl[TABLE_SIZE_LTR-1]->V);
		fp_mul_2e127m1_x8664_asm(t->tbl[1]->R, NULL, NULL, t->tbl[1]->R, t->tbl[TABLE_SIZE_LTR-1]->V);
		fp_mul_2e127m1_x8664_asm(t->tbl[1]->S, NULL, NULL, t->tbl[1]->S, t->tbl[TABLE_SIZE_LTR-1]->V);
		fp_mul_2e127m1_x8664_asm(t->tbl[1]->T, NULL, NULL, t->tbl[1]->T, t->tbl[TABLE_SIZE_LTR-1]->V);
		for(j = 1; j < TABLE_SIZE_LTR; j++){
			fp_st1_2e127m1_x8664_asm(t->tbl[j]->Z, NULL, NULL, 1);
			fp_st1_2e127m1_x8664_asm(t->tbl[j]->W, NULL, NULL, 1);
			fp_st1_2e127m1_x8664_asm(t->tbl[j]->V, NULL, NULL, 1);
		}

		find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
		i -= wd;
		if(ni > 0){
			ni >>= 1;
			hec_fp_cpy_2e127m1_g2i(t->D1, t->tbl[ni]);
		}
		else{
			ni = (-ni) >> 1;
			hec_fp_neg_2e127m1_g2i(t->D1, t->tbl[ni]);
		}
		for(j = k - 1; i >= 0; j--){
			find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
			i -= wd;
			if(ni == 0){
				hec_fp_dbl_2e127m1_g2i(t);
			}
			else{
				for(; j > k; j--){
					hec_fp_dbl_2e127m1_g2i(t);
				}
				if(ni > 0){
					ni >>= 1;
					hec_fp_dbl_2e127m1_g2i(t);
					hec_fp_madd_2e127m1_g2i(t, t->tbl[ni]);
				}
				else{
					ni = (-ni) >> 1;
					hec_fp_dbl_2e127m1_g2i(t);
					hec_fp_neg_2e127m1_g2i(tmD2, t->tbl[ni]);
					hec_fp_madd_2e127m1_g2i(t, tmD2);
				}
			}
		}
		for(; j >= 1; j--){
			hec_fp_dbl_2e127m1_g2i(t); //DBL4++;
		};
	}
	hec_fp_cpy_2e127m1_g2i(D1, t->D1);
}

void hec_fp_smulcached_2e127m1_g2i(DIV_hec_fp_2e127m1 D1, const uni kn, unsigned char *D2, CNS_hec_fp_2e127m1 cn, int slice, int window, int csize)
{
	unsigned int i, j, k, c, m, n, p, ei, e[slice];
	TEMP_hec_fp_2e127m1_t t;

	fp_cpy_2e127m1_x8664_asm(t->cn->a2, NULL, NULL, cn->a2);
	fp_cpy_2e127m1_x8664_asm(t->cn->a3, NULL, NULL, cn->a3);
	fp_st1_2e127m1_x8664_asm(t->D1->Z, NULL, NULL, 0);
	fp_st1_2e127m1_x8664_asm(t->D1->W, NULL, NULL, 0);
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
		hec_fp_dbl_2e127m1_g2i(t);
		for(n = 0, j = 0; j < slice; j++, n += csize){
			if(e[j] != 0){
				m = (e[j] + n);
				hec_fp_madd_2e127m1_g2i(t, (DIV_hec_fp_2e127m1)(D2 + m));
			}
		}
	}
	hec_fp_cpy_2e127m1_g2i(D1, t->D1);
}
