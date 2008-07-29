/*
 * hector/src/x86_64/curve.c version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#include <stdio.h> 
#include <gmp.h>

#include "curve.h"

void curve_init()
{
	// Each of the elements of K has 2 64-bit words, initialisation is done with 2 ulongs:
	unsigned long dummy[2];

	// Initialisation of f3:
	dummy[0] = 1;
	// TODO: Fixed value should go here:
	asm("shlq $55, %0" : "=g" (dummy[0]) : "0" (dummy[0]));

	dummy[1] = 0;
	Kset_uipoly_wide(f3, dummy, 2);

	// Initialisation of f0:
	dummy[0] = 1;
	// TODO: Fixed value should go here:
	asm("shlq $53, %0" : "=g" (dummy[0]) : "0" (dummy[0]));

	// dummy[1] = 0;
	Kset_uipoly_wide(f0, dummy, 2);
}
