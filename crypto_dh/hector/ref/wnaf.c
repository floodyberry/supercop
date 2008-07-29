/*
 * hector/src/wnaf.c version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#include <stdlib.h>
#include <gmp.h>
#include "wnaf.h"
#include "config.h"


/// Initialize a wnaf:
void wnaf_init(wnaf rop)
{
	rop->length = 0;
}


/// Compute the w-NAF of a given scalar:
void wnaf_set(wnaf rop, const mpz_t scalar, size_t windowsize)
{
	if(mpz_cmp_ui(scalar, 0) == 0)
	{
		if (rop->length > 0)
		{
			rop->length = 0;
			free(rop->coefficients);
		}
	}
	else
	{

		mpz_t dummy1, dummy2;
		mpz_init(dummy1);
		mpz_init(dummy2);
		unsigned long int modulus = 1 << windowsize;
		mpz_set(dummy1, scalar);
		if(rop->length > 0)
			rop->coefficients = realloc(rop->coefficients, (mpz_sizeinbase(scalar, 2) + 1) * sizeof(int));
		else
			rop->coefficients = malloc((mpz_sizeinbase(scalar, 2) + 1) * sizeof(int));
		unsigned int i = 0;
		while(mpz_cmp_ui(dummy1, 0))
		{
			if(mpz_odd_p(dummy1))
			{
				mpz_mod_ui(dummy2, dummy1, modulus);
				if(mpz_cmp_ui(dummy2, modulus/2) > 0) mpz_sub_ui(dummy2, dummy2, modulus);
				*(rop->coefficients + i) = mpz_get_si(dummy2);
				mpz_sub(dummy1, dummy1, dummy2);	
			}
			else *(rop->coefficients + i) = 0;
			mpz_cdiv_q_ui(dummy1, dummy1, 2);
			i++;
		}
		rop->length = i;
		mpz_clear(dummy1);
		mpz_clear(dummy2);
	}
}

/// Free the memory used by wnaf
void wnaf_clear(wnaf arg)
{
	if(arg->length > 0)
		free(arg->coefficients);
}
