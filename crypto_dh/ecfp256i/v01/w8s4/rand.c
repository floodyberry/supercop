#include <stdarg.h>
#include <math.h>
#include "_core.h"

void kn_srand(uni_t s)
{
	srand(s);
}

uni_t kn_rand()
{
	return rand();
}
