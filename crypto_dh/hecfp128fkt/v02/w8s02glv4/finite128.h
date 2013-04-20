/**
 * Huseyin Hisil.
 * 2012.
 **/
#include "fpx.h"

#define FP_LEN (128/UNIT_LEN)

#define CONST const

/**
 * Finite field arithmetic for field with 2^127 - 1 elements.
 **/
void fp_dv2_2e127m1_x8664(uni zn, uni an);
void fp_ml2_2e127m1_x8664(uni zn, uni an);
void fp_ml3_2e127m1_x8664(uni zn, uni an);
void fp_sub_2e127m1_x8664(uni zn, uni an, uni bn);
void fp_add_2e127m1_x8664(uni zn, uni an, uni bn);
void fp_mul_2e127m1_x8664(uni zn, uni an, void *NOPARAM, uni bn);
void fp_sqr_2e127m1_x8664(uni zn, uni an);
void fp_cpy_2e127m1_x8664(uni zn, uni an);
void fp_set_1_2e127m1_x8664(uni zn, uni_t a);
void fp_add_1_2e127m1_x8664(uni zn, uni an, uni_t b);
void fp_sub_1_2e127m1_x8664(uni zn, uni an, uni_t b);
void fp_sub_2_2e127m1_x8664(uni zn, uni_t a, uni bn);
void fp_neg_2e127m1_x8664(uni zn, uni an);
void fp_mld_2e127m1_x8664(uni zn, uni an, void *NOPARAM, uni_t b);

void fp_hdm_2e127m1_x8664(uni xn, uni yn, uni zn, uni tn);
void fp_hdm_ym_2e127m1_x8664(uni xn, uni yn, uni zn, uni tn);

typedef struct{
	uni_t n01[FP_LEN];
	uni_t n02[FP_LEN];
	uni_t n03[FP_LEN];
	uni_t n04[FP_LEN];
	uni_t n05[FP_LEN];
	uni_t n06[FP_LEN];
} TEMP_INV_FP_2e127m1_t[1], *TEMP_INV_FP_2e127m1;

void fp_inv_2e127m1_x8664_asm(TEMP_INV_FP_2e127m1 t, void *NOPARAM1, void *NOPARAM2, uni zn, uni an);
void fp_inv_2e127m1_x8664(uni zn, uni an);
void fp_sqrt_2e127m1_x8664_asm(void *NOPARAM1, void *NOPARAM2, void *NOPARAM3, uni zn, uni an);
void fp_sqrt_2e127m1_x8664(uni zn, uni an);

typedef struct{
	uni_t P[FP_LEN];
	uni_t R[FP_LEN];
	uni_t S[FP_LEN];
	uni_t T[FP_LEN];
} AFF_HEC_FP_2e127m1_t[1], *AFF_HEC_FP_2e127m1;

typedef struct{
	uni_t P[FP_LEN];
	uni_t R[FP_LEN];
	uni_t S[FP_LEN];
	uni_t T[FP_LEN];
	uni_t Z[FP_LEN];
} DIV_hec_fp_2e127m1_t[1], *DIV_hec_fp_2e127m1;

typedef struct{
	uni_t a3[FP_LEN];
	uni_t a2[FP_LEN];
} CNS_hec_fp_2e127m1_t[1], *CNS_hec_fp_2e127m1;

typedef struct{
	uni_t n01[FP_LEN];
	uni_t n02[FP_LEN];
	uni_t n03[FP_LEN];
	uni_t n04[FP_LEN];
	uni_t n05[FP_LEN];
	uni_t n06[FP_LEN];
	uni_t n07[FP_LEN];
	uni_t n08[FP_LEN];
	uni_t n09[FP_LEN];
	uni_t n10[FP_LEN];
	uni_t n11[FP_LEN];
	uni_t n12[FP_LEN];
} TEMP_hec_fp_2e127m1_t[1], *TEMP_hec_fp_2e127m1;

typedef struct{
	uni_t X[FP_LEN];
	uni_t Y[FP_LEN];
	uni_t Z[FP_LEN];
	uni_t T[FP_LEN];
} DIV_kum_fp_2e127m1_g_t[1], *DIV_kum_fp_2e127m1_g;

typedef struct{
	uni_t yd[FP_LEN];
	uni_t zd[FP_LEN];
	uni_t td[FP_LEN];
	uni_t x0[FP_LEN];
	uni_t y0[FP_LEN];
	uni_t z0[FP_LEN];
	uni_t t0[FP_LEN];
	uni_t yb[FP_LEN];
	uni_t zb[FP_LEN];
	uni_t tb[FP_LEN];
	uni_t rn[2*FP_LEN];
} CNS_kum_fp_2e127m1_g_t[1], *CNS_kum_fp_2e127m1_g;

typedef struct{
	uni_t n01[FP_LEN];
	uni_t n02[FP_LEN];
	uni_t n03[FP_LEN];
	uni_t n04[FP_LEN];
} TEMP_kum_fp_2e127m1_g_t[1], *TEMP_kum_fp_2e127m1_g;

void ec_fp_smul_127M(uni X1, uni Z1, uni kn, uni X2, uni_t a);
void ec_fp_smul_127e(uni X1, uni Y1, uni Z1, uni kn, uni X2, uni Y2);
void ec_fp_smulbase_127e(uni X1, uni Y1, uni Z1, CONST uni kn, CONST uni *xn0, CONST uni *yn0, CONST uni *tn0);


inline void hec_fp_dbl_2e127m1_g2i_x8664_asm(uni TMP, void *NOPARAM1, void *NOPARAM2, uni D3, uni d1, uni CNS);
inline void hec_fp_add_2e127m1_g2i_x8664_asm(uni TMP, void *NOPARAM1, void *NOPARAM2, uni D3, uni d1, uni d2);
inline void hec_fp_madd_2e127m1_g2i_x8664_asm(uni TMP, void *NOPARAM1, void *NOPARAM2, uni D3, uni d1, uni d2);

void hec_fp_smul_2e127m1_g2i(DIV_hec_fp_2e127m1 d1, const uni kn,  DIV_hec_fp_2e127m1 d2, CNS_hec_fp_2e127m1 cn);
void hec_fp_smulcached_2e127m1_g2i(DIV_hec_fp_2e127m1 d1, const uni kn, unsigned char *d2, CNS_hec_fp_2e127m1 cn, int slice, int window, int csize);


inline void kum_fp_dbl_2e127m1_g_x8664_asm(uni TMP, void *NOPARAM1, void *NOPARAM2, uni d1, void *NOPARAM3, uni CNS);
inline void kum_fp_dbladd_2e127m1_g_fixed_x8664_asm(uni TMP, uni kn, uni_t i, uni d1, uni d2, uni CNS);
inline void kum_fp_dbladd_2e127m1_g_x8664_asm(uni TMP, uni kn, uni_t i, uni d1, uni d2, uni CNS);

inline void kum_fp_dbl_2e127m1_g_ym_x8664_asm(uni TMP, void *NOPARAM1, void *NOPARAM2, uni d1, void *NOPARAM3, uni CNS);
inline void kum_fp_dbladd_2e127m1_g_ym_x8664_asm(uni TMP, uni kn, uni_t i, uni d1, uni d2, uni CNS);

void kum_fp_smul_2e127m1_g(DIV_kum_fp_2e127m1_g d1, CONST uni kn, DIV_kum_fp_2e127m1_g d2, CNS_kum_fp_2e127m1_g cn);
void kum_fp_smul_ym_2e127m1_g(DIV_kum_fp_2e127m1_g d1, CONST uni kn, DIV_kum_fp_2e127m1_g d2, CNS_kum_fp_2e127m1_g cn);
void kum_fp_smul_2e127m1_g_fixed(DIV_kum_fp_2e127m1_g d1, CONST uni kn, DIV_kum_fp_2e127m1_g d2, CNS_kum_fp_2e127m1_g cn);









/**
 * Finite field arithmetic for field with 2^128 - c elements.
 **/
void fp_dv2_2e128mc_x8664(uni zn, uni_t prm, uni an);
void fp_ml2_2e128mc_x8664(uni zn, uni_t prm, uni an);
void fp_add_2e128mc_x8664(uni zn, uni_t prm, uni an, uni bn);
void fp_sub_2e128mc_x8664(uni zn, uni_t prm, uni an, uni bn);
void fp_mul_2e128mc_x8664(uni zn, uni_t prm, void *NOPARAM, uni an, uni bn);
void fp_sqr_2e128mc_x8664(uni zn, uni_t prm, void *NOPARAM, uni an);
void fp_sub_2_2e128mc_x8664(uni zn, uni_t prm, uni_t a, uni bn);
void fp_mld_2e128mc_x8664(uni zn, uni_t prm, void *NOPARAM, uni_t a, uni bn);
void fp_cpy_2e128mc_x8664(uni zn, uni an);
void fp_set_1_2e128mc_x8664(uni zn, uni_t a);
void fp_add_1_2e128mc_x8664(uni zn, uni_t prm, uni an, uni_t b);
void fp_inv_2e128mc_x8664(uni zn, uni_t prm, uni an);

typedef struct{
	uni_t X[FP_LEN];
	uni_t Y[FP_LEN];
	uni_t Z[FP_LEN];
	uni_t T[FP_LEN];
} DIV_kum_fp_2e128mc_t[1], *DIV_kum_fp_2e128mc;

typedef struct{
	uni_t prm;
	uni_t for_future_use;
	uni_t yd[FP_LEN];
	uni_t zd[FP_LEN];
	uni_t td[FP_LEN];
	uni_t x0[FP_LEN];
	uni_t y0[FP_LEN];
	uni_t z0[FP_LEN];
	uni_t t0[FP_LEN];
	uni_t yb[FP_LEN];
	uni_t zb[FP_LEN];
	uni_t tb[FP_LEN];
	uni_t rn[2*FP_LEN];
} CNS_kum_fp_2e128mc_t[1], *CNS_kum_fp_2e128mc;

typedef struct{
	uni_t n01[FP_LEN];
	uni_t n02[FP_LEN];
	uni_t n03[FP_LEN];
	uni_t n04[FP_LEN];
} TEMP_kum_fp_2e128mc_t[1], *TEMP_kum_fp_2e128mc;

typedef struct{
	uni_t P[FP_LEN];
	uni_t R[FP_LEN];
	uni_t S[FP_LEN];
	uni_t T[FP_LEN];
	uni_t Z[FP_LEN];
} DIV_hec_fp_2e128mc_t[1], *DIV_hec_fp_2e128mc;

typedef struct{
	uni_t prm;
	uni_t for_future_use;
	uni_t a3[FP_LEN];
	uni_t a2[FP_LEN];
} CNS_hec_fp_2e128mc_t[1], *CNS_hec_fp_2e128mc;

typedef struct{
	uni_t prm;
	uni_t for_future_use;
	uni_t a3[FP_LEN];
	uni_t a2[FP_LEN];
	uni_t u1z[FP_LEN];
	uni_t u0z[FP_LEN];
	uni_t v1z[FP_LEN];
	uni_t v0z[FP_LEN];
	uni_t ah1[FP_LEN];
	uni_t ah2[FP_LEN];
	uni_t A1[FP_LEN];
	uni_t A2[FP_LEN];
	uni_t N[2*FP_LEN];
	uni_t Nhalf[2*FP_LEN];
} CNS_hec_fp_2e128mc_glv2_t[1], *CNS_hec_fp_2e128mc_glv2;

typedef struct{
	uni_t prm;
	uni_t for_future_use;
	uni_t a3[FP_LEN];
	uni_t a2[FP_LEN];
	uni_t u1z[FP_LEN];
	uni_t u0z[FP_LEN];
	uni_t v1z[FP_LEN];
	uni_t v0z[FP_LEN];
	uni_t ah1[3*FP_LEN/2];
	uni_t ah2[3*FP_LEN/2];
	uni_t ah3[3*FP_LEN/2];
	uni_t ah4[3*FP_LEN/2];
	uni_t A1[FP_LEN/2];
	uni_t A2[FP_LEN/2];
	uni_t A3[FP_LEN/2];
	uni_t A4[FP_LEN/2];
	uni_t N[2*FP_LEN];
	uni_t Nhalf[2*FP_LEN];
} CNS_hec_fp_2e128mc_glv4_t[1], *CNS_hec_fp_2e128mc_glv4;

typedef struct{
	uni_t n01[FP_LEN];
	uni_t n02[FP_LEN];
	uni_t n03[FP_LEN];
	uni_t n04[FP_LEN];
	uni_t n05[FP_LEN];
	uni_t n06[FP_LEN];
	uni_t n07[FP_LEN];
	uni_t n08[FP_LEN];
	uni_t n09[FP_LEN];
	uni_t n10[FP_LEN];
	uni_t n11[FP_LEN];
	uni_t n12[FP_LEN];
} TEMP_hec_fp_2e128mc_t[1], *TEMP_hec_fp_2e128mc;

inline void hec_fp_dbl_2e128mc_g2i_x8664_asm(uni TMP, uni_t prm, void *NOPARAM, uni D3, uni d1, uni CNS);
inline void hec_fp_dbl_2e128mc_g2i_a2is0_a3is0_x8664_asm(uni TMP, uni_t prm, void *NOPARAM, uni D3, uni d1, uni CNS);
inline void hec_fp_add_2e128mc_g2i_x8664_asm(uni TMP, uni_t prm, void *NOPARAM, uni D3, uni d1, uni d2);
inline void hec_fp_madd_2e128mc_g2i_x8664_asm(uni TMP, uni_t prm, void *NOPARAM, uni D3, uni d1, uni d2);
inline void hec_fp_aadd_2e128mc_g2i_x8664_asm(uni TMP, uni_t prm, void *NOPARAM, uni D3, uni d1, uni d2);

void hec_fp_cpy_2e128mc_g2i(DIV_hec_fp_2e128mc_t D3, DIV_hec_fp_2e128mc_t d1);
void hec_fp_neg_2e128mc_g2i(DIV_hec_fp_2e128mc_t D3, DIV_hec_fp_2e128mc_t d1, CNS_hec_fp_2e128mc cn);
void hec_fp_dbl_2e128mc_g2i(DIV_hec_fp_2e128mc d3, CONST DIV_hec_fp_2e128mc d1, CNS_hec_fp_2e128mc cn);
void hec_fp_dbl_2e128mc_g2i_a2is0_a3is0(DIV_hec_fp_2e128mc d3, CONST DIV_hec_fp_2e128mc d1, CNS_hec_fp_2e128mc cn);
void hec_fp_add_2e128mc_g2i(DIV_hec_fp_2e128mc d3, CONST DIV_hec_fp_2e128mc d1, CONST DIV_hec_fp_2e128mc d2, CNS_hec_fp_2e128mc cn);
void hec_fp_madd_2e128mc_g2i(DIV_hec_fp_2e128mc d3, CONST DIV_hec_fp_2e128mc d1, CONST DIV_hec_fp_2e128mc d2, CNS_hec_fp_2e128mc cn);
void hec_fp_aadd_2e128mc_g2i(DIV_hec_fp_2e128mc d3, CONST DIV_hec_fp_2e128mc d1, CONST DIV_hec_fp_2e128mc d2, CNS_hec_fp_2e128mc cn);

inline void kum_fp_dbl_2e128mc_g_x8664_asm(uni TMP, void *NOPARAM1, void *NOPARAM2, uni d1, void *NOPARAM3, uni CNS);
inline void kum_fp_dbladd_2e128mc_g_x8664_asm(uni TMP, uni kn, uni_t i, uni d1, uni d2, uni CNS);
inline void kum_fp_dbladd_2e128mc_g_fixed_x8664_asm(uni TMP, uni kn, uni_t i, uni d1, uni d2, uni CNS);

void kum_fp_smul_2e128mc_g(DIV_kum_fp_2e128mc d1, CONST uni kn, DIV_kum_fp_2e128mc d2, CNS_kum_fp_2e128mc cns);
void kum_fp_smul_2e128mc_g_fixed(DIV_kum_fp_2e128mc d2, CONST uni kn, CONST DIV_kum_fp_2e128mc d0, CNS_kum_fp_2e128mc cn);
void hec_fp_smul_2e128mc_g2i(DIV_hec_fp_2e128mc d1, CONST uni kn,  DIV_hec_fp_2e128mc d2, CNS_hec_fp_2e128mc cn);
void hec_fp_smul_2e128mc_bk_glv4(DIV_hec_fp_2e128mc d1, CONST uni kn,  DIV_hec_fp_2e128mc d2, CNS_hec_fp_2e128mc_glv4 cn);
void hec_fp_smul_2e128mc_fkt_glv2(DIV_hec_fp_2e128mc d1, CONST uni kn,  DIV_hec_fp_2e128mc d2, CNS_hec_fp_2e128mc_glv2 cn);
void hec_fp_smul_2e128mc_fkt_glv4(DIV_hec_fp_2e128mc d1, CONST uni kn,  DIV_hec_fp_2e128mc d2, CNS_hec_fp_2e128mc_glv4 cn);
void hec_fp_smulcached_2e128mc_g2i(DIV_hec_fp_2e128mc d1, CONST uni kn, unsigned char *d2, CNS_hec_fp_2e128mc cn, int slice, int window, int csize);
void hec_fp_smulcached_2e128mc_g2i_a2is0_a3is0(DIV_hec_fp_2e128mc d1, CONST uni kn, unsigned char *d2, CNS_hec_fp_2e128mc cn, int slice, int window, int csize);












/**
 * Finite field arithmetic for field with (2^61 - 1)^2 elements.
 **/
void fp_cpy_2e61m1e2_x8664(uni zn, uni an);
void fp_set_1_2e61m1e2_x8664(uni zn, uni_t a);
void fp_dv2_2e61m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni an);
void fp_ml2_2e61m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni an);
void fp_sub_2e61m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni an, uni bn);
void fp_add_2e61m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni an, uni bn);
void fp_mul_2e61m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni an, uni bn);
void fp_mul_1_2e61m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni an, uni bn);
void fp_sqr_2e61m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni an);
void fp_sub_2_2e61m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni_t a, uni bn);
void fp_cjg_2e61m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni bn);
void fp_neg_2e61m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni bn);

void fp_add_11_2e61m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni an, uni_t b0, uni_t b1);
void fp_sub_11_2e61m1e2_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni an, uni_t b0, uni_t b1);

void fp_hdm_2e61m1e2_x8664(uni xn, uni yn, uni zn, uni tn);

void fp_inv_2e61m1e2_x8664(uni zn, uni an);


typedef struct{
	uni_t X[FP_LEN];
	uni_t Y[FP_LEN];
	uni_t Z[FP_LEN];
	uni_t T[FP_LEN];
} DIV_kum_fp_2e61m1e2_g_t[1], *DIV_kum_fp_2e61m1e2_g;

typedef struct{
	uni_t yd[FP_LEN];
	uni_t zd[FP_LEN];
	uni_t td[FP_LEN];
	uni_t x0[FP_LEN];
	uni_t y0[FP_LEN];
	uni_t z0[FP_LEN];
	uni_t t0[FP_LEN];
	uni_t yb[FP_LEN];
	uni_t zb[FP_LEN];
	uni_t tb[FP_LEN];
	uni_t rn[2*FP_LEN];
} CNS_kum_fp_2e61m1e2_g_t[1], *CNS_kum_fp_2e61m1e2_g;

typedef struct{
	uni_t n01[FP_LEN];
	uni_t n02[FP_LEN];
	uni_t n03[FP_LEN];
	uni_t n04[FP_LEN];
} TEMP_kum_fp_2e61m1e2_g_t[1], *TEMP_kum_fp_2e61m1e2_g;

typedef struct{
	uni_t P[FP_LEN];
	uni_t R[FP_LEN];
	uni_t S[FP_LEN];
	uni_t T[FP_LEN];
	uni_t Z[FP_LEN];
} DIV_hec_fp_2e61m1e2_t[1], *DIV_hec_fp_2e61m1e2;

typedef struct{
	uni_t a3[FP_LEN];
	uni_t a2[FP_LEN];
} CNS_hec_fp_2e61m1e2_t[1], *CNS_hec_fp_2e61m1e2;

typedef struct{
	uni_t a3[FP_LEN];
	uni_t a2[FP_LEN];
	uni_t u1z[FP_LEN];
	uni_t u0z[FP_LEN];
	uni_t v1z[FP_LEN];
	uni_t v0z[FP_LEN];
	uni_t ah1[3*FP_LEN/2];
	uni_t ah2[3*FP_LEN/2];
	uni_t ah3[3*FP_LEN/2];
	uni_t ah4[3*FP_LEN/2];
	uni_t ah5[3*FP_LEN/2];
	uni_t ah6[3*FP_LEN/2];
	uni_t ah7[3*FP_LEN/2];
	uni_t ah8[3*FP_LEN/2];
	uni_t A1[FP_LEN/2];
	uni_t A2[FP_LEN/2];
	uni_t A3[FP_LEN/2];
	uni_t A4[FP_LEN/2];
	uni_t A5[FP_LEN/2];
	uni_t A6[FP_LEN/2];
	uni_t A7[FP_LEN/2];
	uni_t A8[FP_LEN/2];
	uni_t N[2*FP_LEN];
	uni_t Nhalf[2*FP_LEN];
} CNS_hec_fp_2e61m1e2_glv8_t[1], *CNS_hec_fp_2e61m1e2_glv8;

typedef struct{
	uni_t a3[FP_LEN];
	uni_t a2[FP_LEN];
	uni_t u1z[FP_LEN];
	uni_t u0z[FP_LEN];
	uni_t v1z[FP_LEN];
	uni_t v0z[FP_LEN];
	uni_t ah1[3*FP_LEN/2];
	uni_t ah2[3*FP_LEN/2];
	uni_t ah3[3*FP_LEN/2];
	uni_t ah4[3*FP_LEN/2];
	uni_t ah5[3*FP_LEN/2];
	uni_t ah6[3*FP_LEN/2];
	uni_t ah7[3*FP_LEN/2];
	uni_t ah8[3*FP_LEN/2];
	uni_t A1[FP_LEN/2];
	uni_t A2[FP_LEN/2];
	uni_t A3[FP_LEN/2];
	uni_t A4[FP_LEN/2];
	uni_t A5[FP_LEN/2];
	uni_t A6[FP_LEN/2];
	uni_t A7[FP_LEN/2];
	uni_t A8[FP_LEN/2];
	uni_t N[2*FP_LEN];
	uni_t Nhalf[2*FP_LEN];
	uni_t u1m1[FP_LEN];
	uni_t u0m1[FP_LEN];
	uni_t v1m1[FP_LEN];
	uni_t v0m1[FP_LEN];
	uni_t u1m2[FP_LEN];
	uni_t u0m2[FP_LEN];
	uni_t v1m2[FP_LEN];
	uni_t v0m2[FP_LEN];
	uni_t u1m3[FP_LEN];
	uni_t u0m3[FP_LEN];
	uni_t v1m3[FP_LEN];
	uni_t v0m3[FP_LEN];
	uni_t u1m4[FP_LEN];
	uni_t u0m4[FP_LEN];
	uni_t v1m4[FP_LEN];
	uni_t v0m4[FP_LEN];
	uni_t u1m5[FP_LEN];
	uni_t u0m5[FP_LEN];
	uni_t v1m5[FP_LEN];
	uni_t v0m5[FP_LEN];
	uni_t u1m6[FP_LEN];
	uni_t u0m6[FP_LEN];
	uni_t v1m6[FP_LEN];
	uni_t v0m6[FP_LEN];
} CNS_hec_fp_2e61m1e2_glv8_s1_t[1], *CNS_hec_fp_2e61m1e2_glv8_s1;

typedef struct{
	uni_t a3[FP_LEN];
	uni_t a2[FP_LEN];
	uni_t u1z[FP_LEN];
	uni_t u0z[FP_LEN];
	uni_t v1z[FP_LEN];
	uni_t v0z[FP_LEN];
	uni_t ah1[3*FP_LEN/2];
	uni_t ah2[3*FP_LEN/2];
	uni_t ah3[3*FP_LEN/2];
	uni_t ah4[3*FP_LEN/2];
	uni_t ah5[3*FP_LEN/2];
	uni_t ah6[3*FP_LEN/2];
	uni_t ah7[3*FP_LEN/2];
	uni_t ah8[3*FP_LEN/2];
	uni_t A1[FP_LEN/2];
	uni_t A2[FP_LEN/2];
	uni_t A3[FP_LEN/2];
	uni_t A4[FP_LEN/2];
	uni_t A5[FP_LEN/2];
	uni_t A6[FP_LEN/2];
	uni_t A7[FP_LEN/2];
	uni_t A8[FP_LEN/2];
	uni_t N[2*FP_LEN];
	uni_t Nhalf[2*FP_LEN];
	uni_t u1m1[FP_LEN];
	uni_t u0m1[FP_LEN];
	uni_t v1m1[FP_LEN];
	uni_t v0m1[FP_LEN];
	uni_t u1m2[FP_LEN];
	uni_t u0m2[FP_LEN];
	uni_t v1m2[FP_LEN];
	uni_t v0m2[FP_LEN];
	uni_t u1m3[FP_LEN];
	uni_t u0m3[FP_LEN];
	uni_t v1m3[FP_LEN];
	uni_t v0m3[FP_LEN];
	uni_t u1m4[FP_LEN];
	uni_t u0m4[FP_LEN];
	uni_t v1m4[FP_LEN];
	uni_t v0m4[FP_LEN];
	uni_t u1m5[FP_LEN];
	uni_t u0m5[FP_LEN];
	uni_t v1m5[FP_LEN];
	uni_t v0m5[FP_LEN];
	uni_t u1m6[FP_LEN];
	uni_t u0m6[FP_LEN];
	uni_t v1m6[FP_LEN];
	uni_t v0m6[FP_LEN];
} CNS_hec_fp_2e61m1e2_glv8_s2_t[1], *CNS_hec_fp_2e61m1e2_glv8_s2;

typedef struct{
	uni_t n01[FP_LEN];
	uni_t n02[FP_LEN];
	uni_t n03[FP_LEN];
	uni_t n04[FP_LEN];
	uni_t n05[FP_LEN];
	uni_t n06[FP_LEN];
	uni_t n07[FP_LEN];
	uni_t n08[FP_LEN];
	uni_t n09[FP_LEN];
	uni_t n10[FP_LEN];
	uni_t n11[FP_LEN];
	uni_t n12[FP_LEN];
} TEMP_hec_fp_2e61m1e2_t[1], *TEMP_hec_fp_2e61m1e2;

inline void hec_fp_dbl_2e61m1e2_g2i_x8664_asm(uni TMP, void *NOPARAM1, void *NOPARAM2, uni D3, uni d1, uni CNS);
inline void hec_fp_dbl_2e61m1e2_g2i_a2is0_a3is0_x8664_asm(uni TMP, void *NOPARAM1, void *NOPARAM2, uni D3, uni d1, uni CNS);
inline void hec_fp_add_2e61m1e2_g2i_x8664_asm(uni TMP, void *NOPARAM1, void *NOPARAM2, uni D3, uni d1, uni d2);
inline void hec_fp_madd_2e61m1e2_g2i_x8664_asm(uni TMP, void *NOPARAM1, void *NOPARAM2, uni D3, uni d1, uni d2);
inline void hec_fp_aadd_2e61m1e2_g2i_x8664_asm(uni TMP, void *NOPARAM1, void *NOPARAM2, uni D3, uni d1, uni d2);

void hec_fp_cpy_2e61m1e2_g2i(DIV_hec_fp_2e61m1e2_t D3, DIV_hec_fp_2e61m1e2_t d1);
void hec_fp_neg_2e61m1e2_g2i(DIV_hec_fp_2e61m1e2_t D3, DIV_hec_fp_2e61m1e2_t d1);
void hec_fp_dbl_2e61m1e2_g2i(DIV_hec_fp_2e61m1e2 d3, CONST DIV_hec_fp_2e61m1e2 d1, CNS_hec_fp_2e61m1e2 cn);
void hec_fp_dbl_2e61m1e2_g2i_a2is0_a3is0(DIV_hec_fp_2e61m1e2 d3, CONST DIV_hec_fp_2e61m1e2 d1, CNS_hec_fp_2e61m1e2 cn);
void hec_fp_add_2e61m1e2_g2i(DIV_hec_fp_2e61m1e2 d3, CONST DIV_hec_fp_2e61m1e2 d1, CONST DIV_hec_fp_2e61m1e2 d2, CNS_hec_fp_2e61m1e2 cn);
void hec_fp_madd_2e61m1e2_g2i(DIV_hec_fp_2e61m1e2 d3, CONST DIV_hec_fp_2e61m1e2 d1, CONST DIV_hec_fp_2e61m1e2 d2, CNS_hec_fp_2e61m1e2 cn);
void hec_fp_aadd_2e61m1e2_g2i(DIV_hec_fp_2e61m1e2 d3, CONST DIV_hec_fp_2e61m1e2 d1, CONST DIV_hec_fp_2e61m1e2 d2, CNS_hec_fp_2e61m1e2 cn);

void hec_fp_smul_2e61m1e2_g2i(DIV_hec_fp_2e61m1e2 d1, CONST uni kn,  DIV_hec_fp_2e61m1e2 d2, CNS_hec_fp_2e61m1e2 cn);
void hec_fp_smul_2e61m1e2_g2i_a2is0_a3is0(DIV_hec_fp_2e61m1e2 d1, CONST uni kn,  DIV_hec_fp_2e61m1e2 d2, CNS_hec_fp_2e61m1e2 cn);
void hec_fp_smulcached_2e61m1e2_g2i(DIV_hec_fp_2e61m1e2 D1, const uni kn, unsigned char *D2, CNS_hec_fp_2e61m1e2 cn, int slice, int window, int csize);
void hec_fp_smulcached_2e61m1e2_g2i_a2is0_a3is0(DIV_hec_fp_2e61m1e2 D1, const uni kn, unsigned char *D2, CNS_hec_fp_2e61m1e2 cn, int slice, int window, int csize);
void hec_fp_smul_2e61m1e2_glv8_edirne_s0(DIV_hec_fp_2e61m1e2 d1, CONST uni kn,  DIV_hec_fp_2e61m1e2 d2, CNS_hec_fp_2e61m1e2_glv8 cn);
void hec_fp_smul_2e61m1e2_glv8_edirne_s1(DIV_hec_fp_2e61m1e2 d1, CONST uni kn,  DIV_hec_fp_2e61m1e2 d2, CNS_hec_fp_2e61m1e2_glv8_s1 cn);
void hec_fp_smul_2e61m1e2_glv8_edirne_s2(DIV_hec_fp_2e61m1e2 d1, CONST uni kn,  DIV_hec_fp_2e61m1e2 d2, CNS_hec_fp_2e61m1e2_glv8_s2 cn);


inline void kum_fp_dbl_2e61m1e2_g_x8664_asm(uni TMP, void *NOPARAM1, void *NOPARAM2, uni d1, void *NOPARAM3, uni CNS);
inline void kum_fp_dbladd_2e61m1e2_g_x8664_asm(uni TMP, uni kn, uni_t i, uni d1, uni d2, uni CNS);

void kum_fp_smul_2e61m1e2_g(DIV_kum_fp_2e61m1e2_g d2, const uni kn, const DIV_kum_fp_2e61m1e2_g d0, CNS_kum_fp_2e61m1e2_g cn);




















/**
 * Finite field arithmetic for field with (2^64 - c)^2 elements.
 **/
void fp_dv2_2e64mce2_x8664(uni zn, uni_t ch, void *NOPARAM, uni an);
void fp_ml2_2e64mce2_x8664(uni zn, uni_t c, void *NOPARAM, uni an);
//void fp_ml3_2e64mce2_x8664(uni zn, uni an);
void fp_sub_2e64mce2_x8664(uni zn, uni_t c, void *NOPARAM, uni an, uni bn);
void fp_add_2e64mce2_x8664(uni zn, uni_t c, void *NOPARAM, uni an, uni bn);
void fp_mul_2e64mce2_x8664(uni zn, uni_t c, void *NOPARAM, uni an, uni bn);
void fp_mul_1_2e64mce2_x8664(uni zn, uni_t c, void *NOPARAM, uni an, uni bn);
void fp_sqr_2e64mce2_x8664(uni zn, uni_t c, void *NOPARAM, uni an);
void fp_cpy_2e64mce2_x8664(uni zn, uni an);
void fp_set_1_2e64mce2_x8664(uni zn, uni_t a);
void fp_add_1_2e64mce2_x8664(uni zn, uni_t c, void *NOPARAM, uni an, uni_t b);
//void fp_sub_1_2e64mce2_x8664(uni zn, uni an, uni_t b);
void fp_sub_2_2e64mce2_x8664(uni zn, uni_t c, void *NOPARAM, uni_t a, uni bn);
void fp_cjg_2e64mce2_x8664(uni zn, uni_t c, void *NOPARAM, uni bn);
void fp_neg_2e64mce2_x8664(uni zn, uni_t c, void *NOPARAM, uni bn);
//void fp_mld_2e64mce2_x8664(uni zn, uni an, void *NOPARAM, uni_t b);

void fp_hdm_2e64mce2_x8664(uni xn, uni yn, uni zn, uni tn, uni_t c);

void fp_inv_2e64mce2_x8664(uni zn, uni_t prm, uni an);


typedef struct{
	uni_t X[FP_LEN];
	uni_t Y[FP_LEN];
	uni_t Z[FP_LEN];
	uni_t T[FP_LEN];
} DIV_kum_fp_2e64mce2_g_t[1], *DIV_kum_fp_2e64mce2_g;

typedef struct{
	uni_t prm;
	uni_t for_future_use;
	uni_t yd[FP_LEN];
	uni_t zd[FP_LEN];
	uni_t td[FP_LEN];
	uni_t x0[FP_LEN];
	uni_t y0[FP_LEN];
	uni_t z0[FP_LEN];
	uni_t t0[FP_LEN];
	uni_t yb[FP_LEN];
	uni_t zb[FP_LEN];
	uni_t tb[FP_LEN];
	uni_t rn[2*FP_LEN];
} CNS_kum_fp_2e64mce2_g_t[1], *CNS_kum_fp_2e64mce2_g;

typedef struct{
	uni_t n01[FP_LEN];
	uni_t n02[FP_LEN];
	uni_t n03[FP_LEN];
	uni_t n04[FP_LEN];
} TEMP_kum_fp_2e64mce2_g_t[1], *TEMP_kum_fp_2e64mce2_g;

typedef struct{
	uni_t P[FP_LEN];
	uni_t R[FP_LEN];
	uni_t S[FP_LEN];
	uni_t T[FP_LEN];
	uni_t Z[FP_LEN];
} DIV_hec_fp_2e64mce2_t[1], *DIV_hec_fp_2e64mce2;

typedef struct{
	uni_t prm;
	uni_t for_future_use;
	uni_t a3[FP_LEN];
	uni_t a2[FP_LEN];
} CNS_hec_fp_2e64mce2_t[1], *CNS_hec_fp_2e64mce2;

typedef struct{
	uni_t prm;
	uni_t for_future_use;
	uni_t a3[FP_LEN];
	uni_t a2[FP_LEN];
	uni_t u1z[FP_LEN];
	uni_t u0z[FP_LEN];
	uni_t v1z[FP_LEN];
	uni_t v0z[FP_LEN];
	uni_t ah1[2*FP_LEN];
	uni_t ah2[2*FP_LEN];
	uni_t ah3[2*FP_LEN];
	uni_t ah4[2*FP_LEN];
	uni_t ah5[2*FP_LEN];
	uni_t ah6[2*FP_LEN];
	uni_t ah7[2*FP_LEN];
	uni_t ah8[2*FP_LEN];
	uni_t A1[FP_LEN/2];
	uni_t A2[FP_LEN/2];
	uni_t A3[FP_LEN/2];
	uni_t A4[FP_LEN/2];
	uni_t A5[FP_LEN/2];
	uni_t A6[FP_LEN/2];
	uni_t A7[FP_LEN/2];
	uni_t A8[FP_LEN/2];
	uni_t N[2*FP_LEN];
	uni_t Nhalf[2*FP_LEN];
} CNS_hec_fp_2e64mce2_glv8_s0_t[1], *CNS_hec_fp_2e64mce2_glv8_s0;

typedef struct{
	uni_t prm;
	uni_t for_future_use;
	uni_t a3[FP_LEN];
	uni_t a2[FP_LEN];
	uni_t u1z[FP_LEN];
	uni_t u0z[FP_LEN];
	uni_t v1z[FP_LEN];
	uni_t v0z[FP_LEN];
	uni_t ah1[2*FP_LEN];
	uni_t ah2[2*FP_LEN];
	uni_t ah3[2*FP_LEN];
	uni_t ah4[2*FP_LEN];
	uni_t ah5[2*FP_LEN];
	uni_t ah6[2*FP_LEN];
	uni_t ah7[2*FP_LEN];
	uni_t ah8[2*FP_LEN];
	uni_t A1[FP_LEN/2];
	uni_t A2[FP_LEN/2];
	uni_t A3[FP_LEN/2];
	uni_t A4[FP_LEN/2];
	uni_t A5[FP_LEN/2];
	uni_t A6[FP_LEN/2];
	uni_t A7[FP_LEN/2];
	uni_t A8[FP_LEN/2];
	uni_t N[2*FP_LEN];
	uni_t Nhalf[2*FP_LEN];
	uni_t u1m1[FP_LEN];
	uni_t u0m1[FP_LEN];
	uni_t v1m1[FP_LEN];
	uni_t v0m1[FP_LEN];
	uni_t u1m2[FP_LEN];
	uni_t u0m2[FP_LEN];
	uni_t v1m2[FP_LEN];
	uni_t v0m2[FP_LEN];
	uni_t u1m3[FP_LEN];
	uni_t u0m3[FP_LEN];
	uni_t v1m3[FP_LEN];
	uni_t v0m3[FP_LEN];
	uni_t u1m4[FP_LEN];
	uni_t u0m4[FP_LEN];
	uni_t v1m4[FP_LEN];
	uni_t v0m4[FP_LEN];
	uni_t u1m5[FP_LEN];
	uni_t u0m5[FP_LEN];
	uni_t v1m5[FP_LEN];
	uni_t v0m5[FP_LEN];
	uni_t u1m6[FP_LEN];
	uni_t u0m6[FP_LEN];
	uni_t v1m6[FP_LEN];
	uni_t v0m6[FP_LEN];
} CNS_hec_fp_2e64mce2_glv8_s1_t[1], *CNS_hec_fp_2e64mce2_glv8_s1;

typedef struct{
	uni_t prm;
	uni_t for_future_use;
	uni_t a3[FP_LEN];
	uni_t a2[FP_LEN];
	uni_t u1z[FP_LEN];
	uni_t u0z[FP_LEN];
	uni_t v1z[FP_LEN];
	uni_t v0z[FP_LEN];
	uni_t ah1[2*FP_LEN];
	uni_t ah2[2*FP_LEN];
	uni_t ah3[2*FP_LEN];
	uni_t ah4[2*FP_LEN];
	uni_t ah5[2*FP_LEN];
	uni_t ah6[2*FP_LEN];
	uni_t ah7[2*FP_LEN];
	uni_t ah8[2*FP_LEN];
	uni_t A1[FP_LEN/2];
	uni_t A2[FP_LEN/2];
	uni_t A3[FP_LEN/2];
	uni_t A4[FP_LEN/2];
	uni_t A5[FP_LEN/2];
	uni_t A6[FP_LEN/2];
	uni_t A7[FP_LEN/2];
	uni_t A8[FP_LEN/2];
	uni_t N[2*FP_LEN];
	uni_t Nhalf[2*FP_LEN];
	uni_t u1m1[FP_LEN];
	uni_t u0m1[FP_LEN];
	uni_t v1m1[FP_LEN];
	uni_t v0m1[FP_LEN];
	uni_t u1m2[FP_LEN];
	uni_t u0m2[FP_LEN];
	uni_t v1m2[FP_LEN];
	uni_t v0m2[FP_LEN];
	uni_t u1m3[FP_LEN];
	uni_t u0m3[FP_LEN];
	uni_t v1m3[FP_LEN];
	uni_t v0m3[FP_LEN];
	uni_t u1m4[FP_LEN];
	uni_t u0m4[FP_LEN];
	uni_t v1m4[FP_LEN];
	uni_t v0m4[FP_LEN];
	uni_t u1m5[FP_LEN];
	uni_t u0m5[FP_LEN];
	uni_t v1m5[FP_LEN];
	uni_t v0m5[FP_LEN];
	uni_t u1m6[FP_LEN];
	uni_t u0m6[FP_LEN];
	uni_t v1m6[FP_LEN];
	uni_t v0m6[FP_LEN];
} CNS_hec_fp_2e64mce2_glv8_s2_t[1], *CNS_hec_fp_2e64mce2_glv8_s2;

typedef struct{
	uni_t n01[FP_LEN];
	uni_t n02[FP_LEN];
	uni_t n03[FP_LEN];
	uni_t n04[FP_LEN];
	uni_t n05[FP_LEN];
	uni_t n06[FP_LEN];
	uni_t n07[FP_LEN];
	uni_t n08[FP_LEN];
	uni_t n09[FP_LEN];
	uni_t n10[FP_LEN];
	uni_t n11[FP_LEN];
	uni_t n12[FP_LEN];
} TEMP_hec_fp_2e64mce2_t[1], *TEMP_hec_fp_2e64mce2;

inline void hec_fp_dbl_2e64mce2_g2i_x8664_asm(uni TMP, uni_t prm, void *NOPARAM, uni D3, uni d1, uni CNS);
inline void hec_fp_dbl_2e64mce2_g2i_a2is0_a3is0_x8664_asm(uni TMP, uni_t prm, void *NOPARAM, uni D3, uni d1, uni CNS);
inline void hec_fp_add_2e64mce2_g2i_x8664_asm(uni TMP, uni_t prm, void *NOPARAM, uni D3, uni d1, uni d2);
inline void hec_fp_madd_2e64mce2_g2i_x8664_asm(uni TMP, uni_t prm, void *NOPARAM, uni D3, uni d1, uni d2);
inline void hec_fp_aadd_2e64mce2_g2i_x8664_asm(uni TMP, uni_t prm, void *NOPARAM, uni D3, uni d1, uni d2);

void hec_fp_cpy_2e64mce2_g2i(DIV_hec_fp_2e64mce2_t D3, DIV_hec_fp_2e64mce2_t d1);
void hec_fp_neg_2e64mce2_g2i(DIV_hec_fp_2e64mce2_t D3, DIV_hec_fp_2e64mce2_t d1, CNS_hec_fp_2e64mce2 cn);
void hec_fp_dbl_2e64mce2_g2i(DIV_hec_fp_2e64mce2 d3, CONST DIV_hec_fp_2e64mce2 d1, CNS_hec_fp_2e64mce2 cn);
void hec_fp_dbl_2e64mce2_g2i_a2is0_a3is0(DIV_hec_fp_2e64mce2 d3, CONST DIV_hec_fp_2e64mce2 d1, CNS_hec_fp_2e64mce2 cn);
void hec_fp_add_2e64mce2_g2i(DIV_hec_fp_2e64mce2 d3, CONST DIV_hec_fp_2e64mce2 d1, CONST DIV_hec_fp_2e64mce2 d2, CNS_hec_fp_2e64mce2 cn);
void hec_fp_madd_2e64mce2_g2i(DIV_hec_fp_2e64mce2 d3, CONST DIV_hec_fp_2e64mce2 d1, CONST DIV_hec_fp_2e64mce2 d2, CNS_hec_fp_2e64mce2 cn);
void hec_fp_aadd_2e64mce2_g2i(DIV_hec_fp_2e64mce2 d3, CONST DIV_hec_fp_2e64mce2 d1, CONST DIV_hec_fp_2e64mce2 d2, CNS_hec_fp_2e64mce2 cn);

void hec_fp_smul_2e64mce2_g2i(DIV_hec_fp_2e64mce2 d1, CONST uni kn,  DIV_hec_fp_2e64mce2 d2, CNS_hec_fp_2e64mce2 cn);
void hec_fp_smul_2e64mce2_g2i_a2is0_a3is0(DIV_hec_fp_2e64mce2 d1, CONST uni kn,  DIV_hec_fp_2e64mce2 d2, CNS_hec_fp_2e64mce2 cn);
void hec_fp_smulcached_2e64mce2_g2i(DIV_hec_fp_2e64mce2 D1, const uni kn, unsigned char *D2, CNS_hec_fp_2e64mce2 cn, int slice, int window, int csize);
void hec_fp_smulcached_2e64mce2_g2i_a2is0_a3is0(DIV_hec_fp_2e64mce2 D1, const uni kn, unsigned char *D2, CNS_hec_fp_2e64mce2 cn, int slice, int window, int csize);
void hec_fp_smul_2e64mce2_glv8_a2is0_a3is0_antep_s0(DIV_hec_fp_2e64mce2 d1, const uni kn,  DIV_hec_fp_2e64mce2 d2, CNS_hec_fp_2e64mce2_glv8_s0 cn);
void hec_fp_smul_2e64mce2_glv8_a2is0_a3is0_antep_s1(DIV_hec_fp_2e64mce2 d1, const uni kn,  DIV_hec_fp_2e64mce2 d2, CNS_hec_fp_2e64mce2_glv8_s1 cn);
void hec_fp_smul_2e64mce2_glv8_a2is0_a3is0_antep_s2(DIV_hec_fp_2e64mce2 d1, const uni kn,  DIV_hec_fp_2e64mce2 d2, CNS_hec_fp_2e64mce2_glv8_s2 cn);
void hec_fp_smul_2e64mce2_glv8_a2is0_a3is0_aydin_s0(DIV_hec_fp_2e64mce2 d1, const uni kn,  DIV_hec_fp_2e64mce2 d2, CNS_hec_fp_2e64mce2_glv8_s0 cn);
void hec_fp_smul_2e64mce2_glv8_a2is0_a3is0_aydin_s1(DIV_hec_fp_2e64mce2 d1, const uni kn,  DIV_hec_fp_2e64mce2 d2, CNS_hec_fp_2e64mce2_glv8_s1 cn);
void hec_fp_smul_2e64mce2_glv8_a2is0_a3is0_aydin_s2(DIV_hec_fp_2e64mce2 d1, const uni kn,  DIV_hec_fp_2e64mce2 d2, CNS_hec_fp_2e64mce2_glv8_s2 cn);



inline void kum_fp_dbl_2e64mce2_g_x8664_asm(uni TMP, void *NOPARAM1, void *NOPARAM2, uni d1, void *NOPARAM3, uni CNS);
inline void kum_fp_dbladd_2e64mce2_g_x8664_asm(uni TMP, uni kn, uni_t i, uni d1, uni d2, uni CNS);

void kum_fp_smul_2e64mce2_g(DIV_kum_fp_2e64mce2_g d2, const uni kn, const DIV_kum_fp_2e64mce2_g d0, CNS_kum_fp_2e64mce2_g cn);













#define TRIAL (unsigned long)100000
#define IOBASE 10

