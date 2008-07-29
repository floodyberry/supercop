/*
 * hector/src/x86_64/generator.c version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

void generator_init()
{
	// Allocate space for the generator_multiples-array and set first position to GENERATOR
	const size_t number_of_generator_multiples1 = 256;
	const size_t number_of_generator_multiples2 = 256;
	generator_multiples1 = malloc(sizeof(divclass) * number_of_generator_multiples1);
	generator_multiples2 = malloc(sizeof(divclass) * number_of_generator_multiples2);

	// Initialise all generator_multiples values:
	size_t i;
	
	for(i = 0; i < number_of_generator_multiples1; i++)
	{
		divclass_init(*generator_multiples1);
	}
	
	for(i = 0; i < number_of_generator_multiples2; i++)
	{
		divclass_init(*generator_multiples2);
	}

	// Write the 0-Divisor to both tables in the first position:
	Kset_uipoly((*(generator_multiples1))->m_U1, 0UL);
	Kset_uipoly((*(generator_multiples1))->m_U0, 1UL);
	Kset_uipoly((*(generator_multiples1))->m_V1, 0UL);
	Kset_uipoly((*(generator_multiples1))->m_V0, 0UL);
	Kset_uipoly((*(generator_multiples1))->m_Z, 1UL);
	Kset_uipoly((*(generator_multiples1))->m_z, 1UL);

	
	Kset_uipoly((*generator_multiples2)->m_U1, 0UL);
	Kset_uipoly((*generator_multiples2)->m_U0, 1UL);
	Kset_uipoly((*generator_multiples2)->m_V1, 0UL);
	Kset_uipoly((*generator_multiples2)->m_V0, 0UL);
	Kset_uipoly((*generator_multiples2)->m_Z, 1UL);
	Kset_uipoly((*generator_multiples2)->m_z, 1UL);

	unsigned long dummy[2];
	
	// Uncomment for precomputation
	/*
	// Initalisation of the generator GENERATOR:
	dummy[1] = 0x1FD8E56ECDF3D;
	dummy[0] = 0xC6AA3AD60CB57B5B;
	Kset_uipoly_wide(GENERATOR->m_U1, dummy, 2);

	dummy[1] = 0xB2D051A6499D;
	dummy[0] = 0x0125EBEA6D544CF3;
	Kset_uipoly_wide(GENERATOR->m_U0, dummy, 2);

	Kset_uipoly(GENERATOR->m_V1,1);
	Kset_uipoly(GENERATOR->m_V0,(1 << 6));

	Kset_uipoly(GENERATOR->m_Z,1);
	Kset_uipoly(GENERATOR->m_z,1);
	*/

	// Include the multiples
	#include "precompute64_out.c"
}


