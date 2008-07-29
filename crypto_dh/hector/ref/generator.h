/*
 * hector/src/generator.h version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#ifndef GENERATOR_H
#define GENERATOR_H

#include "field.h"
#include "divclass.h"

// Generator of the subgroup of prime order:
divclass *generator_multiples1;
divclass *generator_multiples2;

// define alias for the generator
#define GENERATOR (*(generator_multiples1 + 1))

void generator_init();

void generator_multiply(divclass rop, unsigned char *byte_array);

void generator_clear();

#endif // define GENERATOR_H
