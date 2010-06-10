/**
 * Scalar multiplication on twisted Jacobi intersection curves with b = 1.
 *
 *    b*S^2 + C^2 = Z^2, a*S^2 + D^2 = Z^2.
 *
 * To guarantee a correct output, the input must be of odd order.
 * In addition, the scalar must be smaller than the order of the base point.
 * The function ec_fp_smul_256i() is made public via finite.h.
 * The function ec_fp_smulbase_256i() is made public via finite.h.
 *
 * Huseyin Hisil.
 * 2009-2010.
 **/
#include <stdio.h>
#include "crympix.h"
#include "finite256.h"
#include "ec_fp_256i.h"

#define WINDOW_SIZE_LTR 5
#define TABLE_SIZE_LTR (1 << (WINDOW_SIZE_LTR - 2))

static void ec_fp_set_1_256Ima(uni S3, uni C3, uni D3, uni Z3, uni U3, uni V3, const uni_t S1, const uni_t C1, const uni_t D1, const uni_t Z1, const uni_t U1, const uni_t V1){
	fp_set_1_256(S3, S1);
	fp_set_1_256(C3, C1);
	fp_set_1_256(D3, D1);
	fp_set_1_256(Z3, Z1);
	fp_set_1_256(U3, U1);
	fp_set_1_256(V3, V1);
}

static void ec_fp_cpy256Ima(uni S3, uni C3, uni D3, uni Z3, uni U3, uni V3, const uni S1, const uni C1, const uni D1, const uni Z1, const uni U1, const uni V1){
	fp_cpy_256(S3, S1);
	fp_cpy_256(C3, C1);
	fp_cpy_256(D3, D1);
	if(Z1 == NULL){
		fp_set_1_256(Z3, 1);
		fp_cpy_256(V3, C1);
	}
	else{
		fp_cpy_256(Z3, Z1);
		fp_cpy_256(V3, V1);
	}
	fp_cpy_256(U3, U1);
}

static void ec_fp_neg256Ima(uni S3, uni C3, uni D3, uni Z3, uni U3, uni V3, const uni S1, const uni C1, const uni D1, const uni Z1, const uni U1, const uni V1){
	fp_sub_2_256(S3, 0, S1);
	fp_cpy_256(C3, C1);
	fp_cpy_256(D3, D1);
	if(Z1 == NULL){
		fp_set_1_256(Z3, 1);
		fp_cpy_256(V3, C1);
	}
	else{
		fp_cpy_256(Z3, Z1);
		fp_cpy_256(V3, V1);
	}
	fp_sub_2_256(U3, 0, U1);
}

static void ec_fp_mdbl256Ima(uni S3, uni C3, uni D3, uni Z3, uni U3, uni V3, const uni S1, const uni C1, const uni D1, const uni U1){
	uni_t t1[FP_LEN];

	fp_add_256(t1, C1, U1);
	fp_sqr_256(t1, t1);
	fp_sqr_256(S3, U1);
	fp_sqr_256(C3, C1);
	fp_sqr_256(D3, D1);
	fp_add_256(Z3, S3, C3);
	fp_sub_256(C3, C3, S3);
	fp_ml2_256(D3, D3);
	fp_sub_256(D3, D3, Z3);
	fp_sub_256(S3, t1, Z3);
	fp_mul_256(U3, S3, D3);
	fp_mul_256(V3, C3, Z3);
}

/* 3M + 4S + 6a */
inline static void ec_fp_dbl256Ima(uni S3, uni C3, uni D3, uni Z3, uni U3, uni V3, const uni S1, const uni C1, const uni D1, const uni Z1, const uni U1, const uni V1){
	uni_t t1[FP_LEN];

	fp_mul_256(D3, D1, Z1);
	fp_add_256(t1, V1, U1);
	fp_sqr_256(t1, t1);
	fp_sqr_256(S3, U1);
	fp_sqr_256(C3, V1);
	fp_sqr_256(D3, D3);
	fp_add_256(Z3, S3, C3);
	fp_sub_256(C3, C3, S3);
	fp_ml2_256(D3, D3);
	fp_sub_256(D3, D3, Z3);
	fp_sub_256(S3, t1, Z3);
	fp_mul_256(V3, C3, Z3);
	fp_mul_256(U3, S3, D3);
}

/* 10M + 9a */
static void ec_fp_madd256Ima(uni S3, uni C3, uni D3, uni Z3, uni U3, uni V3, const uni S1, const uni C1, const uni D1, const uni Z1, const uni U1, const uni V1, const uni S2, const uni C2, const uni D2, const uni U2){
	uni_t t1[FP_LEN], t2[FP_LEN];

	fp_mul_256(Z3, Z1, C2);
	fp_sub_256(t2, Z3, C1);
	fp_add_256(C3, Z3, C1);
	fp_mul_256(t1, S1, D2);
	fp_mul_256(D3, D1, S2);
	fp_sub_256(S3, t1, D3);
	fp_add_256(D3, t1, D3);
	fp_mul_256(t1, C3, S3);
	fp_mul_256(D3, t2, D3);
	fp_mul_256(S3, t2, C3);
	fp_sub_256(C3, t1, D3);
	fp_dv2_256(C3, C3);
	fp_add_256(Z3, t1, D3);
	fp_dv2_256(Z3, Z3);
	fp_mul_256(t1, U1, C2);
	fp_mul_256(t2, V1, U2);
	fp_sub_256(D3, t1, t2);
	fp_mul_256(U3, S3, D3);
	fp_mul_256(V3, C3, Z3);
}

/* 11M + 9a */
inline static void ec_fp_add256Ima(uni S3, uni C3, uni D3, uni Z3, uni U3, uni V3, const uni S1, const uni C1, const uni D1, const uni Z1, const uni U1, const uni V1, const uni S2, const uni C2, const uni D2, const uni Z2, const uni U2, const uni V2){
	uni_t t1[FP_LEN], t2[FP_LEN];

	fp_mul_256(t1, C1, Z2);
	fp_mul_256(Z3, Z1, C2);
	fp_sub_256(t2, Z3, t1);
	fp_add_256(C3, Z3, t1);
	fp_mul_256(t1, S1, D2);
	fp_mul_256(D3, D1, S2);
	fp_sub_256(S3, t1, D3);
	fp_add_256(D3, t1, D3);
	fp_mul_256(t1, C3, S3);
	fp_mul_256(D3, t2, D3);
	fp_mul_256(S3, t2, C3);
	fp_sub_256(C3, t1, D3);
	fp_dv2_256(C3, C3);
	fp_add_256(Z3, t1, D3);
	fp_dv2_256(Z3, Z3);
	fp_mul_256(t1, U1, V2);
	fp_mul_256(t2, V1, U2);
	fp_sub_256(D3, t1, t2);
	fp_mul_256(U3, S3, D3);
	fp_mul_256(V3, C3, Z3);
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

void ec_fp_smul_256i(uni S1, uni C1, uni D1, uni Z1, const uni kn, const uni S2, const uni C2, const uni D2)
{
	uni_t mS2[FP_LEN], mU2[FP_LEN], U1[FP_LEN], V1[FP_LEN], U2[FP_LEN], S[TABLE_SIZE_LTR][FP_LEN], C[TABLE_SIZE_LTR][FP_LEN], D[TABLE_SIZE_LTR][FP_LEN], Z[TABLE_SIZE_LTR][FP_LEN], U[TABLE_SIZE_LTR][FP_LEN], V[TABLE_SIZE_LTR][FP_LEN];
	int i, j, ni, k, wd;

	fp_cnt_256(&i, kn, FP_LEN);
	if(i == 0){
		fp_set_1_256(S1, 0);
		fp_set_1_256(C1, 1);
		fp_set_1_256(D1, 1);
		fp_set_1_256(Z1, 1);
		fp_set_1_256(U1, 0);
		fp_set_1_256(V1, 1);
	}
	else{
		fp_mul_256(U2, S2, D2);
		ec_fp_mdbl256Ima(S[0], C[0], D[0], Z[0], U[0], V[0], S2, C2, D2, U2); /* 2P. */
		ec_fp_madd256Ima(S[1], C[1], D[1], Z[1], U[1], V[1], S[0], C[0], D[0], Z[0], U[0], V[0], S2, C2, D2, U2); /* 3P. */
		for(j = 2; j < TABLE_SIZE_LTR; j++){
			ec_fp_add256Ima(S[j], C[j], D[j], Z[j], U[j], V[j], S[j - 1], C[j - 1], D[j - 1], Z[j - 1], U[j - 1], V[j - 1], S[0], C[0], D[0], Z[0], U[0], V[0]);
		}
		find_nextwindow(&ni, &k, &wd, kn, i);
		i -= wd;
		if(ni > 0){
			ni >>= 1;
			if(ni == 0){
				ec_fp_cpy256Ima(S1, C1, D1, Z1, U1, V1, S2, C2, D2, NULL, U2, NULL);
			}
			else{
				ec_fp_cpy256Ima(S1, C1, D1, Z1, U1, V1, S[ni], C[ni], D[ni], Z[ni], U[ni], V[ni]);
			}
		}
		else{
			ni = (-ni) >> 1;
			if(ni == 0){
				ec_fp_neg256Ima(S1, C1, D1, Z1, U1, V1, S2, C2, D2, NULL, U2, NULL);
			}
			else{
				ec_fp_neg256Ima(S1, C1, D1, Z1, U1, V1, S[ni], C[ni], D[ni], Z[ni], U[ni], V[ni]);
			}
		}
		for(j = k - 1; i >= 0; j--){
			find_nextwindow(&ni, &k, &wd, kn, i);
			i -= wd;
			if(ni == 0){
				ec_fp_dbl256Ima(S1, C1, D1, Z1, U1, V1, S1, C1, D1, Z1, U1, V1); //DBL1++;
			}
			else{
				for(; j > k; j--){
					ec_fp_dbl256Ima(S1, C1, D1, Z1, U1, V1, S1, C1, D1, Z1, U1, V1); //DBL2++;
				}
				ec_fp_dbl256Ima(S1, C1, D1, Z1, U1, V1, S1, C1, D1, Z1, U1, V1); //DBL2++;
				if(ni > 0){
					ni >>= 1;
					if(ni == 0){
						ec_fp_madd256Ima(S1, C1, D1, Z1, U1, V1, S1, C1, D1, Z1, U1, V1, S2, C2, D2, U2); //DBL3++; ADD++;
					}
					else{
						ec_fp_add256Ima(S1, C1, D1, Z1, U1, V1, S1, C1, D1, Z1, U1, V1, S[ni], C[ni], D[ni], Z[ni], U[ni], V[ni]); //DBL3++; ADD++;
					}
				}
				else{
					ni = (-ni) >> 1;
					if(ni == 0){
						fp_sub_2_256(mS2, 0, S2);
						fp_sub_2_256(mU2, 0, U2);
						ec_fp_madd256Ima(S1, C1, D1, Z1, U1, V1, S1, C1, D1, Z1, U1, V1, mS2, C2, D2, mU2); //DBL3++; ADD++;
					}
					else{
						fp_sub_2_256(mS2, 0, S[ni]);
						fp_sub_2_256(mU2, 0, U[ni]);
						ec_fp_add256Ima(S1, C1, D1, Z1, U1, V1, S1, C1, D1, Z1, U1, V1, mS2, C[ni], D[ni], Z[ni], mU2, V[ni]);  //DBL3++; ADD++;
					}
				}
			}
		}
		for(; j >= 1; j--){
			ec_fp_dbl256Ima(S1, C1, D1, Z1, U1, V1, S1, C1, D1, Z1, U1, V1); //DBL4++;
		};
	}
}

#if EC_FP_SMULBASE_SLICE != 0
void ec_fp_smulbase_256i(uni S1, uni C1, uni D1, uni Z1, const uni kn, const uni *sn0, const uni *cn0, const uni *dn0)
{
	unsigned int i, j, k, m, n, p, ei, e[EC_FP_SMULBASE_SLICE];
	uni_t U1[FP_LEN], V1[FP_LEN], un0[FP_LEN];

	ec_fp_set_1_256Ima(S1, C1, D1, Z1, U1, V1, 0, 1, 1, 1, 0, 1);
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
		ec_fp_dbl256Ima(S1, C1, D1, Z1, U1, V1, S1, C1, D1, Z1, U1, V1);
		for(n = 0, j = 0; j < EC_FP_SMULBASE_SLICE; j++, n += ((EC_FP_SMULBASE_CACHE_SIZE*sizeof(unsigned char))/sizeof(uni_t))){
			if(e[j] != 0){
				m = e[j] + n;
				fp_mul_256(un0, (uni)(sn0 + m), (uni)(dn0 + m));
				ec_fp_madd256Ima(S1, C1, D1, Z1, U1, V1, S1, C1, D1, Z1, U1, V1, (uni)(sn0 + m), (uni)(cn0 + m), (uni)(dn0 + m), un0);
			}
		}
	}
}
#endif
