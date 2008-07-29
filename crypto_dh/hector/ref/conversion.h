/*
 * hector/src/conversion.h version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#include "divclass.h"
#include "mpfq.h"

#ifndef CONVERSION_H
#define CONVERSION_H

/* Conversion between different representations */

void kelt_to_bytearray(unsigned char *byte_array, const Kelt op);
void bytearray_to_kelt(Kelt rop, const unsigned char *byte_array);

void bytearray_to_divclass(divclass rop, const unsigned char *byte_array);
void divclass_to_bytearray(unsigned char *byte_array, const divclass op);

void bytearray_to_mpz_t(mpz_t rop, const unsigned char *byte_array, const size_t array_length);
void mpz_t_to_bytearray(unsigned char *byte_array, const size_t roplen, const mpz_t op);

void scrambled_bytearray_to_mpz_t(mpz_t rop, const unsigned char *byte_array, const size_t array_length);
void mpz_t_to_scrambled_bytearray(unsigned char *byte_array, const size_t roplen, const mpz_t op);

void kelt_to_mpz_t(mpz_t rop, const Kelt op);

#endif // ifndef CONVERSION_H
