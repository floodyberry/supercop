/*
 * hector/src/generator.c version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#include <stdio.h>
#include <gmp.h>

#include "config.h"
#include "divclass.h"
#include "generator.h"
#include "wnaf.h"
#include "sizes.h"

// Include code depending on the architecture
#if (GMP_LIMB_BITS == 32)
#include "x86_32/generator.c"
#elif (GMP_LIMB_BITS == 64)
#include "x86_64/generator.c"
#else
#error "Only 32 and 64 bit architectures are supported."
#endif

void generator_multiply(divclass rop, unsigned char *byte_array)
{
	// Initialise rop (at position 0 of generator_multiples there's the 0-divisor)
	divclass_set(rop, *(generator_multiples1));

	int i;

	
	// ################  2 lookup table comb method ###################
	int e = (SECRETKEY_BYTES + 1) / 2;

	assert(SECRETKEY_BYTES % 2);

	divclass_double(rop, rop);
	divclass_mixadd(rop, rop, *(generator_multiples1 + (*(byte_array + e - 1))));
	
	for(i = e - 2; i >= 0; i--)
	{
		divclass_double(rop, rop);
		divclass_mixadd(rop, rop, *(generator_multiples1 + (*(byte_array + i))));
		divclass_mixadd(rop, rop, *(generator_multiples2 + (*(byte_array + i + e))));
	}
	/*	
	// ################  1 lookup table comb method ###################
	for(i = SECRETKEY_BYTES - 1; i >= 0; i--)
	{
		divclass_double(rop, rop);
		divclass_mixadd(rop, rop, *(generator_multiples1 + (*(byte_array + i))));
	}
	*/	

}

// Clear memory used by the global parameters:
void generator_clear()
{
	free(generator_multiples2);
	free(generator_multiples1);
}
