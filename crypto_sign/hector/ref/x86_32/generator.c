/*
 * hector/src/x86_32/generator.c version 20080403
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

	// Initialise the first position of the precomputed-array with the 0-Divisor
	unsigned long dummy[4];

	// Write the 0-Divisor to both tables in the first position:
	Kset_uipoly((*(generator_multiples1))->m_U1, 0);
	Kset_uipoly((*(generator_multiples1))->m_U0, 1);
	Kset_uipoly((*(generator_multiples1))->m_V1, 0);
	Kset_uipoly((*(generator_multiples1))->m_V0, 0);
	Kset_uipoly((*(generator_multiples1))->m_Z, 1);
	Kset_uipoly((*(generator_multiples1))->m_z, 1);

	Kset_uipoly((*generator_multiples2)->m_U1, 0);
	Kset_uipoly((*generator_multiples2)->m_U0, 1);
	Kset_uipoly((*generator_multiples2)->m_V1, 0);
	Kset_uipoly((*generator_multiples2)->m_V0, 0);
	Kset_uipoly((*generator_multiples2)->m_Z, 1);
	Kset_uipoly((*generator_multiples2)->m_z, 1);

	// Initalisation of the generator GENERATOR:
	dummy[3] = 0x1FD8E;
	dummy[2] = 0x56ECDF3D;
	dummy[1] = 0xC6AA3AD6;
	dummy[0] = 0xCB57B5B;
	Kset_uipoly_wide(GENERATOR->m_U1, dummy, 4);

	dummy[3] = 0xB2D0;
	dummy[2] = 0x51A6499D;
	dummy[1] = 0x125EBEA;
	dummy[0] = 0x6D544CF3;
	Kset_uipoly_wide( GENERATOR->m_U0, dummy, 4);
	
	Kset_uipoly(GENERATOR->m_V1, 1);
	Kset_uipoly(GENERATOR->m_V0, (1 << 6));
	
	Kset_uipoly(GENERATOR->m_Z,1);
	Kset_uipoly(GENERATOR->m_z,1);

	// Automatically generated code by precompute:
	#include "precompute32_out.c"

}
