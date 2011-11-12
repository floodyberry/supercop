#ifndef KECCAK_H
#define KECCAK_H

#include "crypto_uint64.h"
#include "crypto_uint32.h"
#include "crypto_uint8.h"

//#define KECCAK_B    1600
#define R_BYTES      128
#define NROUNDS       24
#define LANE_BYTES     8
#define R_NLANES     (R_BYTES / LANE_BYTES)
#define LANE_WORDS   (LANE_BYTES >> 2)
#define LANE_BITS    (LANE_BYTES << 3)
#define STATE_WORDS  (5*5*LANE_WORDS)

typedef crypto_uint64 u64;
typedef crypto_uint32 u32;
typedef crypto_uint8 u8; 

#endif
