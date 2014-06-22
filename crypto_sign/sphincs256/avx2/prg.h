#ifndef PRG_H
#define PRG_H

#include "params.h"

void prg(unsigned char *r, unsigned long long rlen, const unsigned char key[SEED_BYTES]);

#endif
