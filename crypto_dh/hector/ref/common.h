/*
 * hector/src/common.h version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#ifndef COMMON_H
#define COMMON_H

#include <gmp.h>

#include "divclass.h"

void gen_keypair(mpz_t sk, divclass pk);

int keypair(
		unsigned char *sk,
		unsigned long long *sklen,
		unsigned char *pk,
		unsigned long long *pklen
	   );

#endif // ifndef COMMON_H
