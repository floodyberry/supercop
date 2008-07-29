/*
 * hector/src/curve.h version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#ifndef CURVE_H
#define CURVE_H

#include "field.h"
#include <gmp.h>

// Definition of the curve we are working with, curve equation is of the form y^2 + xy = x^ 5 + f3x^3 + f0
Kelt f3;
Kelt f0;

// Initalisation functions setting curve parameters
void curve_init();

// Free memory of the curve 
void curve_clear();

#endif // define CURVE_H
