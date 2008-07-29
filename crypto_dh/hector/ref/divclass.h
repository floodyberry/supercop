/*
 * hector/src/divclass.h version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#ifndef DIVCLASS_H
#define DIVCLASS_H

#include <field.h>
#include <stdio.h>

typedef struct
{
	// Representation of a divisor class using recent coordinates, see HEHCC, 14.5.5.b
	Kelt m_U1;
	Kelt m_U0;
	Kelt m_V1;
	Kelt m_V0;
	Kelt m_Z;
	Kelt m_z;
} divclass_struct;

typedef divclass_struct divclass[1];

#define WINDOWSIZE_DIVCLASS 5

// Initialise a divisor class:
void divclass_init(divclass rop);

// Clear a divisor class:
void divclass_clear(divclass rop);

// Copy function for divclasses:
void divclass_set(divclass rop, const divclass op);

// Check a divisorclass for zero:
int divclass_iszero(const divclass op);

// Add two (different) divisor classes:
void divclass_mixadd(divclass rop, const divclass op1, const divclass op2);

// Double a divisor class:
void divclass_double(divclass rop, const divclass op);

// Invert a divisor class:
inline void divclass_neg(divclass rop, const divclass op);

// Compute multiple of a divisor class:
void divclass_multiply(divclass rop, const divclass op, mpz_t scalar);

// Transform to  affine representation:
void divclass_make_affine(divclass rop, const divclass const op);

// Output functions:
void divclass_print(FILE * outfile, const divclass op);

#endif // define DIVCLASS_H
