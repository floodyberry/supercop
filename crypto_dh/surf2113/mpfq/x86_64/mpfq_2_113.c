/* MPFQ generated file -- do not edit */

#include "mpfq_2_113.h"

#if GMP_LIMB_BITS == 64
/* Active handler: field */
/* Automatically generated code for GF(2^113) */
/* Definition polynomial P = X^113 + X^9 + 1 */
/* Active handler: trivialities */
/* Active handler: io */
/* Active handler: linearops */
/* Active handler: inversion */
/* Active handler: reduction */
/* Active handler: plain_c */
/* Options used: sqrslice=8 mul_ur=sb_aligned_sse2 slice=4 favor_sse2=1 machine=core2 */

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
void mpfq_2_113_print(mpfq_2_113_field_ptr K UNUSED_VARIABLE, FILE * f, mpfq_2_113_src_elt s)
{
	unsigned int j;
	int sth = 0;
	for(j = 0 ; j < 113 ; j++) {
		if (s[j/64] >> (j % 64) & 1UL) {
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

#endif      /* GMP_LIMB_BITS == 64 */


/* vim:set ft=cpp: */
