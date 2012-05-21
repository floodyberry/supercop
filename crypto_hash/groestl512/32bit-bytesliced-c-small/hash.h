#ifndef HASH_H
#define HASH_H

#include "api.h"
#include "crypto_hash.h"
#include "crypto_uint8.h"
#include "crypto_uint32.h"

typedef crypto_uint8 u8;
typedef crypto_uint32 u32;

#define ROUNDS     ((CRYPTO_BYTES<=32?10:14))
#define STATEBYTES ((CRYPTO_BYTES<=32?64:128))
#define STATEWORDS (STATEBYTES/4)
#define STATECOLS  (STATEBYTES/8)

#endif
