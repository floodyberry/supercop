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

void hec_fp_smul_2e128mc_g2i_jac_a2a3is0(DIV_hec_fp_2e128mc D1, const uni kn,  DIV_hec_fp_2e128mc D2, CNS_hec_fp_2e128mc cn)
{
	TEMP_hec_fp_2e128mc_t t;
	DIV_hec_fp_2e128mc_t mD2, tmD2, nD2;
	int i, j, ni, k, wd;

	t->cn->prm = cn->prm;
	fp_neg_2e128mc_x8664_asm(t->cn->a2, t->cn->prm, NULL, cn->a2);
	fp_cpy_2e128mc_x8664_asm(t->cn->a3, t->cn->prm, NULL, cn->a3);

	hec_fp_neg_2e128mc_g2i_jac(t, mD2, D2);
	fp_cnt_bits(&i, kn, FP_LEN*2); /*printf("%d ", i);*/
	if(i == 0){
		fp_st1_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, 0); /* Marker for the identity. */
	}
	else{
		/*
		//Traditional way to prepare the lookup table.
		hec_fp_cpy_2e128mc_g2i_jac(nD2, D2);
		hec_fp_dbl_2e128mc_g2i_jac(t->tbl[0], nD2, cn);
		hec_fp_madd_2e128mc_g2i_jac(t->tbl[1], t->tbl[0], D2, cn);
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			hec_fp_add_2e128mc_g2i_jac(t->tbl[j], t->tbl[j-1], t->tbl[0], cn);
		}
		*/
		hec_fp_cpy_2e128mc_g2i_jac(t, nD2, D2);
		hec_fp_zdbl_2e128mc_g2i_jac(t, nD2); /* [2]*D2. */
		hec_fp_zadd_2e128mc_g2i_jac(t, nD2); /* [3]*D2. */
		hec_fp_cpy_2e128mc_g2i_jac(t, t->tbl[1], t->D3);
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			hec_fp_zadd_2e128mc_g2i_jac(t, t->tbl[j-1]);
			hec_fp_cpy_2e128mc_g2i_jac(t, t->tbl[j], t->D3);
		}
		hec_fp_cpy_2e128mc_g2i_jac(t, t->tbl[0], D2);

		//t->tbl[0] is already affine.
		//So, we start Montgomery's simultaneous inversion from t->tbl[1].
		//We first switch to homogeneous projective coordinates (without W or V=W^2) to save field operations and space.
		fp_mul_2e128mc_x8664_asm(t->tbl[1]->W, t->cn->prm, NULL, t->tbl[1]->Z, t->tbl[1]->W);  //W := W*Z
		fp_sqr_2e128mc_x8664_asm(t->tbl[1]->Z, t->cn->prm, NULL, t->tbl[1]->Z);                //Z := Z^2
		fp_mul_2e128mc_x8664_asm(t->tbl[1]->S, t->cn->prm, NULL, t->tbl[1]->S, t->tbl[1]->Z);  //S := S*Z^2
		fp_mul_2e128mc_x8664_asm(t->tbl[1]->R, t->cn->prm, NULL, t->tbl[1]->R, t->tbl[1]->W);  //R := R*W*Z
		fp_mul_2e128mc_x8664_asm(t->tbl[1]->W, t->cn->prm, NULL, t->tbl[1]->Z, t->tbl[1]->W);  //W := W*Z^3
		fp_mul_2e128mc_x8664_asm(t->tbl[1]->Q, t->cn->prm, NULL, t->tbl[1]->Q, t->tbl[1]->W);  //Q := Q*W*Z^3
		fp_mul_2e128mc_x8664_asm(t->tbl[1]->Z, t->cn->prm, NULL, t->tbl[1]->Z, t->tbl[1]->W);  //Z := W*Z^5
		fp_cpy_2e128mc_x8664_asm(t->tbl[1]->V, t->cn->prm, NULL, t->tbl[1]->Z);                //V is accumulator now.
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			fp_mul_2e128mc_x8664_asm(t->tbl[j]->W, t->cn->prm, NULL, t->tbl[j]->Z, t->tbl[j]->W);  //W := W*Z
			fp_sqr_2e128mc_x8664_asm(t->tbl[j]->Z, t->cn->prm, NULL, t->tbl[j]->Z);                //Z := Z^2
			fp_mul_2e128mc_x8664_asm(t->tbl[j]->S, t->cn->prm, NULL, t->tbl[j]->S, t->tbl[j]->Z);  //S := S*Z^2
			fp_mul_2e128mc_x8664_asm(t->tbl[j]->R, t->cn->prm, NULL, t->tbl[j]->R, t->tbl[j]->W);  //R := R*W*Z
			fp_mul_2e128mc_x8664_asm(t->tbl[j]->W, t->cn->prm, NULL, t->tbl[j]->Z, t->tbl[j]->W);  //W := W*Z^3
			fp_mul_2e128mc_x8664_asm(t->tbl[j]->Q, t->cn->prm, NULL, t->tbl[j]->Q, t->tbl[j]->W);  //Q := Q*W*Z^3
			fp_mul_2e128mc_x8664_asm(t->tbl[j]->Z, t->cn->prm, NULL, t->tbl[j]->Z, t->tbl[j]->W);  //Z := W*Z^5
			fp_mul_2e128mc_x8664_asm(t->tbl[j]->V, t->cn->prm, NULL, t->tbl[j]->Z, t->tbl[j-1]->V);
		}
		fp_inv_2e128mc_x8664(t->tbl[TABLE_SIZE_LTR-1]->V, t->cn->prm, NULL, t->tbl[TABLE_SIZE_LTR-1]->V);
		for(j = TABLE_SIZE_LTR-1; j > 1; j--){
			fp_mul_2e128mc_x8664_asm(t->tbl[j]->W, t->cn->prm, NULL, t->tbl[j-1]->V, t->tbl[TABLE_SIZE_LTR-1]->V);
			fp_mul_2e128mc_x8664_asm(t->tbl[TABLE_SIZE_LTR-1]->V, t->cn->prm, NULL, t->tbl[j]->Z, t->tbl[TABLE_SIZE_LTR-1]->V);
			fp_mul_2e128mc_x8664_asm(t->tbl[j]->Q, t->cn->prm, NULL, t->tbl[j]->W, t->tbl[j]->Q);
			fp_mul_2e128mc_x8664_asm(t->tbl[j]->R, t->cn->prm, NULL, t->tbl[j]->W, t->tbl[j]->R);
			fp_mul_2e128mc_x8664_asm(t->tbl[j]->S, t->cn->prm, NULL, t->tbl[j]->W, t->tbl[j]->S);
			fp_mul_2e128mc_x8664_asm(t->tbl[j]->T, t->cn->prm, NULL, t->tbl[j]->W, t->tbl[j]->T);
		}
		fp_mul_2e128mc_x8664_asm(t->tbl[1]->Q, t->cn->prm, NULL, t->tbl[1]->Q, t->tbl[TABLE_SIZE_LTR-1]->V);
		fp_mul_2e128mc_x8664_asm(t->tbl[1]->R, t->cn->prm, NULL, t->tbl[1]->R, t->tbl[TABLE_SIZE_LTR-1]->V);
		fp_mul_2e128mc_x8664_asm(t->tbl[1]->S, t->cn->prm, NULL, t->tbl[1]->S, t->tbl[TABLE_SIZE_LTR-1]->V);
		fp_mul_2e128mc_x8664_asm(t->tbl[1]->T, t->cn->prm, NULL, t->tbl[1]->T, t->tbl[TABLE_SIZE_LTR-1]->V);
		for(j = 1; j < TABLE_SIZE_LTR; j++){
			fp_st1_2e128mc_x8664_asm(t->tbl[j]->Z, t->cn->prm, NULL, 1);
			fp_st1_2e128mc_x8664_asm(t->tbl[j]->W, t->cn->prm, NULL, 1);
			fp_st1_2e128mc_x8664_asm(t->tbl[j]->V, t->cn->prm, NULL, 1);
		}

		find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
		i -= wd;
		if(ni > 0){
			ni >>= 1;
			hec_fp_cpy_2e128mc_g2i_jac(t, t->D1, t->tbl[ni]);
		}
		else{
			ni = (-ni) >> 1;
			hec_fp_neg_2e128mc_g2i_jac(t, t->D1, t->tbl[ni]);
		}
		for(j = k - 1; i >= 0; j--){
			find_nextwindow(&ni, &k, 2*FP_LEN, &wd, kn, i, WINDOW_SIZE_LTR, TABLE_SIZE_LTR);
			i -= wd;
			if(ni == 0){
				hec_fp_dbl_2e128mc_g2i_jac_a2a3is0(t);
			}
			else{
				for(; j > k; j--){
					hec_fp_dbl_2e128mc_g2i_jac_a2a3is0(t);
				}
				if(ni > 0){
					ni >>= 1;
					hec_fp_mdbladd_2e128mc_g2i_jac(t, t->tbl[ni]);
				}
				else{
					ni = (-ni) >> 1;
					hec_fp_neg_2e128mc_g2i_jac(t, tmD2, t->tbl[ni]);
					hec_fp_mdbladd_2e128mc_g2i_jac(t, tmD2);
				}
			}
		}
		for(; j >= 1; j--){
			hec_fp_dbl_2e128mc_g2i_jac_a2a3is0(t);
		};
	}
	hec_fp_cpy_2e128mc_g2i_jac(t, D1, t->D1);
}

void hec_fp_smulcached_2e128mc_g2i_jac_a2a3is0(DIV_hec_fp_2e128mc D1, const uni kn, unsigned char *D2, CNS_hec_fp_2e128mc cn, int slice, int window, int csize)
{
	unsigned int i, j, k, c, m, n, p, ei, e[slice];
	TEMP_hec_fp_2e128mc_t t;

	t->cn->prm = cn->prm;
	fp_neg_2e128mc_x8664_asm(t->cn->a2, t->cn->prm, NULL, cn->a2);
	fp_cpy_2e128mc_x8664_asm(t->cn->a3, t->cn->prm, NULL, cn->a3);
	fp_st1_2e128mc_x8664_asm(t->D1->Z, t->cn->prm, NULL, 0);
	fp_st1_2e128mc_x8664_asm(t->D1->W, t->cn->prm, NULL, 0);
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
		hec_fp_dbl_2e128mc_g2i_jac_a2a3is0(t);
		for(n = 0, j = 0; j < slice; j++, n += csize){
			if(e[j] != 0){
				m = (e[j] + n);
				hec_fp_madd_2e128mc_g2i_jac(t, (DIV_hec_fp_2e128mc)(D2 + m));
			}
		}
	}
	hec_fp_cpy_2e128mc_g2i_jac(t, D1, t->D1);
}
