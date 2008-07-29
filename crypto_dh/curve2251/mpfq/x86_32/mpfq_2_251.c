/* MPFQ generated file -- do not edit */

#include "mpfq_2_251.h"

#if GMP_LIMB_BITS == 32
/* Active handler: field */
/* Automatically generated code for GF(2^251) */
/* Definition polynomial P = X^251 + X^7 + X^4 + X^2 + 1 */
/* Active handler: trivialities */
/* Active handler: io */
/* Active handler: linearops */
/* Active handler: inversion */
/* Active handler: reduction */
/* Active handler: plain_c */
/* Options used: sqrslice=4 mul_ur=sb_aligned_sse2 slice=4 */

/* Functions operating on the field structure */

/* Element allocation functions */

/* Elementary assignment functions */
/* missing set_mpn */
/* missing set_mpz */
/* missing get_mpn */
/* missing get_mpz */

/* Assignment of random values */

/* Arithmetic operations on elements */

/* Operations involving unreduced elements */
/* missing elt_ur_init */
/* missing elt_ur_clear */

/* Comparison functions */

/* Vector allocation functions */

/* Input/output functions */
void mpfq_2_251_print(mpfq_2_251_field_ptr K UNUSED_VARIABLE, FILE * f, mpfq_2_251_src_elt s)
{
	unsigned int j;
	int sth = 0;
	for(j = 0 ; j < 251 ; j++) {
		if (s[j/32] >> (j % 32) & 1UL) {
			if (sth) fprintf(f, " + ");
			sth = 1;
			if (j == 0) {
				fprintf(f, "1");
			} else if (j == 1) {
				fprintf(f, "z");
			} else {
				fprintf(f, "z^%d",j);
			}
		}
	}
	if (!sth) {
		fprintf(f, "0");
	}
	fprintf(f, "\n");
}

#endif      /* GMP_LIMB_BITS == 32 */


/* vim:set ft=cpp: */
