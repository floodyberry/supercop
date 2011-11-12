#ifndef HASH_H
#define HASH_H

#include "crypto_hash.h"
#include <crypto_uint32.h>

typedef crypto_uint32 u32;

#define STATEBYTES 64
#define STATEWORDS (STATEBYTES/4)
#define NROUNDS 10

#define ROTL32(v, n) ((((v)<<(n))|((v)>>(32-(n)))) & 0xffffffff)

#define U32BIG(a)				\
  ((ROTL32(a,8) & 0x00FF00FF) |		\
   (ROTL32(a,24) & 0xFF00FF00))

#endif
