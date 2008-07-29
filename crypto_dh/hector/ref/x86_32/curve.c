/*
 * hector/src/x86_32/curve.c version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

void curve_init()
{
	// Each of the elements of K has 4 32-bit words, initialisation is done with 4 ulongs:
	unsigned long dummy[4];

	// Initialisation of f3:
	dummy[0] = 0;
	dummy[1] = (1 << 23);
	dummy[2] = 0;
	dummy[3] = 0;
	Kset_uipoly_wide(f3, dummy, 4);

	// Initialisation of f0:
	dummy[0] = 0;
	dummy[1] = (1 << 21);
	dummy[2] = 0;
	dummy[3] = 0;
	Kset_uipoly_wide( f0, dummy, 4);
}
