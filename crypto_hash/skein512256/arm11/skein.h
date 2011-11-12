#ifndef _SKEIN_H_
#define _SKEIN_H_

#include <stddef.h>

#include "crypto_uint64.h"
#include "crypto_uint32.h"
#include "crypto_uint8.h"

typedef crypto_uint64 u64;
typedef crypto_uint32 u32;
typedef crypto_uint8 u8;

typedef struct {
   u64    X[8];
   u64    T[2];
} state;

void Skein_512_Init(state *ctx);
void Skein_512_Update(state *ctx, const u8 *msg, size_t len);
void Skein_512_Final(state *ctx, u8 *hash);

void Skein_512_Process_Block(state *ctx, const u8 *msg, u32 blkCnt, u32 byteCntAdd);

static const u64 SKEIN_512_IV_256[] = {
	0xCCD044A12FDB3E13ull, 0xE83590301A79A9EBull,
	0x55AEA0614F816E6Full, 0x2A2767A4AE9B94DBull,
	0xEC06025E74DD7683ull, 0xE7A436CDC4746251ull,
	0xC36FBAF9393AD185ull, 0x3EEDBA1833EDFC13ull
};

// Special cases: 8, 56, 24
enum
{
   R_512_0_0=46, R_512_0_1=36, R_512_0_2=19, R_512_0_3=37,
   R_512_1_0=33, R_512_1_1=27, R_512_1_2=14, R_512_1_3=42,
   R_512_2_0=17, R_512_2_1=49, R_512_2_2=36, R_512_2_3=39,
   R_512_3_0=44, R_512_3_1= 9, R_512_3_2=54, R_512_3_3=56,
   R_512_4_0=39, R_512_4_1=30, R_512_4_2=34, R_512_4_3=24,
   R_512_5_0=13, R_512_5_1=50, R_512_5_2=10, R_512_5_3=17,
   R_512_6_0=25, R_512_6_1=29, R_512_6_2=39, R_512_6_3=43,
   R_512_7_0= 8, R_512_7_1=35, R_512_7_2=56, R_512_7_3=22
};

#endif
