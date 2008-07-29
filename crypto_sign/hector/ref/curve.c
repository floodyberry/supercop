/*
 * hector/src/curve.c version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#include "config.h"
#include "curve.h"

// Include architecture depending code:
#if (GMP_LIMB_BITS == 32)
#include "x86_32/curve.c"
#elif (GMP_LIMB_BITS == 64)
#include "x86_64/curve.c"
#else
#error "Only 32 and 64 bit architectures are supported."
#endif

// Clear memory used by the global parameters:
void curve_clear()
{
	Kclear(&f3);
	Kclear(&f0);
}




