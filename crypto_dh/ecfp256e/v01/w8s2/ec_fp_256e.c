/**
 * Scalar multiplication on twisted Edwards curves with a=-1.
 *
 *     a*X^2*Z^2 + Y^2*Z^2 = Z^4 + d*X^2*Y^2.
 *
 * To guarantee a correct output, the input must be of odd order.
 * In addition, the scalar must be smaller than the order of the base point.
 * The function ec_fp_smul_256e() is made public via finite.h.
 * The function ec_fp_smulbase_256e() is made public via finite.h.
 *
 * Huseyin Hisil.
 * 2009-2010.
 **/
#include <stdio.h>
#include "crympix.h"
#include "finite256.h"
#include "ec_fp_256e.h"

#define WINDOW_SIZE_LTR 6
#define TABLE_SIZE_LTR (1 << (WINDOW_SIZE_LTR - 2))

static void ec_fp_cpy_256E(uni X3, uni Y3, uni Z3, const uni X1, const uni Y1, const uni Z1){
	fp_cpy_256(X3, X1);
	fp_cpy_256(Y3, Y1);
	if(Z1 == NULL){
		fp_set_1_256(Z3, 1);
	}
	else{
		fp_cpy_256(Z3, Z1);
	}
}

static void ec_fp_neg_256E(uni X3, uni Y3, uni Z3, const uni X1, const uni Y1, const uni Z1){
	fp_sub_2_256(X3, 0, X1);
	fp_cpy_256(Y3, Y1);
	if(Z1 == NULL){
		fp_set_1_256(Z3, 1);
	}
	else{
		fp_cpy_256(Z3, Z1);
	}
}

/* 5M + 2S + 4a. (4M + 3S + 7a or 3M + 4S + 9a are possible but slower in this implementation.) */
static void ec_fp_mdbl_256Ee(uni X3, uni Y3, uni T3, uni Z3, const uni X1, const uni Y1){
	uni_t t1[FP_LEN];

	fp_sqr_256(T3, X1);
	fp_mul_256(X3, X1, Y1);
	fp_sqr_256(Y3, Y1);
	fp_ml2_256(X3, X3);
	fp_sub_256(Z3, Y3, T3);
	fp_add_256(T3, Y3, T3);
	fp_mul_256(Y3, Z3, T3);
	fp_mul_256(T3, X3, T3);
	fp_sub_2_256(t1, 2, Z3);
	fp_mul_256(X3, X3, t1);
	fp_mul_256(Z3, Z3, t1);
}

/* 3*M + 4*S + 6a */
inline static void ec_fp_dbl_256E(uni X3, uni Y3, uni Z3, const uni X1, const uni Y1, const uni Z1){
	uni_t t1[FP_LEN], t2[FP_LEN];

	fp_add_256(t1, X1, Y1);
	fp_sqr_256(X3, X1);
	fp_sqr_256(Y3, Y1);
	fp_sqr_256(Z3, Z1);
	fp_ml2_256(Z3, Z3);
	fp_sqr_256(t1, t1);
	fp_add_256(t2, X3, Y3);
	fp_sub_256(Y3, Y3, X3);
	fp_sub_256(t1, t1, t2);
	fp_sub_256(Z3, Z3, Y3);
	fp_mul_256(X3, t1, Z3);
	fp_mul_256(Z3, Z3, Y3);
	fp_mul_256(Y3, Y3, t2);
}

/* 5M + 3S + 5a */
static void ec_fp_dbl_256Ee(uni X3, uni Y3, uni T3, uni Z3, const uni X1, const uni Y1, const uni Z1){
	uni_t t1[FP_LEN], t2[FP_LEN];

	fp_sqr_256(t1, X1);
	fp_sqr_256(T3, Y1);
	fp_mul_256(X3, X1, Y1);
	fp_sqr_256(Z3, Z1);
	fp_ml2_256(t2, X3);
	fp_ml2_256(Z3, Z3);
	fp_sub_256(Y3, T3, t1);
	fp_add_256(T3, T3, t1);
	fp_sub_256(Z3, Z3, Y3);
	fp_mul_256(X3, t2, Z3);
	fp_mul_256(Z3, Y3, Z3);
	fp_mul_256(Y3, Y3, T3);
	fp_mul_256(T3, t2, T3);
}

/* 6M + 10a */
static void ec_fp_madd_256Ex(uni X3, uni Y3, uni Z3, const uni X1, const uni Y1, const uni T1, const uni Z1, const uni X2, const uni Y2, const uni T2){
	uni_t t1[FP_LEN], t2[FP_LEN], t3[FP_LEN];

	fp_sub_256(t1, Y1, X1);
	fp_add_256(t2, Y2, X2);
	fp_mul_256(t1, t1, t2);
	fp_add_256(t2, Y1, X1);
	fp_sub_256(X3, Y2, X2);
	fp_mul_256(t2, t2, X3);
	fp_sub_256(X3, t2, t1);
	fp_add_256(Y3, t2, t1);
	fp_mul_256(t1, T2, Z1);
	fp_ml2_256(t1, t1);
	fp_cpy_256(t2, T1);
	fp_ml2_256(t2, t2);
	fp_add_256(t3, t2, t1);
	fp_sub_256(t2, t2, t1);
	fp_mul_256(Z3, X3, Y3);
	fp_mul_256(X3, t3, X3);
	fp_mul_256(Y3, Y3, t2);
}

/* 7M + 10a */
static void ec_fp_madd_256Ee(uni X3, uni Y3, uni T3, uni Z3, const uni X1, const uni Y1, const uni T1, const uni Z1, const uni X2, const uni Y2, const uni T2){
	uni_t t1[FP_LEN], t2[FP_LEN];

	fp_sub_256(t1, Y1, X1);
	fp_add_256(t2, Y2, X2);
	fp_mul_256(t1, t1, t2);
	fp_add_256(t2, Y1, X1);
	fp_sub_256(X3, Y2, X2);
	fp_mul_256(t2, t2, X3);
	fp_sub_256(X3, t2, t1);
	fp_add_256(Y3, t2, t1);
	fp_mul_256(t1, T2, Z1);
	fp_ml2_256(t1, t1);
	fp_cpy_256(t2, T1);
	fp_ml2_256(t2, t2);
	fp_add_256(T3, t2, t1);
	fp_sub_256(t2, t2, t1);
	fp_mul_256(Z3, X3, Y3);
	fp_mul_256(X3, T3, X3);
	fp_mul_256(Y3, Y3, t2);
	fp_mul_256(T3, T3, t2);
}

/* 8*M + 10a */
static void ec_fp_add_256Ee(uni X3, uni Y3, uni T3, uni Z3, const uni X1, const uni Y1, const uni T1, const uni Z1, const uni X2, const uni Y2, const uni T2, const uni Z2){
	uni_t t1[FP_LEN], t2[FP_LEN];

	fp_sub_256(t1, Y1, X1);
	fp_add_256(t2, Y2, X2);
	fp_mul_256(t1, t1, t2);
	fp_add_256(t2, Y1, X1);
	fp_sub_256(X3, Y2, X2);
	fp_mul_256(t2, t2, X3);
	fp_sub_256(X3, t2, t1);
	fp_add_256(Y3, t2, t1);
	fp_mul_256(t1, T2, Z1);
	fp_ml2_256(t1, t1);
	fp_mul_256(t2, T1, Z2);
	fp_ml2_256(t2, t2);
	fp_add_256(T3, t2, t1);
	fp_sub_256(t2, t2, t1);
	fp_mul_256(Z3, X3, Y3);
	fp_mul_256(X3, X3, T3);
	fp_mul_256(Y3, Y3, t2);
	fp_mul_256(T3, T3, t2);
}

/* (5M + 3S) + (6M) + 15a, with Z2 = 1 */
static void ec_fp_dblmadd_256Ex(uni X3, uni Y3, uni Z3, const uni X1, const uni Y1, const uni Z1, const uni X2, const uni Y2, const uni T2){
	uni_t t1[FP_LEN], t2[FP_LEN], t3[FP_LEN], t4[FP_LEN], t5[FP_LEN];

	fp_mul_256(t4, X1, Y1);
	fp_sqr_256(t1, X1);
	fp_sqr_256(t2, Y1);
	fp_sub_256(t3, t2, t1);
	fp_add_256(t2, t2, t1);
	fp_mul_256(t1, t3, t2);
	fp_ml2_256(t4, t4);
	fp_mul_256(t2, t4, t2);
	fp_sqr_256(t5, Z1);
	fp_ml2_256(t5, t5);
	fp_sub_256(t5, t5, t3);
	fp_mul_256(t4, t4, t5);
	fp_mul_256(t3, t3, t5);
	fp_sub_256(t5, t1, t4);
	fp_add_256(t1, t1, t4);
	fp_add_256(t4, Y2, X2);
	fp_mul_256(t5, t5, t4);
	fp_sub_256(t4, Y2, X2);
	fp_mul_256(t3, t3, T2);
	fp_ml2_256(t2, t2);
	fp_mul_256(t1, t1, t4);
	fp_ml2_256(t3, t3);
	fp_add_256(t4, t2, t3);
	fp_sub_256(t2, t2, t3);
	fp_sub_256(t3, t1, t5);
	fp_add_256(t5, t1, t5);
	fp_mul_256(X3, t4, t3);
	fp_mul_256(Y3, t5, t2);
	fp_mul_256(Z3, t3, t5);
}

/* (5M + 3S) + (7M) + 15a */
static void ec_fp_dbladd_256Ex(uni X3, uni Y3, uni Z3, const uni X1, const uni Y1, const uni Z1, const uni X2, const uni Y2, const uni T2, const uni Z2){
	uni_t t1[FP_LEN], t2[FP_LEN], t3[FP_LEN], t4[FP_LEN], t5[FP_LEN];

	fp_sqr_256(t1, X1);
	fp_sqr_256(t2, Y1);
	fp_sub_256(t3, t2, t1);
	fp_mul_256(t4, X1, Y1);
	fp_add_256(t2, t2, t1);
	fp_mul_256(t1, t3, t2);
	fp_ml2_256(t4, t4);
	fp_sqr_256(t5, Z1);
	fp_mul_256(t2, t4, t2);
	fp_ml2_256(t5, t5);
	fp_sub_256(t5, t5, t3);
	fp_mul_256(t4, t5, t4);
	fp_mul_256(t3, t5, t3);
	fp_sub_256(t5, t1, t4);
	fp_add_256(t1, t1, t4);
	fp_add_256(t4, Y2, X2);
	fp_mul_256(t5, t4, t5);
	fp_sub_256(t4, Y2, X2);
	fp_mul_256(t3, T2, t3);
	fp_mul_256(t2, Z2, t2);
	fp_ml2_256(t3, t3);
	fp_mul_256(t1, t4, t1);
	fp_ml2_256(t2, t2);
	fp_add_256(t4, t2, t3);
	fp_sub_256(t2, t2, t3);
	fp_sub_256(t3, t1, t5);
	fp_add_256(t5, t5, t1);
	fp_mul_256(X3, t4, t3);
	fp_mul_256(Y3, t5, t2);
	fp_mul_256(Z3, t3, t5);
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

void ec_fp_smul_256e(uni X1, uni Y1, uni Z1, const uni kn, const uni X2, const uni Y2)
{
	uni_t mX2[FP_LEN], mT2[FP_LEN], T2[FP_LEN], X[TABLE_SIZE_LTR][FP_LEN], Y[TABLE_SIZE_LTR][FP_LEN], T[TABLE_SIZE_LTR][FP_LEN], Z[TABLE_SIZE_LTR][FP_LEN];
	int i, j, ni, k, wd;

	fp_cnt_256(&i, kn, FP_LEN);
	if(i == 0){
		fp_set_1_256(X1, 0);
		fp_set_1_256(Y1, 1);
		fp_set_1_256(Z1, 1);
	}
	else{
		fp_mul_256(T2, X2, Y2);
		ec_fp_mdbl_256Ee(X[0], Y[0], T[0], Z[0], X2, Y2); /* 2P. */
		ec_fp_madd_256Ee(X[1], Y[1], T[1], Z[1], X[0], Y[0], T[0], Z[0], X2, Y2, T2); /* 3P. */
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			ec_fp_add_256Ee(X[j], Y[j], T[j], Z[j], X[j - 1], Y[j - 1], T[j - 1], Z[j - 1], X[0], Y[0], T[0], Z[0]);
		}
		find_nextwindow(&ni, &k, &wd, kn, i);
		i -= wd;
		if(ni > 0){
			ni >>= 1;
			if(ni == 0){
				ec_fp_cpy_256E(X1, Y1, Z1, X2, Y2, NULL);
			}
			else{
				ec_fp_cpy_256E(X1, Y1, Z1, X[ni], Y[ni], Z[ni]);
			}
		}
		else{
			ni = (-ni) >> 1;
			if(ni == 0){
				ec_fp_neg_256E(X1, Y1, Z1, X2, Y2, NULL);
			}
			else{
				ec_fp_neg_256E(X1, Y1, Z1, X[ni], Y[ni], Z[ni]);
			}
		}
		for(j = k - 1; i >= 0; j--){
			find_nextwindow(&ni, &k, &wd, kn, i);
			i -= wd;
			if(ni == 0){
				ec_fp_dbl_256E(X1, Y1, Z1, X1, Y1, Z1); //DBL1++;
			}
			else{
				for(; j > k; j--){
					ec_fp_dbl_256E(X1, Y1, Z1, X1, Y1, Z1); //DBL2++;
				}
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						ec_fp_dblmadd_256Ex(X1, Y1, Z1, X1, Y1, Z1, X2, Y2, T2); //DBL3++; ADD++;
					}
					else{
						ec_fp_dbladd_256Ex(X1, Y1, Z1, X1, Y1, Z1, X[ni], Y[ni], T[ni], Z[ni]); //DBL3++; ADD++;
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						fp_sub_2_256(mX2, 0, X2);
						fp_sub_2_256(mT2, 0, T2);
						ec_fp_dblmadd_256Ex(X1, Y1, Z1, X1, Y1, Z1, mX2, Y2, mT2); //DBL3++; ADD++;
					}
					else{
						fp_sub_2_256(mX2, 0, X[ni]);
						fp_sub_2_256(mT2, 0, T[ni]);
						ec_fp_dbladd_256Ex(X1, Y1, Z1, X1, Y1, Z1, mX2, Y[ni], mT2, Z[ni]); //DBL3++; ADD++;
					}
				}
			}
		}
		for(; j >= 1; j--){
			ec_fp_dbl_256E(X1, Y1, Z1, X1, Y1, Z1); //DBL4++;
		};
	}
}

#if EC_FP_SMULBASE_SLICE != 0
void ec_fp_smulbase_256e(uni X1, uni Y1, uni Z1, const uni kn, const uni *xn0, const uni *yn0, const uni *tn0)
{
	unsigned int i, j, k, m, n, p, ei, e[EC_FP_SMULBASE_SLICE];
	uni_t T1[FP_LEN], t[FP_LEN];

	fp_set_1_256(X1, 0);
	fp_set_1_256(Y1, 1);
	fp_set_1_256(Z1, 1);
	fp_set_1_256(T1, 0);
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
		ec_fp_dbl_256Ee(X1, Y1, T1, Z1, X1, Y1, Z1);
		for(n = 0, j = 0; j < EC_FP_SMULBASE_SLICE; j++, n += ((EC_FP_SMULBASE_CACHE_SIZE*sizeof(unsigned char))/sizeof(uni_t))){
			if(e[j] != 0){
				m = e[j] + n;
				fp_mul_256(t, (uni)(xn0 + m), (uni)(yn0 + m));
				ec_fp_madd_256Ee(X1, Y1, T1, Z1, X1, Y1, T1, Z1, (uni)(xn0 + m), (uni)(yn0 + m), t);
			}
		}
	}
}
#endif

