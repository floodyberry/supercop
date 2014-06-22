#ifndef WOTS_H
#define WOTS_H

#include "params.h"

void wots_pkgen(unsigned char pk[WOTS_L*HASH_BYTES], const unsigned char sk[SEED_BYTES], const unsigned char masks[(WOTS_W-1)*HASH_BYTES]);

void wots_sign(unsigned char sig[WOTS_L*HASH_BYTES], const unsigned char msg[HASH_BYTES], const unsigned char sk[SEED_BYTES], const unsigned char masks[(WOTS_W-1)*HASH_BYTES]);

void wots_verify(unsigned char pk[WOTS_L*HASH_BYTES], const unsigned char sig[WOTS_L*HASH_BYTES], const unsigned char msg[HASH_BYTES], const unsigned char masks[(WOTS_W-1)*HASH_BYTES]);

#endif
