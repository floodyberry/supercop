#include <gmp.h>
#if (GMP_LIMB_BITS == 32)
#include "x86_32/mpfq_2_251.h"
#elif (GMP_LIMB_BITS == 64)
#include "x86_64/mpfq_2_251.h" 
#endif
