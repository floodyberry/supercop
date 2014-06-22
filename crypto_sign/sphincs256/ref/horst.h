#ifndef HORST_H
#define HORST_H

#include "params.h"

int horst_sign(unsigned char *sig, unsigned char pk[HASH_BYTES], unsigned long long *sigbytes, const unsigned char *m, unsigned long long mlen, const unsigned char seed[SEED_BYTES], const unsigned char masks[2*HORST_LOGT*HASH_BYTES], const unsigned char m_hash[MSGHASH_BYTES]);

int horst_verify(unsigned char *pk, const unsigned char *sig, const unsigned char *m, unsigned long long mlen, const unsigned char masks[2*HORST_LOGT*HASH_BYTES], const unsigned char m_hash[MSGHASH_BYTES]);

#endif
