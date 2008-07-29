#include "mpfq_2_113.h"
#if (GMP_LIMB_BITS == 32)
#include "x86_32/mpfq_2_113.c"
#elif (GMP_LIMB_BITS == 64)
#include "x86_64/mpfq_2_113.c"
#else
#error "Only 32 and 64 bit architectures are supported."
#endif
