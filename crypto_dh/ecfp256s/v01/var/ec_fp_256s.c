/**
 * Scalar multiplication on short Weierstrass curves with a=-3.
 *
 *     Y^2 = X^3 + a*X*Z^4 + B*Z^6.
 *
 * To guarantee a correct output, the scalar must be smaller than the order of the base point.
 * The function ec_fp_smul_256s() is made public via finite.h.
 * The function ec_fp_smulbase_256s() is made public via finite.h.
 *
 * See EFD for a collection of algorithms for point operations.
 *
 * Huseyin Hisil.
 * 2009-2010.
 **/
#include <stdio.h>
#include "crympix.h"
#include "finite256.h"
#include "ec_fp_256s.h"

#define WINDOW_SIZE_LTR 5
#define TABLE_SIZE_LTR (1 << (WINDOW_SIZE_LTR - 2))

static void ec_fp_set_1_256J(uni X3, uni Y3, uni Z3, uni U3, const uni_t X1, const uni_t Y1, const uni_t Z1, const uni_t U1){
	fp_set_1_256(X3, X1);
	fp_set_1_256(Y3, Y1);
	fp_set_1_256(Z3, Z1);
	fp_set_1_256(U3, U1);
}

static void ec_fp_cpy_256J(uni X3, uni Y3, uni Z3, uni U3, const uni X1, const uni Y1, const uni Z1, const uni U1){
	fp_cpy_256(X3, X1);
	fp_cpy_256(Y3, Y1);
	if(Z1 == NULL){
		fp_set_1_256(Z3, 1);
		fp_set_1_256(U3, 1);
	}
	else{
		fp_cpy_256(Z3, Z1);
		fp_cpy_256(U3, U1);
	}
}

static void ec_fp_neg_256J(uni X3, uni Y3, uni Z3, uni U3, const uni X1, const uni Y1, const uni Z1, const uni U1){
	fp_cpy_256(X3, X1);
	fp_sub_2_256(Y3, 0, Y1);
	if(Z1 == NULL){
		fp_set_1_256(Z3, 1);
		fp_set_1_256(U3, 1);
	}
	else{
		fp_cpy_256(Z3, Z1);
		fp_cpy_256(U3, U1);
	}
}

static void ec_fp_mdbl_256J(uni X3, uni Y3, uni Z3, uni U3, const uni X1, const uni Y1){
	uni_t t1[FP_LEN];

	if(fp_is0_256(Y1)){
		ec_fp_set_1_256J(X3, Y3, Z3, U3, 1, 1, 0, 0);
	}
	else{
		fp_ml2_256(Z3, Y1);
		fp_sub_1_256(t1, X1, 1);
		fp_add_1_256(U3, X1, 1);
		fp_mul_256(t1, U3, t1);
		fp_ml2_256(U3, t1);
		fp_add_256(U3, U3, t1);
		fp_ml2_256(Y3, Y1);
		fp_sqr_256(Y3, Y3);
		fp_sqr_256(t1, Y3);
		fp_dv2_256(t1, t1);
		fp_mul_256(Y3, Y3, X1);
		fp_sqr_256(X3, U3);
		fp_sub_256(X3, X3, Y3);
		fp_sub_256(X3, X3, Y3);
		fp_sub_256(Y3, Y3, X3);
		fp_mul_256(Y3, Y3, U3);
		fp_sub_256(Y3, Y3, t1);
		fp_sqr_256(U3, Z3);
	}
}

inline static void ec_fp_dbl_256J(uni X3, uni Y3, uni Z3, uni U3, const uni X1, const uni Y1, const uni Z1, const uni U1){
	uni_t t1[FP_LEN], t2[FP_LEN], t3[FP_LEN];

	if(fp_is0_256(Y1) || fp_is0_256(Z1)){
		ec_fp_set_1_256J(X3, Y3, Z3, U3, 1, 1, 0, 0);
	}
	else{
		fp_add_256(t1, Y1, Z1);
		fp_sqr_256(t1, t1);
		fp_sub_256(t2, X1, U1);
		fp_add_256(t3, X1, U1);
		fp_mul_256(t2, t2, t3);
		fp_ml2_256(t3, t2);
		fp_add_256(t3, t3, t2);
		fp_dv2_256(t2, t3);
		fp_sqr_256(Y3, Y1);
		fp_mul_256(t3, X1, Y3);
		fp_sub_256(t1, t1, Y3);
		fp_sub_256(t1, t1, U1);
		fp_dv2_256(Z3, t1);
		fp_sqr_256(U3, Z3);
		fp_sqr_256(t1, t2);
		fp_add_256(X3, t3, t3);
		fp_sub_256(X3, t1, X3);
		fp_sub_256(t3, t3, X3);
		fp_mul_256(t2, t2, t3);
		fp_sqr_256(t3, Y3);
		fp_sub_256(Y3, t2, t3);
	}
}

static void ec_fp_add_256J(uni X3, uni Y3, uni Z3, uni U3, const uni X1, const uni Y1, const uni Z1, const uni U1, const uni X2, const uni Y2, const uni Z2, const uni U2){
	uni_t t1[FP_LEN], t2[FP_LEN], t3[FP_LEN], t4[FP_LEN];

	if(fp_is0_256(Z1)){
		ec_fp_cpy_256J(X3, Y3, Z3, U3, X2, Y2, Z2, U2);
	}
	else if(fp_is0_256(Z2)){
		ec_fp_cpy_256J(X3, Y3, Z3, U3, X1, Y1, Z1, U1);
	}
	else{
		fp_mul_256(t1, Z2, U2);
		fp_mul_256(t2, X1, U2);
		fp_mul_256(t1, Y1, t1);
		fp_mul_256(t3, Z1, U1);
		fp_mul_256(t3, Y2, t3);
		fp_mul_256(t4, U1, X2);
		fp_sub_256(t3, t3, t1);
		fp_sub_256(t4, t4, t2);
		if(fp_is0_256(t4)){
			if(fp_is0_256(t3)){
				ec_fp_dbl_256J(X3, Y3, Z3, U3, X1, Y1, Z1, U1);
			}
			else{
				ec_fp_set_1_256J(X3, Y3, Z3, U3, 1, 1, 0, 0);
			}
		}
		else{
			fp_mul_256(Z3, Z1, Z2);
			fp_mul_256(Z3, Z3, t4);
			fp_sqr_256(X3, t4);
			fp_mul_256(t4, X3, t4);
			fp_mul_256(t2, t2, X3);
			fp_sqr_256(Y3, t3);
			fp_sub_256(Y3, Y3, t4);
			fp_mul_256(t1, t1, t4);
			fp_ml2_256(t4, t2);
			fp_sub_256(X3, Y3, t4);
			fp_sub_256(Y3, t2, X3);
			fp_mul_256(Y3, t3, Y3);
			fp_sub_256(Y3, Y3, t1);
			fp_sqr_256(U3, Z3);
		}
	}
}

static void ec_fp_readd_256J(uni X3, uni Y3, uni Z3, uni U3, const uni X1, const uni Y1, const uni Z1, const uni U1, const uni X2, const uni Y2, const uni Z2, const uni U2, const uni V2){
	uni_t t1[FP_LEN], t2[FP_LEN], t3[FP_LEN], t4[FP_LEN];

	if(fp_is0_256(Z1)){
		ec_fp_cpy_256J(X3, Y3, Z3, U3, X2, Y2, Z2, U2);
	}
	else if(fp_is0_256(Z2)){
		ec_fp_cpy_256J(X3, Y3, Z3, U3, X1, Y1, Z1, U1);
	}
	else{
		fp_mul_256(t2, X1, U2);
		fp_mul_256(t1, Y1, V2);
		fp_mul_256(t3, Z1, U1);
		fp_mul_256(t3, t3, Y2);
		fp_sub_256(t3, t3, t1);
		fp_mul_256(t4, U1, X2);
		fp_sub_256(t4, t4, t2);
		if(fp_is0_256(t4)){
			if(fp_is0_256(t3)){
				ec_fp_dbl_256J(X3, Y3, Z3, U3, X1, Y1, Z1, U1);
			}
			else{
				ec_fp_set_1_256J(X3, Y3, Z3, U3, 1, 1, 0, 0);
			}
		}
		else{
			fp_mul_256(Z3, Z1, Z2);
			fp_mul_256(Z3, Z3, t4);
			fp_sqr_256(U3, Z3);
			fp_sqr_256(X3, t4);
			fp_mul_256(t4, t4, X3);
			fp_mul_256(t2, t2, X3);
			fp_sqr_256(Y3, t3);
			fp_sub_256(Y3, Y3, t4);
			fp_mul_256(t1, t1, t4);
			fp_ml2_256(t4, t2);
			fp_sub_256(X3, Y3, t4);
			fp_sub_256(Y3, t2, X3);
			fp_mul_256(Y3, Y3, t3);
			fp_sub_256(Y3, Y3, t1);
		}
	}
}

static void ec_fp_madd_256J(uni X3, uni Y3, uni Z3, uni U3, const uni X1, const uni Y1, const uni Z1, const uni U1, const uni X2, const uni Y2){
	uni_t t1[FP_LEN], t2[FP_LEN], t3[FP_LEN], t4[FP_LEN];

	if(fp_is0_256(Z1)){
		ec_fp_cpy_256J(X3, Y3, Z3, U3, X2, Y2, NULL, NULL);
	}
	else{
		fp_mul_256(t2, U1, Z1);
		fp_mul_256(t1, U1, X2);
		fp_mul_256(t2, t2, Y2);
		fp_sub_256(t1, t1, X1);
		fp_sub_256(t2, t2, Y1);
		if(fp_is0_256(t1)){
			if(fp_is0_256(t2)){
				ec_fp_dbl_256J(X3, Y3, Z3, U3, X1, Y1, Z1, U1);
			}
			else{
				ec_fp_set_1_256J(X3, Y3, Z3, U3, 1, 1, 0, 0);
			}
		}
		else{
			fp_mul_256(Z3, Z1, t1);
			fp_sqr_256(t3, t1);
			fp_mul_256(t4, t3, t1);
			fp_mul_256(t3, t3, X1);
			fp_ml2_256(t1, t3);
			fp_sqr_256(X3, t2);
			fp_sub_256(X3, X3, t4);
			fp_sub_256(X3, X3, t1);
			fp_sub_256(t3, t3, X3);
			fp_mul_256(t3, t3, t2);
			fp_mul_256(t4, t4, Y1);
			fp_sub_256(Y3, t3, t4);
			fp_sqr_256(U3, Z3);
		}
	}
}

inline static void fp_cnt_256(int *bc, const uni an, const uni_t al){
	uni_t w, i, j;

	for(i = al - 1; (an[i] == 0) && (i > 0); i--);
	w = an[i];
	for(j = 0; w != 0; j++){
		w >>= 1;
	}
	(*bc) = j + i*UNIT_LEN;
}

inline static void find_nextwindow(int *v, int *k, int *wd, const uni en, const int i){
	int t, u2, s, b, sl, sr;
	uni_t n;

	b = i/UNIT_LEN;
	sr = (i + 1) - (b*UNIT_LEN);
	sl = UNIT_LEN - sr;
	if(b < FP_LEN){
		n = en[b] << sl;
	}
	else{
		n = 0;
	}
	if((b != 0) && (sl != 0)){
		n |= (en[b - 1] >> sr);
	}
	t = n >> (UNIT_LEN - 1);
	if(((n >> (UNIT_LEN - 2)) & 0x1) == t){
		*v = 0; *k = i; *wd = 1;
	}
	else{
		if(WINDOW_SIZE_LTR < (i + 1)){
			*wd = WINDOW_SIZE_LTR;
		}
		else{
			*wd = i + 1;
		}
		n <<= 1;
		n >>= (UNIT_LEN - *wd);
		if((i - *wd + 1) < 1){
			u2 = 0;
		}
		else{
			u2 = n & 0x1;
		}
		*v = -(t << (*wd - 1)) + (n >> 1) + u2;
		s = 0;
		for(; (*v & 0x1) == 0; s++, *v = *v >> 1);
		*k = i - (*wd - 1) + s + 1;
	}
}

void ec_fp_smul_256s(uni X1, uni Y1, uni Z1, const uni kn, const uni X2, const uni Y2)
{
	uni_t mY2[FP_LEN], U1[FP_LEN], X[TABLE_SIZE_LTR][FP_LEN], Y[TABLE_SIZE_LTR][FP_LEN], Z[TABLE_SIZE_LTR][FP_LEN], U[TABLE_SIZE_LTR][FP_LEN], V[TABLE_SIZE_LTR][FP_LEN];
	int i, j, ni, k, wd;

	fp_cnt_256(&i, kn, FP_LEN);
	if(i == 0){
		fp_set_1_256(X1, 1);
		fp_set_1_256(Y1, 1);
		fp_set_1_256(Z1, 0);
	}
	else{
		ec_fp_mdbl_256J(X[0], Y[0], Z[0], U[0], X2, Y2); /* 2P. */
		fp_mul_256(V[0], Z[0], U[0]);
		ec_fp_madd_256J(X[1], Y[1], Z[1], U[1], X[0], Y[0], Z[0], U[0], X2, Y2); /* 3P. */
		fp_mul_256(V[1], Z[1], U[1]);
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			ec_fp_add_256J(X[j], Y[j], Z[j], U[j], X[j - 1], Y[j - 1], Z[j - 1], U[j - 1], X[0], Y[0], Z[0], U[0]);
			fp_mul_256(V[j], Z[j], U[j]);
		}
		find_nextwindow(&ni, &k, &wd, kn, i);
		i -= wd;
		if(ni > 0){
			ni >>= 1;
			if(ni == 0){
				ec_fp_cpy_256J(X1, Y1, Z1, U1, X2, Y2, NULL, NULL);
			}
			else{
				ec_fp_cpy_256J(X1, Y1, Z1, U1, X[ni], Y[ni], Z[ni], U[ni]);
			}
		}
		else{
			ni = (-ni) >> 1;
			if(ni == 0){
				ec_fp_neg_256J(X1, Y1, Z1, U1, X2, Y2, NULL, NULL);
			}
			else{
				ec_fp_neg_256J(X1, Y1, Z1, U1, X[ni], Y[ni], Z[ni], U[ni]);
			}
		}
		for(j = k - 1; i >= 0;){
			find_nextwindow(&ni, &k, &wd, kn, i);
			i -= wd;
			if(ni == 0){
				ec_fp_dbl_256J(X1, Y1, Z1, U1, X1, Y1, Z1, U1); //DBL1++;
				j--;
			}
			else{
				for(; j >= k; j--){
					ec_fp_dbl_256J(X1, Y1, Z1, U1, X1, Y1, Z1, U1); //DBL2++;
				}
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						ec_fp_madd_256J(X1, Y1, Z1, U1, X1, Y1, Z1, U1, X2, Y2); //DBL3++; ADD++;
					}
					else{
						ec_fp_readd_256J(X1, Y1, Z1, U1, X1, Y1, Z1, U1, X[ni], Y[ni], Z[ni], U[ni], V[ni]); //DBL3++; ADD++;
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						fp_sub_2_256(mY2, 0, Y2);
						ec_fp_madd_256J(X1, Y1, Z1, U1, X1, Y1, Z1, U1, X2, mY2); //DBL3++; ADD++;
					}
					else{
						fp_sub_2_256(mY2, 0, Y[ni]);
						ec_fp_readd_256J(X1, Y1, Z1, U1, X1, Y1, Z1, U1, X[ni], mY2, Z[ni], U[ni], V[ni]); //DBL3++; ADD++;
					}
				}
			}
		}
		for(; j >= 1; j--){
			ec_fp_dbl_256J(X1, Y1, Z1, U1, X1, Y1, Z1, U1); //DBL4++;
		};
	}
}

#if EC_FP_SMULBASE_SLICE != 0
void ec_fp_smulbase_256s(uni X1, uni Y1, uni Z1, const uni kn, const uni *xn0, const uni *yn0)
{
	unsigned int i, j, k, m, n, p, ei, e[EC_FP_SMULBASE_SLICE];
	uni_t U1[FP_LEN];

	ec_fp_set_1_256J(X1, Y1, Z1, U1, 1, 1, 0, 0);
	k = (UNIT_LEN*FP_LEN)/(EC_FP_SMULBASE_WINDOW*EC_FP_SMULBASE_SLICE);
	for(i = k; i > 0; i--){
		for(p = 0, m = 0; m < EC_FP_SMULBASE_SLICE; m++, p += k){
			e[m] = 0;
			for(n = 0, j = 0; j < EC_FP_SMULBASE_WINDOW; j++, n += ((UNIT_LEN*FP_LEN)/EC_FP_SMULBASE_WINDOW)){
				mam_ith_bit(ei, kn, i + n + p);
				e[m] |= (ei << j);
			}
			e[m] <<= 2;
		}
		ec_fp_dbl_256J(X1, Y1, Z1, U1, X1, Y1, Z1, U1);
		for(n = 0, j = 0; j < EC_FP_SMULBASE_SLICE; j++, n += ((EC_FP_SMULBASE_CACHE_SIZE*sizeof(unsigned char))/sizeof(uni_t))){
			if(e[j] != 0){
				m = e[j] + n;
				ec_fp_madd_256J(X1, Y1, Z1, U1, X1, Y1, Z1, U1, (uni)(xn0 + m), (uni)(yn0 + m));
			}
		}
	}
}
#endif

