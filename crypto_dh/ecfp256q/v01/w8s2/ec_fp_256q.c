/**
 * Scalar multiplication on extended Jacobi quartic curves with a=-1/2.
 *
 *     Y^2*Z^2 = d X^4 + 2*a*X^2*Z^2 + Z^4.
 *
 * To guarantee a correct output, the input must be of odd order.
 * In addition, the scalar must be smaller than the order of the base point.
 * The function ec_fp_smul_256q() is made public via finite.h.
 * The function ec_fp_smulbase_256q() is made public via finite.h.
 *
 * Huseyin Hisil.
 * 2009-2010.
 **/
#include <stdio.h>
#include "crympix.h"
#include "finite256.h"
#include "ec_fp_256q.h"

#define WINDOW_SIZE_LTR 5
#define TABLE_SIZE_LTR (1 << (WINDOW_SIZE_LTR - 2))

static void ec_fp_set_1_256Q(uni X3, uni Y3, uni Z3, const uni_t X1, const uni_t Y1, const uni_t Z1){
	fp_set_1_256(X3, X1);
	fp_set_1_256(Y3, Y1);
	fp_set_1_256(Z3, Z1);
}

static void ec_fp_cpy_256Q(uni X3, uni Y3, uni Z3, const uni X1, const uni Y1, const uni Z1){
	fp_cpy_256(X3, X1);
	fp_cpy_256(Y3, Y1);
	if(Z1 == NULL){
		fp_set_1_256(Z3, 1);
	}
	else{
		fp_cpy_256(Z3, Z1);
	}
}

static void ec_fp_neg_256Q(uni X3, uni Y3, uni Z3, const uni X1, const uni Y1, const uni Z1){
	fp_sub_2_256(X3, 0, X1);
	fp_cpy_256(Y3, Y1);
	if(Z1 == NULL){
		fp_set_1_256(Z3, 1);
	}
	else{
		fp_cpy_256(Z3, Z1);
	}
}

static void ec_fp_mdbl_256Qe(uni X3, uni Y3, uni T3, uni Z3, const uni X1, const uni Y1){
	fp_mul_256(T3, X1, Y1);
	fp_add_256(X3, X1, Y1);
	fp_sqr_256(X3, X3);
	fp_dv2_256(X3, X3);
	fp_sub_256(X3, X3, T3);
	fp_sqr_256(Y3, Y1);
	fp_mul_256(Y3, X3, Y3);
	fp_sub_2_256(X3, 1, X3);
	fp_sqr_256(Z3, X3);
	fp_sub_256(Y3, Y3, Z3);
	fp_mul_256(X3, T3, X3);
	fp_sqr_256(T3, T3);
}

/* 3M + 4S + 4a */
inline static void ec_fp_dbl_256Qx(uni X3, uni Y3, uni Z3, const uni X1, const uni Y1, const uni Z1){
	uni_t t1[FP_LEN], t2[FP_LEN], t3[FP_LEN];

	fp_sqr_256(Z3, Z1);
	fp_mul_256(t1, X1, Y1);
	fp_sqr_256(t2, X1);
	fp_sqr_256(Y3, Y1);
	fp_add_256(X3, t2, Y3);
	fp_dv2_256(t3, X3);
	fp_mul_256(Y3, t3, Y3);
	fp_sub_256(t2, Z3, t3);
	fp_sqr_256(Z3, t2);
	fp_sub_256(Y3, Y3, Z3);
	fp_mul_256(X3, t2, t1);
}

/* 4M + 4S + 4a */
static void ec_fp_dbl_256Qe(uni X3, uni Y3, uni T3, uni Z3, uni X1, uni Y1, uni Z1){
	uni_t t1[FP_LEN], t2[FP_LEN];

	fp_mul_256(t1, X1, Y1);
	fp_sqr_256(t2, X1);
	fp_sqr_256(Y3, Y1);
	fp_mul_256(T3, t2, Y3);
	fp_add_256(X3, t2, Y3);
	fp_sqr_256(Z3, Z1);
	fp_dv2_256(t2, X3);
	fp_mul_256(Y3, t2, Y3);
	fp_sub_256(X3, Z3, t2);
	fp_sqr_256(Z3, X3);
	fp_sub_256(Y3, Y3, Z3);
	fp_mul_256(X3, X3, t1);
}

/* 7M + 2S + 2D + 14a */
static void ec_fp_madd_256Qx(uni X3, uni Y3, uni Z3, const uni X1, const uni Y1, const uni T1, const uni Z1, const uni X2, const uni Y2, const uni T2, const uni_t d){
	uni_t t1[FP_LEN], t2[FP_LEN], t3[FP_LEN], T3[FP_LEN];

	fp_add_256(t1, T1, Z1);
	fp_mld_256(t2, d, T2); /*TODO: Try caching.*/
	fp_add_1_256(t2, t2, 1); /*TODO: Try caching.*/
	fp_mul_256(t1, t2, t1);
	fp_mul_256(t2, Z1, T2);
	fp_sub_256(t1, t1, T1);
	fp_mld_256(t3, d, t2);
	fp_sub_256(t1, t1, t3);
	fp_add_256(t3, T1, t2);
	fp_sub_256(T3, T1, t2);
	fp_sub_256(Z3, X1, Y1);
	fp_add_256(t2, X2, Y2);
	fp_mul_256(Z3, t2, Z3);
	fp_mul_256(t2, X1, X2);
	fp_mul_256(Y3, Y2, Y1);
	fp_sub_256(Z3, Z3, t2);
	fp_add_256(Z3, Z3, Y3);
	fp_add_256(Y3, Y3, t1);
	fp_ml2_256(t1, t2);
	fp_sub_256(t1, t3, t1);
	fp_add_256(Y3, Y3, t2);
	fp_mul_256(Y3, t1, Y3);
	fp_mul_256(X3, Z3, T3);
	fp_sqr_256(Z3, Z3);
	fp_sub_256(Y3, Y3, Z3);
	fp_sqr_256(T3, T3);
}

/* 7M + 2S + 2D + 14a */
static void ec_fp_madd_256Qe(uni X3, uni Y3, uni T3, uni Z3, const uni X1, const uni Y1, const uni T1, const uni Z1, const uni X2, const uni Y2, const uni T2, const uni_t d){
	uni_t t1[FP_LEN], t2[FP_LEN], t3[FP_LEN];

	fp_add_256(t1, T1, Z1);
	fp_mld_256(t2, d, T2); /*TODO: Try caching.*/
	fp_add_1_256(t2, t2, 1); /*TODO: Try caching.*/
	fp_mul_256(t1, t2, t1);
	fp_mul_256(t2, Z1, T2);
	fp_sub_256(t1, t1, T1);
	fp_mld_256(t3, d, t2);
	fp_sub_256(t1, t1, t3);
	fp_add_256(t3, T1, t2);
	fp_sub_256(T3, T1, t2);
	fp_sub_256(Z3, X1, Y1);
	fp_add_256(t2, X2, Y2);
	fp_mul_256(Z3, t2, Z3);
	fp_mul_256(t2, X1, X2);
	fp_mul_256(Y3, Y2, Y1);
	fp_sub_256(Z3, Z3, t2);
	fp_add_256(Z3, Z3, Y3);
	fp_add_256(Y3, Y3, t1);
	fp_ml2_256(t1, t2);
	fp_sub_256(t1, t3, t1);
	fp_add_256(Y3, Y3, t2);
	fp_mul_256(Y3, t1, Y3);
	fp_mul_256(X3, Z3, T3);
	fp_sqr_256(Z3, Z3);
	fp_sub_256(Y3, Y3, Z3);
	fp_sqr_256(T3, T3);
}

/* 8M + 2S + 2D + 15a */
static void ec_fp_add_256Qe(uni X3, uni Y3, uni T3, uni Z3, const uni X1, const uni Y1, const uni T1, const uni Z1, const uni X2, const uni Y2, const uni T2, const uni Z2, const uni_t d){
	uni_t t1[FP_LEN], t2[FP_LEN], t3[FP_LEN];

	fp_add_256(t1, T1, Z1);
	fp_mld_256(t2, d, T2);  /*TODO: Try caching.*/
	fp_add_256(t2, t2, Z2); /*TODO: Try caching.*/
	fp_mul_256(t1, t1, t2);
	fp_mul_256(t2, Z1, T2);
	fp_mul_256(T3, T1, Z2);
	fp_sub_256(t1, t1, T3);
	fp_mld_256(t3, d, t2);
	fp_sub_256(t1, t1, t3);
	fp_add_256(t3, T3, t2);
	fp_sub_256(T3, T3, t2);
	fp_sub_256(Z3, X1, Y1);
	fp_add_256(t2, X2, Y2);
	fp_mul_256(Z3, Z3, t2);
	fp_mul_256(t2, X1, X2);
	fp_mul_256(Y3, Y1, Y2);
	fp_sub_256(Z3, Z3, t2);
	fp_add_256(Z3, Z3, Y3);
	fp_add_256(Y3, Y3, t1);
	fp_ml2_256(t1, t2);
	fp_sub_256(t1, t3, t1);
	fp_add_256(Y3, Y3, t2);
	fp_mul_256(Y3, Y3, t1);
	fp_mul_256(X3, Z3, T3);
	fp_sqr_256(Z3, Z3);
	fp_sub_256(Y3, Y3, Z3);
	fp_sqr_256(T3, T3);
}

/* (5M + 3S) + (6M) + 15a, with Z2 = 1 */
static void ec_fp_dblmadd_256Qx(uni X3, uni Y3, uni Z3, const uni X1, const uni Y1, const uni Z1, const uni X2, const uni Y2, const uni T2, const uni_t d){
	uni_t t1[FP_LEN], t2[FP_LEN], t3[FP_LEN], T1[FP_LEN], T3[FP_LEN];

	fp_mul_256(T1, X1, Y1);
	fp_sqr_256(X3, X1);
	fp_sqr_256(Y3, Y1);
	fp_sqr_256(Z3, Z1);
	fp_add_256(X3, X3, Y3);
	fp_dv2_256(X3, X3);
	fp_mul_256(Y3, Y3, X3);
	fp_sub_256(X3, Z3, X3);
	fp_sqr_256(Z3, X3);
	fp_sub_256(Y3, Y3, Z3);
	fp_mul_256(X3, X3, T1);
	fp_sqr_256(T1, T1);
	fp_add_256(t1, T1, Z3);
	fp_mld_256(t2, d, T2);  /*TODO Try caching.*/
	fp_add_1_256(t2, t2, 1); /*TODO Try caching.*/
	fp_mul_256(t1, t1, t2);
	fp_mul_256(t2, Z3, T2);
	fp_sub_256(t1, t1, T1);
	fp_mld_256(t3, d, t2);
	fp_sub_256(t1, t1, t3);
	fp_add_256(t3, T1, t2);
	fp_sub_256(T3, T1, t2);
	fp_sub_256(Z3, X3, Y3);
	fp_add_256(t2, X2, Y2);
	fp_mul_256(Z3, t2, Z3);
	fp_mul_256(t2, X3, X2);
	fp_mul_256(Y3, Y3, Y2);
	fp_sub_256(Z3, Z3, t2);
	fp_add_256(Z3, Z3, Y3);
	fp_add_256(Y3, Y3, t1);
	fp_ml2_256(t1, t2);
	fp_sub_256(t1, t3, t1);
	fp_add_256(Y3, Y3, t2);
	fp_mul_256(Y3, Y3, t1);
	fp_mul_256(X3, Z3, T3);
	fp_sqr_256(Z3, Z3);
	fp_sub_256(Y3, Y3, Z3);
}

/* (3M + 5S + 4*a) + (8M + 1S + 2D + 15a) */
static void ec_fp_dbladd_256Qx(uni X3, uni Y3, uni Z3,	const uni X1, const uni Y1, const uni Z1, const uni X2, const uni Y2, const uni T2, const uni Z2, const uni_t d){
	uni_t t1[FP_LEN], t2[FP_LEN], t3[FP_LEN], T1[FP_LEN], T3[FP_LEN]; /*TODO: Merge T1 and T3.*/

	fp_mul_256(T1, X1, Y1);
	fp_sqr_256(X3, X1);
	fp_sqr_256(Y3, Y1);
	fp_sqr_256(Z3, Z1);
	fp_add_256(X3, X3, Y3);
	fp_dv2_256(X3, X3);
	fp_mul_256(Y3, Y3, X3);
	fp_sub_256(X3, Z3, X3);
	fp_sqr_256(Z3, X3);
	fp_sub_256(Y3, Y3, Z3);
	fp_mul_256(X3, X3, T1);
	fp_sqr_256(T1, T1);
	fp_add_256(t1, T1, Z3);
	fp_mld_256(t2, d, T2);  /*TODO Try caching.*/
	fp_add_256(t2, t2, Z2); /*TODO Try caching.*/
	fp_mul_256(t1, t1, t2);
	fp_mul_256(t2, Z3, T2);
	fp_mul_256(T3, T1, Z2);
	fp_sub_256(t1, t1, T3);
	fp_mld_256(t3, d, t2);
	fp_sub_256(t1, t1, t3);
	fp_add_256(t3, T3, t2);
	fp_sub_256(Z3, X3, Y3);
	fp_sub_256(T3, T3, t2);
	fp_add_256(t2, X2, Y2);
	fp_mul_256(Z3, t2, Z3);
	fp_mul_256(t2, X3, X2);
	fp_sub_256(Z3, Z3, t2);
	fp_mul_256(Y3, Y3, Y2);
	fp_add_256(Z3, Z3, Y3);
	fp_add_256(Y3, Y3, t1);
	fp_ml2_256(t1, t2);
	fp_add_256(Y3, Y3, t2);
	fp_sub_256(t1, t3, t1);
	fp_mul_256(X3, Z3, T3);
	fp_mul_256(Y3, Y3, t1);
	fp_sqr_256(Z3, Z3);
	fp_sub_256(Y3, Y3, Z3);
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

void ec_fp_smul_256q(uni X1, uni Y1, uni Z1, const uni kn, const uni X2, const uni Y2, const uni_t d)
{
	uni_t mX2[FP_LEN], T2[FP_LEN], X[TABLE_SIZE_LTR][FP_LEN], Y[TABLE_SIZE_LTR][FP_LEN], T[TABLE_SIZE_LTR][FP_LEN], Z[TABLE_SIZE_LTR][FP_LEN];
	int i, j, ni, k, wd;

	fp_cnt_256(&i, kn, FP_LEN);
	if(i == 0){
		fp_set_1_256(X1, 0);
		fp_set_1_256(Y1, 1);
		fp_set_1_256(Z1, 1);
	}
	else{
		fp_sqr_256(T2, X2);
		ec_fp_mdbl_256Qe(X[0], Y[0], T[0], Z[0], X2, Y2); /* 2P. */
		ec_fp_madd_256Qe(X[1], Y[1], T[1], Z[1], X[0], Y[0], T[0], Z[0], X2, Y2, T2, d); /* 3P. */
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			ec_fp_add_256Qe(X[j], Y[j], T[j], Z[j], X[j - 1], Y[j - 1], T[j - 1], Z[j - 1], X[0], Y[0], T[0], Z[0], d);
		}
		find_nextwindow(&ni, &k, &wd, kn, i);
		i -= wd;
		if(ni > 0){
			ni >>= 1;
			if(ni == 0){
				ec_fp_cpy_256Q(X1, Y1, Z1, X2, Y2, NULL);
			}
			else{
				ec_fp_cpy_256Q(X1, Y1, Z1, X[ni], Y[ni], Z[ni]);
			}
		}
		else{
			ni = (-ni) >> 1;
			if(ni == 0){
				ec_fp_neg_256Q(X1, Y1, Z1, X2, Y2, NULL);
			}
			else{
				ec_fp_neg_256Q(X1, Y1, Z1, X[ni], Y[ni], Z[ni]);
			}
		}
		for(j = k - 1; i >= 0; j--){
			find_nextwindow(&ni, &k, &wd, kn, i);
			i -= wd;
			if(ni == 0){
				ec_fp_dbl_256Qx(X1, Y1, Z1, X1, Y1, Z1); //DBL1++;
			}
			else{
				for(; j > k; j--){
					ec_fp_dbl_256Qx(X1, Y1, Z1, X1, Y1, Z1); //DBL2++;
				}
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						ec_fp_dblmadd_256Qx(X1, Y1, Z1, X1, Y1, Z1, X2, Y2, T2, d); //DBL3++; ADD++;
					}
					else{
						ec_fp_dbladd_256Qx(X1, Y1, Z1, X1, Y1, Z1, X[ni], Y[ni], T[ni], Z[ni], d); //DBL3++; ADD++;
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						fp_sub_2_256(mX2, 0, X2);
						ec_fp_dblmadd_256Qx(X1, Y1, Z1, X1, Y1, Z1, mX2, Y2, T2, d); //DBL3++; ADD++;
					}
					else{
						fp_sub_2_256(mX2, 0, X[ni]);
						ec_fp_dbladd_256Qx(X1, Y1, Z1, X1, Y1, Z1, mX2, Y[ni], T[ni], Z[ni], d);  //DBL3++; ADD++;
					}
				}
			}
		}
		for(; j >= 1; j--){
			ec_fp_dbl_256Qx(X1, Y1, Z1, X1, Y1, Z1); //DBL4++;
		};
	}
}

#if EC_FP_SMULBASE_SLICE != 0
void ec_fp_smulbase_256q(uni X1, uni Y1, uni Z1, const uni kn, const uni *xn0, const uni *yn0, const uni *tn0, const uni_t d)
{
	unsigned int i, j, k, m, n, p, ei, e[EC_FP_SMULBASE_SLICE];
	uni_t T1[FP_LEN], t[FP_LEN];

	ec_fp_set_1_256Q(X1, Y1, Z1, 0, 1, 1);
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
		ec_fp_dbl_256Qe(X1, Y1, T1, Z1, X1, Y1, Z1);
		for(n = 0, j = 0; j < EC_FP_SMULBASE_SLICE; j++, n += ((EC_FP_SMULBASE_CACHE_SIZE*sizeof(unsigned char))/sizeof(uni_t))){
			if(e[j] != 0){
				m = e[j] + n;
				fp_sqr_256(t, (uni)(xn0 + m));
				ec_fp_madd_256Qe(X1, Y1, T1, Z1, X1, Y1, T1, Z1, (uni)(xn0 + m), (uni)(yn0 + m), t, d);
			}
		}
	}
}
#endif

////2M + 5S + 7a
//static void ec_fp_dbl_256Qx(uni X3, uni Y3, uni Z3, uni X1, uni Y1, uni Z1){
//	uni_t t1[FP_LEN];
//
//	fp_add_256(t1, X1, Y1);
//	fp_sqr_256(X3, X1);
//	fp_sqr_256(Y3, Y1);
//	fp_sqr_256(Z3, Z1);
//	fp_sqr_256(t1, t1);
//	fp_add_256(X3, X3, Y3);
//	fp_sub_256(t1, t1, X3);
//	fp_ml2_256(Z3, Z3);
//	fp_mul_256(Y3, X3, Y3);
//	fp_ml2_256(Y3, Y3);
//	fp_sub_256(Z3, Z3, X3);
//	fp_mul_256(X3, t1, Z3);
//	fp_sqr_256(Z3, Z3);
//	fp_sub_256(Y3, Y3, Z3);
//}
