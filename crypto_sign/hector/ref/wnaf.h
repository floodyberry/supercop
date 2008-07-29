/*
 * hector/src/wnaf.h version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#ifndef WNAF_H
#define WNAF_H

typedef struct
{
	signed int *coefficients;
	size_t length;
}wnaf_struct;

typedef wnaf_struct wnaf[1];

/// Initialize a wnaf:
void wnaf_init(wnaf rop);

/// Compute the w-NAF of a given scalar:
void wnaf_set(wnaf rop, const mpz_t scalar, size_t windowsize);

/// Free the memory used by wnaf
void wnaf_clear(wnaf arg);

#endif // WNAF_H
