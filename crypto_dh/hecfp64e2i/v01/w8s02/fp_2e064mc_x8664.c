//Huseyin Hisil, 2013.

#define NOXGCD

#ifdef NOXGCD
#include "_core.h"
#include "finite064.h"

void fp_inv_2e064mc_x8664(uni zn, uni_t prm, void *NOPARAM, uni an){
	uni_t n01[FP_LEN], n02[FP_LEN];
	int i, j, ei;

	fp_st1_2e064mc_x8664_asm(n01, prm, NULL, 2);
	fp_st1_2e064mc_x8664_asm(n02, prm, NULL, 1);
	fp_neg_2e064mc_x8664_asm(n01, prm, NULL, n01);
	fp_cnt_bits(&i, n01, FP_LEN);
	for(j = i; j > 0; j--){ /* This can be done faster. */
		mam_ith_bit(ei, n01, j);
		fp_sqr_2e064mc_x8664_asm(n02, prm, NULL, n02);
		if(ei == 1){
			fp_mul_2e064mc_x8664_asm(n02, prm, NULL, n02, an);
		}
	}
	fp_cpy_2e064mc_x8664_asm(zn, prm, NULL, n02);
}

#else

#include "kernel.h"
#include "multiprecision.h"
#include "multiprecision_stack.h"
#include "finite128.h"

void fp_inv_2e064mc_x8664(uni zn, uni_t prm, void *NOPARAM, uni an){

}

#endif
