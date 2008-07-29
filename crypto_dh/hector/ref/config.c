/*
 * hector/src/config.c version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#include <stdio.h> 
#include <gmp.h>

#include "config.h"
#include "field.h"
#include "curve.h"
#include "generator.h"

void init_all()
{
	// Field Initialisation:
	Kfield_init();

	// Curve Initialisation:
	curve_init();

	// Generator Initalisation:
	generator_init();
	
	// Order of the subgroup:
	mpz_init_set_str(p, "53919893334301279666889509884200806281039951735555151719046432375393",10);
	size_of_p = mpz_sizeinbase(p,2);

	// Initialisation of global dummys:
	int i;
	for(i = 0; i < NUMBER_OF_DUMMYELTS; i++)
	{
		Kinit(&(dummyelts[i]));
	}

}

// Clear memory used by the global parameters:
void clear_all()
{
	// Clear global dummys:
	int i;
	for(i = 0; i < NUMBER_OF_DUMMYELTS; i++)
	{
		Kclear(&(dummyelt[i]));
	}
	
	mpz_clear(p);
	
	// Clear memory used by genetor:
	generator_clear();

	// Clear memory used by curve:
	curve_clear();

	// Clear memory used by field:
	Kfield_clear();
}
