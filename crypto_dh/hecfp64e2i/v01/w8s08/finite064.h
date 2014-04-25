/**
 * Huseyin Hisil.
 * 2013.
 **/
#include "fpx.h"

#define FP_LEN (64/UNIT_LEN)

/**
 * Finite field arithmetic for GF(2^61 - 1).
 **/
void fp_cpy_2e061m1_x8664_asm(uni zn, void *NOPARAM1, void *NOPARAM2, uni an);
void fp_st1_2e061m1_x8664_asm(uni zn, void *NOPARAM1, void *NOPARAM2, uni_t a);
void fp_neg_2e061m1_x8664_asm(uni zn, void *NOPARAM1, void *NOPARAM2, uni an);
void fp_add_2e061m1_x8664_asm(uni zn, void *NOPARAM1, void *NOPARAM2, uni an, uni bn);
void fp_mul_2e061m1_x8664_asm(uni zn, void *NOPARAM1, void *NOPARAM2, uni an, uni bn);
void fp_sqr_2e061m1_x8664_asm(uni zn, void *NOPARAM1, void *NOPARAM2, uni an);

typedef struct{
	uni_t n01[FP_LEN];
	uni_t n02[FP_LEN];
	uni_t n03[FP_LEN];
	uni_t n04[FP_LEN];
	uni_t n05[FP_LEN];
	uni_t n06[FP_LEN];
} TEMP_INV_fp_2e061m1_t[1], *TEMP_INV_fp_2e061m1;

void fp_inv_2e061m1_x8664_asm(TEMP_INV_fp_2e061m1_t t, void *NOPARAM1, void *NOPARAM2, uni zn, uni an);
void fp_inv_2e061m1_x8664(uni zn, void *NOPARAM1, void *NOPARAM2, uni an);


/**
 * Finite field arithmetic for GF(2^64 - c).
 **/
void fp_cpy_2e064mc_x8664_asm(uni zn, uni_t c, void *NOPARAM, uni an);
void fp_st1_2e064mc_x8664_asm(uni zn, uni_t c, void *NOPARAM, uni_t a);
void fp_neg_2e064mc_x8664_asm(uni zn, uni_t c, void *NOPARAM, uni an);
void fp_add_2e064mc_x8664_asm(uni zn, uni_t c, void *NOPARAM, uni an, uni bn);
void fp_mul_2e064mc_x8664_asm(uni zn, uni_t c, void *NOPARAM, uni an, uni bn);
void fp_sqr_2e064mc_x8664_asm(uni zn, uni_t c, void *NOPARAM, uni an);

void fp_inv_2e064mc_x8664(uni zn, uni_t c, void *NOPARAM, uni an);
