/*
 * hector/src/field.h version 20080403
 * Peter Schwabe & Peter Birkner
 * Public domain
*/

#include "mpfq_2_113.h"
#include "mpfq_name_K.h"

// Global definitions depending on the field go here:

#define LIMBS_PER_KELT (128/GMP_LIMB_BITS)
#define BYTES_PER_LIMB (GMP_LIMB_BITS/8)
#define BYTES_PER_KELT 15
